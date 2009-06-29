Received: from [65.55.34.205] (helo=col0-omc4-s3.col0.hotmail.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pascal_kesseli@hotmail.com>) id 1MLH2C-0006tu-0L
	for openembedded-devel@lists.openembedded.org;
	Mon, 29 Jun 2009 15:36:36 +0200
Received: from COL109-DS16 ([65.55.34.200]) by col0-omc4-s3.col0.hotmail.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 29 Jun 2009 06:24:51 -0700
X-Originating-IP: [213.3.31.124]
X-Originating-Email: [pascal_kesseli@hotmail.com]
Message-ID: <COL109-DS1646B10617396513D8E822F2300@phx.gbl>
From: "Pascal Kesseli" <pascal_kesseli@hotmail.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 29 Jun 2009 15:24:48 +0200
MIME-Version: 1.0
X-Mailer: Microsoft Office Outlook 12.0
thread-index: Acn4vPnBzPA4RlKFTSmlvwdSYcElUA==
X-OriginalArrivalTime: 29 Jun 2009 13:24:51.0416 (UTC)
	FILETIME=[FB85CD80:01C9F8BC]
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Preferred gcc version ignored
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
X-List-Received-Date: Mon, 29 Jun 2009 13:36:36 -0000
Content-Language: de-ch
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi everyone

 

Recently, I tried building helloworld without providing a precompiled
toolchain for the MOXA UC-7408+. It worked as expected with OpenEmbedded
first compiling the cross-compiler and glibc. To do so, I used the following
machine config:

 

TARGET_ARCH = arm

PACKAGE_ARCH = xscale

TARGET_CC_ARCH = "-mcpu=xscale"

#ASSUME_PROVIDED += virtual/arm-linux-gcc virtual/libc

PREFERRED_PROVIDER_virtual/kernel = "linux-2.6"

BOOTSTRAP_EXTRA_DEPENDS += " virtual/kernel"

BOOTSTRAP_EXTRA_RDEPENDS += " kernel kernel-modules"

IMAGE_FSTYPE = "ext2"

EXTRA_IMGECMD_ext2 = " -b 2097152"

 

PREFERRED_PROVIDER_virtual/arm-linux-libc-for-gcc = glibc

PREFERRED_VERSION_arm-linux-gcc = "3.4.4"

PREFERRED_VERSION_gcc = "3.4.4"

PREFERRED_VERSION_gcc-cross = "3.4.4"

PREFERRED_VERSION_glibc = "2.3.3"

 

 

Nevetheless, the compilation failed with the following error:

 

| checking for pwd... /opt/openembedded/tmp/staging/i686-linux/usr/bin/pwd

| checking for arm-linux-gcc... (cached) arm-linux-gcc -mcpu=xscale

| checking version of arm-linux-gcc -mcpu=xscale... 4.2.4, bad

| checking for gnumake... make

| checking version of make... 3.81, ok

| checking for gnumsgfmt... no

| checking for gmsgfmt... no

| checking for msgfmt... msgfmt

| checking version of msgfmt... 0.17, ok

| checking for makeinfo... makeinfo

| checking version of makeinfo... 4.11, ok

| checking for sed... sed

| checking version of sed... 4.1.5, ok

| checking for autoconf... autoconf

| checking whether autoconf works... yes

| configure: error:

| *** These critical programs are missing or too old: gcc

| *** Check the INSTALL file for required versions.

| FATAL: oe_runconf failed

NOTE: Task failed:
/opt/openembedded/tmp/work/xscale-linux/glibc-2.3.3-r17/temp/log.do_configur
e.5110

ERROR: TaskFailed event exception, aborting

ERROR: Build of /opt/openembedded/recipes/glibc/glibc_2.3.3.bb do_configure
failed

ERROR: Task 75 (/opt/openembedded/recipes/glibc/glibc_2.3.3.bb,
do_configure) failed

NOTE: Tasks Summary: Attempted 159 tasks of which 159 didn't need to be
rerun and 1 failed.

ERROR: '/opt/openembedded/recipes/glibc/glibc_2.3.3.bb' failed

 

 

It seems as if gcc version 4.2.4 was created and used by OpenEmbedded, which
is too new for building glibc 2.3.3. Which PREFERRED_VERSION statement did I
miss to advise OpenEmbedded to use an earlier gcc version to build the
glibc?

 

Thanks for any help and best regards

Kessi

 


