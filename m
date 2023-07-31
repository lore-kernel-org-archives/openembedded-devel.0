Return-Path: <auh@moto-timo.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAA8EC001DF
	for <webhook@archiver.kernel.org>; Mon, 31 Jul 2023 05:10:44 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.1222.1690780234305647117
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Jul 2023 22:10:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@moto-timo.dev header.s=gm1 header.b=A+M2k8qC;
 spf=pass (domain: moto-timo.dev, ip: 217.70.183.194, mailfrom: auh@moto-timo.dev)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8A33E40004
	for <openembedded-devel@lists.openembedded.org>; Mon, 31 Jul 2023 05:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moto-timo.dev;
	s=gm1; t=1690780232;
	h=from:from:reply-to:subject:subject:to:to:cc:mime-version:mime-version:
	 content-type:content-type; bh=ARCHLDruw9qK/4TakdXrSDqet94bSKNdOFKjoTYtWII=;
	b=A+M2k8qC1TNiI5j7fqQ4bH0j6qMeHYnzp+A/4KPyMlAnn1LlUQDvYLx/OQPkO9/TUjeF+f
	8kMVHV59GkCxWT54A0ZHgyiokQc5SazOPDzHuroU6S2hNBpoPx6qqu4b2h3rFV34pfflO/
	icKKekTfduzCtbkqoffRYpIkImvXnyp0OlXF0GvsnqLTFli1FVCgz23vmQWJ9Mg1fDdQe/
	Tz7Jc3NdnT+SRmSpSPybZLlpJBMLiDVLgeLs1gce0xbL1yHYuxwz58OMD3iZylu0pOtgxZ
	89PBLZFl4H9WXC6tZjrjuqrwh04DRFWzWtYJ/buuFEV0hQVfSRHTGt16IVuA/A==
Content-Type: multipart/mixed; boundary="===============5152860293325197674=="
MIME-Version: 1.0
From: auh@moto-timo.dev
To: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-xmlschema: upgrading to 2.4.0 FAILED
X-GND-Sasl: auh@moto-timo.dev
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 31 Jul 2023 05:10:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104139
Message-Id: <20230731051044.CAA8EC001DF@smtp.lore.kernel.org>
Date: Mon, 31 Jul 2023 05:10:44 +0000 (UTC)

--===============5152860293325197674==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-xmlschema* to *2.4.0* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade python3-xmlschema -V 2.4.0
NOTE: Starting bitbake server...
Loading cache...done.
Loaded 12625 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies
NOTE: Resolving any missing task queue dependencies
NOTE: Resolving any missing task queue dependencies
NOTE: Resolving any missing task queue dependencies
NOTE: Resolving any missing task queue dependencies
NOTE: Resolving any missing task queue dependencies

Build Configuration (mc:default):
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "master:5dd5f0f5348594a0b636ef05a87381b997db4fb5"
meta-oe              
meta-python          
meta-perl            = "tmp-auh-upgrades:9d4ce13d23c371beb8b9cd020b6eebed19c0d793"
workspace            = "<unknown>:<unknown>"


Build Configuration (mc:qemux86-musl):
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "master:5dd5f0f5348594a0b636ef05a87381b997db4fb5"
meta-oe              
meta-python          
meta-perl            = "tmp-auh-upgrades:9d4ce13d23c371beb8b9cd020b6eebed19c0d793"
workspace            = "<unknown>:<unknown>"


Build Configuration (mc:qemuarm64):
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "aarch64-poky-linux"
MACHINE              = "qemuarm64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "aarch64 armv8a crc cortexa57"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "master:5dd5f0f5348594a0b636ef05a87381b997db4fb5"
meta-oe              
meta-python          
meta-perl            = "tmp-auh-upgrades:9d4ce13d23c371beb8b9cd020b6eebed19c0d793"
workspace            = "<unknown>:<unknown>"

Initialising tasks...done.
Sstate summary: Wanted 10 Local 0 Mirrors 10 Missed 0 Current 20 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds
Loading cache...done.
Loaded 12625 entries from dependency cache.
Parsing recipes...done.
Parsing of 7344 .bb files complete (7338 cached, 6 parsed). 12619 targets, 353 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies
NOTE: Resolving any missing task queue dependencies
NOTE: Resolving any missing task queue dependencies
NOTE: Resolving any missing task queue dependencies
NOTE: Resolving any missing task queue dependencies
NOTE: Resolving any missing task queue dependencies

Build Configuration (mc:default):
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "master:5dd5f0f5348594a0b636ef05a87381b997db4fb5"
meta-oe              
meta-python          
meta-perl            = "tmp-auh-upgrades:9d4ce13d23c371beb8b9cd020b6eebed19c0d793"
workspace            = "<unknown>:<unknown>"


Build Configuration (mc:qemux86-musl):
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "master:5dd5f0f5348594a0b636ef05a87381b997db4fb5"
meta-oe              
meta-python          
meta-perl            = "tmp-auh-upgrades:9d4ce13d23c371beb8b9cd020b6eebed19c0d793"
workspace            = "<unknown>:<unknown>"


Build Configuration (mc:qemuarm64):
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "aarch64-poky-linux"
MACHINE              = "qemuarm64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "aarch64 armv8a crc cortexa57"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "master:5dd5f0f5348594a0b636ef05a87381b997db4fb5"
meta-oe              
meta-python          
meta-perl            = "tmp-auh-upgrades:9d4ce13d23c371beb8b9cd020b6eebed19c0d793"
workspace            = "<unknown>:<unknown>"

Initialising tasks...done.
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 5 seconds
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://files.pythonhosted.org/packages/source/x/xmlschema/xmlschema-2.4.0.tar.gz;downloadfilename=xmlschema-2.4.0.tar.gz...
ERROR: Execution of 'git add -f -A "source-date-epoch/__source_date_epoch.txt" "xmlschema-2.4.0/.coveragerc" "xmlschema-2.4.0/CHANGELOG.rst" "xmlschema-2.4.0/LICENSE" "xmlschema-2.4.0/MANIFEST.in" "xmlschema-2.4.0/PKG-INFO" "xmlschema-2.4.0/README.rst" "xmlschema-2.4.0/doc/Makefile" "xmlschema-2.4.0/doc/api.rst" "xmlschema-2.4.0/doc/components.rst" "xmlschema-2.4.0/doc/conf.py" "xmlschema-2.4.0/doc/converters.rst" "xmlschema-2.4.0/doc/extras.rst" "xmlschema-2.4.0/doc/features.rst" "xmlschema-2.4.0/doc/index.rst" "xmlschema-2.4.0/doc/intro.rst" "xmlschema-2.4.0/doc/testing.rst" "xmlschema-2.4.0/doc/usage.rst" "xmlschema-2.4.0/mypy.ini" "xmlschema-2.4.0/requirements-dev.txt" "xmlschema-2.4.0/setup.cfg" "xmlschema-2.4.0/setup.py" "xmlschema-2.4.0/tests/__init__.py" "xmlschema-2.4.0/tests/check_memory.py" "xmlschema-2.4.0/tests/templates/demo/demo_type_filter_test.jinja" "xmlschema-2.4.0/tests/templates/filters/name_filter_test.jinja" "xmlschema-2.4.0/tests/templates/filters/namespace_fi
 lter_test.jinja" "xmlschema-2.4.0/tests/templates/filters/python_type_filter_test.jinja" "xmlschema-2.4.0/tests/templates/filters/qname_filter_test.jinja" "xmlschema-2.4.0/tests/templates/filters/sort_types_filter_test.jinja" "xmlschema-2.4.0/tests/templates/filters/type_name_filter_test.jinja" "xmlschema-2.4.0/tests/templates/filters/type_qname_filter_test.jinja" "xmlschema-2.4.0/tests/templates/filters/unknown_filter_test.jinja" "xmlschema-2.4.0/tests/templates/filters/wrong-template.jinja" "xmlschema-2.4.0/tests/test_all.py" "xmlschema-2.4.0/tests/test_cases/examples/collection/collection-1_error.xml" "xmlschema-2.4.0/tests/test_cases/examples/collection/collection-default.xml" "xmlschema-2.4.0/tests/test_cases/examples/collection/collection.py" "xmlschema-2.4.0/tests/test_cases/examples/collection/collection.xml" "xmlschema-2.4.0/tests/test_cases/examples/collection/collection.xsd" "xmlschema-2.4.0/tests/test_cases/examples/collection/collection2.xml" "xmlschema-2.4.0/tests/test
 _cases/examples/collection/collection2.xsd" "xmlschema-2.4.0/tests/test_cases/examples/collection/collection3.xml" "xmlschema-2.4.0/tests/test_cases/examples/collection/collection3.xsd" "xmlschema-2.4.0/tests/test_cases/examples/collection/collection3bis.xml" "xmlschema-2.4.0/tests/test_cases/examples/collection/collection3bis.xsd" "xmlschema-2.4.0/tests/test_cases/examples/collection/collection4.xml" "xmlschema-2.4.0/tests/test_cases/examples/collection/collection4.xsd" "xmlschema-2.4.0/tests/test_cases/examples/collection/collection5.xsd" ""xmlschema-2.4.0/tests/test_cases/examples/men\303\271/men\303\271-ascii.xml"" ""xmlschema-2.4.0/tests/test_cases/examples/men\303\271/men\303\271-ascii.xsd"" ""xmlschema-2.4.0/tests/test_cases/examples/men\303\271/men\303\271-cp1252.xml"" ""xmlschema-2.4.0/tests/test_cases/examples/men\303\271/men\303\271-cp1252.xsd"" ""xmlschema-2.4.0/tests/test_cases/examples/men\303\271/men\303\271.txt"" ""xmlschema-2.4.0/tests/test_cases/examples/men\303\27
 1/men\303\271.xml"" ""xmlschema-2.4.0/tests/test_cases/examples/men\303\271/men\303\271.xsd"" "xmlschema-2.4.0/tests/test_cases/examples/stockquote/stockquote.wsdl" "xmlschema-2.4.0/tests/test_cases/examples/stockquote/stockquote.xsd" "xmlschema-2.4.0/tests/test_cases/examples/stockquote/stockquoteservice.wsdl" "xmlschema-2.4.0/tests/test_cases/examples/vehicles/bikes.xsd" "xmlschema-2.4.0/tests/test_cases/examples/vehicles/cars.xsd" "xmlschema-2.4.0/tests/test_cases/examples/vehicles/invalid.xsd" "xmlschema-2.4.0/tests/test_cases/examples/vehicles/types.xsd" "xmlschema-2.4.0/tests/test_cases/examples/vehicles/vehicles-1_error.json" "xmlschema-2.4.0/tests/test_cases/examples/vehicles/vehicles-1_error.xml" "xmlschema-2.4.0/tests/test_cases/examples/vehicles/vehicles-2_errors.xml" "xmlschema-2.4.0/tests/test_cases/examples/vehicles/vehicles-3_errors.json" "xmlschema-2.4.0/tests/test_cases/examples/vehicles/vehicles-3_errors.xml" "xmlschema-2.4.0/tests/test_cases/examples/vehicles/vehi
 cles-max.xsd" "xmlschema-2.4.0/tests/test_cases/examples/vehicles/vehicles-schemas.xsd.zip" "xmlschema-2.4.0/tests/test_cases/examples/vehicles/vehicles.xml" "xmlschema-2.4.0/tests/test_cases/examples/vehicles/vehicles.xsd" "xmlschema-2.4.0/tests/test_cases/examples/vehicles/vehicles2.json" "xmlschema-2.4.0/tests/test_cases/examples/vehicles/vehicles2.xml" "xmlschema-2.4.0/tests/test_cases/features/attributes/default_attributes-missing_group.xsd" "xmlschema-2.4.0/tests/test_cases/features/attributes/default_attributes.xsd" "xmlschema-2.4.0/tests/test_cases/features/builtins/builtins.xml" "xmlschema-2.4.0/tests/test_cases/features/builtins/builtins.xsd" "xmlschema-2.4.0/tests/test_cases/features/decoder/data.xml" "xmlschema-2.4.0/tests/test_cases/features/decoder/data2.xml" "xmlschema-2.4.0/tests/test_cases/features/decoder/data3.xml" "xmlschema-2.4.0/tests/test_cases/features/decoder/data4-mixed.xml" "xmlschema-2.4.0/tests/test_cases/features/decoder/long-sequence-1.xsd" "xmlschema-
 2.4.0/tests/test_cases/features/decoder/mixed-content.xsd" "xmlschema-2.4.0/tests/test_cases/features/decoder/simple-types.xsd" "xmlschema-2.4.0/tests/test_cases/features/derivations/complex-extensions.xsd" "xmlschema-2.4.0/tests/test_cases/features/derivations/complex-with-simple-content-restriction.xsd" "xmlschema-2.4.0/tests/test_cases/features/derivations/complex11-restrictions.xsd" "xmlschema-2.4.0/tests/test_cases/features/derivations/invalid-enumeration-restriction.xsd" "xmlschema-2.4.0/tests/test_cases/features/derivations/invalid-restrictions1.xsd" "xmlschema-2.4.0/tests/test_cases/features/derivations/invalid-restrictions2.xsd" "xmlschema-2.4.0/tests/test_cases/features/derivations/list_types.xml" "xmlschema-2.4.0/tests/test_cases/features/derivations/list_types.xsd" "xmlschema-2.4.0/tests/test_cases/features/elements/test_alternatives-1.xml" "xmlschema-2.4.0/tests/test_cases/features/elements/type_alternatives-no-ns.xsd" "xmlschema-2.4.0/tests/test_cases/features/elements
 /type_alternatives.xsd" "xmlschema-2.4.0/tests/test_cases/features/models/billion_laughs_model.xsd" "xmlschema-2.4.0/tests/test_cases/features/models/circular_model.xsd" "xmlschema-2.4.0/tests/test_cases/features/models/illegal-attributes.xsd" "xmlschema-2.4.0/tests/test_cases/features/models/illegal-declarations.xsd"' failed with exit code 128:
fatal: pathspec 'xmlschema-2.4.0/tests/test_cases/examples/men303271/men303271-ascii.xml' did not match any files



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5152860293325197674==--

