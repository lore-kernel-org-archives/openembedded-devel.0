Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PEqdt-0000on-TV
	for openembedded-devel@lists.openembedded.org;
	Sat, 06 Nov 2010 22:49:48 +0100
Received: by gyf3 with SMTP id 3so2958345gyf.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 06 Nov 2010 14:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:cc:content-type
	:content-transfer-encoding;
	bh=n78rAJSRSzdhqIdTW25VZFvjFhK8Zf4CPMSO0RzCx3E=;
	b=uUl09/bxAQpdUGFA6zrkmN6icTBP5jP8z500Cfofjz8CAFOd1sWWU7Tl0VNTQwqErt
	3/pON2AUX7jbTQhX4BR8dDAYwseifyAHdUmE8pdPr+oai9OYzC0j92CbmJug1VPsjrHm
	IjoO3ILexfUbZ7SC/7XkKCqz4/ySyUxEa2BSQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=hA2LFvDfY8bi+SUAFsl78HueOlWoqYvcuk4k7xlDUBPatv3o5R/ufEWk5wNShA+L8V
	pcOxKanM1YtNeJbmQxowsM81NCNt2hPjmdCSqsvJdno5vITKQF2j1yRQarOt3jyg0V3j
	D79vop4bV5rez4HmiqjcDXCrKDyOJdhVsKTqc=
Received: by 10.91.27.32 with SMTP id e32mr3237792agj.37.1289080129669; Sat,
	06 Nov 2010 14:48:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.90.86.4 with HTTP; Sat, 6 Nov 2010 14:48:29 -0700 (PDT)
In-Reply-To: <1289061084-19901-1-git-send-email-moncelier@devlife.org>
References: <1289061084-19901-1-git-send-email-moncelier@devlife.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 6 Nov 2010 14:48:29 -0700
Message-ID: <AANLkTi=L6r1i9yayoo9=j_JNx5Yd+bGhgQYotEp=SJ-s@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Camille Moncelier <moncelier@devlife.org>
Subject: Re: [PATCH 01/11] parted: Added parted-native
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
X-List-Received-Date: Sat, 06 Nov 2010 21:49:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 6, 2010 at 9:31 AM, Camille Moncelier <moncelier@devlife.org> w=
rote:
> Signed-off-by: Camille Moncelier <moncelier@devlife.org>
> ---
> =C2=A0recipes/parted/parted_2.3.bb | =C2=A0 =C2=A04 ++++
> =C2=A01 files changed, 4 insertions(+), 0 deletions(-)
>
> diff --git a/recipes/parted/parted_2.3.bb b/recipes/parted/parted_2.3.bb
> index d2ac303..6efb398 100644
> --- a/recipes/parted/parted_2.3.bb
> +++ b/recipes/parted/parted_2.3.bb
> @@ -3,14 +3,18 @@ HOMEPAGE =3D "http://www.gnu.org/software/parted/parted=
.html"
> =C2=A0LICENSE =3D "GPLv3"
> =C2=A0SECTION =3D "console/tools"
> =C2=A0DEPENDS =3D "readline util-linux-ng lvm2"
> +DEPENDS_virtclass-native =3D "readline-native util-linux-ng-native"

this should not be needed.

>
> =C2=A0SRC_URI =3D "${GNU_MIRROR}/parted/parted-${PV}.tar.gz \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://use_llseek_syscall.patch =
\
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "
>
> =C2=A0EXTRA_OECONF =3D "--disable-Werror ac_cv_func_calloc_0_nonnull=3Dye=
s"
> +EXTRA_OECONF_virtclass-native =3D "--disable-device-mapper"
>
> =C2=A0inherit autotools pkgconfig
>
> =C2=A0SRC_URI[md5sum] =3D "30ceb6df7e8681891e865e2fe5a7903d"
> =C2=A0SRC_URI[sha256sum] =3D "e81fa140805b5cd029ff6dda5cfa94d223e83ac182e=
bcae94f841d62ce468829"
> +
> +BBCLASSEXTEND =3D "native"
> --
> 1.7.3.1
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


