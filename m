Return-Path: <rehsack@gmail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id EC1836AC1E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Aug 2015 16:48:35 +0000 (UTC)
Received: by wicja10 with SMTP id ja10so77700982wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Aug 2015 09:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:date:cc
	:content-transfer-encoding:message-id:to;
	bh=JBI4YsJx8z9VIdQ30I7101HOXGnK28E1dacDuFH024c=;
	b=PZDv/rsM4RFJ5vBJy3f+RdHK3Cb38eSfY6244pxy1pcbzrgBV+Y4b21w1/NKwHPFRD
	aKsFLyXJNr5bgAAwNyr1dYny72P4twI1N2rbLN2L65/Rl67K6b+aps7TKck2F7+z5lmN
	FWjFGBopSfHV1+38IPbttUt4jNTXtRxlvx+DkzUyxeXXrK0c1UVT30wFjQjteBF1lZLM
	CP5KC9R9o77kCIGAHBhSxIjis1nJfEWIZbfAw6txJ9Fba8uh9nu/1rozltnJ5n1tcppE
	I0oWB3BFK90JG1J2V37H9lNKKYtA7mDyrUR0y1Eo0/QhyKG14Bjn4Mo26D5TeXm7jj4I
	CM8Q==
X-Received: by 10.180.99.193 with SMTP id es1mr31963178wib.29.1440434915155;
	Mon, 24 Aug 2015 09:48:35 -0700 (PDT)
Received: from ernie.rdm.local (rademacherexchange.de. [46.245.221.222])
	by smtp.gmail.com with ESMTPSA id
	vl1sm24035692wjc.0.2015.08.24.09.48.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 24 Aug 2015 09:48:34 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
From: Jens Rehsack <rehsack@gmail.com>
Date: Mon, 24 Aug 2015 18:48:33 +0200
Message-Id: <1A315F32-74AE-4B3B-A5B7-65A33C5A6BC7@gmail.com>
To: OE-devel <openembedded-devel@lists.openembedded.org>
X-Mailer: Apple Mail (2.2104)
Cc: Tobias Theophile <Tobias.Theophile@rademacher.de>,
	Otavio Salvador <otavio@ossystems.com.br>,
	Mario Domenech Goulart <mario@ossystems.com.br>
Subject: meta-java - recent commits break foreign (MY!) builds ...
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
X-List-Received-Date: Mon, 24 Aug 2015 16:48:37 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi,

recent commits (24b98ac3, 15ed9662) on meta-java broke my build, so I =
reverted them for my fork and decided to report:

15ed9662

This one is easy - and very likely similar easy to fix for patch author:

The layer-readme tells users:

Usage instructions
------------------

You should define at least the following variables in a distro include =
file or local.conf

PREFERRED_PROVIDER_virtual/java-initial-native =3D =
"cacao-initial-native"

PREFERRED_PROVIDER_virtual/java-native =3D "jamvm-native"
PREFERRED_PROVIDER_virtual/javac-native =3D "ecj-bootstrap-native"

With 15ed9662, jamvm requires ecj-bootstrap-native and =
ecj-bootstrap-native requires virtual/java-native which shall be =
jamvm-native.
Since I trust in you have a running version, there is very likely a way =
out by a nice and proper PREFERRED_PROVIDER_* setup making 15ed9662 =
succeed.=20

24b98ac3

This is more complicated. I announced that in a small round already - =
and without this
commit I would hold back until I finished openjdk-8 cross-compiling and =
running on our
i.MX6 box with Framebuffer-XBMC and Java-Service for Smart-Home control.

See https://github.com/rehsack/meta-java/commits/master for an =
icedtea7-native and an
openjdk-8-native without any alsa or x11 dependency, compiling smoothly =
alongside a
gpu-viv-bin-mx6q (with a tiny patch removing hidden x11 dependency).

There is no serious need for x11 the dependency chain down from =
icedtea7-native.

Maybe the requirement as added was intended for target packages only, =
but hit accidentally
some native packages either.

Cheers
--=20
Jens Rehsack - rehsack@gmail.com


