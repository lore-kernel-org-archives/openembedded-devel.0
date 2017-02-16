Return-Path: <frieder.schrempf@exceet.de>
X-Greylist: delayed 309 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 16 Feb 2017 13:52:04 UTC
Received: from smtp.exceet.ch (smtp.exceet.ch [77.245.33.226])
	by mail.openembedded.org (Postfix) with ESMTP id E799A6FF84
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Feb 2017 13:52:04 +0000 (UTC)
Received: from [192.168.178.27] (94.216.237.169) by smtp.exceet.ch
	(172.24.58.4) with Microsoft SMTP Server (TLS) id 14.3.210.2;
	Thu, 16 Feb 2017 14:46:53 +0100
To: <openembedded-devel@lists.openembedded.org>
From: Frieder Schrempf <frieder.schrempf@exceet.de>
Message-ID: <5a673173-1ee1-6d3d-dbc4-2f4011d04a47@exceet.de>
Date: Thu, 16 Feb 2017 14:46:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
X-Originating-IP: [94.216.237.169]
X-TM-AS-Product-Ver: SMEX-11.0.0.4255-8.100.1062-22888.006
X-TM-AS-Result: No-3.674500-5.000000-31
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
Subject: [meta-qt5] wrong mkspec set for sdk in nativesdk-qtbase
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 16 Feb 2017 13:52:05 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I stumbled upon an issue with the Qt5 SDK in morty-branch.
There's a patch 0008-configure-paths-for-target-qmake-properly.patch 
being applied to nativesdk-qtbase, that sets mkspec to linux-g++ while 
it should be linux-oe-g++.

To solve the problem I removed the patch from SRC_URI in 
nativesdk-qtbase_git.bb.

The issue (and the solution) is also described here:
https://github.com/graugans/meta-udoo/issues/20#issuecomment-261241783

and here:
https://lists.yoctoproject.org/pipermail/yocto/2016-October/032407.html

The patch was originally added for qtbase only, but later also for 
qtbase-native and nativesdk-qtbase 
(https://github.com/meta-qt5/meta-qt5/commit/1a42aa78af040d0fbecc960e4f9dd3f180ccb404).

I don't know if this was on purpose or maybe by accident.

Regards
Frieder

