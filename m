Return-Path: <armccurdy@gmail.com>
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by mail.openembedded.org (Postfix) with ESMTP id E5C9673E3B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jul 2015 00:46:32 +0000 (UTC)
Received: by oiho132 with SMTP id o132so3927412oih.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Jul 2015 17:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=kfJ8hURgyxGXgtoIFyyyc6/hkNbKuT3bp3Np+GeW7/E=;
	b=znOxizrHY+QsnNHLOjw05ji2vFLgceStGq8bXa/KQOZMMI6tvV2Gi2y1WWrsK5NJAS
	7FK8Su9O9KeZKPlUzRYIr2CvWPcimbH/KljUeTo9RXj5NfmnmIkywnC/5gNNRJS7scv9
	jqD5PhPIWgncBRuThArRJ/eKMqeAl/hAljmlfIuIyIsTNgatWag1O3sKpLHdYKimhLTL
	+25ROlVDa6uVuvnYog65MNx+JqJDkIegkE/LXKzK4m4q/1L9JXRswbJQ9O3MPHq4botX
	Co5FM/m8Ht2TGXuri1vKHfpQ1mCw8mbd928fVon7VaRJNbjRU+s0GJqicKhxUoIOmePs
	WApg==
MIME-Version: 1.0
X-Received: by 10.202.4.7 with SMTP id 7mr10821418oie.93.1437093992938; Thu,
	16 Jul 2015 17:46:32 -0700 (PDT)
Received: by 10.202.64.130 with HTTP; Thu, 16 Jul 2015 17:46:32 -0700 (PDT)
In-Reply-To: <1437050752-12663-1-git-send-email-dominic.sacre@gmx.de>
References: <1437050752-12663-1-git-send-email-dominic.sacre@gmx.de>
Date: Thu, 16 Jul 2015 17:46:32 -0700
Message-ID: <CAJ86T=XoRKBHyH0HmDv9thHr8qSievRt-WwT=qddsUkuyg5qpA@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] fio: Add PACKAGECONFIG for numa, re-enable ARM build
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
X-List-Received-Date: Fri, 17 Jul 2015 00:46:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Dominic,

On Thu, Jul 16, 2015 at 5:45 AM, Dominic Sacr=C3=A9 <dominic.sacre@gmx.de> =
wrote:
> Make fio's NUMA support optional via PACKAGECONFIG.
> Enable this feature by default, except on ARM where libnuma/numactl
> is not available.
>
> Signed-off-by: Dominic Sacr=C3=A9 <dominic.sacre@gmx.de>
> ---
>  meta-oe/recipes-benchmark/fio/fio_2.2.6.bb | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/meta-oe/recipes-benchmark/fio/fio_2.2.6.bb b/meta-oe/recipes=
-benchmark/fio/fio_2.2.6.bb
> index 82f9cd4..1255441 100644
> --- a/meta-oe/recipes-benchmark/fio/fio_2.2.6.bb
> +++ b/meta-oe/recipes-benchmark/fio/fio_2.2.6.bb
> @@ -10,10 +10,13 @@ SECTION =3D "console/tests"
>  LICENSE =3D "GPLv2"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D393a5ca445f6965873eca0259a17f=
833"
>
> -DEPENDS =3D "libaio zlib numactl"
> +DEPENDS =3D "libaio zlib"
> +
> +PACKAGECONFIG ??=3D "numa"
> +PACKAGECONFIG[numa] =3D ",--disable-numa,numactl"

I don't think this change will work.

The fio recipe doesn't use autotools, so the --disable-numa option set
via PACKAGECONFIG isn't going to have any effect unless you also
manually pass EXTRA_OECONF into the build somehow.

>  # ARM does not currently support NUMA
> -COMPATIBLE_HOST =3D "^((?!arm).*)$"
> +PACKAGECONFIG_remove_arm =3D "numa"

In general, it would be better to use something like:

  PACKAGECONFIG_NUMA =3D "numa"
  PACKAGECONFIG_NUMA_arm =3D ""

  PACKAGECONFIG ??=3D "${PACKAGECONFIG_NUMA}"

_remove can be a little difficult to 'over-ride', so makes things
harder if someone did, one day, want to experiment with enabling that
option from local.conf or a .bbappend.

>  # rev for v2.2.6
>  SRCREV =3D "f52c9691bc8c285f3445235c69acdfd6de7f9b82"
> --
> 2.4.5
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

