Return-Path: <pascal.bach@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CCD9C433EF
	for <webhook@archiver.kernel.org>; Thu,  7 Jul 2022 10:57:44 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net
 (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.web08.4165.1657191454240276121
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Jul 2022 03:57:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=pascal.bach@siemens.com header.s=fm1 header.b=kjFzBPwI;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225,
 mailfrom: fm-402798-20220707105730966463dbc3fb7c8c70-sdlx73@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id
 20220707105730966463dbc3fb7c8c70
        for <openembedded-devel@lists.openembedded.org>;
        Thu, 07 Jul 2022 12:57:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=pascal.bach@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=TzRE1fylOQOQCtO5QfURVRt7T+/Om+3U/mobeEeYlis=;
 b=kjFzBPwIUDoKIFcou3q84se7jMvo13DNQBa+HfvFNgJKOPZ7Q/ln7rPwNfuDdBlRt0XbX4
 HO/BMcf554IWB59l5K1zlFjvZ1qR53KO8NsG4bhoXhDSmGSQh1ug0VVuVKSSatrsWrAfGPzX
 ATWtBFo+pW05G4OHtsWQC5aLdHBMs=;
From: pascal.bach@siemens.com
To: openembedded-devel@lists.openembedded.org
Cc: Pascal Bach <pascal.bach@siemens.com>
Subject: [meta-oe][PATCH] python3-pybind11: upgrade 2.8.1 -> 2.9.2
Date: Thu,  7 Jul 2022 12:57:27 +0200
Message-Id: <20220707105727.1475868-1-pascal.bach@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-402798:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Jul 2022 10:57:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97777

From: Pascal Bach <pascal.bach@siemens.com>

Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 .../{python3-pybind11_2.8.1.bb => python3-pybind11_2.9.2.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pybind11_2.8.1.bb => python3-pybind11_2.9.2.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-pybind11_2.8.1.bb b/meta-python/recipes-devtools/python/python3-pybind11_2.9.2.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-pybind11_2.8.1.bb
rename to meta-python/recipes-devtools/python/python3-pybind11_2.9.2.bb
index 4d94e2033..433bfd60e 100644
--- a/meta-python/recipes-devtools/python/python3-pybind11_2.8.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pybind11_2.9.2.bb
@@ -5,11 +5,11 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=774f65abd8a7fe3124be2cdf766cd06f"
 
 DEPENDS = "boost"
 
-SRC_URI = "git://github.com/pybind/pybind11.git;branch=master;protocol=https \
+SRC_URI = "git://github.com/pybind/pybind11.git;branch=stable;protocol=https \
            file://0001-Do-not-strip-binaries.patch \
            file://0001-Do-not-check-pointer-size-when-cross-compiling.patch \
 "
-SRCREV = "f7b499615e14d70ab098a20deb0cdb3889998a1a"
+SRCREV = "914c06fb252b6cc3727d0eedab6736e88a3fcb01"
 
 S = "${WORKDIR}/git"
 
-- 
2.37.0


