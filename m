Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OsrJt-0008SJ-QC
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Sep 2010 08:06:14 +0200
Received: by iwn2 with SMTP id 2so4913642iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Sep 2010 23:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=B8VcfS5vAY+dIzTEEJDmPorZ/oxIb2bWHhMiM7pO8p4=;
	b=QAn+7wIG0aQdEKmlUHqmJN9JjHXnizmBKpS3fI9DT7gBpv+Zl7FyjVn6z4SWD5DpHc
	eJT98c6V8RpNskMid2orwO33bFFkbh8xQkjHTbFo7KeYMmzr+cqeb3UVgFFBClf6Tp2c
	2jpB09mp64BUkHZH7ZstuKpydfPy0RMl4hzJY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=UIeZKqMoLqxWyoMJWHaOFn6VocXPic6IA/XvOJ5LEVudTFijqSncUMS8jkx3MSyDtJ
	2DUUcoZKeiUmjr7SZiH8Evb8lGqmd7rmLKIxBnWHRl4+U1Z0psqufy6sH3qh8/m3r6rn
	xCQ9A8lsfYsUxOGtS0Rq9TIczvwOOvbRKpFm8=
Received: by 10.231.160.205 with SMTP id o13mr7543073ibx.15.1283839534113;
	Mon, 06 Sep 2010 23:05:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.205.134 with HTTP; Mon, 6 Sep 2010 23:05:14 -0700 (PDT)
In-Reply-To: <1283777330-31590-1-git-send-email-fahad_usman@mentor.com>
References: <1283777330-31590-1-git-send-email-fahad_usman@mentor.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 6 Sep 2010 23:05:14 -0700
Message-ID: <AANLkTimt2g=o04TocN=w9t6z2sHk3vopELdgCqYTKQ4h@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] uicmoc-native_2.3.10.bb: converted to new style staging
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
X-List-Received-Date: Tue, 07 Sep 2010 06:06:14 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 6, 2010 at 5:48 AM, Fahad Usman <fahad_usman@mentor.com> wrote:
> * Converted do_stage to do_install.
> * Bumped PR
> * Added NATIVE_INSTALL_WORKS =3D "1"
>
> Signed-off-by: Fahad Usman <fahad_usman@mentor.com>

looks ok
> ---
> =A0recipes/uicmoc/uicmoc-native_2.3.10.bb | =A0 13 ++++++++-----
> =A01 files changed, 8 insertions(+), 5 deletions(-)
>
> diff --git a/recipes/uicmoc/uicmoc-native_2.3.10.bb b/recipes/uicmoc/uicm=
oc-native_2.3.10.bb
> index c161571..8c69bef 100644
> --- a/recipes/uicmoc/uicmoc-native_2.3.10.bb
> +++ b/recipes/uicmoc/uicmoc-native_2.3.10.bb
> @@ -3,7 +3,7 @@ HOMEPAGE =3D "http://www.trolltech.com"
> =A0SECTION =3D "devel"
> =A0PRIORITY =3D "optional"
> =A0LICENSE =3D "GPL QPL"
> -PR =3D "r4"
> +PR =3D "r5"
>
> =A0SRC_URI =3D "ftp://ftp.trolltech.com/pub/qt/source/qt-embedded-${PV}-f=
ree.tar.gz \
> =A0 =A0 =A0 =A0 =A0 =A0file://fix-makefile.patch \
> @@ -43,11 +43,14 @@ do_compile() {
> =A0 =A0 oe_runmake -C tools/makeqpf =A0 =A0 =A0 || die "Building makeqpf =
failed"
> =A0}
>
> -do_stage() {
> - =A0 =A0install -m 0755 bin/moc ${STAGING_BINDIR}
> - =A0 =A0install -m 0755 bin/uic ${STAGING_BINDIR}
> - =A0 =A0install -m 0755 tools/makeqpf/makeqpf ${STAGING_BINDIR}
> +do_install() {
> + =A0 =A0install -d ${D}${bindir}
> + =A0 =A0install -m 0755 bin/moc ${D}${bindir}
> + =A0 =A0install -m 0755 bin/uic ${D}${bindir}
> + =A0 =A0install -m 0755 tools/makeqpf/makeqpf ${D}${bindir}
> =A0}
>
> =A0SRC_URI[md5sum] =3D "1f7ad30113afc500cab7f5b2f4dec0d7"
> =A0SRC_URI[sha256sum] =3D "883363eb0c94de3d1e36f3ab9e09a8f127418d497213cc=
1a0ed1a1588ecd66b8"
> +
> +NATIVE_INSTALL_WORKS =3D "1"
> --
> 1.6.3.3
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


