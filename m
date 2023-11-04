Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D04DC4167B
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 01:38:19 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.2281.1699061894488854594
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 18:38:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=KTgbPJe1;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=PO29fxj8;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018b97fb1dbd-fc1534c9-f143-4840-bfb3-a1c4c61bb64f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699061898;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Ux48fpX6It15U4zd5mwFYJOAbVO6rduwg+20VjZn358=;
	b=KTgbPJe1lD5MFAuG4mS71VmhwQmJaQBAVubwEIouOtLTlEsyF7pMY8v/VYyb2Svb
	ULfgtyEjA8RMs5vutD++ofDfFrJND3/+6n9ImOIFBimIUTP3hqU0ijHutwpg/AnRf1H
	qlnlm5HkarP/OaTpYYy5dWuCWUVKlDK3uoJb2fXU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699061898;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Ux48fpX6It15U4zd5mwFYJOAbVO6rduwg+20VjZn358=;
	b=PO29fxj8bsrodQegczocn8TSXZDE7C8mK1NBCwfM0012XIh0oI1/imTXE0oWH059
	x0PrhbcYUFN7fQVmamMHwUfOTyZEgDl4zYhAPBWdBstgNGXJJku5znaV3fqwbUgROD8
	oGoeNZyaLJvRUuvYjAZaLreuaI+iIFf58MHIV3bo=
Content-Type: multipart/mixed; boundary="===============6727471862938746602=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-xmlschema: upgrading to 2.5.0 FAILED
Message-ID: <0101018b97fb1dbd-fc1534c9-f143-4840-bfb3-a1c4c61bb64f-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 01:38:18 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.30
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 01:38:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106179

--===============6727471862938746602==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-xmlschema* to *2.5.0* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade python3-xmlschema -V 2.5.0
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 5126 entries from dependency cache.
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
meta-yocto-bsp       
workspace            = "master:e575f59b82eae78fb1ac8df7198eaa4a7a963259"
meta-oe              
meta-python          
meta-perl            
meta-networking      
meta-multimedia      
meta-gnome           
meta-xfce            
meta-filesystems     
meta-initramfs       
meta-webserver       = "tmp-auh-upgrades:3504582162218b7af7835fda0080774d43046fb5"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 8 seconds
Loading cache...done.
Loaded 5126 entries from dependency cache.
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
meta-yocto-bsp       
workspace            = "master:e575f59b82eae78fb1ac8df7198eaa4a7a963259"
meta-oe              
meta-python          
meta-perl            
meta-networking      
meta-multimedia      
meta-gnome           
meta-xfce            
meta-filesystems     
meta-initramfs       
meta-webserver       = "tmp-auh-upgrades:3504582162218b7af7835fda0080774d43046fb5"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 8 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://files.pythonhosted.org/packages/source/x/xmlschema/xmlschema-2.5.0.tar.gz;downloadfilename=xmlschema-2.5.0.tar.gz...
ERROR: Execution of 'git add -f -A "pyproject.toml" ""tests/test_cases/examples/men\303\271/men\303\271-ascii.xml"" ""tests/test_cases/examples/men\303\271/men\303\271-ascii.xsd"" ""tests/test_cases/examples/men\303\271/men\303\271-cp1252.xml"" ""tests/test_cases/examples/men\303\271/men\303\271-cp1252.xsd"" ""tests/test_cases/examples/men\303\271/men\303\271.txt"" ""tests/test_cases/examples/men\303\271/men\303\271.xml"" ""tests/test_cases/examples/men\303\271/men\303\271.xsd"" "tests/test_cases/issues/issue_362/dir1/dir2/issue_362_2.xsd" "tests/test_cases/issues/issue_362/dir1/issue_362_1.xsd" "tests/test_cases/issues/issue_362/dir2/issue_362_2.xsd" "tests/test_cases/issues/issue_362/issue_362_1.xsd" "tests/test_cases/issues/issue_363/issue_363-invalid-1.xml" "tests/test_cases/issues/issue_363/issue_363-invalid-2.xml" "tests/test_cases/issues/issue_363/issue_363-invalid-3.xml" "tests/test_cases/issues/issue_363/issue_363.xml" "tests/test_cases/issues/issue_363/issue_363.xsd" "tests
 /test_cases/translations/pl/tw-1(5)8e.xsd" "tests/test_cases/translations/pl/tytul_wykonawczy_niekompletny.xml" "xmlschema/exports.py" "xmlschema/locale/pl/LC_MESSAGES/xmlschema.mo" "xmlschema/locale/pl/LC_MESSAGES/xmlschema.po" "xmlschema/schemas/DSIG/xmldsig-core-schema.xsd" "xmlschema/schemas/DSIG/xmldsig11-schema.xsd" "xmlschema/schemas/XENC/xenc-schema-11.xsd" "xmlschema/schemas/XENC/xenc-schema.xsd" "CHANGELOG.rst" "PKG-INFO" "README.rst" "doc/conf.py" "doc/usage.rst" "requirements-dev.txt" "setup.py" "tests/test_resources.py" "tests/test_translations.py" "tests/validation/test_decoding.py" "tests/validation/test_validation.py" "tests/validators/test_identities.py" "tests/validators/test_schemas.py" "tests/validators/test_xsdbase.py" "tox.ini" "xmlschema.egg-info/PKG-INFO" "xmlschema.egg-info/SOURCES.txt" "xmlschema.egg-info/requires.txt" "xmlschema/__init__.py" "xmlschema/aliases.py" "xmlschema/dataobjects.py" "xmlschema/helpers.py" "xmlschema/names.py" "xmlschema/resources.p
 y" "xmlschema/testing/__init__.py" "xmlschema/validators/attributes.py" "xmlschema/validators/elements.py" "xmlschema/validators/exceptions.py" "xmlschema/validators/groups.py" "xmlschema/validators/identities.py" "xmlschema/validators/models.py" "xmlschema/validators/schemas.py" "xmlschema/validators/simple_types.py" "xmlschema/validators/wildcards.py" "xmlschema/validators/xsdbase.py" "xmlschema/xpath.py"' failed with exit code 128:
fatal: pathspec 'tests/test_cases/examples/men303271/men303271-ascii.xml' did not match any files



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============6727471862938746602==--

