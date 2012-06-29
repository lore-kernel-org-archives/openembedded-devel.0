Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SkP1C-0002U4-Fp
	for openembedded-devel@lists.openembedded.org;
	Fri, 29 Jun 2012 02:25:02 +0200
Received: by wgbdr1 with SMTP id dr1so2510264wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Jun 2012 17:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=BWtNpWLOrioTZIqvWhXZeL/gVN+AgC191JnpcYaGsco=;
	b=fOAMLUaC6da+NmxhOkvWTk7iSNUgF305GJH3kE3vvpv14WZgawvVOGKFulzIzDjkOq
	GSe21/TUmG9eIPvyBD1rv2ZM6CFwjkB2ViSAbo3oVY9WZt1/8qv0Q8ezJenhrrVeexAN
	ZbZuIzVVRGUzR8inbaOR14i1QK15wMpeT0klHj3ZUMtDYhqIIMqJrGcLf098AtfR6V4K
	p/eD4ZySRycE4URL8GtKWxUCGdw1Qt64tf2tCJx1RWXoOYJuWennm0pXDevV0W7f5BJ7
	NS6Ps5L+f7j/k1LU98L0xkUNDRdGrL3bW7JXF8tzTpmPbfuhF2bFpdMOxUijBiaM28so
	Plgw==
Received: by 10.216.135.146 with SMTP id u18mr2386100wei.5.1340928847451; Thu,
	28 Jun 2012 17:14:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.194.30.34 with HTTP; Thu, 28 Jun 2012 17:13:37 -0700 (PDT)
In-Reply-To: <1340904942-41537-1-git-send-email-elvis.dowson@gmail.com>
References: <1340904942-41537-1-git-send-email-elvis.dowson@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 28 Jun 2012 17:13:37 -0700
Message-ID: <CAMKF1soU2SERBGQogpQb75YcEju0mYBtK0on=HMRn_Z2Mrp3jQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-xilinx] util-linux: rename file to util-linux_2.21.2.bbappend
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 29 Jun 2012 00:25:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

if this is a bbappend for meta-xilinx then this is not the right list
for this patch
Read http://git.yoctoproject.org/cgit/cgit.cgi/meta-xilinx/tree/README

On Thu, Jun 28, 2012 at 10:35 AM, Elvis Dowson <elvis.dowson@gmail.com> wro=
te:
> * Rename util-linux bbaapend file to match recipe version provided in
> =C2=A0poky/meta/recipes-core/util-linux
>
> Signed-off-by: Elvis Dowson <elvis.dowson@gmail.com>
> ---
> =C2=A0recipes-core/util-linux/util-linux_2.21.1.bbappend | =C2=A0 =C2=A03=
 ---
> =C2=A0recipes-core/util-linux/util-linux_2.21.2.bbappend | =C2=A0 =C2=A03=
 +++
> =C2=A02 files changed, 3 insertions(+), 3 deletions(-)
> =C2=A0delete mode 100644 recipes-core/util-linux/util-linux_2.21.1.bbappe=
nd
> =C2=A0create mode 100644 recipes-core/util-linux/util-linux_2.21.2.bbappe=
nd
>
> diff --git a/recipes-core/util-linux/util-linux_2.21.1.bbappend b/recipes=
-core/util-linux/util-linux_2.21.1.bbappend
> deleted file mode 100644
> index 5199eb2..0000000
> --- a/recipes-core/util-linux/util-linux_2.21.1.bbappend
> +++ /dev/null
> @@ -1,3 +0,0 @@
> -FILESEXTRAPATHS :=3D "${THISDIR}/${PN}"
> -# Disable microblaze ncurses support
> -EXTRA_OECONF_microblaze +=3D " --without-ncurses "
> diff --git a/recipes-core/util-linux/util-linux_2.21.2.bbappend b/recipes=
-core/util-linux/util-linux_2.21.2.bbappend
> new file mode 100644
> index 0000000..5199eb2
> --- /dev/null
> +++ b/recipes-core/util-linux/util-linux_2.21.2.bbappend
> @@ -0,0 +1,3 @@
> +FILESEXTRAPATHS :=3D "${THISDIR}/${PN}"
> +# Disable microblaze ncurses support
> +EXTRA_OECONF_microblaze +=3D " --without-ncurses "
> --
> 1.7.9.5
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


