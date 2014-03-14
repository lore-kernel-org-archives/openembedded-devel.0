Return-Path: <mike.looijmans@topic.nl>
Received: from smtp103.mer-nm.internl.net (smtp103.mer-nm.internl.net
	[217.149.192.139])
	by mail.openembedded.org (Postfix) with ESMTP id D42CA6F4E7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Mar 2014 11:54:01 +0000 (UTC)
Received: from amavisd-new (mailscanner03.wrt-nm.internl.net [217.149.192.96])
	by smtp103.mer-nm.internl.net (Postfix) with ESMTP id D41D73F88D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Mar 2014 12:54:00 +0100 (CET)
X-Spam-scanned: scanned by InterNLnet Mail Scan System
X-Spam-Flag: NO
X-Spam-Score: -4.4
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 tagged_above=-999 required=4.5
	tests=[BAYES_00=-2.9, KHOP_THREADED=-1.5] autolearn=no
X-Spam-Languages: en
Received: from smtp103.mer-nm.internl.net ([217.149.192.139])
	by amavisd-new (mailscanner03.wrt-nm.internl.net [217.149.192.160])
	(amavisd-new, port 10024)
	with ESMTP for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Mar 2014 12:54:00 +0100 (CET)
Received: from TOP-EX01.TOPIC.LOCAL (mail.topic.nl [82.204.13.182])
	(using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	by smtp103.mer-nm.internl.net (Postfix) with ESMTPS
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Mar 2014 12:54:00 +0100 (CET)
Received: from [192.168.80.45] (192.168.80.45) by TOP-EX01.TOPIC.LOCAL
	(192.168.10.102) with Microsoft SMTP Server (TLS) id 14.3.181.6;
	Fri, 14 Mar 2014 12:54:01 +0100
Message-ID: <5322EDD7.1050206@topic.nl>
Date: Fri, 14 Mar 2014 12:53:59 +0100
From: Mike Looijmans <mike.looijmans@topic.nl>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <20140313100833.1910da0b@pcnovotny-t.fit.vutbr.cz>	<4829465.mJ9OgDPCCk@peggleto-mobl5.ger.corp.intel.com>	<20585E58-8061-4AC9-99B7-330584CA48DD@dominion.thruhere.net>
	<2224360.gaE7z3Uyox@peggleto-mobl5.ger.corp.intel.com>
In-Reply-To: <2224360.gaE7z3Uyox@peggleto-mobl5.ger.corp.intel.com>
X-Originating-IP: [192.168.80.45]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
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
X-List-Received-Date: Fri, 14 Mar 2014 11:54:02 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFOn 03/13/2014 12:54 PM, Paul Eggleton wrote:
> On Thursday 13 March 2014 12:17:40 Koen Kooi wrote:
>> Op 13 mrt. 2014, om 12:14 heeft Paul Eggleton
> <paul.eggleton@linux.intel.com> het volgende geschreven:
>>> On Thursday 13 March 2014 12:09:21 Koen Kooi wrote:
>>>> Op 13 mrt. 2014, om 11:45 heeft Paul Eggleton
>>>
>>> <paul.eggleton@linux.intel.com> het volgende geschreven:
>>>>> On Thursday 13 March 2014 10:59:38 Koen Kooi wrote:
>>>>>> Tomas Novotny schreef op 13-03-14 10:08:
>>>>>>> there is a recipe sunxi-board-fex in meta-sunxi layer. That recipe
>>>>>>> fetches sources from unversioned git which contains definitions of
>>>>>>> some
>>>>>>> boards (in fact it is something like a store). I'm not sure with
>>>>>>> correct
>>>>>>> versioning in OE. Is that: PV =3D "1.0+git${SRCPV}" SRCREV =3D
>>>>>>> "<some_gitrev_I_want>" correct? Will be change of SRCREV (only)
>>>>>>> catched
>>>>>>> by build system (I'm curious how OE handles age of the rev in git)?=
 Or
>>>>>>> do
>>>>>>> I need to raise PV to 1.1 and so on with every change to SRCREV?
>>>>>>
>>>>>> The answer changes if you have more than one buildhost. If you have
>>>>>> only
>>>>>> one buildhost and don't care about other people rebuilding the exact
>>>>>> same versions, 1.0+git${SRCPV} will work.
>>>>>>
>>>>>> If you have more than one buildhost and/or care about other people
>>>>>> rebuilding the exact same, you'll need to increase PR (or PV) everyt=
ime
>>>>>> SRCREV changes. That will still cause some discrepancies if someone
>>>>>> rebuilds after >1 SRCREV change, but upgrade paths should work when
>>>>>> increasing PV (not with PR!).
>>>>>
>>>>> Why not with PR?
>>>>
>>>> because SRCPV in in PV, not PR
>>>
>>> Right, but if you're using the PR server, that also stores the
>>> incrementing
>>> number at the start of SRCPV; PR may also increment when SRCREV changes=
 as
>>> well (not sure on the latter). The PR server ought to be used if you ca=
re
>>> about this sort of thing.
>>
>> Only if your PR server is publicly available *and* you have network acce=
ss
>> during the build. There is currently no workable way to get versioning i=
nfo
>> to users trying to rebuild something. The closest I've been to a solutio=
n
>> is to ship prserv-tool exports in git.
>
> If you're saying you want something that doesn't require network access, =
gets
> the right answer for all users *and* automatically increments when someth=
ing
> changes - those are conflicting requirements...

"gitpkgv" from mete-openembedded has been doing a good job at that for me i=
n=20
several projects. It just counts the number of git commits and uses that as=
=20
counter. Everybody thus sees the same number, versions are incremental, and=
 no=20
server access needed during build.


My only wish would be that this were in oe-core.





Met vriendelijke groet / kind regards,

Mike Looijmans

TOPIC Embedded Systems
Eindhovenseweg 32-C, NL-5683 KH Best
Postbus 440, NL-5680 AK Best
Telefoon: (+31) (0) 499 33 69 79
Telefax:  (+31) (0) 499 33 69 70
E-mail: mike.looijmans@topic.nl
Website: www.topic.nl

Please consider the environment before printing this e-mail


