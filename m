Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OUDsD-00080y-4i
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Jul 2010 09:07:54 +0200
Received: by iwn34 with SMTP id 34so1754037iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Jul 2010 00:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=mHI6o8kGHvtN8Xo6TfAZsgo72u22XGjeHenaFVTF7wY=;
	b=JyjRenOTdGY031ZWbXbFIx6NwZAhLpOlNOOpIwDnZJP0mFuhA3V8IxsWdGSMYiVJoe
	e0+mMc1hgqg9f/49fQV+VxxIaiblZwwkt6d/dmc/Lnli97a0XA3kkFxpTM3LJ2CsbtN+
	uMGU3dOFiGUEhfuM3NEs0GYTwAt0ruuGq1bf8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=byYrsAct/U5+knJufQlhHhgtFUHyeLphJmuwMPf1KDnZ3WoJKr8YWpudy9T7yk96U1
	jhDFqLPyoWoFBtRnkOWjl8/Dvq5U6dwuKyiHCsyfy5OheJ4e0L1Co73HnnxEB7VVie8S
	ouHoP7Tf8BNjTPVOrNGIFtb1qM+h15fJVXTe0=
Received: by 10.231.120.95 with SMTP id c31mr10342099ibr.95.1277967786174; 
	Thu, 01 Jul 2010 00:03:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.14.131 with HTTP; Thu, 1 Jul 2010 00:02:46 -0700 (PDT)
In-Reply-To: <4C2AC6F3.3090603@gmail.com>
References: <4C2AC6F3.3090603@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 1 Jul 2010 00:02:46 -0700
Message-ID: <AANLkTimFH9gYI7fWz3QUmjBegcBmr0dfoJLwPYbyU3Xy@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] dbus: fix building for mipsel.
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
X-List-Received-Date: Thu, 01 Jul 2010 07:07:57 -0000
X-List-Received-Date: Thu, 01 Jul 2010 07:07:57 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 29, 2010 at 9:24 PM, Graham Gower <graham.gower@gmail.com> wrot=
e:
> Mipsel lives in a bizarro world where the following error happens:
>
> | =A0 CCLD =A0 dbus-daemon-launch-helper
> | /home/grg/oe2/tmp/cross/mipsel/lib/gcc/mipsel-oe-linux/4.4.4/../../../.=
./mipsel-oe-linux/bin/ld: can not make stub section: File format not recogn=
ized
> | /home/grg/oe2/tmp/cross/mipsel/lib/gcc/mipsel-oe-linux/4.4.4/../../../.=
./mipsel-oe-linux/bin/ld: failed to set dynamic section sizes: File format =
not recognized
> | collect2: ld returned 1 exit status
>
> Fix as noted by the openwrt folks:
> https://dev.openwrt.org/changeset/18308
>
> Signed-off-by: Graham Gower <graham.gower@gmail.com>
> ---
> =A0recipes/dbus/dbus.inc | =A0 =A03 +++
> =A01 files changed, 3 insertions(+), 0 deletions(-)
>
> diff --git a/recipes/dbus/dbus.inc b/recipes/dbus/dbus.inc
> index ec66960..41ec9d1 100644
> --- a/recipes/dbus/dbus.inc
> +++ b/recipes/dbus/dbus.inc
> @@ -38,6 +38,9 @@ EXTRA_OECONF =3D "\
> =A0do_compile_prepend_mipsel() {
> =A0 =A0 =A0 =A0sed -i -e 's/\-fPIE//' -e 's/\-pie\ \-Wl\,\-z\,relro//' bu=
s/Makefile
> =A0}
> +do_configure_prepend_mipsel() {
> + =A0 =A0 =A0 sed -i -e 's/-Wl,--gc-sections/--gc-sections/' ${S}/configu=
re
> +}

this changes this to be a compiler option instead of
gcc driver passing it to link step and gcc does not
have such option so it should error out. I wonder how
does this work. just removing it fully would be
understandable if say gc-sections does not work in ld.

>
> =A0do_install_append() {
> =A0 =A0 =A0 =A0 install -d ${D}${sysconfdir}/init.d
> --
> 1.7.1
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


