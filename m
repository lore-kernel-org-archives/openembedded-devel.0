Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB083C04A68
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 20:02:28 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.63231.1699041739688121371
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 13:02:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=SSNiq6S1;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=f2zoZAFX;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018b96c78198-d7da7148-80de-4306-81ba-e53cf1ffe675-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699041739;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=46rqe54iicuu6DmIn0BP8CMpMfAoOpA6HNhlH83p898=;
	b=SSNiq6S1W9ysIMYhLyywAMxJ8v9BF31M2/K0eGvJGk9sgOW+pBSqfsu6KQJ9TCB7
	zBzEoMHf/hfXs3HqS+aMn7ZvdTix50A8KLqz8qYHErTva32qgsmZdFmrbrxGWU5vDJv
	vAEtIU8t7oe7bTLndaL8ufm80X7FwPhdu24mWN7s=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699041739;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=46rqe54iicuu6DmIn0BP8CMpMfAoOpA6HNhlH83p898=;
	b=f2zoZAFX1+mvhN9rdnCswRrpz9P8i3IPw3mGRx+HMw/Pikv9lJvrETphyqVukCyl
	CVSjcXQDcafCTTKwJox7gL/HKT1FvhDF3uMacYG+JtkmuZ2rGA4a9AntmKERqE/4Myr
	1SRDz8RuCdSF4YnKHyz2on+Ehq6ORMh3NkkiAT3M=
Content-Type: multipart/mixed; boundary="===============2252708447570768019=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] php: upgrading to 8.2.12 FAILED
Message-ID: <0101018b96c78198-d7da7148-80de-4306-81ba-e53cf1ffe675-000000@us-west-2.amazonses.com>
Date: Fri, 3 Nov 2023 20:02:19 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.03-54.240.27.29
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 20:02:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106080

--===============2252708447570768019==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *php* to *8.2.12* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade php -V 8.2.12
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 5024 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-e575f59b82eae78fb1ac8df7198eaa4a7a963259"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "master:e575f59b82eae78fb1ac8df7198eaa4a7a963259"
meta-oe              
meta-python          
meta-perl            
meta-networking      
meta-multimedia      
meta-gnome           
meta-xfce            
meta-filesystems     
meta-initramfs       
meta-webserver       = "tmp-auh-upgrades:79519059c951ab9f96f9a459dcf9af4ee24d72bf"
workspace            = "master:e575f59b82eae78fb1ac8df7198eaa4a7a963259"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 6 seconds
Loading cache...done.
Loaded 5024 entries from dependency cache.
Parsing recipes...done.
Parsing of 3056 .bb files complete (3054 cached, 2 parsed). 4887 targets, 92 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-e575f59b82eae78fb1ac8df7198eaa4a7a963259"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "master:e575f59b82eae78fb1ac8df7198eaa4a7a963259"
meta-oe              
meta-python          
meta-perl            
meta-networking      
meta-multimedia      
meta-gnome           
meta-xfce            
meta-filesystems     
meta-initramfs       
meta-webserver       = "tmp-auh-upgrades:79519059c951ab9f96f9a459dcf9af4ee24d72bf"
workspace            = "master:e575f59b82eae78fb1ac8df7198eaa4a7a963259"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 5 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
INFO: Extracting current version source...
INFO: SRC_URI contains some conditional appends/prepends - will create branches to represent these
INFO: Adding local source files to srctree...
INFO: Extracting upgraded version source...
INFO: Fetching http://php.net/distributions/php-8.2.12.tar.bz2...
ERROR: Execution of 'git add -f -A ".github/workflows/push.yml" "NEWS" "Zend/Optimizer/block_pass.c" "Zend/Optimizer/optimize_func_calls.c" "Zend/Optimizer/zend_inference.c" "Zend/tests/arginfo_zpp_mismatch.phpt" "Zend/tests/arginfo_zpp_mismatch_strict.phpt" "Zend/zend.c" "Zend/zend.h" "Zend/zend_API.c" "Zend/zend_alloc.c" "Zend/zend_closures.c" "Zend/zend_compile.c" "Zend/zend_execute_API.c" "Zend/zend_hash.c" "Zend/zend_inheritance.c" "Zend/zend_ini.c" "Zend/zend_ini_parser.c" "Zend/zend_ini_parser.h" "Zend/zend_ini_parser.output" "Zend/zend_ini_scanner.c" "Zend/zend_ini_scanner_defs.h" "Zend/zend_interfaces.c" "Zend/zend_language_parser.c" "Zend/zend_language_parser.h" "Zend/zend_language_parser.output" "Zend/zend_language_scanner.c" "Zend/zend_language_scanner_defs.h" "Zend/zend_opcode.c" "Zend/zend_vm_def.h" "Zend/zend_vm_execute.h" "build/php.m4" "configure" "configure.ac" "ext/ctype/ctype.c" "ext/curl/tests/curl_basic_009.phpt" "ext/date/php_date.c" "ext/dl_test/tests/skip.inc
 " "ext/dom/attr.c" "ext/dom/cdatasection.c" "ext/dom/characterdata.c" "ext/dom/comment.c" "ext/dom/document.c" "ext/dom/documentfragment.c" "ext/dom/element.c" "ext/dom/entity.c" "ext/dom/entityreference.c" "ext/dom/node.c" "ext/dom/parentnode.c" "ext/dom/php_dom.c" "ext/dom/php_dom.stub.php" "ext/dom/php_dom_arginfo.h" "ext/dom/processinginstruction.c" "ext/dom/tests/DOMDocumentFragment_construct_basic_002.phpt" "ext/dom/tests/bug47530.phpt" "ext/dom/tests/bug47847.phpt" "ext/dom/tests/bug55294.phpt" "ext/dom/tests/bug80602.phpt" "ext/dom/tests/bug80602_2.phpt" "ext/dom/tests/bug80602_3.phpt" "ext/dom/tests/bug80602_4.phpt" "ext/dom/tests/domobject_debug_handler.phpt" "ext/dom/tests/gh11288.phpt" "ext/dom/tests/gh11289.phpt" "ext/dom/tests/gh11290.phpt" "ext/dom/tests/gh9142.phpt" "ext/dom/tests/not_serializable.phpt" "ext/dom/text.c" "ext/ffi/ffi.c" "ext/fileinfo/data_file.c" "ext/fileinfo/magicdata.patch" "ext/fileinfo/tests/magic" ""ext/fileinfo/tests/magic\347\247\201\343\201\2
 57\343\202\254\343\203\251\343\202\271\343\202\222\351\243\237\343\201\271\343\202\211\343\202\214\343\201\276\343\201\231"" "ext/filter/filter.c" "ext/hash/hash.c" "ext/hash/hash.stub.php" "ext/hash/hash_arginfo.h" "ext/hash/tests/reuse.phpt" "ext/iconv/iconv.c" "ext/intl/dateformat/dateformat_create.cpp" "ext/intl/msgformat/msgformat_format.c" "ext/intl/tests/calendar_clear_variation1.phpt" "ext/intl/tests/gh11658.phpt" "ext/json/json_parser.tab.c" "ext/json/json_parser.tab.h" "ext/json/json_scanner.c" "ext/json/php_json_scanner_defs.h" "ext/libxml/tests/libxml_entity_loading_disabled_by_default.phpt" "ext/mysqlnd/mysqlnd_auth.c" "ext/mysqlnd/mysqlnd_commands.c" "ext/mysqlnd/mysqlnd_connection.c" "ext/mysqlnd/mysqlnd_protocol_frame_codec.c" "ext/mysqlnd/mysqlnd_result.c" "ext/mysqlnd/mysqlnd_vio.c" "ext/mysqlnd/php_mysqlnd.c" "ext/odbc/odbc.stub.php" "ext/odbc/odbc_arginfo.h" "ext/odbc/php_odbc.c" "ext/odbc/tests/config.inc" "ext/opcache/ZendAccelerator.c"' failed with exit code 1
 28:
fatal: pathspec 'ext/fileinfo/tests/magic347247201343201257343202254343203251343202271343202222351243237343201271343202211343202214343201276343201231' did not match any files



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============2252708447570768019==--

