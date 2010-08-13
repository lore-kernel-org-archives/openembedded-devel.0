Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OjnmA-0004s9-FH
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Aug 2010 08:30:11 +0200
Received: by ywe9 with SMTP id 9so804191ywe.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Aug 2010 23:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=PRFnnvHnX3trgd3EKu3d0mv7IJsE+XJ0sebyE9+atC8=;
	b=TZVccoj+0kU4fstCgYCgAQDB1UqxeeFq3rivOjzrWOlZ1Ppyicyjx5Ag5e9QQeXpmn
	SCXoLW/RurUkeAnK7tHUsL3cHYQRBxLYJG/lrzYtkxyXWIpT3dwfXwdF5VYXN79DfKxO
	kxzGihGIjDN0Rb5gfxKvT6u+KlvluU025FGqk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=TvGFLjihaFTfTP/zrgmOd7zYsFfIHXxm4FgauSzr/pdEhGCuImuE3ogNmPS1uYWoIo
	LAvRyH19Pird6WnJMt/QNoI4MHqSmONUYV83Y3YC3vCQZ0hpJ2IlzJJG4Jr21bGLXGYL
	mfi87NILhilxgVPv+1hHIDV69inNoUbDRGp34=
MIME-Version: 1.0
Received: by 10.231.173.144 with SMTP id p16mr1072307ibz.108.1281680983670;
	Thu, 12 Aug 2010 23:29:43 -0700 (PDT)
Received: by 10.231.208.72 with HTTP; Thu, 12 Aug 2010 23:29:43 -0700 (PDT)
In-Reply-To: <1281677993-19478-1-git-send-email-noor_ahsan@mentor.com>
References: <1281677993-19478-1-git-send-email-noor_ahsan@mentor.com>
Date: Fri, 13 Aug 2010 08:29:43 +0200
Message-ID: <AANLkTi=XHdsksjrnq3eB7_RM+p=qnL49zhPtFRKf2s4z@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH]Removing Legacy staging from genboot native recipe
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
X-List-Received-Date: Fri, 13 Aug 2010 06:30:11 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/8/13  <noor_ahsan@mentor.com>:
> genboot: Removing legacy staging
>
> * Replaced do_stage function with do_install and replaced ${STAGING_BINDI=
R} with ${D}${bindir}
> Signed-off-by: Noor Ahsan <noor_ahsan@mentorg.com>
> diff --git a/recipes/simpad-utilities/genboot-native.bb b/recipes/simpad-=
utilities/genboot-native.bb
> index 47b9b34..966a450 100644
> --- a/recipes/simpad-utilities/genboot-native.bb
> +++ b/recipes/simpad-utilities/genboot-native.bb
> @@ -9,12 +9,15 @@ DEPENDS =3D "pad-native"
>
> =A0inherit native
>
> +NATIVE_INSTALL_WORKS =3D "1"
> +
> =A0do_compile() {
> =A0 =A0 =A0 =A0cp ${WORKDIR}/*.h ${WORKDIR}/*.c .
> =A0 =A0 =A0 =A0${CC} -I. -o genboot gen_boot.c
> =A0}
>
> -do_stage() {
> - =A0 =A0 =A0 install -m 0755 genboot ${STAGING_BINDIR}/
> - =A0 =A0 =A0 install -m 0755 ${WORKDIR}/simpad-make-flashimg ${STAGING_B=
INDIR}/
> +do_install() {
> + =A0 =A0 =A0 install -d ${D}${bindir}/
> + =A0 =A0 =A0 install -m 0755 genboot ${D}${bindir}/
> + =A0 =A0 =A0 install -m 0755 ${WORKDIR}/simpad-make-flashimg ${D}${bindi=
r}/
> =A0}
>

You might also want to bumnp PR (although logically nothing changed so
this is perhaps not needed)
Can you also have a look at serload-native?
And maybe trun it to contrib/oe-stylize.py

Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>


