Return-Path: <Mingli.Yu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id DBE9E605B3
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Sep 2016 01:46:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u891kXVE025499
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Thu, 8 Sep 2016 18:46:33 -0700
Received: from [128.224.163.140] (128.224.163.140) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.248.2;
	Thu, 8 Sep 2016 18:46:32 -0700
To: Joe MacDonald <Joe_MacDonald@mentor.com>
References: <1473325733-21840-1-git-send-email-mingli.yu@windriver.com>
	<20160908133609.GA4939@mentor.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <57D2137D.4030705@windriver.com>
Date: Fri, 9 Sep 2016 09:42:21 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <20160908133609.GA4939@mentor.com>
X-Originating-IP: [128.224.163.140]
Cc: openembedded-devel@lists.openembedded.org, jslater@windriver.com
Subject: Re: [meta-networking][PATCH] tcpreplay: 3.4.4 -> 4.1.1
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
X-List-Received-Date: Fri, 09 Sep 2016 01:46:34 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2016年09月08日 21:36, Joe MacDonald wrote:
> [[oe] [meta-networking][PATCH] tcpreplay: 3.4.4 -> 4.1.1] On 16.09.08 (Thu 17:08) mingli.yu@windriver.com wrote:
>
>> From: Mingli Yu <Mingli.Yu@windriver.com>
>>
>> * Upgrade tcpreplay from 3.4.4 to 4.1.1
>> * Remove the backport and unapplicable patches
>>    - The logic for tcpreplay-3.4.4-cross-compile.patch
>>      is covered by below commit:
>>      commit f204c88d0d610c09b2b0249c447fed1e4813a8cb
>>      Author: Aaron Turner <synfinatic@gmail.com>
>>      Date:   Tue Oct 4 03:00:44 2011 +0000
>>
>>        - mark as beta4
>>        - fix autoconf quoting issues
>>        - fix cross compile issue refs #489
>>
>>    - The logic for tcpreplay-3.4.4-no-bfp-support.patch
>>      is covered by below commit:
>>      commit 8a3647813dcb7b89cd5e1fe064890a6e1d750f24
>>      Author: Alexey Indeev <aindeev@appneta.com>
>>      Date:   Fri Oct 10 15:04:43 2014 -0700
>>
>>         #140 fixed bpf, netmap
>>
>>    - The logic for both
>>      tcpreplay-3.4.4-fix-unable-to-link-libpcap-issue.patch
>>      and tcpreplay-3.4.4-improve-search-for-libpcap.patch are
>>      covered by below commit:
>>      commit e0cc16947b28cbb7040475c6fad123b8a739b34f
>>      Author: Fred Klassen <fklassen@JTLM57.local>
>>      Date:   Sun Dec 13 20:20:12 2015 -0800
>>
>>         #203 many fixes to libpcap discovery
>>
>> Reference https://github.com/appneta/tcpreplay.git
>
> I don't know if there's any technical issue with the proposed change
> yet, I'll pick that up from master-next soon, I expect, but I have some
> feedback for you on your commit log.
>
>     - You don't need to quote the commits from up-stream in your commit
>       log.  I don't even particularly care if you quote the commit IDs
>       by way of saying you're disposing of patches that are no longer
>       necessary.  It's nice but not required.  Definitely don't quote the
>       whole commit log for each of them, though.

Thanks! Will remove the upstream commit messages and resent out V2 patch.

Thanks,

>
>     - You make no mention of what happened to the LICENSE file to cause
>       it to change between versions.  I haven't looked, my guess is a
>       year in the copyright changed, but changes in a file used to
>       determine the license for a package are always worth commenting on.

Sorry, will add this information in V2 patch.

Thanks,

>
>     - Most trivially, this still uses the 'old_ver -> new_ver' subject I
>       prefer not to see.  I think I'm losing that one, though, so if I
>       wasn't commenting on other stuff in your log, I wouldn't've
>       bothered bringing it up.

Thanks! Will update the subject from 'old_ver -> new_ver' to 'upgrade to 
new_ver' in V2 patch.

Thanks,

>
> -J.
>
>>
>> Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
>> ---
>>   .../files/tcpreplay-3.4.4-cross-compile.patch      | 92 ----------------------
>>   ...ay-3.4.4-fix-unable-to-link-libpcap-issue.patch | 17 ----
>>   ...cpreplay-3.4.4-improve-search-for-libpcap.patch | 33 --------
>>   .../files/tcpreplay-3.4.4-no-bfp-support.patch     | 15 ----
>>   .../{tcpreplay_3.4.4.bb => tcpreplay_4.1.1.bb}     | 10 +--
>>   5 files changed, 3 insertions(+), 164 deletions(-)
>>   delete mode 100755 meta-networking/recipes-support/tcpreplay/files/tcpreplay-3.4.4-cross-compile.patch
>>   delete mode 100644 meta-networking/recipes-support/tcpreplay/files/tcpreplay-3.4.4-fix-unable-to-link-libpcap-issue.patch
>>   delete mode 100644 meta-networking/recipes-support/tcpreplay/files/tcpreplay-3.4.4-improve-search-for-libpcap.patch
>>   delete mode 100644 meta-networking/recipes-support/tcpreplay/files/tcpreplay-3.4.4-no-bfp-support.patch
>>   rename meta-networking/recipes-support/tcpreplay/{tcpreplay_3.4.4.bb => tcpreplay_4.1.1.bb} (43%)
>>
>> diff --git a/meta-networking/recipes-support/tcpreplay/files/tcpreplay-3.4.4-cross-compile.patch b/meta-networking/recipes-support/tcpreplay/files/tcpreplay-3.4.4-cross-compile.patch
>> deleted file mode 100755
>> index a856b18..0000000
>> --- a/meta-networking/recipes-support/tcpreplay/files/tcpreplay-3.4.4-cross-compile.patch
>> +++ /dev/null
>> @@ -1,92 +0,0 @@
>> -Uptream-Status: Pending
>> -
>> -Signed-off-by: Zongchun Yu <Zongchun.Yu@freescale.com>
>> -
>> ---- a/configure.ac
>> -+++ b/configure.ac
>> -@@ -402,7 +402,6 @@
>> -
>> - dnl 0.9.6 (which is still thinks it is 0.9.5 due to a bug) introduces an important
>> - dnl fix for OSX.  See: http://tcpreplay.synfin.net/trac/ticket/167
>> --libpcap_version_096=no
>> - AC_RUN_IFELSE(AC_LANG_PROGRAM([[
>> - #include <string.h>
>> - #include <stdlib.h>
>> -@@ -419,11 +418,12 @@
>> -             exit(0);
>> -
>> -     exit(1);
>> --]]), [
>> --    libpcap_version_096=yes
>> --])
>> -+]]),
>> -+ [libpcap_version_096=yes],
>> -+ [libpcap_version_096=no],
>> -+ [libpcap_version_096=yes]
>> -+)
>> -
>> --libpcap_ver8=no
>> - AC_RUN_IFELSE(AC_LANG_PROGRAM([[
>> - #include <string.h>
>> - #include <stdlib.h>
>> -@@ -444,13 +444,12 @@
>> -         exit(0);
>> -
>> -     exit(1);
>> --]]), [
>> --    libpcap_ver8=yes
>> --], [
>> --    libpcap_ver8=no
>> --])
>> -+]]),
>> -+ [libpcap_ver8=yes],
>> -+ [libpcap_ver8=no],
>> -+ [libpcap_ver8=yes]
>> -+)
>> -
>> --libpcap_ver7=no
>> - AC_RUN_IFELSE(AC_LANG_PROGRAM([[
>> - #include <string.h>
>> - #include <stdlib.h>
>> -@@ -469,11 +468,11 @@
>> -             exit(0);
>> -
>> -     exit(1);
>> --]]), [
>> --    libpcap_ver7=yes
>> --], [
>> --    libpcap_ver7=no
>> --])
>> -+]]),
>> -+ [libpcap_ver7=yes],
>> -+ [libpcap_ver7=no],
>> -+ [libpcap_ver7=yes]
>> -+)
>> -
>> - if test x$libpcap_ver8 = xyes ; then
>> -     AC_MSG_RESULT(>= 0.8.0)
>> -@@ -761,8 +760,8 @@
>> -
>> - have_bpf=no
>> - dnl Check for BSD's BPF
>> --AC_MSG_CHECKING(for BPF device sending support)
>> --AC_TRY_RUN([
>> -+AC_CACHE_CHECK([for BPF device sending support], ac_cv_have_bpf,
>> -+[AC_TRY_RUN([
>> - #include <stdio.h>
>> - #include <stdlib.h>
>> - #include <sys/types.h>
>> -@@ -796,8 +795,11 @@
>> -             [Do we have BPF device support?])
>> -     AC_MSG_RESULT(yes)
>> -     have_bpf=yes
>> --],[
>> --    AC_MSG_RESULT(no)
>> -+],
>> -+[AC_MSG_RESULT(no)],
>> -+[AC_MSG_ERROR([cross-compiling,
>> -+  presetting ac_cv_have_bpf=(yes|no) will help])]
>> -+)
>> - ])
>> -
>> -
>> diff --git a/meta-networking/recipes-support/tcpreplay/files/tcpreplay-3.4.4-fix-unable-to-link-libpcap-issue.patch b/meta-networking/recipes-support/tcpreplay/files/tcpreplay-3.4.4-fix-unable-to-link-libpcap-issue.patch
>> deleted file mode 100644
>> index 5f36c68..0000000
>> --- a/meta-networking/recipes-support/tcpreplay/files/tcpreplay-3.4.4-fix-unable-to-link-libpcap-issue.patch
>> +++ /dev/null
>> @@ -1,17 +0,0 @@
>> -Uptream-Status: Pending
>> -
>> -Signed-off-by: Zongchun Yu <Zongchun.Yu@freescale.com>
>> -
>> -Index: tcpreplay-3.4.4/configure.ac
>> -===================================================================
>> ---- tcpreplay-3.4.4.orig/configure.ac
>> -+++ tcpreplay-3.4.4/configure.ac
>> -@@ -389,7 +389,7 @@ CFLAGS="$CFLAGS -I$LPCAPINCDIR"
>> - AC_SEARCH_LIBS([pcap_close], [pcap],
>> -     LPCAPLIB="$LIBS",
>> -     AC_ERROR([Unable to link libpcap in ${foundpcap}]),
>> --    -lnl)
>> -+    -lnl-3)
>> -
>> - AC_SUBST(LPCAPINC)
>> - AC_SUBST(LPCAPLIB)
>> diff --git a/meta-networking/recipes-support/tcpreplay/files/tcpreplay-3.4.4-improve-search-for-libpcap.patch b/meta-networking/recipes-support/tcpreplay/files/tcpreplay-3.4.4-improve-search-for-libpcap.patch
>> deleted file mode 100644
>> index 50f024c..0000000
>> --- a/meta-networking/recipes-support/tcpreplay/files/tcpreplay-3.4.4-improve-search-for-libpcap.patch
>> +++ /dev/null
>> @@ -1,33 +0,0 @@
>> -tcpreplay: improve search for libpcap
>> -
>> -Add a test which will find libpcap if $testdir/.. is a sysroot.
>> -
>> -Upstream-Status: Pending
>> -
>> -Signed-off-by: Joe Slater <joe.slater@windriver.com>
>> -
>> -
>> ---- a/configure.ac
>> -+++ b/configure.ac
>> -@@ -350,14 +350,20 @@ for testdir in $trypcapdir /usr/local /o
>> -     if test -f "${testdir}/include/pcap.h" -a $foundpcap = no ; then
>> -         LPCAPINC="${testdir}/include/pcap.h"
>> -         LPCAPINCDIR="${testdir}/include"
>> -+        # If testdir/.. is a sysroot, then sDir should point to where the libraries are.
>> -+        sDir=$(readlink -m ${testdir}/../${libdir})
>> -         if test $dynamic_link = yes; then
>> --            if test -f "${testdir}/lib64/libpcap${shrext_cmds}" ; then
>> -+            if test -f "${sDir}/libpcap${shrext_cmds}" ; then
>> -+                LPCAPLIB="-L${sDir} -lpcap"
>> -+            elif test -f "${testdir}/lib64/libpcap${shrext_cmds}" ; then
>> -                 LPCAPLIB="-L${testdir}/lib64 -lpcap"
>> -             elif test -f "${testdir}/lib/libpcap${shrext_cmds}" ; then
>> -                 LPCAPLIB="-L${testdir}/lib -lpcap"
>> -             else
>> -                 AC_ERROR([Unable to find libpcap in ${testdir}])
>> -             fi
>> -+        elif test -f "${sDir}/libpcap.${libext}" ; then
>> -+            LPCAPLIB="${sDir}/libpcap.${libext}"
>> -         elif test -f "${testdir}/lib64/libpcap.${libext}" ; then
>> -             LPCAPLIB="${testdir}/lib64/libpcap.${libext}"
>> -         elif test -f "${testdir}/lib/libpcap.${libext}" ; then
>> diff --git a/meta-networking/recipes-support/tcpreplay/files/tcpreplay-3.4.4-no-bfp-support.patch b/meta-networking/recipes-support/tcpreplay/files/tcpreplay-3.4.4-no-bfp-support.patch
>> deleted file mode 100644
>> index 3c11c92..0000000
>> --- a/meta-networking/recipes-support/tcpreplay/files/tcpreplay-3.4.4-no-bfp-support.patch
>> +++ /dev/null
>> @@ -1,15 +0,0 @@
>> -Uptream-Status: Pending
>> -
>> -Signed-off-by: Zongchun Yu <Zongchun.Yu@freescale.com>
>> -
>> ---- a/configure.ac
>> -+++ b/configure.ac
>> -@@ -758,6 +758,8 @@
>> -     AC_MSG_RESULT(no)
>> - ])
>> -
>> -+ac_cv_have_bpf=no
>> -+
>> - have_bpf=no
>> - dnl Check for BSD's BPF
>> - AC_CACHE_CHECK([for BPF device sending support], ac_cv_have_bpf,
>> diff --git a/meta-networking/recipes-support/tcpreplay/tcpreplay_3.4.4.bb b/meta-networking/recipes-support/tcpreplay/tcpreplay_4.1.1.bb
>> similarity index 43%
>> rename from meta-networking/recipes-support/tcpreplay/tcpreplay_3.4.4.bb
>> rename to meta-networking/recipes-support/tcpreplay/tcpreplay_4.1.1.bb
>> index ccbab9f..389d61b 100644
>> --- a/meta-networking/recipes-support/tcpreplay/tcpreplay_3.4.4.bb
>> +++ b/meta-networking/recipes-support/tcpreplay/tcpreplay_4.1.1.bb
>> @@ -4,16 +4,12 @@ HOMEPAGE = "http://tcpreplay.synfin.net/"
>>   SECTION = "net"
>>
>>   LICENSE = "GPLv3"
>> -LIC_FILES_CHKSUM = "file://docs/LICENSE;md5=c33cccf72cc1603e8a72a84811ae3ac8"
>> +LIC_FILES_CHKSUM = "file://docs/LICENSE;md5=890b830b22fd632e9ffd996df20338f8"
>>
>>   SRC_URI = "http://prdownloads.sourceforge.net/tcpreplay/${PV}/tcpreplay-${PV}.tar.gz \
>> -           file://tcpreplay-3.4.4-cross-compile.patch \
>> -           file://tcpreplay-3.4.4-no-bfp-support.patch \
>> -           file://tcpreplay-3.4.4-fix-unable-to-link-libpcap-issue.patch \
>> -           file://tcpreplay-3.4.4-improve-search-for-libpcap.patch \
>>              "
>> -SRC_URI[md5sum] = "22725feb9b2590809f9350308ec65180"
>> -SRC_URI[sha256sum] = "7a809c58ddec86407fd6e5597ac883d7874a19bea81d716bb2b1c6e3b0e7b58f"
>> +SRC_URI[md5sum] = "80394c33fe697b53b69eac9bb0968ae9"
>> +SRC_URI[sha256sum] = "61b916ef91049cad2a9ddc8de6f5e3e3cc5d9998dbb644dc91cf3a798497ffe4"
>>
>>   DEPENDS = "libpcap"
>>
>> --
>> 2.8.1
>>

