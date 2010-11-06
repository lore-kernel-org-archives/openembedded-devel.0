Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sylvain.pare@gmail.com>) id 1PEgvt-0003Hm-BK
	for openembedded-devel@lists.openembedded.org;
	Sat, 06 Nov 2010 12:27:43 +0100
Received: by qyk7 with SMTP id 7so277805qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 06 Nov 2010 04:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=QJW4sJfP1DXqEYmTPFDAVYky1qDQXF6rvJxgSGCkTlk=;
	b=vQomncOLanbvEDHWh74r0PcUSofNlxu3P6+PrG+MhQIDRDI/O/WLgptDRvxf7VmgZA
	mFnQWV/UbfnlUJmGI0xZ20GqNISnBPg0SL3REynJXxqjNxsp0Zu26a8UHsenU7sA8GQA
	JUXQ+JY0D/LaXV2SC66KHAmG9svR0b9A0okCo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=QDG3KZ3oTlL3adzJ6lCaTNsWPbVxiHUcTAOBlvjSuMLE+DyelS9Re9bsGvvCca5jO2
	nTyQBFgYGIeW3R/9sqI4kwp9HzcGW2dxyM93gqOjxXUeH85+QuYomniQKud3HTiGf2bS
	/n5RW+8YfJpwa06Xx7M6Qci+a3c8nBc0E0WxA=
Received: by 10.229.251.204 with SMTP id mt12mr2975395qcb.182.1289042804710;
	Sat, 06 Nov 2010 04:26:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.229.185.81 with HTTP; Sat, 6 Nov 2010 04:26:24 -0700 (PDT)
In-Reply-To: <1288387543-1277-7-git-send-email-eric@eukrea.com>
References: <1288387543-1277-1-git-send-email-eric@eukrea.com>
	<1288387543-1277-2-git-send-email-eric@eukrea.com>
	<1288387543-1277-3-git-send-email-eric@eukrea.com>
	<1288387543-1277-4-git-send-email-eric@eukrea.com>
	<1288387543-1277-5-git-send-email-eric@eukrea.com>
	<1288387543-1277-6-git-send-email-eric@eukrea.com>
	<1288387543-1277-7-git-send-email-eric@eukrea.com>
From: =?ISO-8859-1?Q?Sylvain_Par=E9?= <sylvain.pare@gmail.com>
Date: Sat, 6 Nov 2010 12:26:24 +0100
Message-ID: <AANLkTik=_ONqFN=OnALnzoUK6kmdFNfoybCBqQ728JwM@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org, 
	=?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
X-SA-Exim-Connect-IP: 209.85.216.175
X-SA-Exim-Mail-From: sylvain.pare@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH 7/7] qwt: add qwt 5.2.1
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
X-List-Received-Date: Sat, 06 Nov 2010 11:27:43 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello,

Thanks for the update.
But am I the only having issue building it?

http://tinderbox.openembedded.org/public/logs/task/9693587.txt

thanks.

BR

Sylvain(aka GarthPS)


2010/10/29 Eric B=E9nard <eric@eukrea.com>

> this recipe compiles the latest stable version of the
> QT Widgets for Technical Applications against qt4-embedded.
> A specific package was created for the example applications.
>
> Signed-off-by: Eric B=E9nard <eric@eukrea.com>
> ---
>  recipes/qwt/qwt_5.2.1.bb |   33 +++++++++++++++++++++++++++++++++
>  1 files changed, 33 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/qwt/qwt_5.2.1.bb
>
> diff --git a/recipes/qwt/qwt_5.2.1.bb b/recipes/qwt/qwt_5.2.1.bb
> new file mode 100644
> index 0000000..aecee9e
> --- /dev/null
> +++ b/recipes/qwt/qwt_5.2.1.bb
> @@ -0,0 +1,33 @@
> +DESCRIPTION =3D "Qt Widget Extension for Technical Applications"
> +SECTION =3D "libs"
> +PRIORITY =3D "optional"
> +LICENSE =3D "QWT+LGPL"
> +PR =3D "r0"
> +
> +SRC_URI =3D "${SOURCEFORGE_MIRROR}/${PN}/${PN}/${PV}/${PN}-${PV}.tar.bz2=
 \
> +          "
> +
> +inherit qt4e
> +
> +do_configure_prepend() {
> +        sed -e 's#/usr/local/qwt-5.2.1#/usr#g' -i qwtconfig.pri
> +        sed -e 's/#CONFIG     +=3D QwtExamples/CONFIG     +=3D QwtExampl=
es/g'
> -i qwtconfig.pri
> +}
> +do_install() {
> +        make install INSTALL_ROOT=3D${D}
> +        cd examples
> +        install -d ${D}/${bindir}
> +        cp -pPR bin/* ${D}/${bindir}
> +        install -d ${D}/${docdir}/${PN}-${PV}
> +        mv ${D}/usr/doc/html/* ${D}/${docdir}/${PN}-${PV}
> +        install -d ${D}${mandir}/
> +        mv ${D}/usr/doc/man/* ${D}${mandir}/
> +}
> +
> +PACKAGES +=3D "${PN}-examples"
> +
> +FILES_${PN}-examples =3D "${bindir}/*"
> +FILES_${PN} =3D "${libdir}/*.so.*"
> +
> +SRC_URI[md5sum] =3D "4a595b8db0ec3856b117836c1d60cb27"
> +SRC_URI[sha256sum] =3D
> "e2b8bb755404cb3dc99e61f3e2d7262152193488f5fbe88524eb698e11ac569f"
> --
> 1.6.3.3
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

