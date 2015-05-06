Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8A33D72A85
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 May 2015 02:00:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t46202lD026080
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 5 May 2015 19:00:02 -0700 (PDT)
Received: from [128.224.162.142] (128.224.162.142) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 5 May 2015 19:00:01 -0700
Message-ID: <554975A1.5020401@windriver.com>
Date: Wed, 6 May 2015 10:00:01 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1430191635-13438-1-git-send-email-rongqing.li@windriver.com>
	<20150505134249.GC2378@jama>
In-Reply-To: <20150505134249.GC2378@jama>
Subject: Re: [PATCH][meta-oe] dialog: upgrade to 1.2-20150225
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
X-List-Received-Date: Wed, 06 May 2015 02:00:05 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2015年05月05日 21:42, Martin Jansa wrote:
> On Tue, Apr 28, 2015 at 11:27:15AM +0800, rongqing.li@windriver.com wrote:
>> From: Roy Li <rongqing.li@windriver.com>
>>
>> 1. upgrade it to 1.2-20150225
>> 2. update the use-pkg-config-for-ncurses-detection.patch, use it only for
>> dialog
>> 3. dialog-static uses use-pkg-config-for-static-ncurses-detection.patch
>> which outputs libraries suitable for static linking
>
> Any idea why normal dialog now builds static library and tries to stage
> it and fails?
>
> ERROR: The recipe dialog is trying to install files into a shared area when those files already exist. Those files and their manifest location are:
>     /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemuarm/usr/lib/libdialog.a
>   Matched in manifest-qemuarm-dialog-static.populate_sysroot
>


I think we can remove the dialog-static

dialog-1.1-20120706 does not generate static library, or dynamic library.
dialog-static-1.1-20120706 generate the static library by adding
   LDFLAGS += "-static"

dialog-1.2-20150225 will generate the static library, so I think I should
remove the recipes of dialog-static

-Roy

>>
>> The difference between with --static and without --static is below:
>>     $pkg-config --libs "ncurse"
>>      -L${SYSROOT}/usr/lib64 -lncurses
>>     $pkg-config --static --libs "ncurse"
>>      -L${SYSROOT}/usr/lib64 -lncurses -ltinfo
>>     $
>>
>> Signed-off-by: Roy Li <rongqing.li@windriver.com>
>> ---
>>   .../dialog/dialog-static_1.1-20120706.bb           |  6 ----
>>   .../dialog/dialog-static_1.2-20150225.bb           |  6 ++++
>>   meta-oe/recipes-extended/dialog/dialog.inc         |  1 -
>>   .../recipes-extended/dialog/dialog_1.1-20120706.bb |  4 ---
>>   .../recipes-extended/dialog/dialog_1.2-20150225.bb |  6 ++++
>>   .../use-pkg-config-for-ncurses-detection.patch     | 28 +++++++------------
>>   ...e-pkg-config-for-static-ncurses-detection.patch | 32 ++++++++++++++++++++++
>>   7 files changed, 54 insertions(+), 29 deletions(-)
>>   delete mode 100644 meta-oe/recipes-extended/dialog/dialog-static_1.1-20120706.bb
>>   create mode 100644 meta-oe/recipes-extended/dialog/dialog-static_1.2-20150225.bb
>>   delete mode 100644 meta-oe/recipes-extended/dialog/dialog_1.1-20120706.bb
>>   create mode 100644 meta-oe/recipes-extended/dialog/dialog_1.2-20150225.bb
>>   create mode 100644 meta-oe/recipes-extended/dialog/files/use-pkg-config-for-static-ncurses-detection.patch
>>
>> diff --git a/meta-oe/recipes-extended/dialog/dialog-static_1.1-20120706.bb b/meta-oe/recipes-extended/dialog/dialog-static_1.1-20120706.bb
>> deleted file mode 100644
>> index 595f323..0000000
>> --- a/meta-oe/recipes-extended/dialog/dialog-static_1.1-20120706.bb
>> +++ /dev/null
>> @@ -1,6 +0,0 @@
>> -require dialog.inc
>> -
>> -LDFLAGS += "-static"
>> -
>> -SRC_URI[md5sum] = "2e538305977178eb085a9859511c299d"
>> -SRC_URI[sha256sum] = "305aa1000680aa87bb2148a725f9107ef4cd29dcd6185b44d079cb87cf0ce2f5"
>> diff --git a/meta-oe/recipes-extended/dialog/dialog-static_1.2-20150225.bb b/meta-oe/recipes-extended/dialog/dialog-static_1.2-20150225.bb
>> new file mode 100644
>> index 0000000..77d8841
>> --- /dev/null
>> +++ b/meta-oe/recipes-extended/dialog/dialog-static_1.2-20150225.bb
>> @@ -0,0 +1,6 @@
>> +require dialog.inc
>> +
>> +LDFLAGS += "-static"
>> +SRC_URI +="file://use-pkg-config-for-static-ncurses-detection.patch"
>> +SRC_URI[md5sum] = "38ef59a7daa5459119cb06777c735e4b"
>> +SRC_URI[sha256sum] = "6844b13a7a1fea568a8d5bb3004e1af90888cd4a5e8c2ded2c38f34fcc7397ff"
>> diff --git a/meta-oe/recipes-extended/dialog/dialog.inc b/meta-oe/recipes-extended/dialog/dialog.inc
>> index 995d6c0..1a6e8c5 100644
>> --- a/meta-oe/recipes-extended/dialog/dialog.inc
>> +++ b/meta-oe/recipes-extended/dialog/dialog.inc
>> @@ -9,7 +9,6 @@ LICENSE = "LGPL-2.1"
>>   LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343"
>>
>>   SRC_URI = "ftp://invisible-island.net/dialog/dialog-${PV}.tgz \
>> -           file://use-pkg-config-for-ncurses-detection.patch \
>
> Why not keep it here and only add --static parameter to pkg-config call in followup patch applied only in dialog-static?
>
>>             "
>>
>>   # hardcoded here for use in dialog-static recipe
>> diff --git a/meta-oe/recipes-extended/dialog/dialog_1.1-20120706.bb b/meta-oe/recipes-extended/dialog/dialog_1.1-20120706.bb
>> deleted file mode 100644
>> index c87fb61..0000000
>> --- a/meta-oe/recipes-extended/dialog/dialog_1.1-20120706.bb
>> +++ /dev/null
>> @@ -1,4 +0,0 @@
>> -require dialog.inc
>> -
>> -SRC_URI[md5sum] = "2e538305977178eb085a9859511c299d"
>> -SRC_URI[sha256sum] = "305aa1000680aa87bb2148a725f9107ef4cd29dcd6185b44d079cb87cf0ce2f5"
>> diff --git a/meta-oe/recipes-extended/dialog/dialog_1.2-20150225.bb b/meta-oe/recipes-extended/dialog/dialog_1.2-20150225.bb
>> new file mode 100644
>> index 0000000..477be73
>> --- /dev/null
>> +++ b/meta-oe/recipes-extended/dialog/dialog_1.2-20150225.bb
>> @@ -0,0 +1,6 @@
>> +require dialog.inc
>> +
>> +SRC_URI +="file://use-pkg-config-for-ncurses-detection.patch"
>> +
>> +SRC_URI[md5sum] = "38ef59a7daa5459119cb06777c735e4b"
>> +SRC_URI[sha256sum] = "6844b13a7a1fea568a8d5bb3004e1af90888cd4a5e8c2ded2c38f34fcc7397ff"
>> diff --git a/meta-oe/recipes-extended/dialog/files/use-pkg-config-for-ncurses-detection.patch b/meta-oe/recipes-extended/dialog/files/use-pkg-config-for-ncurses-detection.patch
>> index a2354ad..0a25a7f 100644
>> --- a/meta-oe/recipes-extended/dialog/files/use-pkg-config-for-ncurses-detection.patch
>> +++ b/meta-oe/recipes-extended/dialog/files/use-pkg-config-for-ncurses-detection.patch
>> @@ -8,33 +8,25 @@ file, and autoconf can not work, make a workaround in configure file.
>>
>>   Signed-off-by: Roy Li <rongqing.li@windriver.com>
>>   ---
>> - configure |    6 +++---
>> - 1 file changed, 3 insertions(+), 3 deletions(-)
>> + configure | 5 ++---
>> + 1 file changed, 2 insertions(+), 3 deletions(-)
>>
>>   diff --git a/configure b/configure
>> -index 24e28c1..c78735d 100755
>> +index 8afe3d7..a54bcc1 100755
>>   --- a/configure
>>   +++ b/configure
>> -@@ -9976,8 +9976,8 @@ fi
>> +@@ -11567,9 +11567,8 @@ fi
>>
>>    if test "$NCURSES_CONFIG" != none ; then
>>
>>   -CPPFLAGS="$CPPFLAGS `$NCURSES_CONFIG --cflags`"
>> --LIBS="`$NCURSES_CONFIG --libs` $LIBS"
>> +-
>> +-cf_add_libs="`$NCURSES_CONFIG --libs`"
>>   +CPPFLAGS="$CPPFLAGS `pkg-config --short-errors --print-errors --cflags "ncurses" 2>/dev/null`"
>> -+LIBS="`pkg-config --short-errors --print-errors --libs "ncurses" 2>/dev/null` $LIBS"
>> -
>> - # even with config script, some packages use no-override for curses.h
>> -
>> -@@ -10096,7 +10096,7 @@ cat >>confdefs.h <<EOF
>> - #define $cf_nculib_ROOT 1
>> - EOF
>> -
>> --cf_cv_ncurses_version=`$NCURSES_CONFIG --version`
>> -+cf_cv_ncurses_version=`pkg-config --short-errors --print-errors --modversion "ncurses"`
>> -
>> - else
>> -
>> ++cf_add_libs="`pkg-config --short-errors --print-errors --libs "ncurses" 2>/dev/null` $LIBS"
>> + # Filter out duplicates - this happens with badly-designed ".pc" files...
>> + for cf_add_1lib in $LIBS
>> + do
>>   --
>>   1.7.10.4
>>
>> diff --git a/meta-oe/recipes-extended/dialog/files/use-pkg-config-for-static-ncurses-detection.patch b/meta-oe/recipes-extended/dialog/files/use-pkg-config-for-static-ncurses-detection.patch
>> new file mode 100644
>> index 0000000..3ed174c
>> --- /dev/null
>> +++ b/meta-oe/recipes-extended/dialog/files/use-pkg-config-for-static-ncurses-detection.patch
>> @@ -0,0 +1,32 @@
>> +Subject: [PATCH] use pkg-config for ncurses detection.
>> +
>> +Upstream-Status: Inappropriate [configuration]
>> +
>> +This is a workaround to make dialog be able to build after ncurses-config
>> +does not work, since the configure file is called directly in dialog bb
>> +file, and autoconf can not work, make a workaround in configure file.
>> +
>> +Signed-off-by: Roy Li <rongqing.li@windriver.com>
>> +---
>> + configure | 5 ++---
>> + 1 file changed, 2 insertions(+), 3 deletions(-)
>> +
>> +diff --git a/configure b/configure
>> +index 8afe3d7..a54bcc1 100755
>> +--- a/configure
>> ++++ b/configure
>> +@@ -11567,9 +11567,8 @@ fi
>> +
>> + if test "$NCURSES_CONFIG" != none ; then
>> +
>> +-CPPFLAGS="$CPPFLAGS `$NCURSES_CONFIG --cflags`"
>> +-
>> +-cf_add_libs="`$NCURSES_CONFIG --libs`"
>> ++CPPFLAGS="$CPPFLAGS `pkg-config --short-errors --print-errors --cflags "ncurses" 2>/dev/null`"
>> ++cf_add_libs="`pkg-config --short-errors --print-errors --static --libs "ncurses" 2>/dev/null` $LIBS"
>> + # Filter out duplicates - this happens with badly-designed ".pc" files...
>> + for cf_add_1lib in $LIBS
>> + do
>> +--
>> +1.7.10.4
>> +
>> --
>> 2.1.0
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

-- 
Best Reagrds,
Roy | RongQing Li

