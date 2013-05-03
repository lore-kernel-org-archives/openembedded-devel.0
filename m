Received: from mail-ee0-f50.google.com ([74.125.83.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UYHQ7-0005wy-P7
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 May 2013 16:57:16 +0200
Received: by mail-ee0-f50.google.com with SMTP id e50so821785eek.23
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 May 2013 07:39:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=bQTxHvytpTljMMAzOLYZNMa+pckrc2Mn4UzLWwCWfV8=;
	b=Uzb7QEWOn8lp3QJp8eJf623oIN9kRKa2i3BbO9GdU8S8oKv7fycbWv//DSFxlEqHfN
	E/K5mDW5D81BV3iwgEiUu3KqYdGODIz+XdihMejBoKBHhhGC7B7dCOu+F0JLmEOnvt7i
	mYl1jYVz99mhjl21Mnl6dgHB9En8n+mB9xQQCqobXQCepHCLUvBAam5vo7//Ut5TBCSL
	s+9Jt5ByvAg6OUC8l4Op67trT0bpUu4wEKh5Z8D35wssMfuol4R5xgzp0O6vtwzTRIxp
	n22J1G9I7Bj9fAD/+Th1Aa97C7AfIZKsmavEaZ9djG6YJC0gZ9SUFqWcaH9eXq9Pztcc
	xIHQ==
X-Received: by 10.14.213.67 with SMTP id z43mr31967274eeo.16.1367591956722;
	Fri, 03 May 2013 07:39:16 -0700 (PDT)
Received: from ?IPv6:2001:610:612::dc8:274f:2522:bd85?
	([2001:610:612:0:dc8:274f:2522:bd85])
	by mx.google.com with ESMTPSA id l6sm16269610eem.9.2013.05.03.07.39.13
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 03 May 2013 07:39:15 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <2308920.kogFCty2Gp@helios>
Date: Fri, 3 May 2013 16:39:13 +0200
Message-Id: <C7B38416-E360-4FEA-81D1-718D9E6352B7@dominion.thruhere.net>
References: <1367008757-18667-1-git-send-email-nicolas.dechesne@linaro.org>
	<1756231.MGNYtfpC2x@helios>
	<576F47F5-73BA-4369-9A2E-666939097E0A@dominion.thruhere.net>
	<2308920.kogFCty2Gp@helios>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Mailer: Apple Mail (2.1503)
X-Gm-Message-State: ALoCoQltO/uQ94Z7evACx6Pa+0w/opaEwd5a0SzxmogJabzopZLrVULYzyJEikTsESfUV0hWLNkZ
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] smartmontools: import from OE classic
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
X-List-Received-Date: Fri, 03 May 2013 14:57:22 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 3 mei 2013, om 16:30 heeft Paul Eggleton =
<paul.eggleton@linux.intel.com> het volgende geschreven:

> On Friday 03 May 2013 16:10:40 Koen Kooi wrote:
>> Op 27 apr. 2013, om 13:13 heeft Paul Eggleton=20
> <paul.eggleton@linux.intel.com> het volgende geschreven:
>>> On Saturday 27 April 2013 06:34:46 Philip Balister wrote:
>>>> On 04/27/2013 04:24 AM, Paul Eggleton wrote:
>>>>> On Friday 26 April 2013 23:41:38 Koen Kooi wrote:
>>>>>> And do you really need a .inc?
>>>>>=20
>>>>> Are we removing inc files if they were present in OE Classic? =
First I've
>>>>> heard if we are...
>>>>=20
>>>> If we are trying to reduce the number of versions of recipes we =
carry,
>>>> dropping .inc files would seem to be a good idea. I don't have =
strong
>>>> feelings, but it seems like something we should consider.
>>>=20
>>> I agree we should try to keep only one version of each recipe in =
software
>>> layers, however I figure it makes it easier for people to carry =
their own
>>> versions of recipes in distro layers (particularly older, which may =
be
>>> required in certain circumstances) if we do keep inc files where =
they
>>> already exist.
>>=20
>> Can people raise their hand if they want to have a different version =
of
>> smartmontools in their layer?
>=20
> Even assuming everyone who could possibly want this is reading this =
thread,=20
> which is unlikely, in the absence of time machines you won't hear from =
anyone=20
> who doesn't need it now but does in the future.=20
>=20
> As a general rule, people do often want to build versions of recipes =
from SCM=20
> repositories and having an inc file makes that a bit easier. If we =
already have=20
> the inc file split I can't see a compelling reason to drop it.
>=20
> I would also point out that we were asked to preserve these in the =
original=20
> move to OE-Core and as far as I am aware we have done so.

It's unnecessary clutter and in the smartmontools case unneeded as well.=


