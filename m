Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f49.google.com (mail-wg0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id BEB8160167
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jun 2014 14:08:45 +0000 (UTC)
Received: by mail-wg0-f49.google.com with SMTP id y10so5212858wgg.20
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jun 2014 07:08:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=Rj7Gi9Og+LzUq7Li9yCPw4cwX0KZaoI7DS2vJ8RhgGU=;
	b=BKLeVmDfSaHHPyNShqqwwm4vvim8LMNpZaZKCWSsPYGxuesPzhZu7M1R9VNnmKqpPL
	k2+XLRPJVXWFEgB80dBYWa1dhn/iEZSbEwJ/CBrTzubjKuAUJE6Gn2YlU2RSsbhukcck
	iY/SH1xrxeYqD+ZOf7I91z9dEOWbkMgoUsF2Zy0cY93b2WNGToLRaKBErGALCPKl0Tda
	LYgZitidlp1w0foo9DoV3WZlSacPWNc7bSGNSUh/Ka7P9fTTErglaYLAhooFeRrxoZJY
	WkBnY+BbU3wLANV86FZ3KNHSGKBqbJHXBW1oo7ARLK3OZNQrq1brIRPZiFI+JE4yJRkI
	KjIw==
X-Gm-Message-State: ALoCoQlZwcQkMiUclqPPTGtuGYgDngBQLgfCbFfCcHITXna1I0DcM3RHbLf8eYPo7/aRO4s0whc7
X-Received: by 10.180.81.72 with SMTP id y8mr12120937wix.7.1403878125579;
	Fri, 27 Jun 2014 07:08:45 -0700 (PDT)
Received: from [172.20.0.187] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPSA id d3sm36922340wiy.13.2014.06.27.07.08.43
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 27 Jun 2014 07:08:44 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 7.2 \(1874\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAP9ODKqpYJh8wYfxPbcjTEpJN9sSyK0DdyOyw-zt7fMxPgoXoA@mail.gmail.com>
Date: Fri, 27 Jun 2014 16:08:34 +0200
Message-Id: <A66C38BA-AE6D-4EBD-A1FF-589A62CB9DB5@dominion.thruhere.net>
References: <Lauren.Post@freescale.com>
	<1403793465-6376-1-git-send-email-lauren.post@freescale.com>
	<lojdi3$8mu$1@ger.gmane.org>
	<CAP9ODKrjhhBwm2Uuwg9j5RQ9e7NdX7TvOTrCG7mjWkWjA77Hiw@mail.gmail.com>
	<B01FEAA5-E6AF-40A3-9C03-A1F204451E86@dominion.thruhere.net>
	<CAP9ODKqpYJh8wYfxPbcjTEpJN9sSyK0DdyOyw-zt7fMxPgoXoA@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
X-Mailer: Apple Mail (2.1874)
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] cpuburn-neon: Upgrade to 2014066 version to fix build break
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
X-List-Received-Date: Fri, 27 Jun 2014 14:08:50 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 27 jun. 2014, om 15:59 heeft Otavio Salvador =
<otavio@ossystems.com.br> het volgende geschreven:

> Hello Koen,
>=20
> On Fri, Jun 27, 2014 at 10:40 AM, Koen Kooi =
<koen@dominion.thruhere.net> wrote:
>>=20
>> Op 27 jun. 2014, om 15:09 heeft Otavio Salvador =
<otavio@ossystems.com.br> het volgende geschreven:
>>=20
>>> Hello Koen,
>>>=20
>>> On Fri, Jun 27, 2014 at 6:29 AM, Koen Kooi =
<koen@dominion.thruhere.net> wrote:
>>>> Lauren Post schreef op 26-06-14 16:37:
>>>>> Replace SRC_URI with new location, md5sum and new name since =
previous
>>>>> download will not work.  Without this fix cpuburn-neon has a =
broken
>>>>> build.
>>>>=20
>>>> Why not make the recipe clone the git repo?
>>>=20
>>> I pondered about this when looking at the issue with Lauren. The
>>> recipe was like this before and this build break is causing issues =
for
>>> several people using meta-fsl-demos as we include it in our test
>>> images.
>>>=20
>>> The long term solution should be to rework it (also because it has
>>> extra tests and those are not being included) but I think this fix =
is
>>> urgent and known to work for now.
>>=20
>> It's still the wrong way to fix it, rework it to use git://, this =
will break again when the repo gets updated.
>>=20
>>> This fix needs to be backported to old branches as well as current
>>> recipe fails to fetch.
>>=20
>> if you're going to backport it make sure it's the right fix.
>=20
> Instead we can use, for now, the below URL so it stays working even if
> it is updated.
>=20
> =
https://raw.githubusercontent.com/ssvb/cpuburn-arm/dd5c5ba58d2b0b23cfab4a2=
86f9d3f5510000f20/cpuburn-a8.S
>=20
> Fine for this fix?

A lot less fragile :)

> I will update it to use the clone and also include
> the extra tests (for A8, A9 and A7 plus the JPEG ones) soon.
>=20
> --=20
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


