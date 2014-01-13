Return-Path: <jacob.kroon@gmail.com>
Received: from mail-lb0-f181.google.com (mail-lb0-f181.google.com
	[209.85.217.181])
	by mail.openembedded.org (Postfix) with ESMTP id 73D166B565
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Jan 2014 00:58:25 +0000 (UTC)
Received: by mail-lb0-f181.google.com with SMTP id z5so2476303lbh.40
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Jan 2014 16:58:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=LGAfYfqVZj05aKbayR4B1tPSEzGBAR1N4lg8agwFU7Q=;
	b=drFlgp08nq1xAk1713WII5dRSKvyD/EBmAhSnvuyf0239xAKZKHI22TDI2X/VJmD/h
	Z/KPxBSAngrVr+9LOjn+p6ChxnF/GxVgy3/KHyflKwtQpK1A0nF0XwYD4K4x5qamipwz
	JUjYU1MOq6XKa9vz3A/rkrCEMVLXfsPrtKswmlGctMyr6ZdniekiwcWmOZTxkDbXPtQ3
	Uaxysn6sboEvLXL0kEM2EfdumTxwQG6KId/QhAViNWFYkb0VuuxwdNtca5DLxYaDVxaI
	yLE8/64jCBmMlbR6DsvaaUagh0emxHfslSxm4cAMLMnb8tYElVwclWTmLKpPrgGBV+vn
	4qCQ==
MIME-Version: 1.0
X-Received: by 10.152.121.105 with SMTP id lj9mr9468024lab.6.1389574705845;
	Sun, 12 Jan 2014 16:58:25 -0800 (PST)
Received: by 10.112.145.6 with HTTP; Sun, 12 Jan 2014 16:58:25 -0800 (PST)
Date: Mon, 13 Jan 2014 01:58:25 +0100
Message-ID: <CAPbeDCnrC84D8tqjT-A29YLO_hn2K1wQ5a_cK85uMVfGEzbrhQ@mail.gmail.com>
From: Jacob Kroon <jacob.kroon@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [meta-qt5][jansa/qt5-5.2.0] libQt5*.la references OE build directories
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
X-List-Received-Date: Mon, 13 Jan 2014 00:58:26 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

I'm seeing what I believe is a problem with the *.la files in the Qt5
dev-packages.
The files references paths in my OE build environment, like so:

...
# Libraries that this one depends upon.
dependency_libs='-lQt5Gui
-L/home/jkroon/Projects/oe-devel/build/tmp-eglibc/sysroots/wandboard-solo/usr/lib
-lQt5Core -lpthread '
...
# Directory that this library needs to be installed in:
libdir='/home/jkroon/Projects/oe-devel/build/tmp-eglibc/sysroots/wandboard-solo/usr'
...

I noticed this since my Qt5 autotools project wouldn't link properly when
using the SDK, unless I first removed all libQt5*.la files.

I'm not quite sure where to look for the problem so any pointers would be
appreciated.

  -- Jacob

