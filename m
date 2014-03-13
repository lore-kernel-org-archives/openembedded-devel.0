Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f51.google.com (mail-wg0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 21AD16E413
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Mar 2014 13:12:57 +0000 (UTC)
Received: by mail-wg0-f51.google.com with SMTP id k14so845244wgh.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Mar 2014 06:12:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=TsjQ2G1Mz2rINafbuoXazIdM1d6+r391Gk4/8BPL7NU=;
	b=jT951U7LVIkpoOEyMxEm5ptco3yeHPBAX3NwWTbuA7IKc6K22QTs1rYZxzmBJRtWIc
	Xp34rPBFVIetmERUedZUBrwg0+osr/lt2rMu0tvQzGCOh2nmc0ANqF867YX6PPwdbr1X
	cNcZrvUUo9JxZhtXmBxuw7TzS8c5hkVPmNoOVRQTZ53y1JejoWeE6PfuvZT3qy8t7ez3
	jljASPlbPHlnvJxwQUTJ+4IRNvdU3Ts6HgolRu/ZwTJX3Ltqk3bN7mOCCwaPiAl0MC+S
	jhmnoPShoROfZTtiyXLH6rzyS380+A6nbvCSGxajVOtbyQkwozOlpk1/64RJG3u9q9wg
	DaQw==
X-Gm-Message-State: ALoCoQmpX+mljoFVUGWJglYyyF//Yij9xri861KbDZqa6K3NXtbFOTuUvjVxfGU3r0yseXRQsgNO
X-Received: by 10.180.89.136 with SMTP id bo8mr1600145wib.52.1394716377134;
	Thu, 13 Mar 2014 06:12:57 -0700 (PDT)
Received: from ?IPv6:2001:610:612::35b0:c6f0:381c:cf59?
	([2001:610:612:0:35b0:c6f0:381c:cf59])
	by mx.google.com with ESMTPSA id g5sm5582679wjs.8.2014.03.13.06.12.55
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 13 Mar 2014 06:12:56 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 7.2 \(1874\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <2224360.gaE7z3Uyox@peggleto-mobl5.ger.corp.intel.com>
Date: Thu, 13 Mar 2014 14:13:00 +0100
Message-Id: <2CD4C379-7068-4535-BFCA-06E0955C8797@dominion.thruhere.net>
References: <20140313100833.1910da0b@pcnovotny-t.fit.vutbr.cz>
	<4829465.mJ9OgDPCCk@peggleto-mobl5.ger.corp.intel.com>
	<20585E58-8061-4AC9-99B7-330584CA48DD@dominion.thruhere.net>
	<2224360.gaE7z3Uyox@peggleto-mobl5.ger.corp.intel.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Mailer: Apple Mail (2.1874)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Correct versioning of unversioned source in git
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Mar 2014 13:12:58 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 13 mrt. 2014, om 12:54 heeft Paul Eggleton =
<paul.eggleton@linux.intel.com> het volgende geschreven:

> On Thursday 13 March 2014 12:17:40 Koen Kooi wrote:
>> Op 13 mrt. 2014, om 12:14 heeft Paul Eggleton=20
> <paul.eggleton@linux.intel.com> het volgende geschreven:
>>> On Thursday 13 March 2014 12:09:21 Koen Kooi wrote:
>>>> Op 13 mrt. 2014, om 11:45 heeft Paul Eggleton
>>>=20
>>> <paul.eggleton@linux.intel.com> het volgende geschreven:
>>>>> On Thursday 13 March 2014 10:59:38 Koen Kooi wrote:
>>>>>> Tomas Novotny schreef op 13-03-14 10:08:
>>>>>>> there is a recipe sunxi-board-fex in meta-sunxi layer. That =
recipe
>>>>>>> fetches sources from unversioned git which contains definitions =
of
>>>>>>> some
>>>>>>> boards (in fact it is something like a store). I'm not sure with
>>>>>>> correct
>>>>>>> versioning in OE. Is that: PV =3D "1.0+git${SRCPV}" SRCREV =3D
>>>>>>> "<some_gitrev_I_want>" correct? Will be change of SRCREV (only)
>>>>>>> catched
>>>>>>> by build system (I'm curious how OE handles age of the rev in =
git)? Or
>>>>>>> do
>>>>>>> I need to raise PV to 1.1 and so on with every change to SRCREV?
>>>>>>=20
>>>>>> The answer changes if you have more than one buildhost. If you =
have
>>>>>> only
>>>>>> one buildhost and don't care about other people rebuilding the =
exact
>>>>>> same versions, 1.0+git${SRCPV} will work.
>>>>>>=20
>>>>>> If you have more than one buildhost and/or care about other =
people
>>>>>> rebuilding the exact same, you'll need to increase PR (or PV) =
everytime
>>>>>> SRCREV changes. That will still cause some discrepancies if =
someone
>>>>>> rebuilds after >1 SRCREV change, but upgrade paths should work =
when
>>>>>> increasing PV (not with PR!).
>>>>>=20
>>>>> Why not with PR?
>>>>=20
>>>> because SRCPV in in PV, not PR
>>>=20
>>> Right, but if you're using the PR server, that also stores the
>>> incrementing
>>> number at the start of SRCPV; PR may also increment when SRCREV =
changes as
>>> well (not sure on the latter). The PR server ought to be used if you =
care
>>> about this sort of thing.
>>=20
>> Only if your PR server is publicly available *and* you have network =
access
>> during the build. There is currently no workable way to get =
versioning info
>> to users trying to rebuild something. The closest I've been to a =
solution
>> is to ship prserv-tool exports in git.
>=20
> If you're saying you want something that doesn't require network =
access, gets=20
> the right answer for all users *and* automatically increments when =
something=20
> changes - those are conflicting requirements...

I know, that's why putting SRCPV in PV instead of PR is such a massive =
pain :/=

