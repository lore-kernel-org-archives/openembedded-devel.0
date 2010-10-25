Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PAAej-0002iF-KW
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Oct 2010 02:11:18 +0200
Received: by iwn41 with SMTP id 41so12944iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Oct 2010 17:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=Dvxc/K8+Xs5JrjmkPJu50/rbw8NGpl9x6jNmzr6Ynps=;
	b=XU0jvrQEZDtsxJEVxsi+JsL1wi8iXdTGGAs02T6fOkyAqoKKM6Ruw6ohdPPRftuIJ9
	k9LSWXe1KbSMN7K29bQmS/JFoFG7m3OogM0fSLTE8O1dus0+vg27juaJats2thK6zDmQ
	YRSixDDPXD8qtmbCNtG3bdjmnpT/DNDA4Emi4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=Z0MmM/PvER6B9EQTGckOziOvEtZ3MYFaocNUbhXts2p+QScEm2PN56Ox5gMABHLtfo
	d6OQM1sfg4e1mvHREoUmKxEA+soRxKW7KjwKcbYg2NEehnnn/p8H/O1wj+TXOv3VOIlT
	c7X7e7JF6J85YeW4qlUNENh04UV4MWN0NhXR0=
Received: by 10.42.22.133 with SMTP id o5mr4157746icb.268.1287965438027; Sun,
	24 Oct 2010 17:10:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.42.164.194 with HTTP; Sun, 24 Oct 2010 17:10:17 -0700 (PDT)
In-Reply-To: <4CC49A20.5080001@eukrea.com>
References: <4CC49A20.5080001@eukrea.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 24 Oct 2010 17:10:17 -0700
Message-ID: <AANLkTinjV--XGvwUmPJrH_8_A1ckn80V4S-oAowBYPwC@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: qt4.7.0 : QA problem : Architecture did not match
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
X-List-Received-Date: Mon, 25 Oct 2010 00:11:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 24, 2010 at 1:42 PM, Eric B=C3=A9nard <eric@eukrea.com> wrote:
> Hi,
>
> building qt4.7.0 using angstrom 2010.x for and armv5te leads to :
> ERROR: QA Issue with qt4-embedded-tools: Architecture did not match (40 t=
o
> 3) on
> /work/armv5te-angstrom-linux-gnueabi/qt4-embedded-4.7.0-r25.0/packages-sp=
lit/qt4-embedded-tools/usr/bin/rcc
> ERROR: QA Issue with qt4-embedded-tools: Architecture did not match (40 t=
o
> 3) on
> /work/armv5te-angstrom-linux-gnueabi/qt4-embedded-4.7.0-r25.0/packages-sp=
lit/qt4-embedded-tools/usr/bin/moc
> ERROR: QA Issue with qt4-embedded-tools: Architecture did not match (40 t=
o
> 3) on
> /work/armv5te-angstrom-linux-gnueabi/qt4-embedded-4.7.0-r25.0/packages-sp=
lit/qt4-embedded-tools/usr/bin/uic
> ERROR: Task 498
> (/home/ebenard/OEUKREA/openembedded/recipes/qt4/qt4-embedded_4.7.0.bb,
> do_package) failed with exit code '1'
> ERROR:
> '/home/ebenard/OEUKREA/openembedded/recipes/qt4/qt4-embedded_4.7.0.bb'
> failed
>
> The patch below (not cleaned if OK, I'll clean and push it) fix this
> problem, but why these installs were added to the 4.7.0.inc file (they ar=
e
> not present in 4.6.* and the recipe builds fine without) ?
>
> thanks,
> Eric
>
> diff --git a/recipes/qt4/qt-4.7.0.inc b/recipes/qt4/qt-4.7.0.inc
> index cf4b0d8..3004b92 100644
> --- a/recipes/qt4/qt-4.7.0.inc
> +++ b/recipes/qt4/qt-4.7.0.inc
> @@ -47,10 +47,10 @@ do_compile() {
> =C2=A0 =C2=A0 fi
>
> =C2=A0 =C2=A0 unset CFLAGS CXXFLAGS
> - =C2=A0 =C2=A0install -m 0755 ${STAGING_BINDIR_NATIVE}/rcc4 ${S}/bin/rcc
> - =C2=A0 =C2=A0install -m 0755 ${STAGING_BINDIR_NATIVE}/moc4 ${S}/bin/moc
> - =C2=A0 =C2=A0install -m 0755 ${STAGING_BINDIR_NATIVE}/uic4 ${S}/bin/uic
> - =C2=A0 =C2=A0install -m 0755 ${STAGING_BINDIR_NATIVE}/lrelease4 ${S}/bi=
n/lrelease
> +# =C2=A0 =C2=A0install -m 0755 ${STAGING_BINDIR_NATIVE}/rcc4 ${S}/bin/rc=
c
> +# =C2=A0 =C2=A0install -m 0755 ${STAGING_BINDIR_NATIVE}/moc4 ${S}/bin/mo=
c
> +# =C2=A0 =C2=A0install -m 0755 ${STAGING_BINDIR_NATIVE}/uic4 ${S}/bin/ui=
c
> +# =C2=A0 =C2=A0install -m 0755 ${STAGING_BINDIR_NATIVE}/lrelease4 ${S}/b=
in/lrelease
>
> =C2=A0 =C2=A0 oe_runmake ${EXTRA_ENV}
> =C2=A0}

well may be a -native recipe should be written to package those bits.
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


