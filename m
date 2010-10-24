Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PA7Y0-0000AL-3X
	for openembedded-devel@lists.openembedded.org;
	Sun, 24 Oct 2010 22:52:09 +0200
Received: by iwn5 with SMTP id 5so2198046iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Oct 2010 13:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=DTo4jBS4AMPeWwawrhGTc7q4i6AGktT5q6R3wM0g5ek=;
	b=s7p1o9JTLrpds0vmJz6Dk2FKFM7K5Urz7PNXggYJEj0XRPU6LffeERtgBMYiIe8vx1
	j7BOymREN9EESBiaIZb5gCcClvpBc0ay2E3opU8F99cEQynrwzD2ZZ9rEhg8SaDOMeCV
	YxSMYipzGjf4fig4u8MTFrtOuIXkWv5aEZqOE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=O2tzaJFTowxCgDVbo5aUN+E7oiCrAnz2C7Jzbcjy9tCM46Tb5k3xDUrTgMh3wwP9p2
	6TdzZ3pFkVkrJtnQ+9EZ7G+rSJWvhOM4BxbJSE4xN/yV85+OJ8GBP3BrSIWH6y0hT+Kb
	dP5u5KcKI/UcYs4I/M5sxr4X5Q2AMeK4ed4DQ=
MIME-Version: 1.0
Received: by 10.42.176.73 with SMTP id bd9mr4484010icb.33.1287953483593; Sun,
	24 Oct 2010 13:51:23 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Sun, 24 Oct 2010 13:51:23 -0700 (PDT)
In-Reply-To: <4CC49A20.5080001@eukrea.com>
References: <4CC49A20.5080001@eukrea.com>
Date: Sun, 24 Oct 2010 22:51:23 +0200
Message-ID: <AANLkTikcpMxdBb-VWha-TYXYtO=gEOWMQG=chEyofp0U@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
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
X-List-Received-Date: Sun, 24 Oct 2010 20:52:09 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/10/24 Eric B=E9nard <eric@eukrea.com>:
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
> =A0 =A0 fi
>
> =A0 =A0 unset CFLAGS CXXFLAGS
> - =A0 =A0install -m 0755 ${STAGING_BINDIR_NATIVE}/rcc4 ${S}/bin/rcc
> - =A0 =A0install -m 0755 ${STAGING_BINDIR_NATIVE}/moc4 ${S}/bin/moc
> - =A0 =A0install -m 0755 ${STAGING_BINDIR_NATIVE}/uic4 ${S}/bin/uic
> - =A0 =A0install -m 0755 ${STAGING_BINDIR_NATIVE}/lrelease4 ${S}/bin/lrel=
ease
> +# =A0 =A0install -m 0755 ${STAGING_BINDIR_NATIVE}/rcc4 ${S}/bin/rcc
> +# =A0 =A0install -m 0755 ${STAGING_BINDIR_NATIVE}/moc4 ${S}/bin/moc
> +# =A0 =A0install -m 0755 ${STAGING_BINDIR_NATIVE}/uic4 ${S}/bin/uic
> +# =A0 =A0install -m 0755 ${STAGING_BINDIR_NATIVE}/lrelease4 ${S}/bin/lre=
lease
>
> =A0 =A0 oe_runmake ${EXTRA_ENV}
> =A0}
>

Hm, I' my no means a QT expert but copying files from staging to ${S}
seems at least fishy to me.
Then again you might want to discuss this with cbrake. He added the
lines (or perhaps the complete file) on sep 22.

Frans


