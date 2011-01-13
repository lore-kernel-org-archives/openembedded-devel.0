Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1PdVV3-0001uJ-Gl
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Jan 2011 23:18:33 +0100
Received: by bwz10 with SMTP id 10so1963771bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Jan 2011 14:18:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=k6rljtxzm44GpRFHxb/eMiwED/ay9j8UyeI1M3ey9rQ=;
	b=LSaYPIre9talc0lajHnCnxMilL0pE4atLT0VcEwOlAq2lOjZ3Sc+bZs/LesIr1Thm3
	RMpA+ghQvbBYDBTFvXBBeWTbhZq70LG/8wqOaWsNuGi0v6Bz84PCuPvq9MxFM82jiYbk
	gGCs/onzw1f/to4ATquCkKr9fO8LuFomzfjz8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=VIBhsoeOzOBUWPWUJkxtqInbD81Hdm+WKd9qIzzHaxUul2+Fftkp2VizOIfGJ8aBYU
	urKeSXoueuO6TDZ+vjUNm3ewK3aCc9veuyGP+bkcLFTRBFb5bLZusMtSdNVXM8Cb105O
	aQEOZgaZVORsvOG2vVGJpRr2hiuxHWEEbF/VA=
MIME-Version: 1.0
Received: by 10.204.119.75 with SMTP id y11mr19980bkq.18.1294957080018; Thu,
	13 Jan 2011 14:18:00 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.59.147 with HTTP; Thu, 13 Jan 2011 14:17:59 -0800 (PST)
In-Reply-To: <1294084926-3115-10-git-send-email-rep.dot.nop@gmail.com>
References: <1294084926-3115-1-git-send-email-rep.dot.nop@gmail.com>
	<1294084926-3115-10-git-send-email-rep.dot.nop@gmail.com>
Date: Thu, 13 Jan 2011 20:17:59 -0200
X-Google-Sender-Auth: wm-Xlsn62PBGDgRkjje1CdwaazQ
Message-ID: <AANLkTimfE+uAEJ24GA3f08wk2abknExoqSZUnHt2w+oi@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 10/12] busybox: simplify update-rc.d OPT handling
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
X-List-Received-Date: Thu, 13 Jan 2011 22:18:33 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

On Mon, Jan 3, 2011 at 18:02, Bernhard Reutner-Fischer
<rep.dot.nop@gmail.com> wrote:
> style-only change
>
> Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
> ---
> =A0recipes/busybox/busybox.inc | =A0 12 ++----------
> =A01 files changed, 2 insertions(+), 10 deletions(-)
>
> diff --git a/recipes/busybox/busybox.inc b/recipes/busybox/busybox.inc
> index 59653e0..b105337 100644
> --- a/recipes/busybox/busybox.inc
> +++ b/recipes/busybox/busybox.inc
> @@ -291,11 +291,7 @@ pkg_prerm_${PN}-shadow () {
> =A0pkg_postinst_${PN}-syslog () {
> =A0 =A0 =A0 =A0update-alternatives --install ${sysconfdir}/init.d/syslog =
syslog-init syslog.${PN} 50
>
> - =A0 =A0 =A0 if test "x$D" !=3D "x"; then
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 OPT=3D"-r $D"
> - =A0 =A0 =A0 else
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 OPT=3D"-s"
> - =A0 =A0 =A0 fi
> + =A0 =A0 =A0 [ -n "$D" ] && OPT=3D"-r $D" || OPT=3D"-s"
> =A0 =A0 =A0 =A0# remove all rc.d-links potentially created from alternati=
ve
> =A0 =A0 =A0 =A0# syslog packages before creating new ones
> =A0 =A0 =A0 =A0update-rc.d $OPT -f syslog remove
> @@ -313,13 +309,9 @@ pkg_prerm_${PN}-syslog () {
> =A0}
>
> =A0pkg_postrm_${PN}-syslog () {
> - =A0 =A0 =A0 if test "x$D" !=3D "x"; then
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 OPT=3D"-r $D"
> - =A0 =A0 =A0 else
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 OPT=3D""
> - =A0 =A0 =A0 fi
> =A0 =A0 =A0 =A0if test "$1" =3D "remove" -o "$1" =3D "purge"; then
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if ! test -e "/etc/init.d/syslog"; then
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 [ -n "$D" ] && OPT=3D"-r $D=
" || OPT=3D"-s"
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0update-rc.d $OPT syslog re=
move
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0fi
> =A0 =A0 =A0 =A0fi
> --
> 1.7.2.3
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


