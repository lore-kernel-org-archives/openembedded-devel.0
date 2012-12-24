Received: from mail-ee0-f53.google.com ([74.125.83.53])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Tn3ni-00051q-3B
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 Dec 2012 09:54:28 +0100
Received: by mail-ee0-f53.google.com with SMTP id c50so3321561eek.26
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Dec 2012 00:39:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=hy8AiLRAI6EHSnoB9C/Ueutnmjn4BBKTLuHvP4bNi2c=;
	b=ONjhWI3XoMzbfXpMoB238c7pAYXn0Un6of4eQiAdtNZw7kYNKTiQZ/sFSP7YaUYj/d
	MdRF9Wbz5iHxCxaTtOqmZ6CvJJKrkipb+8hJTfO2bKxsnIn4/kfkCyYCm3r9twQt1ysP
	dY/2OvtiER7GAw/HCA/M9RQE6Ds1QZzXRAABKUO4M6dQxJOKvLP6I6xsDBwgk9ZeHFVc
	QSW4gUTEdgRoz7YxFn1bpn7yCj/9Z88a9HFdiG0s0VbhfKp3TU6zhTebsnzbZJqsYC1t
	kV+Sk9d5Q49jGy5tjpvbZ77FxqY0EqDf7836oz5CSLt/D/+1krh+B0NefwDFwYkIlyKQ
	HoGQ==
X-Received: by 10.14.223.200 with SMTP id v48mr54134169eep.24.1356338372344;
	Mon, 24 Dec 2012 00:39:32 -0800 (PST)
Received: from [172.20.0.100] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id k4sm39921807eep.15.2012.12.24.00.39.29
	(version=SSLv3 cipher=OTHER); Mon, 24 Dec 2012 00:39:30 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 6.2 \(1499\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20121224090654.0b16f805@eb-e6520>
Date: Mon, 24 Dec 2012 09:39:29 +0100
Message-Id: <73BA3A6B-A072-4816-A0C9-293F6760D4B6@dominion.thruhere.net>
References: <CAMBWrQnMQtEs78=OtkSR1mjctfet8ArQ_XE43wDB6-6NKiDShA@mail.gmail.com>
	<CAMBWrQm6UbF9t5sAn=oudmhQ2MJdDNMb3ki6o7_sdjErun4SWw@mail.gmail.com>
	<CA+chaQcvSts25RvERVyOxOcsqaLRfADf8zTq_YpqAB8Bp_O+fg@mail.gmail.com>
	<CAMBWrQ=J8n9tm99UT0QvcU1oB4kUtpH+kguDUYfxWP7_u_TPYQ@mail.gmail.com>
	<20121222100318.14a48e10@eb-e6520> <kb40tq$84p$1@ger.gmane.org>
	<20121222120551.6916471a@eb-e6520>
	<20121223154736.3c151ef8@eb-e6520>
	<3DF8EBF7-61B4-4EBB-9C58-D1C63256FEF5@dominion.thruhere.net>
	<20121223195357.5fc91a73@eb-e6520>
	<B7FA4357-A7A1-408A-AF1F-89062AAACF8D@dominion.thruhere.net>
	<20121223222145.6785dca1@eb-e6520>
	<657212B5-E6A0-45F8-AD05-3F99D7DB1B73@dominion.thruhere.net>
	<20121224090654.0b16f805@eb-e6520>
To: =?iso-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
X-Mailer: Apple Mail (2.1499)
X-Gm-Message-State: ALoCoQnNvgRIiOz5Rq49DrOXWbKT2J6m/ItkkfzlCh/YNp/qECFJfYJxf2hY1KnEaN5TX4fQs4KO
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
X-List-Received-Date: Mon, 24 Dec 2012 08:54:29 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 24 dec. 2012, om 09:06 heeft Eric B=E9nard <eric@eukrea.com> het =
volgende geschreven:

> Hi Koen,
>=20
> Le Sun, 23 Dec 2012 23:16:31 +0100,
> Koen Kooi <koen@dominion.thruhere.net> a =E9crit :
>> It does break angstrom since the autobuilder does have that change =
and the updated systemd was pushed into the feeds already after meta-oe =
gained the commit.
>>=20
> strange, I checked there and systemd is not at v189 :
> =
http://www.angstrom-distribution.org/feeds/v2012.05/ipk/eglibc/armv5te/bas=
e/
> may you please point me to the right feed ?

=
eu.feeds.angstrom-distribution.org/feeds/v2012.05/ipk/eglibc/armv7a/base/ =
would be one=


