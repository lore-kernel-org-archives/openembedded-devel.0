Received: from mail-yw0-f176.google.com ([209.85.211.176])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Ng3Uu-0004dY-6u
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Feb 2010 22:56:28 +0100
Received: by ywh6 with SMTP id 6so2605174ywh.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Feb 2010 13:53:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=IxgFs6tQJ4B831OKLi4bMpSJ/rjaOotrlb8BgFKcE/g=;
	b=f8PmGuThf9J2Ifq95WCdU2a/GCadQmE6PYIGutuHgFXHfU9HO0Y+Nyw+PkYVGFgBL1
	b059/2QZspyRh3VSf7Uox0A/K895iCPf7rR9AeYa8c5fOV+OCP2n9FFf2CP8qf7k5U0e
	aYIoeQEUpX3QSaV+pV8SA+RNDuk60QeDOhMdc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=EXHF22kMClKidjByx6DiAjK9UWfPYbh8LmMpF0n0b2GSUjmTNmKshi8sLGBfUIRlZr
	YX2hVLBbU2rhwg6jbAW5XnsIgl08KKvvFqpAT1qCkNijSnySZQtI2CjyjsVuoeHMOPjb
	2Uyw/8ClLC7RX4GKZ2UTX0WMGu1Yk3ljynjY0=
MIME-Version: 1.0
Received: by 10.101.154.22 with SMTP id g22mr3000173ano.51.1266011628025; Fri, 
	12 Feb 2010 13:53:48 -0800 (PST)
In-Reply-To: <1266002916-32059-2-git-send-email-GNUtoo@no-log.org>
References: <1266002916-32059-1-git-send-email-GNUtoo@no-log.org>
	<1266002916-32059-2-git-send-email-GNUtoo@no-log.org>
Date: Fri, 12 Feb 2010 22:53:47 +0100
Message-ID: <ac9c93b11002121353p3aeb67dbofddccc27e3368408@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.211.176
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] autotools.bbclass fix issue with native
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
X-List-Received-Date: Fri, 12 Feb 2010 21:56:28 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/2/12 Denis 'Gnutoo' Carikli <GNUtoo@no-log.org>:
> STAGING_DIR_HOST is "" when using native bbclass:
> native.bbclass:STAGING_DIR_HOST =3D ""
> But in autotools.bbclass there is:
> =A0sed -i -e s:${STAGING_DIR_HOST}::g $i
> which result in the following code in run.autotools_prepackage_lamangler
> =A0sed -i -e s:::g $i
> which makes libxml2-native fail like this:
> =A0| sed: -e expression #1, char 0: no previous regular expression
>
> I discussed it on IRC:
> Feb 11 17:41:29 <RP> =A0 =A0GNUtoo: We should only be doing that is STAGI=
NG_DIR_HOST isn't empty I guess
>
> So I made a temporary fix which only workarround,because some issues pers=
ist:
> Feb 11 17:41:02 <pb_> =A0 RP: heh, I wonder whether paths with colons in =
would be considered valid :-}
>
> Signed-off-by: Denis 'Gnutoo' Carikli <GNUtoo@no-log.org>
> ---
> =A0classes/autotools.bbclass | =A0 =A05 ++++-
> =A01 files changed, 4 insertions(+), 1 deletions(-)
>
> diff --git a/classes/autotools.bbclass b/classes/autotools.bbclass
> index 1ea4b6f..daa0deb 100644
> --- a/classes/autotools.bbclass
> +++ b/classes/autotools.bbclass
> @@ -152,7 +152,10 @@ autotools_prepackage_lamangler () {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 sed -i -e s:${CROSS_DIR}/${HOST_SYS}::g $=
i
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 sed -i -e s:${CROSS_DIR}::g $i
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 sed -i -e s:${STAGING_LIBDIR}:${libdir}:g=
 $i
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0sed -i -e s:${STAGING_DIR_HOST}::g $i
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0#TODO: needs better handling of native
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if [ -n "${STAGING_DIR_HOST}" ]; then
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0sed -i -e s:${STAGING_DI=
R_HOST}::g $i
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0fi
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 sed -i -e s:${STAGING_DIR}::g $i
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 sed -i -e s:${S}::g $i
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 sed -i -e s:${T}::g $i

With some hesitation:
Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>

The hesitation mainly concerns the #TODO comment. I don't really find
it explanatory, personally I'd say remove the whole comment.

FM


