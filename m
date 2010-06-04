Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OKRaH-0000hN-TK
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Jun 2010 09:46:17 +0200
Received: by fxm9 with SMTP id 9so592472fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Jun 2010 00:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=Gl2SyKzfInvwrvwdLTQnbbcQ/OU6DuwD1EnDmlLDQJ0=;
	b=NFG7mnBu7br10cMHfK1WwBSHz1XPD7RaPoC7TWVLXMvPf9pVNrB45ag8zYBZev6MQT
	AaqBFzSJrbKBbd172iG63OAEAxUnUvUBTiJrb5MJG4eY+wpH0O7TFgrfguCZGOvT+1u2
	0KUV1Mc1exl2nIPwXaZAyBBqY1jnKU6smJPd4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=KtPBg/Ttlrr9kT8LL658bdQW1S1iXlXHhYwMtdHEIs2OkkFtorJHqnxfRoolcqIh+/
	OqVszzurBqldekhhtx9AP78fRSpyWb13RyfE2nHBjnX9PMEykM+/7QVcRfNT5HeydhyB
	T8g+cc/EGgOBrjUPc9mX8DAuJsVqR3C7fcQ7E=
MIME-Version: 1.0
Received: by 10.223.25.74 with SMTP id y10mr11352992fab.81.1275637237439; Fri, 
	04 Jun 2010 00:40:37 -0700 (PDT)
Received: by 10.223.106.138 with HTTP; Fri, 4 Jun 2010 00:40:37 -0700 (PDT)
In-Reply-To: <1275510896-30845-11-git-send-email-raj.khem@gmail.com>
References: <1275510896-30845-1-git-send-email-raj.khem@gmail.com>
	<1275510896-30845-11-git-send-email-raj.khem@gmail.com>
Date: Fri, 4 Jun 2010 09:40:37 +0200
Message-ID: <AANLkTimB3vLN_rjW1c0nEGBXJPr2sKc7NyyQH7UpA3ml@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 10/16] inetutils_1.8.bb: Add recipe
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
X-List-Received-Date: Fri, 04 Jun 2010 07:48:45 -0000
X-List-Received-Date: Fri, 04 Jun 2010 07:48:45 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 2, 2010 at 10:34 PM, Khem Raj <raj.khem@gmail.com> wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

> ---
> =A0recipes/inetutils/inetutils_1.8.bb | =A0 43 ++++++++++++++++++++++++++=
++++++++++
> =A01 files changed, 43 insertions(+), 0 deletions(-)
> =A0create mode 100644 recipes/inetutils/inetutils_1.8.bb
>
> diff --git a/recipes/inetutils/inetutils_1.8.bb b/recipes/inetutils/inetu=
tils_1.8.bb
> new file mode 100644
> index 0000000..11fb818
> --- /dev/null
> +++ b/recipes/inetutils/inetutils_1.8.bb
> @@ -0,0 +1,43 @@
> +SECTION =3D "libs"
> +DEPENDS =3D "ncurses"
> +LICENSE =3D "GPL"
> +DESCRIPTION =3D "The GNU inetutils are a collection of common \
> +networking utilities and servers including ftp, ftpd, rcp, \
> +rexec, rlogin, rlogind, rsh, rshd, syslog, syslogd, talk, \
> +talkd, telnet, telnetd, tftp, tftpd, and uucpd."
> +
> +PR =3D "r0"
> +
> +SRC_URI =3D "${GNU_MIRROR}/inetutils/inetutils-${PV}.tar.gz \
> +"
> +
> +inherit autotools
> +
> +EXTRA_OECONF =3D "--with-ncurses-include-dir=3D${STAGING_INCDIR}"
> +
> +do_configure_prepend () {
> + =A0 =A0 =A0 cp ${STAGING_DATADIR_NATIVE}/gettext/config.rpath ${S}/buil=
d-aux/config.rpath
> + =A0 =A0 =A0 rm -f ${S}/glob/configure*
> +}
> +
> +do_install () {
> + =A0 =A0 =A0 autotools_do_install
> + =A0 =A0 =A0 mv ${D}${bindir}/tftp ${D}${bindir}/tftp.${PN}
> + =A0 =A0 =A0 mv ${D}${bindir}/telnet ${D}${bindir}/telnet.${PN}
> + =A0 =A0 =A0 mv ${D}${bindir}/logger ${D}${bindir}/logger.${PN}
> +}
> +
> +pkg_postinst_${PN} () {
> + =A0 =A0 =A0 update-alternatives --install ${bindir}/tftp tftp tftp.${PN=
} 100
> + =A0 =A0 =A0 update-alternatives --install ${bindir}/telnet telnet telne=
t.${PN} 100
> + =A0 =A0 =A0 update-alternatives --install ${bindir}/logger logger logge=
r.${PN} 100
> +}
> +
> +pkg_prerm_${PN} () {
> + =A0 =A0 =A0 update-alternatives --remove tftp tftp.${PN}
> + =A0 =A0 =A0 update-alternatives --remove telnet telnet.${PN}
> + =A0 =A0 =A0 update-alternatives --remove logger logger.${PN}
> +}
> +SRC_URI[md5sum] =3D "ad8fdcdf1797b9ca258264a6b04e48fd"
> +SRC_URI[sha256sum] =3D "c8500baee04b9ea408c9e65e24ad7f5b41e7d96d42fb1d29=
abf25b52b68311c7"
> +
> --
> 1.7.0.4
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


