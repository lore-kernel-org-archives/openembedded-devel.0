Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id C885560030
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jun 2014 13:40:27 +0000 (UTC)
Received: by mail-wi0-f182.google.com with SMTP id bs8so2858713wib.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jun 2014 06:40:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=KsC9siUOtLPrG6Zpfh6IPl8SruaZ17a3jJCqjq36Wgc=;
	b=Y7gbbWVnWzrHmU2IWqTaU663S9YO6pvQnZ3QABjATRjsllo20eXJeRy0nTQUVxqpYI
	tXk/AzB3LbMQrnRIX06uZ1bMsD40nVlSUpJotOpWXY8gQHJlZWGR9NaN3Sl3pimNRaDP
	PM+73knUWhicvs7HuSMXEKWveARcpOxKBHoZjexr2lGIi9p43NS+4IB6E04FPXNPQ0Q3
	O1HVQNY+TNlDpUjVXqJFpn4ls/gQA3eghLkeWK2rp8J9tMwEk/5AfB97ajsLbvI+Av63
	WgQ7q0ZGkdudcy6vxSBO6S2QAUlrJe5UCT0/H5HQlihwR81/ahj9QzHjnUqfEeEQeBRJ
	IcWA==
X-Gm-Message-State: ALoCoQmWSARvMTrwibfWjK9kGtvHF5U9QUA3f/yTih0zG48uCc9ASbjFupDm2tuw/mzAq0dInVR9
X-Received: by 10.180.97.195 with SMTP id ec3mr11914194wib.13.1403876428252;
	Fri, 27 Jun 2014 06:40:28 -0700 (PDT)
Received: from ?IPv6:2001:610:612::3874:69d5:14bb:34e4?
	([2001:610:612:0:3874:69d5:14bb:34e4])
	by mx.google.com with ESMTPSA id gi7sm78098275wib.1.2014.06.27.06.40.26
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 27 Jun 2014 06:40:27 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.2\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAP9ODKrjhhBwm2Uuwg9j5RQ9e7NdX7TvOTrCG7mjWkWjA77Hiw@mail.gmail.com>
Date: Fri, 27 Jun 2014 15:40:25 +0200
Message-Id: <B01FEAA5-E6AF-40A3-9C03-A1F204451E86@dominion.thruhere.net>
References: <Lauren.Post@freescale.com>
	<1403793465-6376-1-git-send-email-lauren.post@freescale.com>
	<lojdi3$8mu$1@ger.gmane.org>
	<CAP9ODKrjhhBwm2Uuwg9j5RQ9e7NdX7TvOTrCG7mjWkWjA77Hiw@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
X-Mailer: Apple Mail (2.1878.2)
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
X-List-Received-Date: Fri, 27 Jun 2014 13:40:30 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 27 jun. 2014, om 15:09 heeft Otavio Salvador =
<otavio@ossystems.com.br> het volgende geschreven:

> Hello Koen,
>=20
> On Fri, Jun 27, 2014 at 6:29 AM, Koen Kooi =
<koen@dominion.thruhere.net> wrote:
>> Lauren Post schreef op 26-06-14 16:37:
>>> Replace SRC_URI with new location, md5sum and new name since =
previous
>>> download will not work.  Without this fix cpuburn-neon has a broken
>>> build.
>>=20
>> Why not make the recipe clone the git repo?
>=20
> I pondered about this when looking at the issue with Lauren. The
> recipe was like this before and this build break is causing issues for
> several people using meta-fsl-demos as we include it in our test
> images.
>=20
> The long term solution should be to rework it (also because it has
> extra tests and those are not being included) but I think this fix is
> urgent and known to work for now.

It's still the wrong way to fix it, rework it to use git://, this will =
break again when the repo gets updated.

> This fix needs to be backported to old branches as well as current
> recipe fails to fetch.

if you're going to backport it make sure it's the right fix.


>=20
> --=20
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
>=20


