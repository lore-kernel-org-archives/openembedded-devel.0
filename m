Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f175.google.com (mail-we0-f175.google.com
	[74.125.82.175])
	by mail.openembedded.org (Postfix) with ESMTP id A8C296F80F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Mar 2014 11:17:39 +0000 (UTC)
Received: by mail-we0-f175.google.com with SMTP id q58so692600wes.20
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Mar 2014 04:17:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=jFEW6vrEX+xQtz6gq9AcDJO2U55p+Aq1b3sDj8BH6Xs=;
	b=fwTGSPllZFjC7e4JALNkdceqzRbdqGIbzpHHgh8me+dnkhfvP+xXw3Y0Ae4Psx2l8e
	7psww+NfOSnEC1TGWDiOD7cNToFKCJ0xQGqgdb7ymojomkrRs2SjTQ+lRTX+v5iDg5rp
	Az3d6r1ttC1WMbKdHwmpbunoAT1Tx7IWSlZFzeYsHG2/nU2DeXrobeUs9aYik/mql9iX
	Cs8+N880ysmqtox6iwmthi8gyrdmih2wSDeNCtY0YHR8Yp88uuYUP91pR280Hktx55jy
	ao/KYdwAYa0naAnu30q/2CbplM+IJ7WhygHUr3qJ1LQ6+XxnF7WxEDCdA2Qf9D0LA/Wo
	L8UA==
X-Gm-Message-State: ALoCoQmbx+l1ANKNiPi8pSzM6XsHYoRyphd9vhVj/ywQiNwEqkY3XjgJU7PfRjR3R0CORzhOyE5l
X-Received: by 10.180.102.42 with SMTP id fl10mr1161100wib.42.1394709460719;
	Thu, 13 Mar 2014 04:17:40 -0700 (PDT)
Received: from ?IPv6:2001:610:612::35b0:c6f0:381c:cf59?
	([2001:610:612:0:35b0:c6f0:381c:cf59])
	by mx.google.com with ESMTPSA id
	qg3sm24600910wic.10.2014.03.13.04.17.39 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 13 Mar 2014 04:17:39 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 7.2 \(1874\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4829465.mJ9OgDPCCk@peggleto-mobl5.ger.corp.intel.com>
Date: Thu, 13 Mar 2014 12:17:40 +0100
Message-Id: <20585E58-8061-4AC9-99B7-330584CA48DD@dominion.thruhere.net>
References: <20140313100833.1910da0b@pcnovotny-t.fit.vutbr.cz>
	<23248607.unOJTkLeyP@peggleto-mobl5.ger.corp.intel.com>
	<F1A43237-A560-4EC6-A29B-699952F92F6B@dominion.thruhere.net>
	<4829465.mJ9OgDPCCk@peggleto-mobl5.ger.corp.intel.com>
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
X-List-Received-Date: Thu, 13 Mar 2014 11:17:42 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 13 mrt. 2014, om 12:14 heeft Paul Eggleton =
<paul.eggleton@linux.intel.com> het volgende geschreven:

> On Thursday 13 March 2014 12:09:21 Koen Kooi wrote:
>> Op 13 mrt. 2014, om 11:45 heeft Paul Eggleton=20
> <paul.eggleton@linux.intel.com> het volgende geschreven:
>>> On Thursday 13 March 2014 10:59:38 Koen Kooi wrote:
>>>> Tomas Novotny schreef op 13-03-14 10:08:
>>>>> there is a recipe sunxi-board-fex in meta-sunxi layer. That recipe
>>>>> fetches sources from unversioned git which contains definitions of =
some
>>>>> boards (in fact it is something like a store). I'm not sure with =
correct
>>>>> versioning in OE. Is that: PV =3D "1.0+git${SRCPV}" SRCREV =3D
>>>>> "<some_gitrev_I_want>" correct? Will be change of SRCREV (only) =
catched
>>>>> by build system (I'm curious how OE handles age of the rev in =
git)? Or
>>>>> do
>>>>> I need to raise PV to 1.1 and so on with every change to SRCREV?
>>>>=20
>>>> The answer changes if you have more than one buildhost. If you have =
only
>>>> one buildhost and don't care about other people rebuilding the =
exact
>>>> same versions, 1.0+git${SRCPV} will work.
>>>>=20
>>>> If you have more than one buildhost and/or care about other people
>>>> rebuilding the exact same, you'll need to increase PR (or PV) =
everytime
>>>> SRCREV changes. That will still cause some discrepancies if someone
>>>> rebuilds after >1 SRCREV change, but upgrade paths should work when
>>>> increasing PV (not with PR!).
>>>=20
>>> Why not with PR?
>>=20
>> because SRCPV in in PV, not PR
>=20
> Right, but if you're using the PR server, that also stores the =
incrementing=20
> number at the start of SRCPV; PR may also increment when SRCREV =
changes as=20
> well (not sure on the latter). The PR server ought to be used if you =
care=20
> about this sort of thing.

Only if your PR server is publicly available *and* you have network =
access during the build. There is currently no workable way to get =
versioning info to users trying to rebuild something. The closest I've =
been to a solution is to ship prserv-tool exports in git.

regards,

Koen=

