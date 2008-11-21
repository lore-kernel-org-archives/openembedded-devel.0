Received: from [87.193.137.78] (helo=mail.extern.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@DResearch.DE>) id 1L3YXS-0002HI-Nh
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 Nov 2008 17:07:22 +0100
Received: from consult.extern.dresearch.de (consult.extern.DResearch.DE
	[87.193.137.68])
	by mail.extern.dresearch.de (Postfix) with ESMTP id B4CBD16E122
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Nov 2008 17:13:39 +0100 (CET)
Received: from hiob.intern.dresearch.de (unknown [87.193.137.50])
	by consult.extern.dresearch.de (Postfix) with ESMTP id E02782A4145
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Nov 2008 17:04:44 +0100 (CET)
Received: from [10.24.0.58] ([10.24.0.58]) by hiob.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.3959); Fri, 21 Nov 2008 17:04:46 +0100
Message-ID: <4926DC15.5070206@dresearch.de>
Date: Fri, 21 Nov 2008 17:04:37 +0100
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Thunderbird 2.0.0.17 (X11/20080922)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-OriginalArrivalTime: 21 Nov 2008 16:04:46.0456 (UTC)
	FILETIME=[DFBBB780:01C94BF2]
Subject: [patch review] uclibc-initial_0.9.30.bb and avr32
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
X-List-Received-Date: Fri, 21 Nov 2008 16:07:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello uclibc maintainers,

please approve or comment following patch of uclibc-initial_0.9.30.bb.

It fixes a compile problem for the avr32 machine in the same way like for the other arm architectures.

diff --git a/packages/uclibc/uclibc_0.9.30.bb b/packages/uclibc/uclibc_0.9.30.bb
index faeaeca..e6c2318 100644
--- a/packages/uclibc/uclibc_0.9.30.bb
+++ b/packages/uclibc/uclibc_0.9.30.bb
@@ -20,6 +20,7 @@ SRC_URI += "file://uClibc.machine file://uClibc.distro \
           "
 SRC_URI_append_arm = " file://ldso_hash_arm.patch;patch=1 "
 SRC_URI_append_armeb = " file://ldso_hash_arm.patch;patch=1 "
+SRC_URI_append_avr32 = " file://ldso_hash_arm.patch;patch=1 "
 
 #recent versions uclibc require real kernel headers
 PACKAGE_ARCH = "${MACHINE_ARCH}"



