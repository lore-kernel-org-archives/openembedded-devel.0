Return-Path: <joe@deserted.net>
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id 9F4186FA98
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Jun 2014 01:43:17 +0000 (UTC)
Received: by mail-ig0-f170.google.com with SMTP id h3so1147580igd.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Jun 2014 18:43:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=5SCYpIKK9DE0JZahvZhrTBRk3AkomwOh4jlgbeVg0u8=;
	b=Fe5k6tHR52yWpyhyfVSmYaDp5mTbt8uJaSdJ0PWGZNWfjX+cPlp9fdLLF9IJiZFXkp
	OtAZA9vRfoG08RmiTVGrMS1tbpuzBZxpdpeVIHsJbnBBFJHu3llnYyaphOGdh0wcumnD
	RIUIEr245QHea45N7fmhzJltDMMqaXAmLXshCzArpztHi9zun5rMm1lOyqQC4GFHybwG
	Z3plL/mJ31SJ4vAUiXs1N5J0Nu9FyMvHFNbbxrj0L3kVYQO5F8NVj8/4EbogiRlCvwd/
	cPtozT+S8rlNH5NBd+hFiciR0NyyomtNMu+m1m4UgWn3E4vRGNa8DXCmQO9Akmp3Fkm8
	q/Xg==
X-Gm-Message-State: ALoCoQkhELrSzlgkzE90ODdkn3TRL4tSlvFnAdCIxJYuObNAeGd8S9McQbSG0j6JcV09VbNhuIBP
MIME-Version: 1.0
X-Received: by 10.50.13.4 with SMTP id d4mr787723igc.11.1401846198287; Tue, 03
	Jun 2014 18:43:18 -0700 (PDT)
Received: by 10.42.81.130 with HTTP; Tue, 3 Jun 2014 18:43:18 -0700 (PDT)
In-Reply-To: <CACS+7ZQ1i2nTKLcD+toOBN2BPA9PE=zzdD05oDLmPkCKco-NUA@mail.gmail.com>
References: <CACS+7ZQ1i2nTKLcD+toOBN2BPA9PE=zzdD05oDLmPkCKco-NUA@mail.gmail.com>
Date: Tue, 3 Jun 2014 21:43:18 -0400
Message-ID: <CANBf+V1XoOErie9+Z50iYTfHXQ61=en1co=kUBspk1Gqb8JQuw@mail.gmail.com>
From: Joe MacDonald <joe@deserted.net>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] netcat-openbsd: fixup patching
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 04 Jun 2014 01:43:24 -0000
Content-Type: text/plain; charset=UTF-8

Merged, sorry for the excessive delay on this.

-J.

On Mon, May 12, 2014 at 12:30 PM, Dan McGregor
<danismostlikely@gmail.com> wrote:
> From: Dan McGregor <dan.mcgregor@usask.ca>
>
> Do the patching in the do_patch phase instead of the compile
> phase. That way if the compile phase needs to be rerun
> patching isn't attempted a second time.
>
> Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
> ---
>  .../recipes-support/netcat/netcat-openbsd_1.105.bb            | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/meta-networking/recipes-support/netcat/netcat-openbsd_1.105.bb
> b/meta-networking/recipes-support/netcat/netcat-openbsd_1.105.bb
> index 4474e1d..4489656 100644
> --- a/meta-networking/recipes-support/netcat/netcat-openbsd_1.105.bb
> +++ b/meta-networking/recipes-support/netcat/netcat-openbsd_1.105.bb
> @@ -15,11 +15,20 @@ SRC_URI[netcat-patch.sha256sum] =
> "eee759327ffea293e81d0dde67921b7fcfcad279ffd7a
>
>  S = "${WORKDIR}/${BPN}-${PV}"
>
> +netcat_do_patch() {
> +    cd ${S}
> +    while read line; do patch -p1 < ${WORKDIR}/debian/patches/$line;
> done < ${WORKDIR}/debian/patches/series
> +}
> +
> +python do_patch() {
> +    bb.build.exec_func('netcat_do_patch', d)
> +    bb.build.exec_func('patch_do_patch', d)
> +}
> +
>  do_configure[noexec] = "1"
>
>  do_compile() {
>      cd ${S}
> -    while read line; do patch -p1 < ${WORKDIR}/debian/patches/$line;
> done < ${WORKDIR}/debian/patches/series
>      pkgrel=4
>      oe_runmake CFLAGS="$CFLAGS -DDEBIAN_VERSION=\"\\\"${pkgrel}\\\"\""
>  }
> --
> 1.9.0
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel



-- 
Joe MacDonald
:wq

