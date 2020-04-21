Received: from NAM02-BL2-obe.outbound.protection.outlook.com (NAM02-BL2-obe.outbound.protection.outlook.com [40.107.75.79])
 by mx.groups.io with SMTP id smtpd.web10.936.1587432522274505929
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Apr 2020 18:28:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=K27+f5PE;
 spf=pass (domain: windriver.com, ip: 40.107.75.79, mailfrom: changqing.li@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RZq1wNR21B4W7uFn1z3QDefTPUe821pyOQgu44UrbX+xBkDDftVZ8TM1bGQtKFuPa3Hnocu1urjVBkfaIsAyNpiqgz5AVhQ+aLslo95lFj7KBq4jPhJfXCOappHjGF9U8Wma2dznlF2CdvT35j8YHJuvoJ5UlD155ucGjmEoWq+2KlBarJm+bVDY5EaOXemLdfhk5AofmniF3MbjFQxzlR48uXR6b1vlCoqt8go0T3ChzQqaoL2zxoA0y77QL3ys42vJI5DBEKUlZTXm9FEelsun6IbG9oZU3+BZfbTJo5JYmQSdWtok5B18nN3Z0QsHqzv0CjtW8aqf6p9JXJ9uaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BGMo0w+5KcWUNHbMXX6swc2Hm4u9ppTayS77vY9f6no=;
 b=WkC8dXinGHCTqZJQNFHlKjKRiwVrPYl5N/RWlitS/g8va90IH7574x63U/BVdOoSCv5u+rvqpDykLHceaAXI1Iy49npCp1LWtU4cY8E7x+vE+M4lCs7nSL1Zutx2tr4o/7sJBY+xNs9xFhm0vvWoTaRp1lAYVZ8S9NnI0AgpD3zZfhHEHW4VW2Xz/z+CxxKdqLf2Ue8nzw+1izhloicAqgmr8ERLPtWHmXh1tvYV3ssgKruf6FjWmKpdqNS0zw7ZG8VDLDPYcvDUok7+TTIFcbsfJyhRBBE/vl/30hPU3rI0nsBu2cULKXbaNXbASbleazGRWteEx3tB1lqX8jZ3Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BGMo0w+5KcWUNHbMXX6swc2Hm4u9ppTayS77vY9f6no=;
 b=K27+f5PE3+2I2YGmB5Lso/mnHQ6MAkBqDYO+AV0YJXqQ/siOrQxB7il9hDlI9P4Z0NyxJwQ/9flIE35YV76WRIRLu8xctFkNUD3Ag5yoB9cIP8KwB0hZAPjeMiRTNVPzsKTUbj/s7K0nGDukB0sMQtmqrlBLIctxsswfrgKXSw4=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Changqing.Li@windriver.com; 
Received: from SN6PR11MB2557.namprd11.prod.outlook.com (2603:10b6:805:56::33)
 by SN6PR11MB2638.namprd11.prod.outlook.com (2603:10b6:805:58::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.29; Tue, 21 Apr
 2020 01:28:39 +0000
Received: from SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::3ce1:6359:35f0:ec2d]) by SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::3ce1:6359:35f0:ec2d%6]) with mapi id 15.20.2921.027; Tue, 21 Apr 2020
 01:28:39 +0000
Subject: Re: [oe] [meta-oe][PATCH] php: Add 7.4.4
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
References: <1587376709-244063-1-git-send-email-changqing.li@windriver.com>
 <CAMKF1sphN=C75MML3KT8be+=9sDTMCCZE+RsaJaaktDLZzHr+w@mail.gmail.com>
From: "Changqing Li" <changqing.li@windriver.com>
Message-ID: <f92a733f-e8cf-d0aa-5635-ebaba8b82317@windriver.com>
Date: Tue, 21 Apr 2020 09:28:29 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
In-Reply-To: <CAMKF1sphN=C75MML3KT8be+=9sDTMCCZE+RsaJaaktDLZzHr+w@mail.gmail.com>
X-ClientProxiedBy: HK2PR06CA0012.apcprd06.prod.outlook.com
 (2603:1096:202:2e::24) To SN6PR11MB2557.namprd11.prod.outlook.com
 (2603:10b6:805:56::33)
Return-Path: changqing.li@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.189] (60.247.85.82) by HK2PR06CA0012.apcprd06.prod.outlook.com (2603:1096:202:2e::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.25 via Frontend Transport; Tue, 21 Apr 2020 01:28:37 +0000
X-Originating-IP: [60.247.85.82]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 04e4f110-5252-46b9-96b9-08d7e5935148
X-MS-TrafficTypeDiagnostic: SN6PR11MB2638:
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB263859F2D245B52F8BDB6F6582D50@SN6PR11MB2638.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:336;
X-Forefront-PRVS: 038002787A
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2557.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(396003)(39850400004)(366004)(376002)(346002)(136003)(8676002)(31686004)(81156014)(86362001)(16799955002)(31696002)(8936002)(6916009)(6706004)(2616005)(478600001)(5660300002)(44832011)(30864003)(966005)(956004)(53546011)(52116002)(16576012)(16526019)(26005)(186003)(83080400001)(33964004)(6666004)(66946007)(2906002)(66476007)(6486002)(316002)(4326008)(36756003)(66556008)(78286006)(579004)(559001);DIR:OUT;SFP:1101;
Received-SPF: None (protection.outlook.com: windriver.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	5WcriQ1PTln2kYPfpHE6WZZqlKd/smB2W1Ajzq67hRyL4hIvEFluvxwpDF26Tu4nwLROBmPf8jHHfmHMtVgA6N40B2esj5QdjbIfYB/NtZkkrUDIc6/h2PqKeYsFObQhaMq58NkClwxte5/83RFsZEaq4X5np2oWO4qstAA/RBRfYXVsfL5mLhsW0Ylh+XatK++5Re2e45pRSWWMd4++deiwRBDkYSDOAEWHd26ucJlGZg/QA0wJEs2EBDknPuarIzadzu6mcfliRUexGFTy5E40NYQO172WZ+4g1M1uK6kAL8YXQxO3pUfS2N1Cc9nYETfYsbYxuyVvtrvXA+ciQ6rPRP3AQS3INxNpVNIfdTZ0gollUXtr1iQgy6AtvvkUwwhYTdTsBzVqNCc1Hd3rdzCe2mjNGCoYRm3ZoJNZigW8tOcuXnVA24xbZSSBldTgLtSHZ4ioWnrxGvsZ2Cm9mYePA0brpSFVOpdu+uLUuSTfTVi6bF/KGvtlf7lzkJ5wgvkVA3w7KCFTmNQeSu+J0C1UP8brZPD0q1Ve+6I2REKEIhYFf4M9dXEBgqS1gssXKWsJwY9V/7ISn4zAmWETfUkPaqcaJ/WKZLr8W9gaI84=
X-MS-Exchange-AntiSpam-MessageData: 
	g8lpJGbcLmRKtz5hYm0HmVL+CANwlNJoXTfhZmHgttazbPJE6QrrCoizSv8G6p3UzQUJvdzlhlF1PF24cesUeTRzr2G/udwPA8sIoJQEzXljfk4ejd6YHXl/Y9dZ4aIQPeCn7xqurnyAKGxbOwAxjA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04e4f110-5252-46b9-96b9-08d7e5935148
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2020 01:28:38.8895
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 642YrQ87u/fsZfdndHo2hGOSBhzHwJl4gQfP79ZClqsK4MQRzQwKp4El4OoKWu60A87Oo3bl0YjuKha4Wrs/PvD3JEsddhhb5STlLLDIeGY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2638
Content-Type: multipart/alternative;
 boundary="------------55BEE1BCE9E0FF2A39962FC0"
Content-Language: en-US

--------------55BEE1BCE9E0FF2A39962FC0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 4/21/20 12:56 AM, Khem Raj wrote:
> On Mon, Apr 20, 2020 at 2:59 AM Changqing Li <changqing.li@windriver.com> wrote:
>> From: Changqing Li <changqing.li@windriver.com>
>>
>> * Add php 7.4, and also keep 7.3 existed.
>
> why do we need to keep 7.3 ?

I keep it since 7.3 and 7.4 have some incompatibility,  so maybe keep 
7.3 to EOF is better ?

>
>> refer:
>> https://www.php.net/migration74
>> https://www.php.net/supported-versions.php
>>
>> * note: for 7.4, pear is disabled by default,
>> and it will be deprecated in future.
>>
>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> ---
>>   ...nfigure.ac-don-t-include-build-libtool.m4.patch |  30 +++
>>   .../0001-php.m4-don-t-unset-cache-variables.patch  |  39 +++
>>   ...7.4-0001-opcache-config.m4-enable-opcache.patch | 230 +++++++++++++++++
>>   ...01-php-don-t-use-broken-wrapper-for-mkdir.patch |  29 +++
>>   .../recipes-devtools/php/php/php7.4-iconv.patch    |  41 ++++
>>   .../php/php/php7.4-imap-fix-autofoo.patch          |  41 ++++
>>   .../php/php/php7.4-phar-makefile.patch             |  46 ++++
>>   .../php/php/php7.4-php_exec_native.patch           |  26 ++
>>   meta-oe/recipes-devtools/php/php_7.4.4.bb          | 272 +++++++++++++++++++++
>>   9 files changed, 754 insertions(+)
>>   create mode 100644 meta-oe/recipes-devtools/php/php/0001-configure.ac-don-t-include-build-libtool.m4.patch
>>   create mode 100644 meta-oe/recipes-devtools/php/php/0001-php.m4-don-t-unset-cache-variables.patch
>>   create mode 100644 meta-oe/recipes-devtools/php/php/php7.4-0001-opcache-config.m4-enable-opcache.patch
>>   create mode 100644 meta-oe/recipes-devtools/php/php/php7.4-0001-php-don-t-use-broken-wrapper-for-mkdir.patch
>>   create mode 100644 meta-oe/recipes-devtools/php/php/php7.4-iconv.patch
>>   create mode 100644 meta-oe/recipes-devtools/php/php/php7.4-imap-fix-autofoo.patch
>>   create mode 100644 meta-oe/recipes-devtools/php/php/php7.4-phar-makefile.patch
>>   create mode 100644 meta-oe/recipes-devtools/php/php/php7.4-php_exec_native.patch
>>   create mode 100644 meta-oe/recipes-devtools/php/php_7.4.4.bb
>>
>> diff --git a/meta-oe/recipes-devtools/php/php/0001-configure.ac-don-t-include-build-libtool.m4.patch b/meta-oe/recipes-devtools/php/php/0001-configure.ac-don-t-include-build-libtool.m4.patch
>> new file mode 100644
>> index 0000000..2861366
>> --- /dev/null
>> +++ b/meta-oe/recipes-devtools/php/php/0001-configure.ac-don-t-include-build-libtool.m4.patch
>> @@ -0,0 +1,30 @@
>> +From f5a34e771532b8433f307b679500c26af328ba35 Mon Sep 17 00:00:00 2001
>> +From: Changqing Li <changqing.li@windriver.com>
>> +Date: Fri, 17 Apr 2020 15:01:57 +0800
>> +Subject: [PATCH] configure.ac: don't include build/libtool.m4
>> +
>> +we delete build/libtool.m4 before do_configure,
>> +we will use libtool.m4 under ACLOCALDIR
>> +
>> +Upstream-Status: Inappropriate [oe-specific]
>> +
>> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> +---
>> + configure.ac | 1 -
>> + 1 file changed, 1 deletion(-)
>> +
>> +diff --git a/configure.ac b/configure.ac
>> +index 06c6a27..f85144e 100644
>> +--- a/configure.ac
>> ++++ b/configure.ac
>> +@@ -6,7 +6,6 @@ dnl ----------------------------------------------------------------------------
>> + m4_include([build/ax_check_compile_flag.m4])
>> + m4_include([build/ax_func_which_gethostbyname_r.m4])
>> + m4_include([build/ax_gcc_func_attribute.m4])
>> +-m4_include([build/libtool.m4])
>> + m4_include([build/php_cxx_compile_stdcxx.m4])
>> + m4_include([build/php.m4])
>> + m4_include([build/pkg.m4])
>> +--
>> +2.7.4
>> +
>> diff --git a/meta-oe/recipes-devtools/php/php/0001-php.m4-don-t-unset-cache-variables.patch b/meta-oe/recipes-devtools/php/php/0001-php.m4-don-t-unset-cache-variables.patch
>> new file mode 100644
>> index 0000000..0d721ec
>> --- /dev/null
>> +++ b/meta-oe/recipes-devtools/php/php/0001-php.m4-don-t-unset-cache-variables.patch
>> @@ -0,0 +1,39 @@
>> +php.m4: don't unset cache variables
>> +
>> +Unsetting prevents cache variable from being passed to configure.
>> +
>> +Upstream-Status: Inappropriate [OE-specific]
>> +
>> +Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
>> +
>> +update this patch to 7.4.4, acinclude.m4 move to build/php.m4
>> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> +---
>> + build/php.m4 | 4 ----
>> + 1 file changed, 4 deletions(-)
>> +
>> +diff --git a/build/php.m4 b/build/php.m4
>> +index 5c45d13..218ec47 100644
>> +--- a/build/php.m4
>> ++++ b/build/php.m4
>> +@@ -1587,8 +1587,6 @@ dnl PHP_CHECK_FUNC_LIB
>> + dnl
>> + AC_DEFUN([PHP_CHECK_FUNC_LIB],[
>> +   ifelse($2,,:,[
>> +-  unset ac_cv_lib_$2[]_$1
>> +-  unset ac_cv_lib_$2[]___$1
>> +   unset found
>> +   AC_CHECK_LIB($2, $1, [found=yes], [
>> +     AC_CHECK_LIB($2, __$1, [found=yes], [found=no])
>> +@@ -1620,8 +1618,6 @@ dnl and as a fall back in the specified library. Defines HAVE_func and
>> + dnl HAVE_library if found and adds the library to LIBS.
>> + dnl
>> + AC_DEFUN([PHP_CHECK_FUNC],[
>> +-  unset ac_cv_func_$1
>> +-  unset ac_cv_func___$1
>> +   unset found
>> +
>> +   AC_CHECK_FUNC($1, [found=yes],[ AC_CHECK_FUNC(__$1,[found=yes],[found=no]) ])
>> +--
>> +2.7.4
>> +
>> diff --git a/meta-oe/recipes-devtools/php/php/php7.4-0001-opcache-config.m4-enable-opcache.patch b/meta-oe/recipes-devtools/php/php/php7.4-0001-opcache-config.m4-enable-opcache.patch
>> new file mode 100644
>> index 0000000..ee0d5ed
>> --- /dev/null
>> +++ b/meta-oe/recipes-devtools/php/php/php7.4-0001-opcache-config.m4-enable-opcache.patch
>> @@ -0,0 +1,230 @@
>> +opcache/config.m4: enable opcache
>> +
>> +We can't use AC_TRY_RUN to run programs in a cross compile environment.
>> +Set
>> +the variables directly instead since we know that we'd be running on
>> +latest
>> +enough linux kernel.
>> +
>> +Upstream-Status: Inappropriate [Configuration]
>> +
>> +Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
>> +
>> +update patch to version 7.4.4
>> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> +---
>> + ext/opcache/config.m4 | 194 +-------------------------------------------------
>> + 1 file changed, 3 insertions(+), 191 deletions(-)
>> +
>> +diff --git a/ext/opcache/config.m4 b/ext/opcache/config.m4
>> +index 6c40caf..84ddf1e 100644
>> +--- a/ext/opcache/config.m4
>> ++++ b/ext/opcache/config.m4
>> +@@ -23,201 +23,13 @@ if test "$PHP_OPCACHE" != "no"; then
>> +   AC_CHECK_FUNCS([mprotect])
>> +
>> +   AC_MSG_CHECKING(for sysvipc shared memory support)
>> +-  AC_RUN_IFELSE([AC_LANG_SOURCE([[
>> +-#include <sys/types.h>
>> +-#include <sys/wait.h>
>> +-#include <sys/ipc.h>
>> +-#include <sys/shm.h>
>> +-#include <unistd.h>
>> +-#include <string.h>
>> +-
>> +-int main() {
>> +-  pid_t pid;
>> +-  int status;
>> +-  int ipc_id;
>> +-  char *shm;
>> +-  struct shmid_ds shmbuf;
>> +-
>> +-  ipc_id = shmget(IPC_PRIVATE, 4096, (IPC_CREAT | SHM_R | SHM_W));
>> +-  if (ipc_id == -1) {
>> +-    return 1;
>> +-  }
>> +-
>> +-  shm = shmat(ipc_id, NULL, 0);
>> +-  if (shm == (void *)-1) {
>> +-    shmctl(ipc_id, IPC_RMID, NULL);
>> +-    return 2;
>> +-  }
>> +-
>> +-  if (shmctl(ipc_id, IPC_STAT, &shmbuf) != 0) {
>> +-    shmdt(shm);
>> +-    shmctl(ipc_id, IPC_RMID, NULL);
>> +-    return 3;
>> +-  }
>> +-
>> +-  shmbuf.shm_perm.uid = getuid();
>> +-  shmbuf.shm_perm.gid = getgid();
>> +-  shmbuf.shm_perm.mode = 0600;
>> +-
>> +-  if (shmctl(ipc_id, IPC_SET, &shmbuf) != 0) {
>> +-    shmdt(shm);
>> +-    shmctl(ipc_id, IPC_RMID, NULL);
>> +-    return 4;
>> +-  }
>> +-
>> +-  shmctl(ipc_id, IPC_RMID, NULL);
>> +-
>> +-  strcpy(shm, "hello");
>> +-
>> +-  pid = fork();
>> +-  if (pid < 0) {
>> +-    return 5;
>> +-  } else if (pid == 0) {
>> +-    strcpy(shm, "bye");
>> +-    return 6;
>> +-  }
>> +-  if (wait(&status) != pid) {
>> +-    return 7;
>> +-  }
>> +-  if (!WIFEXITED(status) || WEXITSTATUS(status) != 6) {
>> +-    return 8;
>> +-  }
>> +-  if (strcmp(shm, "bye") != 0) {
>> +-    return 9;
>> +-  }
>> +-  return 0;
>> +-}
>> +-]])],[dnl
>> +-    AC_DEFINE(HAVE_SHM_IPC, 1, [Define if you have SysV IPC SHM support])
>> +-    msg=yes],[msg=no],[msg=no])
>> +-  AC_MSG_RESULT([$msg])
>> ++  AC_DEFINE(HAVE_SHM_IPC, 1, [Define if you have SysV IPC SHM support])
>> +
>> +   AC_MSG_CHECKING(for mmap() using MAP_ANON shared memory support)
>> +-  AC_RUN_IFELSE([AC_LANG_SOURCE([[
>> +-#include <sys/types.h>
>> +-#include <sys/wait.h>
>> +-#include <sys/mman.h>
>> +-#include <unistd.h>
>> +-#include <string.h>
>> +-
>> +-#ifndef MAP_ANON
>> +-# ifdef MAP_ANONYMOUS
>> +-#  define MAP_ANON MAP_ANONYMOUS
>> +-# endif
>> +-#endif
>> +-#ifndef MAP_FAILED
>> +-# define MAP_FAILED ((void*)-1)
>> +-#endif
>> ++  AC_DEFINE(HAVE_SHM_MMAP_ANON, 1, [Define if you have mmap(MAP_ANON) SHM support])
>> +
>> +-int main() {
>> +-  pid_t pid;
>> +-  int status;
>> +-  char *shm;
>> +-
>> +-  shm = mmap(NULL, 4096, PROT_READ | PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
>> +-  if (shm == MAP_FAILED) {
>> +-    return 1;
>> +-  }
>> +-
>> +-  strcpy(shm, "hello");
>> +-
>> +-  pid = fork();
>> +-  if (pid < 0) {
>> +-    return 5;
>> +-  } else if (pid == 0) {
>> +-    strcpy(shm, "bye");
>> +-    return 6;
>> +-  }
>> +-  if (wait(&status) != pid) {
>> +-    return 7;
>> +-  }
>> +-  if (!WIFEXITED(status) || WEXITSTATUS(status) != 6) {
>> +-    return 8;
>> +-  }
>> +-  if (strcmp(shm, "bye") != 0) {
>> +-    return 9;
>> +-  }
>> +-  return 0;
>> +-}
>> +-]])],[dnl
>> +-    AC_DEFINE(HAVE_SHM_MMAP_ANON, 1, [Define if you have mmap(MAP_ANON) SHM support])
>> +-    msg=yes],[msg=no],[msg=no])
>> +-  AC_MSG_RESULT([$msg])
>> +-
>> +-  PHP_CHECK_FUNC_LIB(shm_open, rt)
>> +   AC_MSG_CHECKING(for mmap() using shm_open() shared memory support)
>> +-  AC_RUN_IFELSE([AC_LANG_SOURCE([[
>> +-#include <sys/types.h>
>> +-#include <sys/wait.h>
>> +-#include <sys/mman.h>
>> +-#include <sys/stat.h>
>> +-#include <fcntl.h>
>> +-#include <unistd.h>
>> +-#include <string.h>
>> +-#include <stdlib.h>
>> +-#include <stdio.h>
>> +-
>> +-#ifndef MAP_FAILED
>> +-# define MAP_FAILED ((void*)-1)
>> +-#endif
>> +-
>> +-int main() {
>> +-  pid_t pid;
>> +-  int status;
>> +-  int fd;
>> +-  char *shm;
>> +-  char tmpname[4096];
>> +-
>> +-  sprintf(tmpname,"/opcache.test.shm.%dXXXXXX", getpid());
>> +-  if (mktemp(tmpname) == NULL) {
>> +-    return 1;
>> +-  }
>> +-  fd = shm_open(tmpname, O_RDWR | O_CREAT, S_IRUSR | S_IWUSR);
>> +-  if (fd == -1) {
>> +-    return 2;
>> +-  }
>> +-  if (ftruncate(fd, 4096) < 0) {
>> +-    close(fd);
>> +-    shm_unlink(tmpname);
>> +-    return 3;
>> +-  }
>> +-
>> +-  shm = mmap(NULL, 4096, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
>> +-  if (shm == MAP_FAILED) {
>> +-    return 4;
>> +-  }
>> +-  shm_unlink(tmpname);
>> +-  close(fd);
>> +-
>> +-  strcpy(shm, "hello");
>> +-
>> +-  pid = fork();
>> +-  if (pid < 0) {
>> +-    return 5;
>> +-  } else if (pid == 0) {
>> +-    strcpy(shm, "bye");
>> +-    return 6;
>> +-  }
>> +-  if (wait(&status) != pid) {
>> +-    return 7;
>> +-  }
>> +-  if (!WIFEXITED(status) || WEXITSTATUS(status) != 6) {
>> +-    return 8;
>> +-  }
>> +-  if (strcmp(shm, "bye") != 0) {
>> +-    return 9;
>> +-  }
>> +-  return 0;
>> +-}
>> +-]])],[dnl
>> +-    AC_DEFINE(HAVE_SHM_MMAP_POSIX, 1, [Define if you have POSIX mmap() SHM support])
>> +-    AC_MSG_RESULT([yes])
>> +-    PHP_CHECK_LIBRARY(rt, shm_unlink, [PHP_ADD_LIBRARY(rt,1,OPCACHE_SHARED_LIBADD)])
>> +-  ],[
>> +-    AC_MSG_RESULT([no])
>> +-  ],[
>> +-    AC_MSG_RESULT([no])
>> +-  ])
>> ++  AC_DEFINE(HAVE_SHM_MMAP_POSIX, 1, [Define if you have POSIX mmap() SHM support])
>> +
>> +   PHP_NEW_EXTENSION(opcache,
>> +       ZendAccelerator.c \
>> +--
>> +2.7.4
>> +
>> diff --git a/meta-oe/recipes-devtools/php/php/php7.4-0001-php-don-t-use-broken-wrapper-for-mkdir.patch b/meta-oe/recipes-devtools/php/php/php7.4-0001-php-don-t-use-broken-wrapper-for-mkdir.patch
>> new file mode 100644
>> index 0000000..d687373
>> --- /dev/null
>> +++ b/meta-oe/recipes-devtools/php/php/php7.4-0001-php-don-t-use-broken-wrapper-for-mkdir.patch
>> @@ -0,0 +1,29 @@
>> +From ebc101e0728b9db6c687cff525e5dfc8eb0edbf3 Mon Sep 17 00:00:00 2001
>> +From: Koen Kooi <koen@dominion.thruhere.net>
>> +Date: Thu, 3 Nov 2011 14:27:15 +0100
>> +Subject: [PATCH 2/8] php: don't use broken wrapper for mkdir
>> +
>> +Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>> +
>> +update patch to version 7.4.4
>> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> +---
>> +
>> +Upstream-Status: Inappropriate
>> +
>> + build/Makefile.global | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/build/Makefile.global b/build/Makefile.global
>> +index ff858c2..ae554b4 100644
>> +--- a/build/Makefile.global
>> ++++ b/build/Makefile.global
>> +@@ -1,4 +1,4 @@
>> +-mkinstalldirs = $(top_srcdir)/build/shtool mkdir -p
>> ++mkinstalldirs = mkdir -p
>> + INSTALL = $(top_srcdir)/build/shtool install -c
>> + INSTALL_DATA = $(INSTALL) -m 644
>> +
>> +--
>> +1.9.3
>> +
>> diff --git a/meta-oe/recipes-devtools/php/php/php7.4-iconv.patch b/meta-oe/recipes-devtools/php/php/php7.4-iconv.patch
>> new file mode 100644
>> index 0000000..9ec8a89
>> --- /dev/null
>> +++ b/meta-oe/recipes-devtools/php/php/php7.4-iconv.patch
>> @@ -0,0 +1,41 @@
>> +Subject: [PATCH] From 17cc5645f3acf943a5a06465d09d0ebcfea987bd Mon Sep 17
>> + 00:00:00 2001 From: Koen Kooi <koen@dominion.thruhere.net> Date: Wed, 2 Nov
>> + 2011 16:54:57 +0100 Subject: [PATCH] Upstream-Status: Pending
>> +
>> +update patch to version 7.4.4
>> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> +---
>> + build/php.m4        | 3 ++-
>> + ext/iconv/config.m4 | 2 +-
>> + 2 files changed, 3 insertions(+), 2 deletions(-)
>> +
>> +diff --git a/build/php.m4 b/build/php.m4
>> +index 7392876..5c45d13 100644
>> +--- a/build/php.m4
>> ++++ b/build/php.m4
>> +@@ -1950,7 +1950,8 @@ AC_DEFUN([PHP_SETUP_ICONV], [
>> +   echo > ext/iconv/php_iconv_supports_errno.h
>> +
>> +   dnl Check libc first if no path is provided in --with-iconv.
>> +-  if test "$PHP_ICONV" = "yes"; then
>> ++  dnl must check against no, not against yes as PHP_ICONV can also include a path, which implies yes
>> ++  if test "$PHP_ICONV" != "no"; then
>> +     dnl Reset LIBS temporarily as it may have already been included -liconv in.
>> +     LIBS_save="$LIBS"
>> +     LIBS=
>> +diff --git a/ext/iconv/config.m4 b/ext/iconv/config.m4
>> +index fe9b47a..b6b632f 100644
>> +--- a/ext/iconv/config.m4
>> ++++ b/ext/iconv/config.m4
>> +@@ -14,7 +14,7 @@ if test "$PHP_ICONV" != "no"; then
>> +
>> +   if test "$iconv_avail" != "no"; then
>> +     if test -z "$ICONV_DIR"; then
>> +-      for i in /usr/local /usr; do
>> ++      for i in $PHP_ICONV /usr/local /usr; do
>> +         if test -f "$i/include/iconv.h" || test -f "$i/include/giconv.h"; then
>> +           PHP_ICONV_PREFIX="$i"
>> +           break
>> +--
>> +2.7.4
>> +
>> diff --git a/meta-oe/recipes-devtools/php/php/php7.4-imap-fix-autofoo.patch b/meta-oe/recipes-devtools/php/php/php7.4-imap-fix-autofoo.patch
>> new file mode 100644
>> index 0000000..ebe5f6a
>> --- /dev/null
>> +++ b/meta-oe/recipes-devtools/php/php/php7.4-imap-fix-autofoo.patch
>> @@ -0,0 +1,41 @@
>> +Subject: [PATCH] From c084c8349d1780980e232cb28b60a109e3d89438 Mon Sep 17
>> + 00:00:00 2001 From: Koen Kooi <koen@dominion.thruhere.net> Date: Wed, 2 Nov
>> + 2011 16:54:57 +0100 Subject: [PATCH] Upstream-Status: Pending
>> +
>> +update patch to version 7.4.4
>> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> +---
>> + ext/imap/config.m4 | 10 ++--------
>> + 1 file changed, 2 insertions(+), 8 deletions(-)
>> +
>> +diff --git a/ext/imap/config.m4 b/ext/imap/config.m4
>> +index 5086a31..0e938bd 100644
>> +--- a/ext/imap/config.m4
>> ++++ b/ext/imap/config.m4
>> +@@ -110,7 +110,7 @@ if test "$PHP_IMAP" != "no"; then
>> +     PHP_NEW_EXTENSION(imap, php_imap.c, $ext_shared,, -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1)
>> +     AC_DEFINE(HAVE_IMAP,1,[ ])
>> +
>> +-    for i in $PHP_IMAP /usr/local /usr; do
>> ++    for i in $PHP_IMAP $PHP_IMAP/usr /usr/local /usr; do
>> +       IMAP_INC_CHK()
>> +       el[]IMAP_INC_CHK(/include/c-client)
>> +       el[]IMAP_INC_CHK(/include/imap)
>> +@@ -199,13 +199,7 @@ if test "$PHP_IMAP" != "no"; then
>> +       AC_MSG_ERROR(Cannot find rfc822.h. Please check your c-client installation.)
>> +     fi
>> +
>> +-    if test ! -r "$IMAP_DIR/c-client/libc-client.a" && test -r "$IMAP_DIR/c-client/c-client.a" ; then
>> +-      ln -s "$IMAP_DIR/c-client/c-client.a" "$IMAP_DIR/c-client/libc-client.a" >/dev/null 2>&1
>> +-    elif test ! -r "$IMAP_DIR/$PHP_LIBDIR/libc-client.a" && test -r "$IMAP_DIR/$PHP_LIBDIR/c-client.a"; then
>> +-      ln -s "$IMAP_DIR/$PHP_LIBDIR/c-client.a" "$IMAP_DIR/$PHP_LIBDIR/libc-client.a" >/dev/null 2>&1
>> +-    fi
>> +-
>> +-    for lib in c-client4 c-client imap; do
>> ++    for lib in /usr/lib c-client4 c-client imap; do
>> +       IMAP_LIB=$lib
>> +       IMAP_LIB_CHK($PHP_LIBDIR)
>> +       IMAP_LIB_CHK(c-client)
>> +--
>> +2.7.4
>> +
>> diff --git a/meta-oe/recipes-devtools/php/php/php7.4-phar-makefile.patch b/meta-oe/recipes-devtools/php/php/php7.4-phar-makefile.patch
>> new file mode 100644
>> index 0000000..eb73bc4
>> --- /dev/null
>> +++ b/meta-oe/recipes-devtools/php/php/php7.4-phar-makefile.patch
>> @@ -0,0 +1,46 @@
>> +Subject: [PATCH] From 08962a56f69963e01892d98ca5b75de8354bd3f5 Mon Sep 17
>> + 00:00:00 2001 From: Koen Kooi <koen@dominion.thruhere.net> Date: Wed, 2 Nov
>> + 2011 16:54:57 +0100 Subject: [PATCH] Fix phar packaging
>> +
>> +Inherited from OE-Classic, with some additions to fix host paths leaking
>> +into the target package.
>> +
>> +Upstream-Status: Inappropriate [config]
>> +
>> +update patch to version 7.4.4
>> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> +---
>> + ext/phar/Makefile.frag | 17 +++--------------
>> + 1 file changed, 3 insertions(+), 14 deletions(-)
>> +
>> +diff --git a/ext/phar/Makefile.frag b/ext/phar/Makefile.frag
>> +index 6442f33..6145412 100644
>> +--- a/ext/phar/Makefile.frag
>> ++++ b/ext/phar/Makefile.frag
>> +@@ -10,20 +10,9 @@ pharcmd: $(builddir)/phar.php $(builddir)/phar.phar
>> +
>> + PHP_PHARCMD_SETTINGS = -n -d 'open_basedir=' -d 'output_buffering=0' -d 'memory_limit=-1' -d phar.readonly=0
>> + PHP_PHARCMD_EXECUTABLE = ` \
>> +-      if test -x "$(top_builddir)/$(SAPI_CLI_PATH)"; then \
>> +-              $(top_srcdir)/build/shtool echo -n -- "$(top_builddir)/$(SAPI_CLI_PATH) -n"; \
>> +-              if test "x$(PHP_MODULES)" != "x"; then \
>> +-              $(top_srcdir)/build/shtool echo -n -- " -d extension_dir=$(top_builddir)/modules"; \
>> +-              for i in bz2 zlib phar; do \
>> +-                      if test -f "$(top_builddir)/modules/$$i.la"; then \
>> +-                              . $(top_builddir)/modules/$$i.la; $(top_srcdir)/build/shtool echo -n -- " -d extension=$$dlname"; \
>> +-                      fi; \
>> +-              done; \
>> +-              fi; \
>> +-      else \
>> +-              $(top_srcdir)/build/shtool echo -n -- "$(PHP_EXECUTABLE)"; \
>> +-      fi;`
>> +-PHP_PHARCMD_BANG = `$(top_srcdir)/build/shtool echo -n -- "$(INSTALL_ROOT)$(bindir)/$(program_prefix)php$(program_suffix)$(EXEEXT)";`
>> ++               $(top_srcdir)/build/shtool echo -n -- "$(PHP_EXECUTABLE)"; `
>> ++
>> ++PHP_PHARCMD_BANG = `$(top_srcdir)/build/shtool echo -n -- "$(bindir)/$(program_prefix)php$(program_suffix)$(EXEEXT)";`
>> +
>> + $(builddir)/phar/phar.inc: $(srcdir)/phar/phar.inc
>> +       -@test -d $(builddir)/phar || mkdir $(builddir)/phar
>> +--
>> +2.7.4
>> +
>> diff --git a/meta-oe/recipes-devtools/php/php/php7.4-php_exec_native.patch b/meta-oe/recipes-devtools/php/php/php7.4-php_exec_native.patch
>> new file mode 100644
>> index 0000000..4aec481
>> --- /dev/null
>> +++ b/meta-oe/recipes-devtools/php/php/php7.4-php_exec_native.patch
>> @@ -0,0 +1,26 @@
>> +Subject: [PATCH] rom d251b5aa3d23803d016ca16818e2e1d2f2b70a02 Mon Sep 17
>> + 00:00:00 2001 From: Koen Kooi <koen@dominion.thruhere.net> Date: Wed, 2 Nov
>> + 2011 16:54:57 +0100 Subject: [PATCH] Upstream-Status: Inappriate
>> +
>> +update patch to version 7.4.4
>> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> +---
>> + sapi/cli/config.m4 | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/sapi/cli/config.m4 b/sapi/cli/config.m4
>> +index 917d45f..aaf1e27 100644
>> +--- a/sapi/cli/config.m4
>> ++++ b/sapi/cli/config.m4
>> +@@ -47,7 +47,7 @@ if test "$PHP_CLI" != "no"; then
>> +   esac
>> +
>> +   dnl Set executable for tests.
>> +-  PHP_EXECUTABLE="\$(top_builddir)/\$(SAPI_CLI_PATH)"
>> ++  PHP_EXECUTABLE="${PHP_NATIVE_DIR}/php"
>> +   PHP_SUBST(PHP_EXECUTABLE)
>> +
>> +   dnl Expose to Makefile.
>> +--
>> +2.7.4
>> +
>> diff --git a/meta-oe/recipes-devtools/php/php_7.4.4.bb b/meta-oe/recipes-devtools/php/php_7.4.4.bb
>> new file mode 100644
>> index 0000000..1f64172
>> --- /dev/null
>> +++ b/meta-oe/recipes-devtools/php/php_7.4.4.bb
>> @@ -0,0 +1,272 @@
>> +SUMMARY = "A server-side, HTML-embedded scripting language"
>> +HOMEPAGE = "http://www.php.net"
>> +SECTION = "console/network"
>> +
>> +LICENSE = "PHP-3.0"
>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=7e571b888d585b31f9ef5edcc647fa30"
>> +
>> +BBCLASSEXTEND = "native"
>> +DEPENDS = "zlib bzip2 libxml2 virtual/libiconv php-native lemon-native"
>> +DEPENDS_class-native = "zlib-native libxml2-native"
>> +
>> +PHP_MAJOR_VERSION = "${@d.getVar('PV').split('.')[0]}"
>> +
>> +SRC_URI = "http://php.net/distributions/php-${PV}.tar.bz2 \
>> +           file://debian-php-fixheader.patch \
>> +           file://0001-configure.ac-don-t-include-build-libtool.m4.patch \
>> +           file://php7.4-0001-php-don-t-use-broken-wrapper-for-mkdir.patch \
>> +           file://0001-php.m4-don-t-unset-cache-variables.patch \
>> +          "
>> +
>> +SRC_URI_append_class-target = " \
>> +            file://php7.4-imap-fix-autofoo.patch \
>> +            file://php7.4-php_exec_native.patch \
>> +            file://php-fpm.conf \
>> +            file://php-fpm-apache.conf \
>> +            file://70_mod_php${PHP_MAJOR_VERSION}.conf \
>> +            file://php-fpm.service \
>> +            file://pear-makefile.patch \
>> +            file://php7.4-phar-makefile.patch \
>> +            file://php7.4-0001-opcache-config.m4-enable-opcache.patch \
>> +            file://xfail_two_bug_tests.patch \
>> +            file://php7.4-iconv.patch \
>> +          "
>> +S = "${WORKDIR}/php-${PV}"
>> +SRC_URI[md5sum] = "262c258a3b8b5699fcca89a64e58758c"
>> +SRC_URI[sha256sum] = "308e8f4182ec8a2767b0b1b8e1e7c69fb149b37cfb98ee4a37475e082fa9829f"
>> +
>> +inherit autotools pkgconfig python3native gettext
>> +
>> +# phpize is not scanned for absolute paths by default (but php-config is).
>> +#
>> +SSTATE_SCAN_FILES += "phpize"
>> +SSTATE_SCAN_FILES += "build-defs.h"
>> +
>> +PHP_LIBDIR = "${libdir}/php${PHP_MAJOR_VERSION}"
>> +
>> +
>> +# Common EXTRA_OECONF
>> +COMMON_EXTRA_OECONF = "--enable-sockets \
>> +                       --enable-pcntl \
>> +                       --enable-shared \
>> +                       --disable-rpath \
>> +                       --with-pic \
>> +                       --libdir=${PHP_LIBDIR} \
>> +"
>> +EXTRA_OECONF = "--enable-mbstring \
>> +                --enable-fpm \
>> +                --with-libdir=${baselib} \
>> +                --with-gettext=${STAGING_LIBDIR}/.. \
>> +                --with-zlib=${STAGING_LIBDIR}/.. \
>> +                --with-iconv=${STAGING_LIBDIR}/.. \
>> +                --with-bz2=${STAGING_DIR_TARGET}${exec_prefix} \
>> +                --with-config-file-path=${sysconfdir}/php/apache2-php${PHP_MAJOR_VERSION} \
>> +                ${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'le', 'ac_cv_c_bigendian_php=no', 'ac_cv_c_bigendian_php=yes', d)} \
>> +                ${@bb.utils.contains('PACKAGECONFIG', 'pam', '', 'ac_cv_lib_pam_pam_start=no', d)} \
>> +                ${COMMON_EXTRA_OECONF} \
>> +"
>> +
>> +EXTRA_OECONF_append_riscv64 = " --with-pcre-jit=no"
>> +EXTRA_OECONF_append_riscv32 = " --with-pcre-jit=no"
>> +
>> +CACHED_CONFIGUREVARS += "ac_cv_func_dlopen=no ac_cv_lib_dl_dlopen=yes"
>> +
>> +EXTRA_OECONF_class-native = " \
>> +                --with-zlib=${STAGING_LIBDIR_NATIVE}/.. \
>> +                --without-iconv \
>> +                ${COMMON_EXTRA_OECONF} \
>> +"
>> +
>> +PACKAGECONFIG ??= "mysql sqlite3 imap opcache openssl \
>> +                   ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6 pam', d)} \
>> +"
>> +PACKAGECONFIG_class-native = ""
>> +
>> +PACKAGECONFIG[zip] = "--enable-zip --with-libzip=${STAGING_EXECPREFIXDIR},,libzip"
>> +
>> +PACKAGECONFIG[mysql] = "--with-mysqli=mysqlnd \
>> +                        --with-pdo-mysql=mysqlnd \
>> +                        ,--without-mysqli --without-pdo-mysql \
>> +                        ,mysql5"
>> +
>> +PACKAGECONFIG[sqlite3] = "--with-sqlite3=${STAGING_LIBDIR}/.. \
>> +                          --with-pdo-sqlite=${STAGING_LIBDIR}/.. \
>> +                          ,--without-sqlite3 --without-pdo-sqlite \
>> +                          ,sqlite3"
>> +PACKAGECONFIG[pgsql] = "--with-pgsql=${STAGING_DIR_TARGET}${exec_prefix},--without-pgsql,postgresql"
>> +PACKAGECONFIG[soap] = "--enable-libxml --enable-soap, --disable-soap, libxml2"
>> +PACKAGECONFIG[apache2] = "--with-apxs2=${STAGING_BINDIR_CROSS}/apxs,,apache2-native apache2"
>> +PACKAGECONFIG[pam] = ",,libpam"
>> +PACKAGECONFIG[imap] = "--with-imap=${STAGING_DIR_HOST} \
>> +                       --with-imap-ssl=${STAGING_DIR_HOST} \
>> +                       ,--without-imap --without-imap-ssl \
>> +                       ,uw-imap"
>> +PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
>> +PACKAGECONFIG[opcache] = "--enable-opcache,--disable-opcache"
>> +PACKAGECONFIG[openssl] = "--with-openssl,--without-openssl,openssl"
>> +PACKAGECONFIG[valgrind] = "--with-valgrind=${STAGING_DIR_TARGET}/usr,--with-valgrind=no,valgrind"
>> +PACKAGECONFIG[mbregex] = "--enable-mbregex, --disable-mbregex, oniguruma"
>> +
>> +export PHP_NATIVE_DIR = "${STAGING_BINDIR_NATIVE}"
>> +export PHP_PEAR_PHP_BIN = "${STAGING_BINDIR_NATIVE}/php"
>> +CFLAGS += " -D_GNU_SOURCE -g -DPTYS_ARE_GETPT -DPTYS_ARE_SEARCHED -I${STAGING_INCDIR}/apache2"
>> +
>> +EXTRA_OEMAKE = "INSTALL_ROOT=${D}"
>> +
>> +acpaths = ""
>> +
>> +do_configure_prepend () {
>> +    #rm -f ${S}/build/libtool.m4 ${S}/ltmain.sh ${S}/aclocal.m4
>> +    rm -f ${S}/ltmain.sh ${S}/aclocal.m4
>> +    sed -i -e 's;build/libtool.m4;${ACLOCALDIR}/libtool.m4;g' ${S}/configure.ac
>> +    find ${S} -name config.m4 | xargs -n1 sed -i 's!APXS_HTTPD=.*!APXS_HTTPD=${STAGING_SBINDIR_NATIVE}/httpd!'
>> +}
>> +
>> +do_configure_append() {
>> +    # No, libtool, we really don't want rpath set...
>> +    sed -i 's|^hardcode_libdir_flag_spec=.*|hardcode_libdir_flag_spec=""|g' ${HOST_SYS}-libtool
>> +    sed -i 's|^runpath_var=LD_RUN_PATH|runpath_var=DIE_RPATH_DIE|g' ${HOST_SYS}-libtool
>> +}
>> +
>> +do_install_append_class-native() {
>> +    rm -rf ${D}/${PHP_LIBDIR}/php/.registry
>> +    rm -rf ${D}/${PHP_LIBDIR}/php/.channels
>> +    rm -rf ${D}/${PHP_LIBDIR}/php/.[a-z]*
>> +}
>> +
>> +do_install_prepend() {
>> +    cat ${ACLOCALDIR}/libtool.m4 ${ACLOCALDIR}/lt~obsolete.m4 ${ACLOCALDIR}/ltoptions.m4 \
>> +        ${ACLOCALDIR}/ltsugar.m4 ${ACLOCALDIR}/ltversion.m4 > ${S}/build/libtool.m4
>> +}
>> +
>> +do_install_prepend_class-target() {
>> +    if ${@bb.utils.contains('PACKAGECONFIG', 'apache2', 'true', 'false', d)}; then
>> +        # Install dummy config file so apxs doesn't fail
>> +        install -d ${D}${sysconfdir}/apache2
>> +        printf "\nLoadModule dummy_module modules/mod_dummy.so\n" > ${D}${sysconfdir}/apache2/httpd.conf
>> +    fi
>> +}
>> +
>> +# fixme
>> +do_install_append_class-target() {
>> +    install -d ${D}${sysconfdir}/
>> +    rm -rf ${D}/${TMPDIR}
>> +    rm -rf ${D}/.registry
>> +    rm -rf ${D}/.channels
>> +    rm -rf ${D}/.[a-z]*
>> +    rm -rf ${D}/var
>> +    rm -f  ${D}/${sysconfdir}/php-fpm.conf.default
>> +    install -m 0644 ${WORKDIR}/php-fpm.conf ${D}/${sysconfdir}/php-fpm.conf
>> +    install -d ${D}/${sysconfdir}/apache2/conf.d
>> +    install -m 0644 ${WORKDIR}/php-fpm-apache.conf ${D}/${sysconfdir}/apache2/conf.d/php-fpm.conf
>> +    install -d ${D}${sysconfdir}/init.d
>> +    sed -i 's:=/usr/sbin:=${sbindir}:g' ${B}/sapi/fpm/init.d.php-fpm
>> +    sed -i 's:=/etc:=${sysconfdir}:g' ${B}/sapi/fpm/init.d.php-fpm
>> +    sed -i 's:=/var:=${localstatedir}:g' ${B}/sapi/fpm/init.d.php-fpm
>> +    install -m 0755 ${B}/sapi/fpm/init.d.php-fpm ${D}${sysconfdir}/init.d/php-fpm
>> +    install -m 0644 ${WORKDIR}/php-fpm-apache.conf ${D}/${sysconfdir}/apache2/conf.d/php-fpm.conf
>> +
>> +    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)};then
>> +        install -d ${D}${systemd_unitdir}/system
>> +        install -m 0644 ${WORKDIR}/php-fpm.service ${D}${systemd_unitdir}/system/
>> +        sed -i -e 's,@SYSCONFDIR@,${sysconfdir},g' \
>> +            -e 's,@LOCALSTATEDIR@,${localstatedir},g' \
>> +            ${D}${systemd_unitdir}/system/php-fpm.service
>> +    fi
>> +
>> +    TMP=`dirname ${D}/${TMPDIR}`
>> +    while test ${TMP} != ${D}; do
>> +        if [ -d ${TMP} ]; then
>> +            rmdir ${TMP}
>> +        fi
>> +        TMP=`dirname ${TMP}`;
>> +    done
>> +
>> +    if ${@bb.utils.contains('PACKAGECONFIG', 'apache2', 'true', 'false', d)}; then
>> +        install -d ${D}${sysconfdir}/apache2/modules.d
>> +        install -d ${D}${sysconfdir}/php/apache2-php${PHP_MAJOR_VERSION}
>> +        install -m 644  ${WORKDIR}/70_mod_php${PHP_MAJOR_VERSION}.conf ${D}${sysconfdir}/apache2/modules.d
>> +        sed -i s,lib/,${libexecdir}/, ${D}${sysconfdir}/apache2/modules.d/70_mod_php${PHP_MAJOR_VERSION}.conf
>> +        cat ${S}/php.ini-production | \
>> +            sed -e 's,extension_dir = \"\./\",extension_dir = \"/usr/lib/extensions\",' \
>> +            > ${D}${sysconfdir}/php/apache2-php${PHP_MAJOR_VERSION}/php.ini
>> +        rm -f ${D}${sysconfdir}/apache2/httpd.conf*
>> +    fi
>> +}
>> +
>> +SYSROOT_PREPROCESS_FUNCS += "php_sysroot_preprocess"
>> +
>> +php_sysroot_preprocess () {
>> +    install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}/
>> +    install -m 755 ${D}${bindir}/phpize ${SYSROOT_DESTDIR}${bindir_crossscripts}/
>> +    install -m 755 ${D}${bindir}/php-config ${SYSROOT_DESTDIR}${bindir_crossscripts}/
>> +
>> +    sed -i 's!eval echo /!eval echo ${STAGING_DIR_HOST}/!' ${SYSROOT_DESTDIR}${bindir_crossscripts}/phpize
>> +    sed -i 's!^include_dir=.*!include_dir=${STAGING_INCDIR}/php!' ${SYSROOT_DESTDIR}${bindir_crossscripts}/php-config
>> +}
>> +
>> +MODPHP_PACKAGE = "${@bb.utils.contains('PACKAGECONFIG', 'apache2', '${PN}-modphp', '', d)}"
>> +
>> +PACKAGES = "${PN}-dbg ${PN}-cli ${PN}-cgi ${PN}-fpm ${PN}-fpm-apache2 ${PN}-pear ${PN}-phar ${MODPHP_PACKAGE} ${PN}-dev ${PN}-staticdev ${PN}-doc ${PN}-opcache ${PN}"
>> +
>> +RDEPENDS_${PN} += "libgcc"
>> +RDEPENDS_${PN}-pear = "${PN}"
>> +RDEPENDS_${PN}-phar = "${PN}-cli"
>> +RDEPENDS_${PN}-cli = "${PN}"
>> +RDEPENDS_${PN}-modphp = "${PN} apache2"
>> +RDEPENDS_${PN}-opcache = "${PN}"
>> +
>> +INITSCRIPT_PACKAGES = "${PN}-fpm"
>> +inherit update-rc.d
>> +
>> +FILES_${PN}-dbg =+ "${bindir}/.debug \
>> +                    ${libexecdir}/apache2/modules/.debug"
>> +FILES_${PN}-doc += "${PHP_LIBDIR}/php/doc"
>> +FILES_${PN}-cli = "${bindir}/php"
>> +FILES_${PN}-phar = "${bindir}/phar*"
>> +FILES_${PN}-cgi = "${bindir}/php-cgi"
>> +FILES_${PN}-fpm = "${sbindir}/php-fpm ${sysconfdir}/php-fpm.conf ${datadir}/fpm ${sysconfdir}/init.d/php-fpm ${systemd_unitdir}/system/php-fpm.service ${sysconfdir}/php-fpm.d/www.conf.default"
>> +FILES_${PN}-fpm-apache2 = "${sysconfdir}/apache2/conf.d/php-fpm.conf"
>> +CONFFILES_${PN}-fpm = "${sysconfdir}/php-fpm.conf"
>> +CONFFILES_${PN}-fpm-apache2 = "${sysconfdir}/apache2/conf.d/php-fpm.conf"
>> +INITSCRIPT_NAME_${PN}-fpm = "php-fpm"
>> +INITSCRIPT_PARAMS_${PN}-fpm = "defaults 60"
>> +FILES_${PN}-pear = "${bindir}/pear* ${bindir}/pecl ${PHP_LIBDIR}/php/PEAR \
>> +                ${PHP_LIBDIR}/php/PEAR*.php ${PHP_LIBDIR}/php/System.php \
>> +                ${PHP_LIBDIR}/php/peclcmd.php ${PHP_LIBDIR}/php/pearcmd.php \
>> +                ${PHP_LIBDIR}/php/.channels ${PHP_LIBDIR}/php/.channels/.alias \
>> +                ${PHP_LIBDIR}/php/.registry ${PHP_LIBDIR}/php/Archive/Tar.php \
>> +                ${PHP_LIBDIR}/php/Console/Getopt.php ${PHP_LIBDIR}/php/OS/Guess.php \
>> +                ${PHP_LIBDIR}/php/data/PEAR \
>> +                ${sysconfdir}/pear.conf"
>> +FILES_${PN}-dev = "${includedir}/php ${PHP_LIBDIR}/build ${bindir}/phpize \
>> +                ${bindir}/php-config ${PHP_LIBDIR}/php/.depdb \
>> +                ${PHP_LIBDIR}/php/.depdblock ${PHP_LIBDIR}/php/.filemap \
>> +                ${PHP_LIBDIR}/php/.lock ${PHP_LIBDIR}/php/test"
>> +FILES_${PN}-staticdev += "${PHP_LIBDIR}/extensions/*/*.a"
>> +FILES_${PN}-opcache = "${PHP_LIBDIR}/extensions/*/opcache${SOLIBSDEV}"
>> +FILES_${PN} = "${PHP_LIBDIR}/php"
>> +FILES_${PN} += "${bindir} ${libexecdir}/apache2"
>> +
>> +SUMMARY_${PN}-modphp = "PHP module for the Apache HTTP server"
>> +FILES_${PN}-modphp = "${libdir}/apache2 ${sysconfdir}"
>> +
>> +MODPHP_OLDPACKAGE = "${@bb.utils.contains('PACKAGECONFIG', 'apache2', 'modphp', '', d)}"
>> +RPROVIDES_${PN}-modphp = "${MODPHP_OLDPACKAGE}"
>> +RREPLACES_${PN}-modphp = "${MODPHP_OLDPACKAGE}"
>> +RCONFLICTS_${PN}-modphp = "${MODPHP_OLDPACKAGE}"
>> +
>> +do_install_append_class-native() {
>> +    create_wrapper ${D}${bindir}/php \
>> +        PHP_PEAR_SYSCONF_DIR=${sysconfdir}/
>> +}
>> +
>> +
>> +# Fails to build with thumb-1 (qemuarm)
>> +# | {standard input}: Assembler messages:
>> +# | {standard input}:3719: Error: selected processor does not support Thumb mode `smull r0,r2,r9,r3'
>> +# | {standard input}:3720: Error: unshifted register required -- `sub r2,r2,r0,asr#31'
>> +# | {standard input}:3796: Error: selected processor does not support Thumb mode `smull r0,r2,r3,r3'
>> +# | {standard input}:3797: Error: unshifted register required -- `sub r2,r2,r0,asr#31'
>> +# | make: *** [ext/standard/math.lo] Error 1
>> +ARM_INSTRUCTION_SET = "arm"
> do we still need this ?, if needed for thumb1 perhaps we should mark
> it so with _armv5t and _armv4
> overrides so it can be built with thumb2 on newer arches
>
>> --
>> 2.7.4
>>
>>
>>
>> 

--------------55BEE1BCE9E0FF2A39962FC0
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 4/21/20 12:56 AM, Khem Raj wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CAMKF1sphN=C75MML3KT8be&#43;=9sDTMCCZE&#43;RsaJaaktDLZzHr&#43;w@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">On Mon, Apr 20, 2020 at 2:59 AM Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
From: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>

* Add php 7.4, and also keep 7.3 existed.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">

why do we need to keep 7.3 ?</pre>
    </blockquote>
    <p>I keep it since 7.3 and 7.4 have some incompatibility,&nbsp; so maybe
      keep 7.3 to EOF is better ?<br>
    </p>
    <blockquote type="cite" cite="mid:CAMKF1sphN=C75MML3KT8be&#43;=9sDTMCCZE&#43;RsaJaaktDLZzHr&#43;w@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">refer:
<a class="moz-txt-link-freetext" href="https://www.php.net/migration74">https://www.php.net/migration74</a>
<a class="moz-txt-link-freetext" href="https://www.php.net/supported-versions.php">https://www.php.net/supported-versions.php</a>

* note: for 7.4, pear is disabled by default,
and it will be deprecated in future.

Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
---
 ...nfigure.ac-don-t-include-build-libtool.m4.patch |  30 &#43;&#43;&#43;
 .../0001-php.m4-don-t-unset-cache-variables.patch  |  39 &#43;&#43;&#43;
 ...7.4-0001-opcache-config.m4-enable-opcache.patch | 230 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;
 ...01-php-don-t-use-broken-wrapper-for-mkdir.patch |  29 &#43;&#43;&#43;
 .../recipes-devtools/php/php/php7.4-iconv.patch    |  41 &#43;&#43;&#43;&#43;
 .../php/php/php7.4-imap-fix-autofoo.patch          |  41 &#43;&#43;&#43;&#43;
 .../php/php/php7.4-phar-makefile.patch             |  46 &#43;&#43;&#43;&#43;
 .../php/php/php7.4-php_exec_native.patch           |  26 &#43;&#43;
 meta-oe/recipes-devtools/php/php_7.4.4.bb          | 272 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;
 9 files changed, 754 insertions(&#43;)
 create mode 100644 meta-oe/recipes-devtools/php/php/0001-configure.ac-don-t-include-build-libtool.m4.patch
 create mode 100644 meta-oe/recipes-devtools/php/php/0001-php.m4-don-t-unset-cache-variables.patch
 create mode 100644 meta-oe/recipes-devtools/php/php/php7.4-0001-opcache-config.m4-enable-opcache.patch
 create mode 100644 meta-oe/recipes-devtools/php/php/php7.4-0001-php-don-t-use-broken-wrapper-for-mkdir.patch
 create mode 100644 meta-oe/recipes-devtools/php/php/php7.4-iconv.patch
 create mode 100644 meta-oe/recipes-devtools/php/php/php7.4-imap-fix-autofoo.patch
 create mode 100644 meta-oe/recipes-devtools/php/php/php7.4-phar-makefile.patch
 create mode 100644 meta-oe/recipes-devtools/php/php/php7.4-php_exec_native.patch
 create mode 100644 meta-oe/recipes-devtools/php/php_7.4.4.bb

diff --git a/meta-oe/recipes-devtools/php/php/0001-configure.ac-don-t-include-build-libtool.m4.patch b/meta-oe/recipes-devtools/php/php/0001-configure.ac-don-t-include-build-libtool.m4.patch
new file mode 100644
index 0000000..2861366
--- /dev/null
&#43;&#43;&#43; b/meta-oe/recipes-devtools/php/php/0001-configure.ac-don-t-include-build-libtool.m4.patch
@@ -0,0 &#43;1,30 @@
&#43;From f5a34e771532b8433f307b679500c26af328ba35 Mon Sep 17 00:00:00 2001
&#43;From: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
&#43;Date: Fri, 17 Apr 2020 15:01:57 &#43;0800
&#43;Subject: [PATCH] configure.ac: don't include build/libtool.m4
&#43;
&#43;we delete build/libtool.m4 before do_configure,
&#43;we will use libtool.m4 under ACLOCALDIR
&#43;
&#43;Upstream-Status: Inappropriate [oe-specific]
&#43;
&#43;Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
&#43;---
&#43; configure.ac | 1 -
&#43; 1 file changed, 1 deletion(-)
&#43;
&#43;diff --git a/configure.ac b/configure.ac
&#43;index 06c6a27..f85144e 100644
&#43;--- a/configure.ac
&#43;&#43;&#43;&#43; b/configure.ac
&#43;@@ -6,7 &#43;6,6 @@ dnl ----------------------------------------------------------------------------
&#43; m4_include([build/ax_check_compile_flag.m4])
&#43; m4_include([build/ax_func_which_gethostbyname_r.m4])
&#43; m4_include([build/ax_gcc_func_attribute.m4])
&#43;-m4_include([build/libtool.m4])
&#43; m4_include([build/php_cxx_compile_stdcxx.m4])
&#43; m4_include([build/php.m4])
&#43; m4_include([build/pkg.m4])
&#43;--
&#43;2.7.4
&#43;
diff --git a/meta-oe/recipes-devtools/php/php/0001-php.m4-don-t-unset-cache-variables.patch b/meta-oe/recipes-devtools/php/php/0001-php.m4-don-t-unset-cache-variables.patch
new file mode 100644
index 0000000..0d721ec
--- /dev/null
&#43;&#43;&#43; b/meta-oe/recipes-devtools/php/php/0001-php.m4-don-t-unset-cache-variables.patch
@@ -0,0 &#43;1,39 @@
&#43;php.m4: don't unset cache variables
&#43;
&#43;Unsetting prevents cache variable from being passed to configure.
&#43;
&#43;Upstream-Status: Inappropriate [OE-specific]
&#43;
&#43;Signed-off-by: Anuj Mittal <a class="moz-txt-link-rfc2396E" href="mailto:anuj.mittal@intel.com">&lt;anuj.mittal@intel.com&gt;</a>
&#43;
&#43;update this patch to 7.4.4, acinclude.m4 move to build/php.m4
&#43;Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
&#43;---
&#43; build/php.m4 | 4 ----
&#43; 1 file changed, 4 deletions(-)
&#43;
&#43;diff --git a/build/php.m4 b/build/php.m4
&#43;index 5c45d13..218ec47 100644
&#43;--- a/build/php.m4
&#43;&#43;&#43;&#43; b/build/php.m4
&#43;@@ -1587,8 &#43;1587,6 @@ dnl PHP_CHECK_FUNC_LIB
&#43; dnl
&#43; AC_DEFUN([PHP_CHECK_FUNC_LIB],[
&#43;   ifelse($2,,:,[
&#43;-  unset ac_cv_lib_$2[]_$1
&#43;-  unset ac_cv_lib_$2[]___$1
&#43;   unset found
&#43;   AC_CHECK_LIB($2, $1, [found=yes], [
&#43;     AC_CHECK_LIB($2, __$1, [found=yes], [found=no])
&#43;@@ -1620,8 &#43;1618,6 @@ dnl and as a fall back in the specified library. Defines HAVE_func and
&#43; dnl HAVE_library if found and adds the library to LIBS.
&#43; dnl
&#43; AC_DEFUN([PHP_CHECK_FUNC],[
&#43;-  unset ac_cv_func_$1
&#43;-  unset ac_cv_func___$1
&#43;   unset found
&#43;
&#43;   AC_CHECK_FUNC($1, [found=yes],[ AC_CHECK_FUNC(__$1,[found=yes],[found=no]) ])
&#43;--
&#43;2.7.4
&#43;
diff --git a/meta-oe/recipes-devtools/php/php/php7.4-0001-opcache-config.m4-enable-opcache.patch b/meta-oe/recipes-devtools/php/php/php7.4-0001-opcache-config.m4-enable-opcache.patch
new file mode 100644
index 0000000..ee0d5ed
--- /dev/null
&#43;&#43;&#43; b/meta-oe/recipes-devtools/php/php/php7.4-0001-opcache-config.m4-enable-opcache.patch
@@ -0,0 &#43;1,230 @@
&#43;opcache/config.m4: enable opcache
&#43;
&#43;We can't use AC_TRY_RUN to run programs in a cross compile environment.
&#43;Set
&#43;the variables directly instead since we know that we'd be running on
&#43;latest
&#43;enough linux kernel.
&#43;
&#43;Upstream-Status: Inappropriate [Configuration]
&#43;
&#43;Signed-off-by: Anuj Mittal <a class="moz-txt-link-rfc2396E" href="mailto:anuj.mittal@intel.com">&lt;anuj.mittal@intel.com&gt;</a>
&#43;
&#43;update patch to version 7.4.4
&#43;Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
&#43;---
&#43; ext/opcache/config.m4 | 194 &#43;-------------------------------------------------
&#43; 1 file changed, 3 insertions(&#43;), 191 deletions(-)
&#43;
&#43;diff --git a/ext/opcache/config.m4 b/ext/opcache/config.m4
&#43;index 6c40caf..84ddf1e 100644
&#43;--- a/ext/opcache/config.m4
&#43;&#43;&#43;&#43; b/ext/opcache/config.m4
&#43;@@ -23,201 &#43;23,13 @@ if test &quot;$PHP_OPCACHE&quot; != &quot;no&quot;; then
&#43;   AC_CHECK_FUNCS([mprotect])
&#43;
&#43;   AC_MSG_CHECKING(for sysvipc shared memory support)
&#43;-  AC_RUN_IFELSE([AC_LANG_SOURCE([[
&#43;-#include &lt;sys/types.h&gt;
&#43;-#include &lt;sys/wait.h&gt;
&#43;-#include &lt;sys/ipc.h&gt;
&#43;-#include &lt;sys/shm.h&gt;
&#43;-#include &lt;unistd.h&gt;
&#43;-#include &lt;string.h&gt;
&#43;-
&#43;-int main() {
&#43;-  pid_t pid;
&#43;-  int status;
&#43;-  int ipc_id;
&#43;-  char *shm;
&#43;-  struct shmid_ds shmbuf;
&#43;-
&#43;-  ipc_id = shmget(IPC_PRIVATE, 4096, (IPC_CREAT | SHM_R | SHM_W));
&#43;-  if (ipc_id == -1) {
&#43;-    return 1;
&#43;-  }
&#43;-
&#43;-  shm = shmat(ipc_id, NULL, 0);
&#43;-  if (shm == (void *)-1) {
&#43;-    shmctl(ipc_id, IPC_RMID, NULL);
&#43;-    return 2;
&#43;-  }
&#43;-
&#43;-  if (shmctl(ipc_id, IPC_STAT, &amp;shmbuf) != 0) {
&#43;-    shmdt(shm);
&#43;-    shmctl(ipc_id, IPC_RMID, NULL);
&#43;-    return 3;
&#43;-  }
&#43;-
&#43;-  shmbuf.shm_perm.uid = getuid();
&#43;-  shmbuf.shm_perm.gid = getgid();
&#43;-  shmbuf.shm_perm.mode = 0600;
&#43;-
&#43;-  if (shmctl(ipc_id, IPC_SET, &amp;shmbuf) != 0) {
&#43;-    shmdt(shm);
&#43;-    shmctl(ipc_id, IPC_RMID, NULL);
&#43;-    return 4;
&#43;-  }
&#43;-
&#43;-  shmctl(ipc_id, IPC_RMID, NULL);
&#43;-
&#43;-  strcpy(shm, &quot;hello&quot;);
&#43;-
&#43;-  pid = fork();
&#43;-  if (pid &lt; 0) {
&#43;-    return 5;
&#43;-  } else if (pid == 0) {
&#43;-    strcpy(shm, &quot;bye&quot;);
&#43;-    return 6;
&#43;-  }
&#43;-  if (wait(&amp;status) != pid) {
&#43;-    return 7;
&#43;-  }
&#43;-  if (!WIFEXITED(status) || WEXITSTATUS(status) != 6) {
&#43;-    return 8;
&#43;-  }
&#43;-  if (strcmp(shm, &quot;bye&quot;) != 0) {
&#43;-    return 9;
&#43;-  }
&#43;-  return 0;
&#43;-}
&#43;-]])],[dnl
&#43;-    AC_DEFINE(HAVE_SHM_IPC, 1, [Define if you have SysV IPC SHM support])
&#43;-    msg=yes],[msg=no],[msg=no])
&#43;-  AC_MSG_RESULT([$msg])
&#43;&#43;  AC_DEFINE(HAVE_SHM_IPC, 1, [Define if you have SysV IPC SHM support])
&#43;
&#43;   AC_MSG_CHECKING(for mmap() using MAP_ANON shared memory support)
&#43;-  AC_RUN_IFELSE([AC_LANG_SOURCE([[
&#43;-#include &lt;sys/types.h&gt;
&#43;-#include &lt;sys/wait.h&gt;
&#43;-#include &lt;sys/mman.h&gt;
&#43;-#include &lt;unistd.h&gt;
&#43;-#include &lt;string.h&gt;
&#43;-
&#43;-#ifndef MAP_ANON
&#43;-# ifdef MAP_ANONYMOUS
&#43;-#  define MAP_ANON MAP_ANONYMOUS
&#43;-# endif
&#43;-#endif
&#43;-#ifndef MAP_FAILED
&#43;-# define MAP_FAILED ((void*)-1)
&#43;-#endif
&#43;&#43;  AC_DEFINE(HAVE_SHM_MMAP_ANON, 1, [Define if you have mmap(MAP_ANON) SHM support])
&#43;
&#43;-int main() {
&#43;-  pid_t pid;
&#43;-  int status;
&#43;-  char *shm;
&#43;-
&#43;-  shm = mmap(NULL, 4096, PROT_READ | PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
&#43;-  if (shm == MAP_FAILED) {
&#43;-    return 1;
&#43;-  }
&#43;-
&#43;-  strcpy(shm, &quot;hello&quot;);
&#43;-
&#43;-  pid = fork();
&#43;-  if (pid &lt; 0) {
&#43;-    return 5;
&#43;-  } else if (pid == 0) {
&#43;-    strcpy(shm, &quot;bye&quot;);
&#43;-    return 6;
&#43;-  }
&#43;-  if (wait(&amp;status) != pid) {
&#43;-    return 7;
&#43;-  }
&#43;-  if (!WIFEXITED(status) || WEXITSTATUS(status) != 6) {
&#43;-    return 8;
&#43;-  }
&#43;-  if (strcmp(shm, &quot;bye&quot;) != 0) {
&#43;-    return 9;
&#43;-  }
&#43;-  return 0;
&#43;-}
&#43;-]])],[dnl
&#43;-    AC_DEFINE(HAVE_SHM_MMAP_ANON, 1, [Define if you have mmap(MAP_ANON) SHM support])
&#43;-    msg=yes],[msg=no],[msg=no])
&#43;-  AC_MSG_RESULT([$msg])
&#43;-
&#43;-  PHP_CHECK_FUNC_LIB(shm_open, rt)
&#43;   AC_MSG_CHECKING(for mmap() using shm_open() shared memory support)
&#43;-  AC_RUN_IFELSE([AC_LANG_SOURCE([[
&#43;-#include &lt;sys/types.h&gt;
&#43;-#include &lt;sys/wait.h&gt;
&#43;-#include &lt;sys/mman.h&gt;
&#43;-#include &lt;sys/stat.h&gt;
&#43;-#include &lt;fcntl.h&gt;
&#43;-#include &lt;unistd.h&gt;
&#43;-#include &lt;string.h&gt;
&#43;-#include &lt;stdlib.h&gt;
&#43;-#include &lt;stdio.h&gt;
&#43;-
&#43;-#ifndef MAP_FAILED
&#43;-# define MAP_FAILED ((void*)-1)
&#43;-#endif
&#43;-
&#43;-int main() {
&#43;-  pid_t pid;
&#43;-  int status;
&#43;-  int fd;
&#43;-  char *shm;
&#43;-  char tmpname[4096];
&#43;-
&#43;-  sprintf(tmpname,&quot;/opcache.test.shm.%dXXXXXX&quot;, getpid());
&#43;-  if (mktemp(tmpname) == NULL) {
&#43;-    return 1;
&#43;-  }
&#43;-  fd = shm_open(tmpname, O_RDWR | O_CREAT, S_IRUSR | S_IWUSR);
&#43;-  if (fd == -1) {
&#43;-    return 2;
&#43;-  }
&#43;-  if (ftruncate(fd, 4096) &lt; 0) {
&#43;-    close(fd);
&#43;-    shm_unlink(tmpname);
&#43;-    return 3;
&#43;-  }
&#43;-
&#43;-  shm = mmap(NULL, 4096, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
&#43;-  if (shm == MAP_FAILED) {
&#43;-    return 4;
&#43;-  }
&#43;-  shm_unlink(tmpname);
&#43;-  close(fd);
&#43;-
&#43;-  strcpy(shm, &quot;hello&quot;);
&#43;-
&#43;-  pid = fork();
&#43;-  if (pid &lt; 0) {
&#43;-    return 5;
&#43;-  } else if (pid == 0) {
&#43;-    strcpy(shm, &quot;bye&quot;);
&#43;-    return 6;
&#43;-  }
&#43;-  if (wait(&amp;status) != pid) {
&#43;-    return 7;
&#43;-  }
&#43;-  if (!WIFEXITED(status) || WEXITSTATUS(status) != 6) {
&#43;-    return 8;
&#43;-  }
&#43;-  if (strcmp(shm, &quot;bye&quot;) != 0) {
&#43;-    return 9;
&#43;-  }
&#43;-  return 0;
&#43;-}
&#43;-]])],[dnl
&#43;-    AC_DEFINE(HAVE_SHM_MMAP_POSIX, 1, [Define if you have POSIX mmap() SHM support])
&#43;-    AC_MSG_RESULT([yes])
&#43;-    PHP_CHECK_LIBRARY(rt, shm_unlink, [PHP_ADD_LIBRARY(rt,1,OPCACHE_SHARED_LIBADD)])
&#43;-  ],[
&#43;-    AC_MSG_RESULT([no])
&#43;-  ],[
&#43;-    AC_MSG_RESULT([no])
&#43;-  ])
&#43;&#43;  AC_DEFINE(HAVE_SHM_MMAP_POSIX, 1, [Define if you have POSIX mmap() SHM support])
&#43;
&#43;   PHP_NEW_EXTENSION(opcache,
&#43;       ZendAccelerator.c \
&#43;--
&#43;2.7.4
&#43;
diff --git a/meta-oe/recipes-devtools/php/php/php7.4-0001-php-don-t-use-broken-wrapper-for-mkdir.patch b/meta-oe/recipes-devtools/php/php/php7.4-0001-php-don-t-use-broken-wrapper-for-mkdir.patch
new file mode 100644
index 0000000..d687373
--- /dev/null
&#43;&#43;&#43; b/meta-oe/recipes-devtools/php/php/php7.4-0001-php-don-t-use-broken-wrapper-for-mkdir.patch
@@ -0,0 &#43;1,29 @@
&#43;From ebc101e0728b9db6c687cff525e5dfc8eb0edbf3 Mon Sep 17 00:00:00 2001
&#43;From: Koen Kooi <a class="moz-txt-link-rfc2396E" href="mailto:koen@dominion.thruhere.net">&lt;koen@dominion.thruhere.net&gt;</a>
&#43;Date: Thu, 3 Nov 2011 14:27:15 &#43;0100
&#43;Subject: [PATCH 2/8] php: don't use broken wrapper for mkdir
&#43;
&#43;Signed-off-by: Koen Kooi <a class="moz-txt-link-rfc2396E" href="mailto:koen@dominion.thruhere.net">&lt;koen@dominion.thruhere.net&gt;</a>
&#43;
&#43;update patch to version 7.4.4
&#43;Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
&#43;---
&#43;
&#43;Upstream-Status: Inappropriate
&#43;
&#43; build/Makefile.global | 2 &#43;-
&#43; 1 file changed, 1 insertion(&#43;), 1 deletion(-)
&#43;
&#43;diff --git a/build/Makefile.global b/build/Makefile.global
&#43;index ff858c2..ae554b4 100644
&#43;--- a/build/Makefile.global
&#43;&#43;&#43;&#43; b/build/Makefile.global
&#43;@@ -1,4 &#43;1,4 @@
&#43;-mkinstalldirs = $(top_srcdir)/build/shtool mkdir -p
&#43;&#43;mkinstalldirs = mkdir -p
&#43; INSTALL = $(top_srcdir)/build/shtool install -c
&#43; INSTALL_DATA = $(INSTALL) -m 644
&#43;
&#43;--
&#43;1.9.3
&#43;
diff --git a/meta-oe/recipes-devtools/php/php/php7.4-iconv.patch b/meta-oe/recipes-devtools/php/php/php7.4-iconv.patch
new file mode 100644
index 0000000..9ec8a89
--- /dev/null
&#43;&#43;&#43; b/meta-oe/recipes-devtools/php/php/php7.4-iconv.patch
@@ -0,0 &#43;1,41 @@
&#43;Subject: [PATCH] From 17cc5645f3acf943a5a06465d09d0ebcfea987bd Mon Sep 17
&#43; 00:00:00 2001 From: Koen Kooi <a class="moz-txt-link-rfc2396E" href="mailto:koen@dominion.thruhere.net">&lt;koen@dominion.thruhere.net&gt;</a> Date: Wed, 2 Nov
&#43; 2011 16:54:57 &#43;0100 Subject: [PATCH] Upstream-Status: Pending
&#43;
&#43;update patch to version 7.4.4
&#43;Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
&#43;---
&#43; build/php.m4        | 3 &#43;&#43;-
&#43; ext/iconv/config.m4 | 2 &#43;-
&#43; 2 files changed, 3 insertions(&#43;), 2 deletions(-)
&#43;
&#43;diff --git a/build/php.m4 b/build/php.m4
&#43;index 7392876..5c45d13 100644
&#43;--- a/build/php.m4
&#43;&#43;&#43;&#43; b/build/php.m4
&#43;@@ -1950,7 &#43;1950,8 @@ AC_DEFUN([PHP_SETUP_ICONV], [
&#43;   echo &gt; ext/iconv/php_iconv_supports_errno.h
&#43;
&#43;   dnl Check libc first if no path is provided in --with-iconv.
&#43;-  if test &quot;$PHP_ICONV&quot; = &quot;yes&quot;; then
&#43;&#43;  dnl must check against no, not against yes as PHP_ICONV can also include a path, which implies yes
&#43;&#43;  if test &quot;$PHP_ICONV&quot; != &quot;no&quot;; then
&#43;     dnl Reset LIBS temporarily as it may have already been included -liconv in.
&#43;     LIBS_save=&quot;$LIBS&quot;
&#43;     LIBS=
&#43;diff --git a/ext/iconv/config.m4 b/ext/iconv/config.m4
&#43;index fe9b47a..b6b632f 100644
&#43;--- a/ext/iconv/config.m4
&#43;&#43;&#43;&#43; b/ext/iconv/config.m4
&#43;@@ -14,7 &#43;14,7 @@ if test &quot;$PHP_ICONV&quot; != &quot;no&quot;; then
&#43;
&#43;   if test &quot;$iconv_avail&quot; != &quot;no&quot;; then
&#43;     if test -z &quot;$ICONV_DIR&quot;; then
&#43;-      for i in /usr/local /usr; do
&#43;&#43;      for i in $PHP_ICONV /usr/local /usr; do
&#43;         if test -f &quot;$i/include/iconv.h&quot; || test -f &quot;$i/include/giconv.h&quot;; then
&#43;           PHP_ICONV_PREFIX=&quot;$i&quot;
&#43;           break
&#43;--
&#43;2.7.4
&#43;
diff --git a/meta-oe/recipes-devtools/php/php/php7.4-imap-fix-autofoo.patch b/meta-oe/recipes-devtools/php/php/php7.4-imap-fix-autofoo.patch
new file mode 100644
index 0000000..ebe5f6a
--- /dev/null
&#43;&#43;&#43; b/meta-oe/recipes-devtools/php/php/php7.4-imap-fix-autofoo.patch
@@ -0,0 &#43;1,41 @@
&#43;Subject: [PATCH] From c084c8349d1780980e232cb28b60a109e3d89438 Mon Sep 17
&#43; 00:00:00 2001 From: Koen Kooi <a class="moz-txt-link-rfc2396E" href="mailto:koen@dominion.thruhere.net">&lt;koen@dominion.thruhere.net&gt;</a> Date: Wed, 2 Nov
&#43; 2011 16:54:57 &#43;0100 Subject: [PATCH] Upstream-Status: Pending
&#43;
&#43;update patch to version 7.4.4
&#43;Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
&#43;---
&#43; ext/imap/config.m4 | 10 &#43;&#43;--------
&#43; 1 file changed, 2 insertions(&#43;), 8 deletions(-)
&#43;
&#43;diff --git a/ext/imap/config.m4 b/ext/imap/config.m4
&#43;index 5086a31..0e938bd 100644
&#43;--- a/ext/imap/config.m4
&#43;&#43;&#43;&#43; b/ext/imap/config.m4
&#43;@@ -110,7 &#43;110,7 @@ if test &quot;$PHP_IMAP&quot; != &quot;no&quot;; then
&#43;     PHP_NEW_EXTENSION(imap, php_imap.c, $ext_shared,, -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1)
&#43;     AC_DEFINE(HAVE_IMAP,1,[ ])
&#43;
&#43;-    for i in $PHP_IMAP /usr/local /usr; do
&#43;&#43;    for i in $PHP_IMAP $PHP_IMAP/usr /usr/local /usr; do
&#43;       IMAP_INC_CHK()
&#43;       el[]IMAP_INC_CHK(/include/c-client)
&#43;       el[]IMAP_INC_CHK(/include/imap)
&#43;@@ -199,13 &#43;199,7 @@ if test &quot;$PHP_IMAP&quot; != &quot;no&quot;; then
&#43;       AC_MSG_ERROR(Cannot find rfc822.h. Please check your c-client installation.)
&#43;     fi
&#43;
&#43;-    if test ! -r &quot;$IMAP_DIR/c-client/libc-client.a&quot; &amp;&amp; test -r &quot;$IMAP_DIR/c-client/c-client.a&quot; ; then
&#43;-      ln -s &quot;$IMAP_DIR/c-client/c-client.a&quot; &quot;$IMAP_DIR/c-client/libc-client.a&quot; &gt;/dev/null 2&gt;&amp;1
&#43;-    elif test ! -r &quot;$IMAP_DIR/$PHP_LIBDIR/libc-client.a&quot; &amp;&amp; test -r &quot;$IMAP_DIR/$PHP_LIBDIR/c-client.a&quot;; then
&#43;-      ln -s &quot;$IMAP_DIR/$PHP_LIBDIR/c-client.a&quot; &quot;$IMAP_DIR/$PHP_LIBDIR/libc-client.a&quot; &gt;/dev/null 2&gt;&amp;1
&#43;-    fi
&#43;-
&#43;-    for lib in c-client4 c-client imap; do
&#43;&#43;    for lib in /usr/lib c-client4 c-client imap; do
&#43;       IMAP_LIB=$lib
&#43;       IMAP_LIB_CHK($PHP_LIBDIR)
&#43;       IMAP_LIB_CHK(c-client)
&#43;--
&#43;2.7.4
&#43;
diff --git a/meta-oe/recipes-devtools/php/php/php7.4-phar-makefile.patch b/meta-oe/recipes-devtools/php/php/php7.4-phar-makefile.patch
new file mode 100644
index 0000000..eb73bc4
--- /dev/null
&#43;&#43;&#43; b/meta-oe/recipes-devtools/php/php/php7.4-phar-makefile.patch
@@ -0,0 &#43;1,46 @@
&#43;Subject: [PATCH] From 08962a56f69963e01892d98ca5b75de8354bd3f5 Mon Sep 17
&#43; 00:00:00 2001 From: Koen Kooi <a class="moz-txt-link-rfc2396E" href="mailto:koen@dominion.thruhere.net">&lt;koen@dominion.thruhere.net&gt;</a> Date: Wed, 2 Nov
&#43; 2011 16:54:57 &#43;0100 Subject: [PATCH] Fix phar packaging
&#43;
&#43;Inherited from OE-Classic, with some additions to fix host paths leaking
&#43;into the target package.
&#43;
&#43;Upstream-Status: Inappropriate [config]
&#43;
&#43;update patch to version 7.4.4
&#43;Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
&#43;---
&#43; ext/phar/Makefile.frag | 17 &#43;&#43;&#43;--------------
&#43; 1 file changed, 3 insertions(&#43;), 14 deletions(-)
&#43;
&#43;diff --git a/ext/phar/Makefile.frag b/ext/phar/Makefile.frag
&#43;index 6442f33..6145412 100644
&#43;--- a/ext/phar/Makefile.frag
&#43;&#43;&#43;&#43; b/ext/phar/Makefile.frag
&#43;@@ -10,20 &#43;10,9 @@ pharcmd: $(builddir)/phar.php $(builddir)/phar.phar
&#43;
&#43; PHP_PHARCMD_SETTINGS = -n -d 'open_basedir=' -d 'output_buffering=0' -d 'memory_limit=-1' -d phar.readonly=0
&#43; PHP_PHARCMD_EXECUTABLE = ` \
&#43;-      if test -x &quot;$(top_builddir)/$(SAPI_CLI_PATH)&quot;; then \
&#43;-              $(top_srcdir)/build/shtool echo -n -- &quot;$(top_builddir)/$(SAPI_CLI_PATH) -n&quot;; \
&#43;-              if test &quot;x$(PHP_MODULES)&quot; != &quot;x&quot;; then \
&#43;-              $(top_srcdir)/build/shtool echo -n -- &quot; -d extension_dir=$(top_builddir)/modules&quot;; \
&#43;-              for i in bz2 zlib phar; do \
&#43;-                      if test -f &quot;$(top_builddir)/modules/$$i.la&quot;; then \
&#43;-                              . $(top_builddir)/modules/$$i.la; $(top_srcdir)/build/shtool echo -n -- &quot; -d extension=$$dlname&quot;; \
&#43;-                      fi; \
&#43;-              done; \
&#43;-              fi; \
&#43;-      else \
&#43;-              $(top_srcdir)/build/shtool echo -n -- &quot;$(PHP_EXECUTABLE)&quot;; \
&#43;-      fi;`
&#43;-PHP_PHARCMD_BANG = `$(top_srcdir)/build/shtool echo -n -- &quot;$(INSTALL_ROOT)$(bindir)/$(program_prefix)php$(program_suffix)$(EXEEXT)&quot;;`
&#43;&#43;               $(top_srcdir)/build/shtool echo -n -- &quot;$(PHP_EXECUTABLE)&quot;; `
&#43;&#43;
&#43;&#43;PHP_PHARCMD_BANG = `$(top_srcdir)/build/shtool echo -n -- &quot;$(bindir)/$(program_prefix)php$(program_suffix)$(EXEEXT)&quot;;`
&#43;
&#43; $(builddir)/phar/phar.inc: $(srcdir)/phar/phar.inc
&#43;       -@test -d $(builddir)/phar || mkdir $(builddir)/phar
&#43;--
&#43;2.7.4
&#43;
diff --git a/meta-oe/recipes-devtools/php/php/php7.4-php_exec_native.patch b/meta-oe/recipes-devtools/php/php/php7.4-php_exec_native.patch
new file mode 100644
index 0000000..4aec481
--- /dev/null
&#43;&#43;&#43; b/meta-oe/recipes-devtools/php/php/php7.4-php_exec_native.patch
@@ -0,0 &#43;1,26 @@
&#43;Subject: [PATCH] rom d251b5aa3d23803d016ca16818e2e1d2f2b70a02 Mon Sep 17
&#43; 00:00:00 2001 From: Koen Kooi <a class="moz-txt-link-rfc2396E" href="mailto:koen@dominion.thruhere.net">&lt;koen@dominion.thruhere.net&gt;</a> Date: Wed, 2 Nov
&#43; 2011 16:54:57 &#43;0100 Subject: [PATCH] Upstream-Status: Inappriate
&#43;
&#43;update patch to version 7.4.4
&#43;Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
&#43;---
&#43; sapi/cli/config.m4 | 2 &#43;-
&#43; 1 file changed, 1 insertion(&#43;), 1 deletion(-)
&#43;
&#43;diff --git a/sapi/cli/config.m4 b/sapi/cli/config.m4
&#43;index 917d45f..aaf1e27 100644
&#43;--- a/sapi/cli/config.m4
&#43;&#43;&#43;&#43; b/sapi/cli/config.m4
&#43;@@ -47,7 &#43;47,7 @@ if test &quot;$PHP_CLI&quot; != &quot;no&quot;; then
&#43;   esac
&#43;
&#43;   dnl Set executable for tests.
&#43;-  PHP_EXECUTABLE=&quot;\$(top_builddir)/\$(SAPI_CLI_PATH)&quot;
&#43;&#43;  PHP_EXECUTABLE=&quot;${PHP_NATIVE_DIR}/php&quot;
&#43;   PHP_SUBST(PHP_EXECUTABLE)
&#43;
&#43;   dnl Expose to Makefile.
&#43;--
&#43;2.7.4
&#43;
diff --git a/meta-oe/recipes-devtools/php/php_7.4.4.bb b/meta-oe/recipes-devtools/php/php_7.4.4.bb
new file mode 100644
index 0000000..1f64172
--- /dev/null
&#43;&#43;&#43; b/meta-oe/recipes-devtools/php/php_7.4.4.bb
@@ -0,0 &#43;1,272 @@
&#43;SUMMARY = &quot;A server-side, HTML-embedded scripting language&quot;
&#43;HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://www.php.net">&quot;http://www.php.net&quot;</a>
&#43;SECTION = &quot;console/network&quot;
&#43;
&#43;LICENSE = &quot;PHP-3.0&quot;
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=7e571b888d585b31f9ef5edcc647fa30">&quot;file://LICENSE;md5=7e571b888d585b31f9ef5edcc647fa30&quot;</a>
&#43;
&#43;BBCLASSEXTEND = &quot;native&quot;
&#43;DEPENDS = &quot;zlib bzip2 libxml2 virtual/libiconv php-native lemon-native&quot;
&#43;DEPENDS_class-native = &quot;zlib-native libxml2-native&quot;
&#43;
&#43;PHP_MAJOR_VERSION = <a class="moz-txt-link-rfc2396E" href="mailto:${@d.getVar('PV').split('.')[0]}">&quot;${@d.getVar('PV').split('.')[0]}&quot;</a>
&#43;
&#43;SRC_URI = <a class="moz-txt-link-rfc2396E" href="http://php.net/distributions/php-${PV}.tar.bz2\&#43;file://debian-php-fixheader.patch\&#43;file://0001-configure.ac-don-t-include-build-libtool.m4.patch\&#43;file://php7.4-0001-php-don-t-use-broken-wrapper-for-mkdir.patch\&#43;file://0001-php.m4-don-t-unset-cache-variables.patch\&#43;">&quot;http://php.net/distributions/php-${PV}.tar.bz2 \
&#43;           file://debian-php-fixheader.patch \
&#43;           file://0001-configure.ac-don-t-include-build-libtool.m4.patch \
&#43;           file://php7.4-0001-php-don-t-use-broken-wrapper-for-mkdir.patch \
&#43;           file://0001-php.m4-don-t-unset-cache-variables.patch \
&#43;          &quot;</a>
&#43;
&#43;SRC_URI_append_class-target = &quot; \
&#43;            <a class="moz-txt-link-freetext" href="file://php7.4-imap-fix-autofoo.patch">file://php7.4-imap-fix-autofoo.patch</a> \
&#43;            <a class="moz-txt-link-freetext" href="file://php7.4-php_exec_native.patch">file://php7.4-php_exec_native.patch</a> \
&#43;            <a class="moz-txt-link-freetext" href="file://php-fpm.conf">file://php-fpm.conf</a> \
&#43;            <a class="moz-txt-link-freetext" href="file://php-fpm-apache.conf">file://php-fpm-apache.conf</a> \
&#43;            <a class="moz-txt-link-freetext" href="file://70_mod_php$">file://70_mod_php$</a>{PHP_MAJOR_VERSION}.conf \
&#43;            <a class="moz-txt-link-freetext" href="file://php-fpm.service">file://php-fpm.service</a> \
&#43;            <a class="moz-txt-link-freetext" href="file://pear-makefile.patch">file://pear-makefile.patch</a> \
&#43;            <a class="moz-txt-link-freetext" href="file://php7.4-phar-makefile.patch">file://php7.4-phar-makefile.patch</a> \
&#43;            <a class="moz-txt-link-freetext" href="file://php7.4-0001-opcache-config.m4-enable-opcache.patch">file://php7.4-0001-opcache-config.m4-enable-opcache.patch</a> \
&#43;            <a class="moz-txt-link-freetext" href="file://xfail_two_bug_tests.patch">file://xfail_two_bug_tests.patch</a> \
&#43;            <a class="moz-txt-link-freetext" href="file://php7.4-iconv.patch">file://php7.4-iconv.patch</a> \
&#43;          &quot;
&#43;S = &quot;${WORKDIR}/php-${PV}&quot;
&#43;SRC_URI[md5sum] = &quot;262c258a3b8b5699fcca89a64e58758c&quot;
&#43;SRC_URI[sha256sum] = &quot;308e8f4182ec8a2767b0b1b8e1e7c69fb149b37cfb98ee4a37475e082fa9829f&quot;
&#43;
&#43;inherit autotools pkgconfig python3native gettext
&#43;
&#43;# phpize is not scanned for absolute paths by default (but php-config is).
&#43;#
&#43;SSTATE_SCAN_FILES &#43;= &quot;phpize&quot;
&#43;SSTATE_SCAN_FILES &#43;= &quot;build-defs.h&quot;
&#43;
&#43;PHP_LIBDIR = &quot;${libdir}/php${PHP_MAJOR_VERSION}&quot;
&#43;
&#43;
&#43;# Common EXTRA_OECONF
&#43;COMMON_EXTRA_OECONF = &quot;--enable-sockets \
&#43;                       --enable-pcntl \
&#43;                       --enable-shared \
&#43;                       --disable-rpath \
&#43;                       --with-pic \
&#43;                       --libdir=${PHP_LIBDIR} \
&#43;&quot;
&#43;EXTRA_OECONF = &quot;--enable-mbstring \
&#43;                --enable-fpm \
&#43;                --with-libdir=${baselib} \
&#43;                --with-gettext=${STAGING_LIBDIR}/.. \
&#43;                --with-zlib=${STAGING_LIBDIR}/.. \
&#43;                --with-iconv=${STAGING_LIBDIR}/.. \
&#43;                --with-bz2=${STAGING_DIR_TARGET}${exec_prefix} \
&#43;                --with-config-file-path=${sysconfdir}/php/apache2-php${PHP_MAJOR_VERSION} \
&#43;                ${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'le', 'ac_cv_c_bigendian_php=no', 'ac_cv_c_bigendian_php=yes', d)} \
&#43;                ${@bb.utils.contains('PACKAGECONFIG', 'pam', '', 'ac_cv_lib_pam_pam_start=no', d)} \
&#43;                ${COMMON_EXTRA_OECONF} \
&#43;&quot;
&#43;
&#43;EXTRA_OECONF_append_riscv64 = &quot; --with-pcre-jit=no&quot;
&#43;EXTRA_OECONF_append_riscv32 = &quot; --with-pcre-jit=no&quot;
&#43;
&#43;CACHED_CONFIGUREVARS &#43;= &quot;ac_cv_func_dlopen=no ac_cv_lib_dl_dlopen=yes&quot;
&#43;
&#43;EXTRA_OECONF_class-native = &quot; \
&#43;                --with-zlib=${STAGING_LIBDIR_NATIVE}/.. \
&#43;                --without-iconv \
&#43;                ${COMMON_EXTRA_OECONF} \
&#43;&quot;
&#43;
&#43;PACKAGECONFIG ??= &quot;mysql sqlite3 imap opcache openssl \
&#43;                   ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6 pam', d)} \
&#43;&quot;
&#43;PACKAGECONFIG_class-native = &quot;&quot;
&#43;
&#43;PACKAGECONFIG[zip] = &quot;--enable-zip --with-libzip=${STAGING_EXECPREFIXDIR},,libzip&quot;
&#43;
&#43;PACKAGECONFIG[mysql] = &quot;--with-mysqli=mysqlnd \
&#43;                        --with-pdo-mysql=mysqlnd \
&#43;                        ,--without-mysqli --without-pdo-mysql \
&#43;                        ,mysql5&quot;
&#43;
&#43;PACKAGECONFIG[sqlite3] = &quot;--with-sqlite3=${STAGING_LIBDIR}/.. \
&#43;                          --with-pdo-sqlite=${STAGING_LIBDIR}/.. \
&#43;                          ,--without-sqlite3 --without-pdo-sqlite \
&#43;                          ,sqlite3&quot;
&#43;PACKAGECONFIG[pgsql] = &quot;--with-pgsql=${STAGING_DIR_TARGET}${exec_prefix},--without-pgsql,postgresql&quot;
&#43;PACKAGECONFIG[soap] = &quot;--enable-libxml --enable-soap, --disable-soap, libxml2&quot;
&#43;PACKAGECONFIG[apache2] = &quot;--with-apxs2=${STAGING_BINDIR_CROSS}/apxs,,apache2-native apache2&quot;
&#43;PACKAGECONFIG[pam] = &quot;,,libpam&quot;
&#43;PACKAGECONFIG[imap] = &quot;--with-imap=${STAGING_DIR_HOST} \
&#43;                       --with-imap-ssl=${STAGING_DIR_HOST} \
&#43;                       ,--without-imap --without-imap-ssl \
&#43;                       ,uw-imap&quot;
&#43;PACKAGECONFIG[ipv6] = &quot;--enable-ipv6,--disable-ipv6,&quot;
&#43;PACKAGECONFIG[opcache] = &quot;--enable-opcache,--disable-opcache&quot;
&#43;PACKAGECONFIG[openssl] = &quot;--with-openssl,--without-openssl,openssl&quot;
&#43;PACKAGECONFIG[valgrind] = &quot;--with-valgrind=${STAGING_DIR_TARGET}/usr,--with-valgrind=no,valgrind&quot;
&#43;PACKAGECONFIG[mbregex] = &quot;--enable-mbregex, --disable-mbregex, oniguruma&quot;
&#43;
&#43;export PHP_NATIVE_DIR = &quot;${STAGING_BINDIR_NATIVE}&quot;
&#43;export PHP_PEAR_PHP_BIN = &quot;${STAGING_BINDIR_NATIVE}/php&quot;
&#43;CFLAGS &#43;= &quot; -D_GNU_SOURCE -g -DPTYS_ARE_GETPT -DPTYS_ARE_SEARCHED -I${STAGING_INCDIR}/apache2&quot;
&#43;
&#43;EXTRA_OEMAKE = &quot;INSTALL_ROOT=${D}&quot;
&#43;
&#43;acpaths = &quot;&quot;
&#43;
&#43;do_configure_prepend () {
&#43;    #rm -f ${S}/build/libtool.m4 ${S}/ltmain.sh ${S}/aclocal.m4
&#43;    rm -f ${S}/ltmain.sh ${S}/aclocal.m4
&#43;    sed -i -e 's;build/libtool.m4;${ACLOCALDIR}/libtool.m4;g' ${S}/configure.ac
&#43;    find ${S} -name config.m4 | xargs -n1 sed -i 's!APXS_HTTPD=.*!APXS_HTTPD=${STAGING_SBINDIR_NATIVE}/httpd!'
&#43;}
&#43;
&#43;do_configure_append() {
&#43;    # No, libtool, we really don't want rpath set...
&#43;    sed -i 's|^hardcode_libdir_flag_spec=.*|hardcode_libdir_flag_spec=&quot;&quot;|g' ${HOST_SYS}-libtool
&#43;    sed -i 's|^runpath_var=LD_RUN_PATH|runpath_var=DIE_RPATH_DIE|g' ${HOST_SYS}-libtool
&#43;}
&#43;
&#43;do_install_append_class-native() {
&#43;    rm -rf ${D}/${PHP_LIBDIR}/php/.registry
&#43;    rm -rf ${D}/${PHP_LIBDIR}/php/.channels
&#43;    rm -rf ${D}/${PHP_LIBDIR}/php/.[a-z]*
&#43;}
&#43;
&#43;do_install_prepend() {
&#43;    cat ${ACLOCALDIR}/libtool.m4 ${ACLOCALDIR}/lt~obsolete.m4 ${ACLOCALDIR}/ltoptions.m4 \
&#43;        ${ACLOCALDIR}/ltsugar.m4 ${ACLOCALDIR}/ltversion.m4 &gt; ${S}/build/libtool.m4
&#43;}
&#43;
&#43;do_install_prepend_class-target() {
&#43;    if ${@bb.utils.contains('PACKAGECONFIG', 'apache2', 'true', 'false', d)}; then
&#43;        # Install dummy config file so apxs doesn't fail
&#43;        install -d ${D}${sysconfdir}/apache2
&#43;        printf &quot;\nLoadModule dummy_module modules/mod_dummy.so\n&quot; &gt; ${D}${sysconfdir}/apache2/httpd.conf
&#43;    fi
&#43;}
&#43;
&#43;# fixme
&#43;do_install_append_class-target() {
&#43;    install -d ${D}${sysconfdir}/
&#43;    rm -rf ${D}/${TMPDIR}
&#43;    rm -rf ${D}/.registry
&#43;    rm -rf ${D}/.channels
&#43;    rm -rf ${D}/.[a-z]*
&#43;    rm -rf ${D}/var
&#43;    rm -f  ${D}/${sysconfdir}/php-fpm.conf.default
&#43;    install -m 0644 ${WORKDIR}/php-fpm.conf ${D}/${sysconfdir}/php-fpm.conf
&#43;    install -d ${D}/${sysconfdir}/apache2/conf.d
&#43;    install -m 0644 ${WORKDIR}/php-fpm-apache.conf ${D}/${sysconfdir}/apache2/conf.d/php-fpm.conf
&#43;    install -d ${D}${sysconfdir}/init.d
&#43;    sed -i 's:=/usr/sbin:=${sbindir}:g' ${B}/sapi/fpm/init.d.php-fpm
&#43;    sed -i 's:=/etc:=${sysconfdir}:g' ${B}/sapi/fpm/init.d.php-fpm
&#43;    sed -i 's:=/var:=${localstatedir}:g' ${B}/sapi/fpm/init.d.php-fpm
&#43;    install -m 0755 ${B}/sapi/fpm/init.d.php-fpm ${D}${sysconfdir}/init.d/php-fpm
&#43;    install -m 0644 ${WORKDIR}/php-fpm-apache.conf ${D}/${sysconfdir}/apache2/conf.d/php-fpm.conf
&#43;
&#43;    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)};then
&#43;        install -d ${D}${systemd_unitdir}/system
&#43;        install -m 0644 ${WORKDIR}/php-fpm.service ${D}${systemd_unitdir}/system/
&#43;        sed -i -e 's,@SYSCONFDIR@,${sysconfdir},g' \
&#43;            -e 's,@LOCALSTATEDIR@,${localstatedir},g' \
&#43;            ${D}${systemd_unitdir}/system/php-fpm.service
&#43;    fi
&#43;
&#43;    TMP=`dirname ${D}/${TMPDIR}`
&#43;    while test ${TMP} != ${D}; do
&#43;        if [ -d ${TMP} ]; then
&#43;            rmdir ${TMP}
&#43;        fi
&#43;        TMP=`dirname ${TMP}`;
&#43;    done
&#43;
&#43;    if ${@bb.utils.contains('PACKAGECONFIG', 'apache2', 'true', 'false', d)}; then
&#43;        install -d ${D}${sysconfdir}/apache2/modules.d
&#43;        install -d ${D}${sysconfdir}/php/apache2-php${PHP_MAJOR_VERSION}
&#43;        install -m 644  ${WORKDIR}/70_mod_php${PHP_MAJOR_VERSION}.conf ${D}${sysconfdir}/apache2/modules.d
&#43;        sed -i s,lib/,${libexecdir}/, ${D}${sysconfdir}/apache2/modules.d/70_mod_php${PHP_MAJOR_VERSION}.conf
&#43;        cat ${S}/php.ini-production | \
&#43;            sed -e 's,extension_dir = \&quot;\./\&quot;,extension_dir = \&quot;/usr/lib/extensions\&quot;,' \
&#43;            &gt; ${D}${sysconfdir}/php/apache2-php${PHP_MAJOR_VERSION}/php.ini
&#43;        rm -f ${D}${sysconfdir}/apache2/httpd.conf*
&#43;    fi
&#43;}
&#43;
&#43;SYSROOT_PREPROCESS_FUNCS &#43;= &quot;php_sysroot_preprocess&quot;
&#43;
&#43;php_sysroot_preprocess () {
&#43;    install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}/
&#43;    install -m 755 ${D}${bindir}/phpize ${SYSROOT_DESTDIR}${bindir_crossscripts}/
&#43;    install -m 755 ${D}${bindir}/php-config ${SYSROOT_DESTDIR}${bindir_crossscripts}/
&#43;
&#43;    sed -i 's!eval echo /!eval echo ${STAGING_DIR_HOST}/!' ${SYSROOT_DESTDIR}${bindir_crossscripts}/phpize
&#43;    sed -i 's!^include_dir=.*!include_dir=${STAGING_INCDIR}/php!' ${SYSROOT_DESTDIR}${bindir_crossscripts}/php-config
&#43;}
&#43;
&#43;MODPHP_PACKAGE = <a class="moz-txt-link-rfc2396E" href="mailto:${@bb.utils.contains('PACKAGECONFIG','apache2','${PN}-modphp','',d)}">&quot;${@bb.utils.contains('PACKAGECONFIG', 'apache2', '${PN}-modphp', '', d)}&quot;</a>
&#43;
&#43;PACKAGES = &quot;${PN}-dbg ${PN}-cli ${PN}-cgi ${PN}-fpm ${PN}-fpm-apache2 ${PN}-pear ${PN}-phar ${MODPHP_PACKAGE} ${PN}-dev ${PN}-staticdev ${PN}-doc ${PN}-opcache ${PN}&quot;
&#43;
&#43;RDEPENDS_${PN} &#43;= &quot;libgcc&quot;
&#43;RDEPENDS_${PN}-pear = &quot;${PN}&quot;
&#43;RDEPENDS_${PN}-phar = &quot;${PN}-cli&quot;
&#43;RDEPENDS_${PN}-cli = &quot;${PN}&quot;
&#43;RDEPENDS_${PN}-modphp = &quot;${PN} apache2&quot;
&#43;RDEPENDS_${PN}-opcache = &quot;${PN}&quot;
&#43;
&#43;INITSCRIPT_PACKAGES = &quot;${PN}-fpm&quot;
&#43;inherit update-rc.d
&#43;
&#43;FILES_${PN}-dbg =&#43; &quot;${bindir}/.debug \
&#43;                    ${libexecdir}/apache2/modules/.debug&quot;
&#43;FILES_${PN}-doc &#43;= &quot;${PHP_LIBDIR}/php/doc&quot;
&#43;FILES_${PN}-cli = &quot;${bindir}/php&quot;
&#43;FILES_${PN}-phar = &quot;${bindir}/phar*&quot;
&#43;FILES_${PN}-cgi = &quot;${bindir}/php-cgi&quot;
&#43;FILES_${PN}-fpm = &quot;${sbindir}/php-fpm ${sysconfdir}/php-fpm.conf ${datadir}/fpm ${sysconfdir}/init.d/php-fpm ${systemd_unitdir}/system/php-fpm.service ${sysconfdir}/php-fpm.d/www.conf.default&quot;
&#43;FILES_${PN}-fpm-apache2 = &quot;${sysconfdir}/apache2/conf.d/php-fpm.conf&quot;
&#43;CONFFILES_${PN}-fpm = &quot;${sysconfdir}/php-fpm.conf&quot;
&#43;CONFFILES_${PN}-fpm-apache2 = &quot;${sysconfdir}/apache2/conf.d/php-fpm.conf&quot;
&#43;INITSCRIPT_NAME_${PN}-fpm = &quot;php-fpm&quot;
&#43;INITSCRIPT_PARAMS_${PN}-fpm = &quot;defaults 60&quot;
&#43;FILES_${PN}-pear = &quot;${bindir}/pear* ${bindir}/pecl ${PHP_LIBDIR}/php/PEAR \
&#43;                ${PHP_LIBDIR}/php/PEAR*.php ${PHP_LIBDIR}/php/System.php \
&#43;                ${PHP_LIBDIR}/php/peclcmd.php ${PHP_LIBDIR}/php/pearcmd.php \
&#43;                ${PHP_LIBDIR}/php/.channels ${PHP_LIBDIR}/php/.channels/.alias \
&#43;                ${PHP_LIBDIR}/php/.registry ${PHP_LIBDIR}/php/Archive/Tar.php \
&#43;                ${PHP_LIBDIR}/php/Console/Getopt.php ${PHP_LIBDIR}/php/OS/Guess.php \
&#43;                ${PHP_LIBDIR}/php/data/PEAR \
&#43;                ${sysconfdir}/pear.conf&quot;
&#43;FILES_${PN}-dev = &quot;${includedir}/php ${PHP_LIBDIR}/build ${bindir}/phpize \
&#43;                ${bindir}/php-config ${PHP_LIBDIR}/php/.depdb \
&#43;                ${PHP_LIBDIR}/php/.depdblock ${PHP_LIBDIR}/php/.filemap \
&#43;                ${PHP_LIBDIR}/php/.lock ${PHP_LIBDIR}/php/test&quot;
&#43;FILES_${PN}-staticdev &#43;= &quot;${PHP_LIBDIR}/extensions/*/*.a&quot;
&#43;FILES_${PN}-opcache = &quot;${PHP_LIBDIR}/extensions/*/opcache${SOLIBSDEV}&quot;
&#43;FILES_${PN} = &quot;${PHP_LIBDIR}/php&quot;
&#43;FILES_${PN} &#43;= &quot;${bindir} ${libexecdir}/apache2&quot;
&#43;
&#43;SUMMARY_${PN}-modphp = &quot;PHP module for the Apache HTTP server&quot;
&#43;FILES_${PN}-modphp = &quot;${libdir}/apache2 ${sysconfdir}&quot;
&#43;
&#43;MODPHP_OLDPACKAGE = <a class="moz-txt-link-rfc2396E" href="mailto:${@bb.utils.contains('PACKAGECONFIG','apache2','modphp','',d)}">&quot;${@bb.utils.contains('PACKAGECONFIG', 'apache2', 'modphp', '', d)}&quot;</a>
&#43;RPROVIDES_${PN}-modphp = &quot;${MODPHP_OLDPACKAGE}&quot;
&#43;RREPLACES_${PN}-modphp = &quot;${MODPHP_OLDPACKAGE}&quot;
&#43;RCONFLICTS_${PN}-modphp = &quot;${MODPHP_OLDPACKAGE}&quot;
&#43;
&#43;do_install_append_class-native() {
&#43;    create_wrapper ${D}${bindir}/php \
&#43;        PHP_PEAR_SYSCONF_DIR=${sysconfdir}/
&#43;}
&#43;
&#43;
&#43;# Fails to build with thumb-1 (qemuarm)
&#43;# | {standard input}: Assembler messages:
&#43;# | {standard input}:3719: Error: selected processor does not support Thumb mode `smull r0,r2,r9,r3'
&#43;# | {standard input}:3720: Error: unshifted register required -- `sub r2,r2,r0,asr#31'
&#43;# | {standard input}:3796: Error: selected processor does not support Thumb mode `smull r0,r2,r3,r3'
&#43;# | {standard input}:3797: Error: unshifted register required -- `sub r2,r2,r0,asr#31'
&#43;# | make: *** [ext/standard/math.lo] Error 1
&#43;ARM_INSTRUCTION_SET = &quot;arm&quot;
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
do we still need this ?, if needed for thumb1 perhaps we should mark
it so with _armv5t and _armv4
overrides so it can be built with thumb2 on newer arches

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">--
2.7.4


</pre>
        <br>
        <fieldset class="mimeAttachmentHeader"></fieldset>
        <pre class="moz-quote-pre" wrap="">
</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------55BEE1BCE9E0FF2A39962FC0--
