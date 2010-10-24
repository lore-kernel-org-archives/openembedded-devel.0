Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PA5hd-0007x5-KU
	for openembedded-devel@lists.openembedded.org;
	Sun, 24 Oct 2010 20:54:00 +0200
Received: by iwn5 with SMTP id 5so2099883iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Oct 2010 11:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=C2PIEE68yM+UXWZByKEkd62M2OZK3HyW5yHwyn2Kcpw=;
	b=R40rsw1nyQWjyPY1jjUFSCGoiFXnobFHJCiAgIJ67RBTBo+4xY0qOB4wJAjyj6Yo8p
	7/25t+oeAvu28NZlrKVTmyU1Q732GqwU9j8OChgmHjyOaDnSYng1HSFnrDWd5eo9NWKD
	evWlfZBq+9rdjhZ4+LhsR7so8WMv9dx77hjaE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=sfBRe+uonlkTlpGvdSWUNEarO4ktRMdCQStCEtXynODMQAEPWdAqkwHqjxR9eTAaeR
	mOk23rhpdloZzRD16NmJ/qRlY1TmGzo8EwlNSVRVUQX6ClycAGUSkE6T8aR2NRdZVbFa
	jPV8AttR9j4O7I3C2jQ8gQ35oBDjbueIDVl9Y=
MIME-Version: 1.0
Received: by 10.231.159.203 with SMTP id k11mr4827996ibx.115.1287946399028;
	Sun, 24 Oct 2010 11:53:19 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Sun, 24 Oct 2010 11:53:18 -0700 (PDT)
In-Reply-To: <AANLkTimUZ9KiEdhbu2R=VV0mCVh_gWqoxHxpwrnTSJeX@mail.gmail.com>
References: <AANLkTimyqP-aP=+poQSHFE=ePogb66en0BwNCYWwCkXk@mail.gmail.com>
	<AANLkTimUZ9KiEdhbu2R=VV0mCVh_gWqoxHxpwrnTSJeX@mail.gmail.com>
Date: Sun, 24 Oct 2010 20:53:18 +0200
Message-ID: <AANLkTimR4TEOwVmWDsvL+WJboq+1qdRssKedS+iiVE9J@mail.gmail.com>
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
Subject: Re: sed dependency
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
X-List-Received-Date: Sun, 24 Oct 2010 18:54:00 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/10/24 Chris Larson <clarson@kergoth.com>:
> On Sun, Oct 24, 2010 at 5:00 AM, Frans Meulenbroeks <
> fransmeulenbroeks@gmail.com> wrote:
>
>> Triggered by this: http://patchwork.openembedded.org/patch/3099/
>> I was wondering whether we should have sed-native as always-required ?
>>
>> If not lots of recipes might require an update like the one above:
>>
>> frans@linux-suse:~/oe/openembedded/recipes> grep sed -l */* -w | wc
>> =A0 =A0776 =A0 =A0 776 =A0 20661
>> frans@linux-suse:~/oe/openembedded/recipes> grep sed-native */* | wc
>> =A0 =A0 =A09 =A0 =A0 =A061 =A0 =A0 737
>>
>> Guess despite the -w there will be some false hits in the first grep
>> (because it is in postinst or in a comment), but I expect some 700+
>> recipes remaining.
>>
>> (actually thinking about it we could also do a scan on all added code
>> to see if there is a dep on e.g. sed or grep, but guess due to the
>> overhead then it is better to generically depend on sed-native).
>>
>> Guess something similar holds for grep (gave 128 matches) and probably
>> some other tools).
>>
>
> If something is covered by posix / SuSv3, I see no need to use a -native.
> =A0We have to expect a certain amount of sanity in our build environment.=
 =A0For
> specific non-portable usages, those should certainly be fixed to not use
> that functionality, to use some form of sanitizing wrapper, or to depend =
on
> the gnu tool specifically via -native, imo.
> --
Seems like a good plan to me. Guess then we should reject Andreas's patch.

for the record: this are the recipes that DEPEND on sed-native

libgc/libgc_6.5.bb:DEPENDS		=3D "sed-native"
libgc/libgc_6.7.bb:DEPENDS		=3D "sed-native"
meta/canadian-sdk.bb:DEPENDS =3D "opkg-native ipkg-utils-native
fakeroot-native sed-native zip-native"
meta/meta-toolchain.bb:DEPENDS =3D "opkg-native ipkg-utils-native
fakeroot-native sed-native"
opensync/libsyncml_0.4.0.bb:DEPENDS =3D "sed-native wbxml2 libsoup
libxml2 bluez-libs openobex"
opensync/libsyncml_0.4.6.bb:DEPENDS =3D "sed-native wbxml2 libsoup
libxml2 bluez-libs openobex"
opensync/libsyncml_svn.bb:DEPENDS =3D "sed-native wbxml2 libsoup libxml2
bluez-libs openobex"
rpm/rpm_4.4.2.3.bb:DEPENDS =3D "zlib beecrypt file popt python sed-native"

No idea if they really should depend on it.

Frans


