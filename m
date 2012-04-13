Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SIYeS-0005pu-RM
	for Openembedded-devel@lists.openembedded.org;
	Fri, 13 Apr 2012 07:02:28 +0200
Received: by lbky2 with SMTP id y2so2023466lbk.6
	for <Openembedded-devel@lists.openembedded.org>;
	Thu, 12 Apr 2012 21:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=EEiazA9EgnYqiv9ZjhrNICGn1pyWcab1Er+/wlpK8DA=;
	b=g60wlX3kY/GgfhDQbpe42YP8605AUAZvKRoabRaR+QtT1MRWf6ULUxEJBwA4mo8WRV
	NQ6FPwGH8MksZ8KzJiLX3OAyG//Q73TT/YSXdSsZ+TR6Tx88+DINdz3dsYmB2SlITN6v
	2ISr2emYdhwFtX7/7KeZytEYyiTquyGlgh0xEnCL1JPx0PIC+iK6NNeRXehYbSTcGWLq
	X9nthZKcmlH5nh6cG6N+rQ7u2tfiQr6Qw2fK5fEOKesFbV2O2l5nZVOpzpx0KXt0sk+3
	nL3Iwz3StnhMv0pY1eHzA95FoqJZPqWvHqQb7U99XAVS1f2bzvNhSZOgITT4o2yNgTs1
	PpAA==
Received: by 10.112.100.170 with SMTP id ez10mr135338lbb.15.1334292787825;
	Thu, 12 Apr 2012 21:53:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.129.134 with HTTP; Thu, 12 Apr 2012 21:52:37 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 12 Apr 2012 21:52:37 -0700
Message-ID: <CAMKF1sr14M_sdr9Mr1yiVxG63FVpUQw+zCJqQeq7ULtOrV+JQw@mail.gmail.com>
To: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: unfs-server-nativesdk multimachine compile issue
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
X-List-Received-Date: Fri, 13 Apr 2012 05:02:29 -0000
Content-Type: text/plain; charset=UTF-8

Hi

I am seeing a problem when building meta-toolchain for more than one
architectures in same tmpdir

it keeps rebuilding unfs-server-nativesdk for every machine build and
then in second case it fails since
it can not configure the preconfigured tree. Anyone seeing this issue ?


