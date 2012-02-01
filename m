Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RsXdD-0001P9-83
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Feb 2012 11:41:39 +0100
Received: by wgbdr13 with SMTP id dr13so973296wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Feb 2012 02:33:44 -0800 (PST)
Received: by 10.180.100.234 with SMTP id fb10mr40567184wib.8.1328092424612;
	Wed, 01 Feb 2012 02:33:44 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id t15sm43814102wiv.6.2012.02.01.02.33.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 01 Feb 2012 02:33:43 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1673681.7VAs90S7L9@helios>
Date: Wed, 1 Feb 2012 11:33:37 +0100
Message-Id: <054AF572-114E-4927-AC07-C595FAF205FC@dominion.thruhere.net>
References: <1592899.mTy93uB97i@helios> <1673681.7VAs90S7L9@helios>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: Splitting meta-oe
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
X-List-Received-Date: Wed, 01 Feb 2012 10:41:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 1 feb. 2012, om 11:07 heeft Paul Eggleton het volgende geschreven:

> On Wednesday 25 January 2012 12:48:11 Paul Eggleton wrote:
>> The meta-oe layer [1] is becoming the home for additional recipes =
that we
>> miss from OE-Classic that don't have another obvious layer to go =
into, and
>> this is a good thing. However I think that meta-oe is already in a =
state
>> where quite a few people feel the new structure is not working for =
them.
>>=20
>> As I see it, meta-oe is trying provide the following:
>>=20
>> 1) Additional recipes that are not in OE-Core
>>=20
>> 2) Additional functionality for OE-Core recipes that we can't enable =
in OE-
>> Core itself (e.g. enabling postgres support in Qt) - mostly just a
>> side-effect of #1
>>=20
>> 3) A place to preserve old versions of recipes that have been removed =
from
>> OE-Core in favour of newer versions
>>=20
>> 4) Newer less-well tested versions of recipes
>>=20
>> I think what most people want when they enable meta-oe in their layer
>> configuration is #1, and it's probably OK to get #2 along with it. =
They do
>> not however expect versions of toolchains, eglibc or other fairly
>> fundamental bits and pieces that might cause their build to fail when
>> everything worked fine just building with OE-Core (#4). Equally I =
expect
>> there will be some people who want just #3 and nothing else.
>>=20
>> I understand there is significant value in providing all of these =
things, I
>> just think we shouldn't be trying to do them all in one largely =
indivisible
>> layer. In our new layer structure we should be able to find a way to =
split
>> the metadata so that people who want any combination can still have =
what we
>> have in meta-oe today, and yet those who just want one of them don't =
get
>> unexpected build failures or older/newer versions being built.
>>=20
>> Thoughts?
>>=20
>> [1] http://cgit.openembedded.org/meta-openembedded/tree/meta-oe
>=20
> Koen, as the maintainer of meta-oe would you like to comment on this =
thread?

I'm waiting for FOSDEM and ELC to discuss this face to face.=


