Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id F1D696BA7B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Aug 2013 21:38:57 +0000 (UTC)
Received: by mail-pa0-f42.google.com with SMTP id lj1so3966409pab.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Aug 2013 14:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=x1YeDSKeNodyB7swhWJN+zxU4GxSLK9+zdBYwcOrlYQ=;
	b=g1lpV6oKpsvVWJMBCQ0C6krqLE9yNGl5DUqiE7zwBVC+ENmgZlGzvSqJuab2y44bBv
	P/nzKVXrxBiRGsU3u6WgjcT3TCSS6nOinSfHqj4A5tCCCf5UDuc96PJjXYmrwITy9EI+
	BRtg9zBY/J1+gDsY2Q9+szPGSFsoX9Az/ium+in+rBWxbl/DAEz/2A+O9iGG5atDMbSN
	tezX/MBxGkXJbFko1P2CMbjLGZ60spddZx59X/uaggJ0fpF1iUjf7hDzoowLD8WTzApB
	PRjmqqon1WjEF6acW2glsFRbKrvZCl6aG9/8TSypRbPeflJieO/ZbkWFG0CEimpRKJ/T
	7kOw==
X-Received: by 10.68.202.130 with SMTP id ki2mr17707858pbc.43.1377553138206;
	Mon, 26 Aug 2013 14:38:58 -0700 (PDT)
Received: from edchang-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPSA id t9sm20073782pba.46.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 26 Aug 2013 14:38:57 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1419577.68pc7GzaiK@helios>
Date: Mon, 26 Aug 2013 14:39:10 -0700
Message-Id: <C76898E3-8DF0-4327-9A24-510259D58C39@gmail.com>
References: <cover.1377257565.git.paul.eggleton@linux.intel.com>
	<da4ddacdf801a6744fbdd2081bcc41586ec326ac.1377257565.git.paul.eggleton@linux.intel.com>
	<0A0D83CF-8BD1-46F8-BCE7-214E5F634E6E@gmail.com>
	<1419577.68pc7GzaiK@helios>
To: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Otavio Salvador <otavio@ossystems.com.br>
X-Mailer: Apple Mail (2.1508)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 1/1] busybox: remove bbappend
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
X-List-Received-Date: Mon, 26 Aug 2013 21:38:58 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Aug 24, 2013, at 2:47 AM, Paul Eggleton =
<paul.eggleton@linux.intel.com> wrote:

> On Friday 23 August 2013 10:36:15 Khem Raj wrote:
>> On Aug 23, 2013, at 4:33 AM, Paul Eggleton =
<paul.eggleton@linux.intel.com>=20
>> wrote:
>>> This bbappend has effectively been merged into OE-Core, although the
>>> log buffer size is the busybox default rather than 64K - layers may
>>> change this either by providing their own =
/etc/default/busybox-syslog
>>> file (when using systemd) or modifying the
>>> CONFIG_FEATURE_IPC_SYSLOG_BUFFER_SIZE option in busybox's build time
>>> config
>>=20
>> I think it would be better if we added this option via a kconfig =
fragment
>> in OE-Core if DISTRO_FEATURES contained systemd and then remove this =
from
>> here. I say this because otherwise size of circular buffer goes back =
to 16k
>> from 64k and may not be enough to hold valuable info.
>=20
> Why is this specific to systemd?

It probably is not. Otavio added it, so I am CCing him
however this is default used in many distros, just to keep enough
messages around while you can affort 64K buffer which is not a huge ask
these days.
=20

>=20
> Cheers,
> Paul
>=20
> --=20
>=20
> Paul Eggleton
> Intel Open Source Technology Centre


