Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 93196719A1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Oct 2016 00:51:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u9P0pLG1000064
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 24 Oct 2016 17:51:21 -0700 (PDT)
Received: from [172.25.44.6] (172.25.44.6) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 24 Oct 2016 17:51:21 -0700
From: Randy MacLeod <randy.macleod@windriver.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, <akuster808@gmail.com>
Message-ID: <9278bc38-73d6-8593-aee4-ee981eb62b7c@windriver.com>
Date: Mon, 24 Oct 2016 20:51:19 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
X-Originating-IP: [172.25.44.6]
Subject: OE plans for morty
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
X-List-Received-Date: Tue, 25 Oct 2016 00:51:22 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



I saw that morty has been branched and there have been 38 commits
made to master.  Woo-hoo and thanks Martin!

Armin,

Many of the master commits sh/could be cherry-picked back
to morty since they are bug fixes rather than package uprevs.
I have a list of commits to cherry-pick below. '?' indicates
that I'm not sure from the oneline summary if it's just a bug
fix as you might expect.

Are you going to do a dot release in the coming weeks or will
it be more like early next year?

../Randy

ec0fb46 openldap: use recommended backend mdb

? 64ebc30 android-tools: fix native build
d2902a3 dhcp_%.bbappend: fix replaces original key warning

? 965d028 python-unidiff: python module for parsing diff data

? 1be8a35 joe: Fix build with clang
? 2084473 openl2tp: Fix build with clang
? 0004410 flashrom: Fix build with clang and aarch64
? 83fec86 gpm: Remove nested functions
? 9446302 lowpan-tools: Fix errors found with clang

? 5e0dc68 python-greenlet: Rename register from rX to xX for aarch64
? d8e9117 frame: Fix build with clang
? 612b2bb libplist: Squash warnings found by clang
? 2951547 libmbim: Fix build with clang
? c04bdbe libbonobo: Fix missing dep on orbit2-native and build with clang

6b3e9ff linux-atm: fix do_compile error

? 9a83c34 adduser: always add -M option for useradd

? da12104 v4l-utils: add support for "native" build


cfe1fba postgresql.inc: Fix do_configure error (could not find Python.h)


? 8ba31c9 gpsd, mongodb: use PACKAGECONFIG_CONFARGS instead of now empty 
EXTRA_OECONF
? f882db6 ipmiutil: uncomment PARALLEL_MAKE

? 54c7e78 pcsc-lite: Seperate GPLV3 portions from BSD
fded4cf opencv: fix packaging and install


1c072cb gvfs: fix fetch error
? 0cc3d06 leptonica: add PACKAGECONFIG for giflib
? 8eef5ab wireshark: update to 2.2.1

? 812e940 ntp : Add openssl to default PACKAGECONFIG options
? 8760099 atftp: fixes musl libc build
? 5abe6ea arptables: add the directory for default /etc/sysconfig/arptables
? a0e2240 arptables: add arptables systemd service file
93b0d65 iscsitarget: resolve build error with linux kernel 4.8
9e8d127 squid: fix ptest failure
6f54f29 squid: specify sysconfdir and logdir
307d1c9 libtdb: fixes for deterministic builds
5175c03 libldb: fixes for deterministic builds
5291715 libtevent: fixes for deterministic builds
778a2b6 libtalloc: fixes for deterministic builds
fe652f8 libldb: fix for LIC_FILES_CHKSUM
f25aa3d libtdb: fix for LIC_FILES_CHKSUM
d4a36f6 libtevent: fix for LIC_FILES_CHKSUM
0014397 libtalloc: fix for LIC_FILES_CHKSUM

a95726d samba: replace pam packageconfig by hard dependency
3fdfdd8 samba: un-blacklist

-- 
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350 | 350 Terry Fox Drive, Suite 200, Ottawa, ON, 
Canada, K2K 2W5

