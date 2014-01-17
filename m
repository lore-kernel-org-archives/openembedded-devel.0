Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vc0-f176.google.com (mail-vc0-f176.google.com
	[209.85.220.176])
	by mail.openembedded.org (Postfix) with ESMTP id 3A9086A467
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jan 2014 18:00:07 +0000 (UTC)
Received: by mail-vc0-f176.google.com with SMTP id la4so1686042vcb.21
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jan 2014 10:00:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=wZWYSwzXRvCSsk4TYtdONVxo7nEco57KAuh/SzI9emw=;
	b=TY4jej2wq170adAv9d2zkzmeP4WOHsPTGBgaitoNoDTgDwmJSzoTFL5WIyA6fu5HhU
	QhSmiP+sQ7B4hKTQ1da0qVe6FDaTHRW8CkJKi6PQNCrskh6mfB7R56aepnffKBy1qDkk
	MFRZ8gmY8zgmtkOxaxIeOxqNa1L8Isvd2QUNHLdTS52AA/g1j9g3+L0BE83V7m7fRiBW
	X3e5tk3Co/9Wh5wC9pKpagsswegHNcHNgxJGaMX8NxyinquOFh8gzU4hRaSlF8j7CsEs
	jeYbClJ3yBVOVo9esjh9roKzjnTUX0j5y/eSysmd7DeT1uQRm4jvzVOdOSs7fbeX9CpF
	XpIQ==
MIME-Version: 1.0
X-Received: by 10.58.181.165 with SMTP id dx5mr1459843vec.19.1389981607605;
	Fri, 17 Jan 2014 10:00:07 -0800 (PST)
Received: by 10.58.59.35 with HTTP; Fri, 17 Jan 2014 10:00:07 -0800 (PST)
Date: Fri, 17 Jan 2014 19:00:07 +0100
Message-ID: <CALbNGRSrtzRFCy6Aru5Jr+iYXpwq=OxxSHk-6HtCWw=Q9bxErA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, 
	Martin Jansa <martin.jansa@gmail.com>
Subject: meta-qt5: dependency loop for egl-library build by qmake
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
X-List-Received-Date: Fri, 17 Jan 2014 18:00:07 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

Found a libegl which is build by qmake. This turns into a dependency loop:

* qtbase ships mkspec and depends on egl (if enabled by packageconfig)
* the driver needs mkspec to build

I see two possible way to get out:

1. in qmake5.bbclass set 'OE_QMAKE_PLATFORM ?= "linux-oe-g++"' Hereby
the driver can ship and select a copy of linux-oe-g++ with a different
name. Disadvantage: in case something is changed on mkspec the copy
needs alignment.
2. Split out mkspec into a recipe. qmake5.bbclass can then depend on
that recipe. Disadvantage: in case linux-oe-g++ finds it's way to
mainline this won't work no more.

What do you think?

Andreas

