Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A170C07D5B
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 01:38:21 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.2289.1699061895895492882
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 18:38:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=cydqef1e;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=fs7Q1P5O;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018b97fb0fee-46e9e29a-bb11-4e66-b950-a68a23b4ea6e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699061895;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=WwlNmbJ5l427Et55Hm7PJSD6QJl21LhTPSoIxfl042I=;
	b=cydqef1e2fn1WDMOlah4/LxZd5d7EAIJFum3WKtcTsVk17VA0Lvs8uh2UZPT9fZa
	aHtKxIE/mNsoniE9wGjSPR6sVD69KvLz3YS5/sSlCiQibdCKMuvKJnR6WeMBJ7IpdoW
	2XS8ADIK40k3v939Aw0GjpzuaUOuObKZ3l0fSETY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699061895;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=WwlNmbJ5l427Et55Hm7PJSD6QJl21LhTPSoIxfl042I=;
	b=fs7Q1P5OBsyTE66xs4fWdNOFcQfg0MNx4wK0iITqiJXzzCYVbcQjs6JDDbNKuwLn
	XygICTDBx/agYTwk7SHYfJw4jQnyJKjThXrm/0lZzddR6s2pzkn7F8MOKUY/DI9PPNz
	h1+qnbg+OR26fSCUAUVmYWacZwzMMh7lARX3m70A=
Content-Type: multipart/mixed; boundary="===============4403736470514000998=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-google-api-python-client: upgrading to 2.106.0
 SUCCEEDED
Message-ID: <0101018b97fb0fee-46e9e29a-bb11-4e66-b950-a68a23b4ea6e-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 01:38:15 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.191
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 01:38:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106127

--===============4403736470514000998==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-google-api-python-client* to *2.106.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-google-api-python-client-upgrade-2.104.0-2.1.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From d3afcacc07786630b31c08e3c7dee4326f45a64e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 3 Nov 2023 21:23:58 +0000
Subject: [PATCH] python3-google-api-python-client: upgrade 2.104.0 -> 2.106.0

---
 ...t_2.104.0.bb => python3-google-api-python-client_2.106.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-api-python-client_2.104.0.bb => python3-google-api-python-client_2.106.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.104.0.bb b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.106.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-google-api-python-client_2.104.0.bb
rename to meta-python/recipes-devtools/python/python3-google-api-python-client_2.106.0.bb
index 34600f0f3..476adc483 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.104.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.106.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/googleapis/google-api-python-client"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "bbc66520e7fe9417b93fd113f2a0a1afa789d686de9009b6e94e48fdea50a60f"
+SRC_URI[sha256sum] = "f6a3862be2f6e5e0536d7bd47b5af3f24ac0b9147c76c830cafb3329d71d5724"
 
 inherit pypi setuptools3
 
-- 
2.39.2


--===============4403736470514000998==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-google-api-python-client: SRC_URI changed from "https://files.pythonhosted.org/packages/source/g/google-api-python-client/google-api-python-client-2.104.0.tar.gz;downloadfilename=google-api-python-client-2.104.0.tar.gz" to "https://files.pythonhosted.org/packages/source/g/google-api-python-client/google-api-python-client-2.106.0.tar.gz;downloadfilename=google-api-python-client-2.106.0.tar.gz"
packages/core2-64-poky-linux/python3-google-api-python-client: PV changed from "2.104.0" to "2.106.0"
packages/core2-64-poky-linux/python3-google-api-python-client: PKGV changed from 2.104.0 [default] to 2.106.0 [default]
packages/core2-64-poky-linux/python3-google-api-python-client/python3-google-api-python-client-dbg: PV changed from "2.104.0" to "2.106.0"
packages/core2-64-poky-linux/python3-google-api-python-client/python3-google-api-python-client-dbg: PKGV changed from 2.104.0 [default] to 2.106.0 [default]
packages/core2-64-poky-linux/python3-google-api-python-client/python3-google-api-python-client-dev: PV changed from "2.104.0" to "2.106.0"
packages/core2-64-poky-linux/python3-google-api-python-client/python3-google-api-python-client-dev: PKGV changed from 2.104.0 [default] to 2.106.0 [default]
packages/core2-64-poky-linux/python3-google-api-python-client/python3-google-api-python-client-doc: PV changed from "2.104.0" to "2.106.0"
packages/core2-64-poky-linux/python3-google-api-python-client/python3-google-api-python-client-doc: PKGV changed from 2.104.0 [default] to 2.106.0 [default]
packages/core2-64-poky-linux/python3-google-api-python-client/python3-google-api-python-client-locale: PV changed from "2.104.0" to "2.106.0"
packages/core2-64-poky-linux/python3-google-api-python-client/python3-google-api-python-client-locale: PKGV changed from 2.104.0 [default] to 2.106.0 [default]
packages/core2-64-poky-linux/python3-google-api-python-client/python3-google-api-python-client-src: PV changed from "2.104.0" to "2.106.0"
packages/core2-64-poky-linux/python3-google-api-python-client/python3-google-api-python-client-src: PKGV changed from 2.104.0 [default] to 2.106.0 [default]
packages/core2-64-poky-linux/python3-google-api-python-client/python3-google-api-python-client-staticdev: PV changed from "2.104.0" to "2.106.0"
packages/core2-64-poky-linux/python3-google-api-python-client/python3-google-api-python-client-staticdev: PKGV changed from 2.104.0 [default] to 2.106.0 [default]
packages/core2-64-poky-linux/python3-google-api-python-client/python3-google-api-python-client: FILELIST: directory renamed /usr/lib/python3.11/site-packages/google_api_python_client-2.104.0.dist-info -> /usr/lib/python3.11/site-packages/google_api_python_client-2.106.0.dist-info, added "/usr/lib/python3.11/site-packages/googleapiclient/discovery_cache/documents/biglake.v1.json"
packages/core2-64-poky-linux/python3-google-api-python-client/python3-google-api-python-client: PKGSIZE changed from 92917797 to 93255052 (+0%)
packages/core2-64-poky-linux/python3-google-api-python-client/python3-google-api-python-client: PV changed from "2.104.0" to "2.106.0"
packages/core2-64-poky-linux/python3-google-api-python-client/python3-google-api-python-client: PKGV changed from 2.104.0 [default] to 2.106.0 [default]
Changes to packages/core2-64-poky-linux/python3-google-api-python-client (sysroot):
  /usr/lib/python3.11/site-packages/google_api_python_client-2.104.0.dist-info moved to /usr/lib/python3.11/site-packages/google_api_python_client-2.106.0.dist-info
  /usr/lib/python3.11/site-packages/googleapiclient/discovery_cache/documents/biglake.v1.json was added

--===============4403736470514000998==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 4918 entries from dependency cache.
Parsing recipes...done.
Parsing of 3055 .bb files complete (3052 cached, 3 parsed). 4885 targets, 143 skipped, 0 masked, 0 errors.
Removing 38 recipes from the core2-64 sysroot...done.
Removing 85 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
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
meta-webserver       = "tmp-auh-upgrades:e5334d71a368d2d0d093c5333169a5d54e31ecdd"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 566 Local 555 Mirrors 0 Missed 11 Current 172 (98% match, 98% complete)
Removing 2 stale sstate objects for arch qemux86_64...done.
Removing 5 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 176 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-google-api-python-client_2.106.0.bb:do_create_runtime_spdx_setscene)
NOTE: Running setscene task 177 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-google-api-python-client_2.106.0.bb:do_package_qa_setscene)
NOTE: Running setscene task 178 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-google-api-python-client_2.106.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 179 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-google-api-python-client_2.106.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 180 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-google-api-python-client_2.106.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 181 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-google-api-python-client_2.106.0.bb:do_populate_lic_setscene)
NOTE: Running setscene task 182 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-google-api-python-client_2.106.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 183 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-google-auth_2.23.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 184 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.61.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 187 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-grpcio_1.56.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 188 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-httplib2_0.22.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 189 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-httplib2_0.22.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 190 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-httplib2_0.22.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 195 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 198 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 199 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/protobuf/protobuf_4.23.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-google-api-python-client-2.106.0-r0: task do_create_runtime_spdx_setscene: Started
NOTE: recipe python3-google-api-python-client-2.106.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-google-api-python-client-2.106.0-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-google-api-python-client-2.106.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-google-api-python-client-2.106.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-google-api-python-client-2.106.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-google-api-python-client-2.106.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-google-auth-2.23.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-httplib2-0.22.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-googleapis-common-protos-1.61.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-grpcio-1.56.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-httplib2-0.22.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-httplib2-0.22.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe abseil-cpp-20230802.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe abseil-cpp-20230802.0-r0: task do_packagedata_setscene: Started
NOTE: recipe protobuf-4.23.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-google-api-python-client-2.106.0-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 200 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-protobuf_4.24.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-google-api-python-client-2.106.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 201 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-uritemplate_4.1.1.bb:do_package_write_deb_setscene)
NOTE: recipe python3-grpcio-1.56.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 202 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-grpcio_1.56.2.bb:do_recipe_qa_setscene)
NOTE: recipe python3-google-api-python-client-2.106.0-r0: task do_create_runtime_spdx_setscene: Succeeded
NOTE: Running setscene task 204 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-google-api-python-client_2.106.0.bb:do_create_spdx_setscene)
NOTE: recipe python3-httplib2-0.22.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe protobuf-4.23.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 207 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-uritemplate_4.1.1.bb:do_package_write_ipk_setscene)
NOTE: recipe python3-google-auth-2.23.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 208 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/protobuf/protobuf_4.23.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 212 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-uritemplate_4.1.1.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-protobuf-4.24.4-r0: task do_deploy_source_date_epoch_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/abseil-cpp/20230802.0/temp/log.do_packagedata_setscene.3136936
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 213 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb:do_package_setscene)
NOTE: recipe python3-uritemplate-4.1.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-grpcio-1.56.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-httplib2-0.22.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-google-api-python-client-2.106.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-uritemplate-4.1.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-uritemplate-4.1.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe protobuf-4.23.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-httplib2-0.22.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-googleapis-common-protos-1.61.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-protobuf-4.24.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-grpcio-1.56.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe protobuf-4.23.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-uritemplate-4.1.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-google-api-python-client-2.106.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-google-api-python-client-2.106.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-uritemplate-4.1.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 217 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-protobuf_4.24.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 218 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 224 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3-pyparsing_3.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 225 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 226 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 228 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 229 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 230 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 238 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 239 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_package_write_ipk_setscene)
NOTE: recipe python3-google-api-python-client-2.106.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-uritemplate-4.1.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 240 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3-pytest_7.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 241 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-google-api-python-client-2.106.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 242 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-google-api-core_2.12.0.bb:do_packagedata_setscene)
NOTE: recipe abseil-cpp-20230802.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 243 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-google-api-python-client_2.106.0.bb:do_packagedata_setscene)
NOTE: recipe python3-google-api-python-client-2.106.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-protobuf-4.24.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 244 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-httplib2_0.22.0.bb:do_packagedata_setscene)
NOTE: recipe python3-pyparsing-3.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-requests-2.31.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-7.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-google-api-core-2.12.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-google-api-python-client-2.106.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 245 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-uritemplate_4.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 250 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-httplib2-0.22.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 251 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_packagedata_setscene)
NOTE: recipe python3-requests-2.31.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-protobuf-4.24.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 271 of 738 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/protobuf/protobuf_4.23.4.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-pytest-7.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-google-api-core-2.12.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 385 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-google-api-core_2.12.0.bb:do_package_setscene)
NOTE: recipe python3-uritemplate-4.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe protobuf-native-4.23.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-pyparsing-3.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-httplib2-0.22.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 638 of 2071 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/protobuf/protobuf_4.23.4.bb:do_fetch)
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 678 of 2071 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-protobuf_4.24.4.bb:do_fetch)
NOTE: Running task 728 of 2071 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-grpcio_1.56.2.bb:do_fetch)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 396 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: recipe python3-uritemplate-4.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-google-api-python-client-2.106.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 402 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-google-api-python-client_2.106.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.11.5-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-protobuf-4.24.4-r0: task do_fetch: Started
NOTE: recipe python3-3.11.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 403 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/coreutils/coreutils_9.4.bb:do_packagedata_setscene)
NOTE: recipe protobuf-4.23.4-r0: task do_fetch: Started
NOTE: Running setscene task 404 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 405 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/binutils/binutils_2.41.bb:do_packagedata_setscene)
NOTE: Running setscene task 406 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc_13.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 407 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/bash/bash_5.2.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 408 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 409 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 410 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: recipe python3-google-api-core-2.12.0-r0: task do_package_setscene: Started
NOTE: recipe abseil-cpp-20230802.0-r0: task do_package_setscene: Started
NOTE: recipe python3-grpcio-1.56.2-r0: task do_fetch: Started
NOTE: recipe python3-google-api-python-client-2.106.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-grpcio-1.56.2-r0: task do_fetch: Succeeded
NOTE: recipe protobuf-native-4.23.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-protobuf-4.24.4-r0: task do_fetch: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 411 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_packagedata_setscene)
NOTE: Running setscene task 412 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 413 of 738 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 415 of 738 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/protobuf/protobuf_4.23.4.bb:do_recipe_qa_setscene)
NOTE: recipe tzdata-2023c-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.41-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.4-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-google-api-python-client-2.106.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 785 of 2071 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-protobuf_4.24.4.bb:do_unpack)
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe protobuf-native-4.23.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 791 of 2071 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-grpcio_1.56.2.bb:do_unpack)
NOTE: recipe tzdata-2023c-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe abseil-cpp-native-20230802.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-protobuf-4.24.4-r0: task do_unpack: Started
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 429 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: recipe protobuf-native-4.23.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 431 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 432 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: recipe python3-grpcio-1.56.2-r0: task do_unpack: Started
NOTE: recipe binutils-2.41-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 439 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_packagedata_setscene)
NOTE: recipe gcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 444 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-google-api-core-2.12.0-r0: task do_package_setscene: Succeeded
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 449 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-google-api-core_2.12.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 450 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 451 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_populate_sysroot_setscene)
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe abseil-cpp-native-20230802.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe coreutils-9.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 462 of 738 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb:do_recipe_qa_setscene)
NOTE: recipe elfutils-0.189-r0: task do_packagedata_setscene: Started
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-google-api-core-2.12.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 468 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.11.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_packagedata_setscene: Started
NOTE: recipe abseil-cpp-native-20230802.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-protobuf-4.24.4-r0: task do_unpack: Succeeded
NOTE: Running task 873 of 2071 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-protobuf_4.24.4.bb:do_patch)
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 472 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_packagedata_setscene)
NOTE: recipe abseil-cpp-native-20230802.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-google-api-core-2.12.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe elfutils-0.189-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 474 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-google-api-core_2.12.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 476 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 478 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: Running setscene task 480 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 484 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 486 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 488 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_packagedata_setscene)
NOTE: recipe python3-protobuf-4.24.4-r0: task do_patch: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-google-api-core-2.12.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-google-api-core-2.12.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-protobuf-4.24.4-r0: task do_patch: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 503 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/file/file_5.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 505 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/curl/curl_8.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 507 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/gnutls/gnutls_3.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 512 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_packagedata_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libarchive-3.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 522 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 524 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gnutls-3.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 530 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 531 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 532 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 533 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 534 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 535 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 537 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_recipe_qa_setscene)
NOTE: recipe curl-8.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe protobuf-4.23.4-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 541 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 542 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 543 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: recipe zstd-1.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 544 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: recipe curl-8.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 545 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_packagedata_setscene)
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 546 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.11.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 549 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 556 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 560 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-connectivity/openssl/openssl_3.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 561 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-connectivity/openssl/openssl_3.1.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 563 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 565 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/expat/expat_2.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 566 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 568 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe abseil-cpp-20230802.0-r0: task do_package_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 572 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 574 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb:do_recipe_qa_setscene)
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 576 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 578 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 580 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 581 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 583 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: recipe abseil-cpp-20230802.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 585 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 588 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 594 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 596 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 598 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 601 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libcap/libcap_2.69.bb:do_packagedata_setscene)
NOTE: recipe libnsl2-2.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe abseil-cpp-20230802.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 605 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_packagedata_setscene)
NOTE: Running setscene task 607 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 610 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 612 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 614 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-connectivity/openssl/openssl_3.1.4.bb:do_recipe_qa_setscene)
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 617 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/sqlite/sqlite3_3.43.2.bb:do_packagedata_setscene)
NOTE: recipe libnsl2-2.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 618 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/sqlite/sqlite3_3.43.2.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.47-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.1.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-grpcio-1.56.2-r0: task do_unpack: Succeeded
NOTE: Running task 1101 of 2071 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/protobuf/protobuf_4.23.4.bb:do_unpack)
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.43.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.43.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 627 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 629 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 631 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1151 of 2071 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-grpcio_1.56.2.bb:do_patch)
NOTE: recipe openssl-3.1.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 636 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_recipe_qa_setscene)
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 640 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libunistring/libunistring_1.1.bb:do_packagedata_setscene)
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 646 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe protobuf-4.23.4-r0: task do_unpack: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.43.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-grpcio-1.56.2-r0: task do_patch: Started
NOTE: recipe libgpg-error-1.47-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 652 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 653 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.43.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 657 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/sqlite/sqlite3_3.43.2.bb:do_recipe_qa_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.43.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.43.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 669 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-grpcio-1.56.2-r0: task do_patch: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 671 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 676 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/zlib/zlib_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 677 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/zlib/zlib_1.3.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 687 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 689 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/zlib/zlib_1.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 690 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 692 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 694 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 695 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 697 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 699 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 700 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 701 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 702 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 704 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 708 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 709 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 711 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 716 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 717 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 719 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe protobuf-4.23.4-r0: task do_unpack: Succeeded
NOTE: Running task 1321 of 2071 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/protobuf/protobuf_4.23.4.bb:do_patch)
NOTE: recipe protobuf-4.23.4-r0: task do_patch: Started
NOTE: recipe protobuf-4.23.4-r0: task do_patch: Succeeded
NOTE: Running task 1322 of 2071 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/protobuf/protobuf_4.23.4.bb:do_generate_toolchain_file)
NOTE: recipe protobuf-4.23.4-r0: task do_generate_toolchain_file: Started
NOTE: recipe protobuf-4.23.4-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 722 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 724 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 725 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 727 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 735 of 738 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1716 of 2071 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/protobuf/protobuf_4.23.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1899 of 2071 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb:do_packagedata)
NOTE: recipe protobuf-4.23.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe abseil-cpp-20230802.0-r0: task do_packagedata: Started
NOTE: recipe protobuf-4.23.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2046 of 2071 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/protobuf/protobuf_4.23.4.bb:do_configure)
NOTE: recipe abseil-cpp-20230802.0-r0: task do_packagedata: Succeeded
NOTE: recipe protobuf-4.23.4-r0: task do_configure: Started
NOTE: recipe protobuf-4.23.4-r0: task do_configure: Succeeded
NOTE: Running task 2047 of 2071 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/protobuf/protobuf_4.23.4.bb:do_configure_ptest_base)
NOTE: recipe protobuf-4.23.4-r0: task do_configure_ptest_base: Started
NOTE: recipe protobuf-4.23.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2048 of 2071 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/protobuf/protobuf_4.23.4.bb:do_compile)
NOTE: recipe protobuf-4.23.4-r0: task do_compile: Started
NOTE: recipe protobuf-4.23.4-r0: task do_compile: Succeeded
NOTE: Running task 2049 of 2071 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/protobuf/protobuf_4.23.4.bb:do_compile_ptest_base)
NOTE: recipe protobuf-4.23.4-r0: task do_compile_ptest_base: Started
NOTE: recipe protobuf-4.23.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2050 of 2071 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/protobuf/protobuf_4.23.4.bb:do_install)
NOTE: recipe protobuf-4.23.4-r0: task do_install: Started
NOTE: recipe protobuf-4.23.4-r0: task do_install: Succeeded
NOTE: Running task 2051 of 2071 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/protobuf/protobuf_4.23.4.bb:do_install_ptest_base)
NOTE: recipe protobuf-4.23.4-r0: task do_install_ptest_base: Started
NOTE: recipe protobuf-4.23.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2052 of 2071 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/protobuf/protobuf_4.23.4.bb:do_populate_sysroot)
NOTE: Running task 2053 of 2071 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/protobuf/protobuf_4.23.4.bb:do_package)
NOTE: recipe protobuf-4.23.4-r0: task do_populate_sysroot: Started
NOTE: recipe protobuf-4.23.4-r0: task do_package: Started
NOTE: recipe protobuf-4.23.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2054 of 2071 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-protobuf_4.24.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-protobuf-4.24.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-protobuf-4.24.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2055 of 2071 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-protobuf_4.24.4.bb:do_configure)
NOTE: recipe python3-protobuf-4.24.4-r0: task do_configure: Started
NOTE: recipe python3-protobuf-4.24.4-r0: task do_configure: Succeeded
NOTE: Running task 2056 of 2071 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-protobuf_4.24.4.bb:do_compile)
NOTE: recipe python3-protobuf-4.24.4-r0: task do_compile: Started
NOTE: recipe protobuf-4.23.4-r0: task do_package: Succeeded
NOTE: Running task 2057 of 2071 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/protobuf/protobuf_4.23.4.bb:do_packagedata)
NOTE: recipe protobuf-4.23.4-r0: task do_packagedata: Started
NOTE: recipe protobuf-4.23.4-r0: task do_packagedata: Succeeded
NOTE: recipe python3-protobuf-4.24.4-r0: task do_compile: Succeeded
NOTE: Running task 2058 of 2071 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-protobuf_4.24.4.bb:do_install)
NOTE: recipe python3-protobuf-4.24.4-r0: task do_install: Started
NOTE: recipe python3-protobuf-4.24.4-r0: task do_install: Succeeded
NOTE: Running task 2059 of 2071 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-protobuf_4.24.4.bb:do_package)
NOTE: Running task 2060 of 2071 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-protobuf_4.24.4.bb:do_populate_sysroot)
NOTE: recipe python3-protobuf-4.24.4-r0: task do_populate_sysroot: Started
NOTE: recipe python3-protobuf-4.24.4-r0: task do_package: Started
NOTE: recipe python3-protobuf-4.24.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2061 of 2071 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-grpcio_1.56.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-grpcio-1.56.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-grpcio-1.56.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2062 of 2071 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-grpcio_1.56.2.bb:do_configure)
NOTE: recipe python3-grpcio-1.56.2-r0: task do_configure: Started
NOTE: recipe python3-grpcio-1.56.2-r0: task do_configure: Succeeded
NOTE: Running task 2063 of 2071 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-grpcio_1.56.2.bb:do_compile)
NOTE: recipe python3-grpcio-1.56.2-r0: task do_compile: Started
NOTE: recipe python3-protobuf-4.24.4-r0: task do_package: Succeeded
NOTE: Running task 2064 of 2071 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-protobuf_4.24.4.bb:do_packagedata)
NOTE: recipe python3-protobuf-4.24.4-r0: task do_packagedata: Started
NOTE: recipe python3-protobuf-4.24.4-r0: task do_packagedata: Succeeded
NOTE: recipe python3-grpcio-1.56.2-r0: task do_compile: Succeeded
NOTE: Running task 2065 of 2071 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-grpcio_1.56.2.bb:do_install)
NOTE: recipe python3-grpcio-1.56.2-r0: task do_install: Started
NOTE: recipe python3-grpcio-1.56.2-r0: task do_install: Succeeded
NOTE: Running task 2066 of 2071 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-grpcio_1.56.2.bb:do_package)
NOTE: recipe python3-grpcio-1.56.2-r0: task do_package: Started
NOTE: recipe python3-grpcio-1.56.2-r0: task do_package: Succeeded
NOTE: Running task 2067 of 2071 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-grpcio_1.56.2.bb:do_packagedata)
NOTE: recipe python3-grpcio-1.56.2-r0: task do_packagedata: Started
NOTE: recipe python3-grpcio-1.56.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2068 of 2071 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-google-api-core_2.12.0.bb:do_package_write_ipk)
NOTE: Running task 2069 of 2071 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-google-api-core_2.12.0.bb:do_package_write_deb)
NOTE: Running task 2070 of 2071 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-google-api-core_2.12.0.bb:do_package_write_rpm)
NOTE: recipe python3-google-api-core-2.12.0-r0: task do_package_write_ipk: Started
NOTE: recipe python3-google-api-core-2.12.0-r0: task do_package_write_deb: Started
NOTE: recipe python3-google-api-core-2.12.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-google-api-core-2.12.0-r0: task do_package_write_ipk: Succeeded
NOTE: recipe python3-google-api-core-2.12.0-r0: task do_package_write_deb: Succeeded
NOTE: recipe python3-google-api-core-2.12.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2071 of 2071 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-google-api-python-client_2.106.0.bb:do_build)
NOTE: Tasks Summary: Attempted 2071 tasks of which 2033 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 8 seconds

Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: abseil-cpp-20230802.0-r0 do_packagedata_setscene: QA Issue: Package version for package abseil-cpp-src went backwards which would break package feeds (from 0:20230802.1-r0 to 0:20230802.0-r0) [version-going-backwards]
ERROR: abseil-cpp-20230802.0-r0 do_packagedata_setscene: QA Issue: Package version for package abseil-cpp-dbg went backwards which would break package feeds (from 0:20230802.1-r0 to 0:20230802.0-r0) [version-going-backwards]
ERROR: abseil-cpp-20230802.0-r0 do_packagedata_setscene: QA Issue: Package version for package abseil-cpp-staticdev went backwards which would break package feeds (from 0:20230802.1-r0 to 0:20230802.0-r0) [version-going-backwards]
ERROR: abseil-cpp-20230802.0-r0 do_packagedata_setscene: QA Issue: Package version for package abseil-cpp-dev went backwards which would break package feeds (from 0:20230802.1-r0 to 0:20230802.0-r0) [version-going-backwards]
ERROR: abseil-cpp-20230802.0-r0 do_packagedata_setscene: QA Issue: Package version for package abseil-cpp-doc went backwards which would break package feeds (from 0:20230802.1-r0 to 0:20230802.0-r0) [version-going-backwards]
ERROR: abseil-cpp-20230802.0-r0 do_packagedata_setscene: QA Issue: Package version for package abseil-cpp-locale went backwards which would break package feeds (from 0:20230802.1-r0 to 0:20230802.0-r0) [version-going-backwards]
ERROR: abseil-cpp-20230802.0-r0 do_packagedata_setscene: QA Issue: Package version for package abseil-cpp went backwards which would break package feeds (from 0:20230802.1-r0 to 0:20230802.0-r0) [version-going-backwards]
ERROR: abseil-cpp-20230802.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============4403736470514000998==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-google-api-python-client/python3-google-api-python-client: FILELIST: directory renamed /usr/lib/python3.11/site-packages/google_api_python_client-2.104.0.dist-info -> /usr/lib/python3.11/site-packages/google_api_python_client-2.106.0.dist-info, added "/usr/lib/python3.11/site-packages/googleapiclient/discovery_cache/documents/biglake.v1.json"
Changes to packages/core2-64-poky-linux/python3-google-api-python-client (sysroot):
  /usr/lib/python3.11/site-packages/google_api_python_client-2.104.0.dist-info moved to /usr/lib/python3.11/site-packages/google_api_python_client-2.106.0.dist-info
  /usr/lib/python3.11/site-packages/googleapiclient/discovery_cache/documents/biglake.v1.json was added

--===============4403736470514000998==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-google-api-python-client-upgrade-2.104.0-2.1.patch"

RnJvbSBkM2FmY2FjYzA3Nzg2NjMwYjMxYzA4ZTNjN2RlZTQzMjZmNDVhNjRlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMyBOb3YgMjAyMyAyMToyMzo1OCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtZ29vZ2xlLWFwaS1weXRob24tY2xpZW50OiB1cGdyYWRlIDIuMTA0LjAgLT4gMi4xMDYu
MAoKLS0tCiAuLi50XzIuMTA0LjAuYmIgPT4gcHl0aG9uMy1nb29nbGUtYXBpLXB5dGhvbi1jbGll
bnRfMi4xMDYuMC5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEg
ZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97
cHl0aG9uMy1nb29nbGUtYXBpLXB5dGhvbi1jbGllbnRfMi4xMDQuMC5iYiA9PiBweXRob24zLWdv
b2dsZS1hcGktcHl0aG9uLWNsaWVudF8yLjEwNi4wLmJifSAoODYlKQoKZGlmZiAtLWdpdCBhL21l
dGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtZ29vZ2xlLWFwaS1weXRo
b24tY2xpZW50XzIuMTA0LjAuYmIgYi9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLWdvb2dsZS1hcGktcHl0aG9uLWNsaWVudF8yLjEwNi4wLmJiCnNpbWlsYXJpdHkg
aW5kZXggODYlCnJlbmFtZSBmcm9tIG1ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtZ29vZ2xlLWFwaS1weXRob24tY2xpZW50XzIuMTA0LjAuYmIKcmVuYW1lIHRvIG1l
dGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtZ29vZ2xlLWFwaS1weXRo
b24tY2xpZW50XzIuMTA2LjAuYmIKaW5kZXggMzQ2MDBmMGYzLi40NzZhZGM0ODMgMTAwNjQ0Ci0t
LSBhL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtZ29vZ2xlLWFw
aS1weXRob24tY2xpZW50XzIuMTA0LjAuYmIKKysrIGIvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy1nb29nbGUtYXBpLXB5dGhvbi1jbGllbnRfMi4xMDYuMC5iYgpA
QCAtNCw3ICs0LDcgQEAgSE9NRVBBR0UgPSAiaHR0cHM6Ly9naXRodWIuY29tL2dvb2dsZWFwaXMv
Z29vZ2xlLWFwaS1weXRob24tY2xpZW50IgogTElDRU5TRSA9ICJBcGFjaGUtMi4wIgogTElDX0ZJ
TEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9ODZkM2YzYTk1YzMyNGM5NDc5YmQ4OTg2
OTY4ZjQzMjciCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJiYmM2NjUyMGU3ZmU5NDE3YjkzZmQx
MTNmMmEwYTFhZmE3ODlkNjg2ZGU5MDA5YjZlOTRlNDhmZGVhNTBhNjBmIgorU1JDX1VSSVtzaGEy
NTZzdW1dID0gImY2YTM4NjJiZTJmNmU1ZTA1MzZkN2JkNDdiNWFmM2YyNGFjMGI5MTQ3Yzc2Yzgz
MGNhZmIzMzI5ZDcxZDU3MjQiCiAKIGluaGVyaXQgcHlwaSBzZXR1cHRvb2xzMwogCi0tIAoyLjM5
LjIKCg==

--===============4403736470514000998==--

