Received: from mail-ea0-f173.google.com ([209.85.215.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1TmrZw-0000rA-63
	for openembedded-devel@lists.openembedded.org;
	Sun, 23 Dec 2012 20:51:20 +0100
Received: by mail-ea0-f173.google.com with SMTP id i13so2716065eaa.32
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Dec 2012 11:36:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=QUDD0frCpTBZYYWD/Cpn3SMA62UE3iSmZvDbJqNtwVY=;
	b=N64zErNe5TguEanciUmXqX2N480jeRSJSrf2SO0FfIgNk5JD9D5iKRybUZ3wm1XkLB
	p/DlimH4/UbZ16MWrQRF0+OeZpvnE/caRKrzkZdMh+63dYLw9DFFix6fURDogi+7ixju
	0aia43GwWfUXhsFnQuZZBb9Mue+2lWdXsCKfKuH3pkdmtSasQIKDU61fa1xF1tcocNHW
	voxR2zJSxLhooWFXyfRdrZbqD985aS5B+xvBbg72orIIj6Bx63pCmBhS7an6aQKYhq6X
	RKOJmb0j5mzThx4zGx8ePsB8KnvfDK62KTDV/g4ZZJdK1JQtwbtX7VSWmPlfSYImiQbZ
	+Iyg==
X-Received: by 10.14.204.70 with SMTP id g46mr24149750eeo.15.1356291391374;
	Sun, 23 Dec 2012 11:36:31 -0800 (PST)
Received: from [172.20.0.100] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id 43sm36657116eed.10.2012.12.23.11.36.29
	(version=SSLv3 cipher=OTHER); Sun, 23 Dec 2012 11:36:30 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 6.2 \(1499\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20121223195357.5fc91a73@eb-e6520>
Date: Sun, 23 Dec 2012 20:36:29 +0100
Message-Id: <B7FA4357-A7A1-408A-AF1F-89062AAACF8D@dominion.thruhere.net>
References: <CAMBWrQnMQtEs78=OtkSR1mjctfet8ArQ_XE43wDB6-6NKiDShA@mail.gmail.com>
	<CAMBWrQm6UbF9t5sAn=oudmhQ2MJdDNMb3ki6o7_sdjErun4SWw@mail.gmail.com>
	<CA+chaQcvSts25RvERVyOxOcsqaLRfADf8zTq_YpqAB8Bp_O+fg@mail.gmail.com>
	<CAMBWrQ=J8n9tm99UT0QvcU1oB4kUtpH+kguDUYfxWP7_u_TPYQ@mail.gmail.com>
	<20121222100318.14a48e10@eb-e6520> <kb40tq$84p$1@ger.gmane.org>
	<20121222120551.6916471a@eb-e6520>
	<20121223154736.3c151ef8@eb-e6520>
	<3DF8EBF7-61B4-4EBB-9C58-D1C63256FEF5@dominion.thruhere.net>
	<20121223195357.5fc91a73@eb-e6520>
To: =?iso-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
X-Mailer: Apple Mail (2.1499)
X-Gm-Message-State: ALoCoQm0K8e79lKvKOjSjkUwWTS5K5i7YlRPslJ5Gpkyb47SSM6q96Nyjlr5XPRHy1cibPwd07H6
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Multiple .bb files are due to be built which each provide udev
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
X-List-Received-Date: Sun, 23 Dec 2012 19:51:20 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 23 dec. 2012, om 19:53 heeft Eric B=E9nard <eric@eukrea.com> het =
volgende geschreven:

> Le Sun, 23 Dec 2012 19:10:54 +0100,
> Koen Kooi <koen@dominion.thruhere.net> a =E9crit :
>> If you're going to use systemd then you'll need to use the matching =
udev version. New systemd with old udev won't work.
>>=20
> same problem for someone using angstrom + setup-scripts + beaglebone :
> =
https://groups.google.com/forum/?fromgroups#!topic/beagleboard/DC3nJjdJCMo=


That's because I haven't pushed the matching meta-angstrom change yet :)

> I'll revert the patch tomorrow (monday)

So how are you going to fix the upgrade paths? Version downgrades are a =
serious regression as well.=


