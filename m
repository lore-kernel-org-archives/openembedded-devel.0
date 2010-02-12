Received: from mail-yx0-f178.google.com ([209.85.210.178])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Ng3Wn-0007VI-9b
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Feb 2010 22:58:24 +0100
Received: by yxe8 with SMTP id 8so2837261yxe.17
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Feb 2010 13:55:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=if9ICEHvW9hRA5/T6Uvl43FLF/F3qSbNYg0lropmgdU=;
	b=nnlnSkAkz2YhT0N06yVU80Cu6CDJ+81IIeTAPniZQ0YIrK2lh9ASkU/rEs9vSzq0i1
	I40q3FpOhtqFz6oAaoQGmPrFvS3oVIb/yn4croA+jhYFlELiA6RxJ7KnOwVS6b15+KxB
	VkmynmvLu0rxtwWiMtqyNn7aS7cdbhy1C0H7Y=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=AUGUl/5P2CRoGbNuDx8yw5S5BAg80CjX+/NKTIwTigJD2l+gerzK/IXDKxus4bjzeB
	hp2gw9SZBuBBMtvMv3IQkK4FF+taErbo8YBGqFVERULJPCXfwjny5lYHFf2PMZ/FnV1Y
	jVKhK/10voRD+t6DjuSCn2q4P1LRA1jAEBYBI=
MIME-Version: 1.0
Received: by 10.101.175.28 with SMTP id c28mr2997263anp.85.1266011745031; Fri, 
	12 Feb 2010 13:55:45 -0800 (PST)
In-Reply-To: <ac9c93b11002121353p3aeb67dbofddccc27e3368408@mail.gmail.com>
References: <1266002916-32059-1-git-send-email-GNUtoo@no-log.org>
	<1266002916-32059-2-git-send-email-GNUtoo@no-log.org>
	<ac9c93b11002121353p3aeb67dbofddccc27e3368408@mail.gmail.com>
Date: Fri, 12 Feb 2010 22:55:44 +0100
Message-ID: <ac9c93b11002121355r44616d3cif68d2e399397b22a@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.210.178
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
X-List-Received-Date: Fri, 12 Feb 2010 21:58:26 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/2/12 Frans Meulenbroeks <fransmeulenbroeks@gmail.com>:
> 2010/2/12 Denis 'Gnutoo' Carikli <GNUtoo@no-log.org>:
>> STAGING_DIR_HOST is "" when using native bbclass:
>> native.bbclass:STAGING_DIR_HOST =3D ""
>> But in autotools.bbclass there is:
>> =A0sed -i -e s:${STAGING_DIR_HOST}::g $i
>> which result in the following code in run.autotools_prepackage_lamangler
>> =A0sed -i -e s:::g $i
>> which makes libxml2-native fail like this:
>> =A0| sed: -e expression #1, char 0: no previous regular expression
>>
>> I discussed it on IRC:
>> Feb 11 17:41:29 <RP> =A0 =A0GNUtoo: We should only be doing that is STAG=
ING_DIR_HOST isn't empty I guess
>>
>> So I made a temporary fix which only workarround,because some issues per=
sist:
>> Feb 11 17:41:02 <pb_> =A0 RP: heh, I wonder whether paths with colons in=
 would be considered valid :-}

BTW: paths with : are technically valid, but imho should be considered
as morons.
It might be a good plan to use everywhere the same delimiter in sed scripts=
.
: seems fine to me.

FM


