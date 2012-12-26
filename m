Received: from mail-ee0-f53.google.com ([74.125.83.53])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1TnsuX-0007si-Lt
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 Dec 2012 16:28:51 +0100
Received: by mail-ee0-f53.google.com with SMTP id c50so4221307eek.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Dec 2012 07:13:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:references:mime-version:in-reply-to:content-type
	:content-transfer-encoding:message-id:cc:x-mailer:from:subject:date
	:to:x-gm-message-state;
	bh=zKJ3UtdCGMe+59ClPmuiPieaz3F9eez7qa+ZO9U2MsU=;
	b=NrfJeloHlhPrF5xWXtTS2jpo2odbknMDhNMMoshR6WIfA8JCZh27sKy+n1bL8+BKT7
	9ktkrUhG5S47oXL6m9jiKp/CXyzfa0jDjs//QRXoJkz5CnKXNOfOhnJM3YBlSINwpzsE
	XwqshHRpRcz0zRBArfBaF6AEHLVlkMFQa0BPH0XjO7l8Btr4yUiP+VIH0dxU/zQZWBjd
	HULrDzbr4L2hOoyt+ZBfxt/mvEftFc0BE46IGY3TveXFfvkZPvFo0iDfZ0thP+67lfGH
	zdwX/54rsxIphe9K5pWy3PmWWQJ+jGfuDlJXbmtsiPDnCZ34SldBNkf8i5SQxKwqWyez
	lmFw==
X-Received: by 10.14.173.65 with SMTP id u41mr70398227eel.13.1356534837010;
	Wed, 26 Dec 2012 07:13:57 -0800 (PST)
Received: from [172.20.0.104] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id 43sm53788926eed.10.2012.12.26.07.13.54
	(version=SSLv3 cipher=OTHER); Wed, 26 Dec 2012 07:13:56 -0800 (PST)
References: <kb31gs$u4d$1@ger.gmane.org> <3053324.FGHdgGAGGN@helios>
	<20121223194558.GL8988@jama.palm1.palmone.com>
	<20121226121055.GA8988@jama.palm1.palmone.com>
Mime-Version: 1.0 (1.0)
In-Reply-To: <20121226121055.GA8988@jama.palm1.palmone.com>
Message-Id: <0E6348F0-C1BE-4325-818C-8F3CCACBA730@dominion.thruhere.net>
X-Mailer: iPad Mail (10A407)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 26 Dec 2012 16:13:53 +0100
To: Martin Jansa <martin.jansa@gmail.com>
X-Gm-Message-State: ALoCoQldA8wh0HPnqQw5ln24mhw5J05LCgGwY1YQOFdR71EUtCNi/r594M217mWiOld9zUMK/Z96
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: Ruby and meta-oe?
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
X-List-Received-Date: Wed, 26 Dec 2012 15:28:51 -0000
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable



Op 26 dec. 2012 om 13:10 heeft Martin Jansa <martin.jansa@gmail.com> het vol=
gende geschreven:

> On Sun, Dec 23, 2012 at 08:45:58PM +0100, Martin Jansa wrote:
>> On Sun, Dec 23, 2012 at 07:40:51PM +0000, Paul Eggleton wrote:
>>> On Saturday 22 December 2012 02:14:07 Koen Kooi wrote:
>>>> What's the status on getting ruby recipes into a meta-ruby or meta-oe? I=

>>>> just had to import it into my working branch to build mkvtoolnix which n=
eeds
>>>> ruby-native for its buildsystem (don't ask).
>>>=20
>>> The original author never replied to my suggestion about creating a sepa=
rate=20
>>> layer. Unless there are objections I'd suggest just creating a meta-ruby=
 and=20
>>> using the patches from patchwork to add ruby into it.
>>=20
>> Agreed,
>=20
> Btw: I'm doing this atm, but that recipe on patchwork didn't even have
> LIC_FILES_CHKSUMs.

I squashed 1/2 and 2/2 together, that makes ruby-native work


>=20
> Koen: feel free to sync it with your tested version in follow-up patch.
>=20
> Cheers,
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


