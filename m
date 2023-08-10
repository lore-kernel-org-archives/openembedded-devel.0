Return-Path: <jsbronder@cold-front.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20B6EC04E69
	for <webhook@archiver.kernel.org>; Thu, 10 Aug 2023 15:40:17 +0000 (UTC)
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
 by mx.groups.io with SMTP id smtpd.web10.20615.1691682009284919827
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Aug 2023 08:40:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cold-front.org header.s=mesmtp header.b=Z/mTftnP;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=GOBNZ8WH;
 spf=pass (domain: cold-front.org, ip: 64.147.123.21, mailfrom: jsbronder@cold-front.org)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id A19CC32004AE;
	Thu, 10 Aug 2023 11:40:08 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Thu, 10 Aug 2023 11:40:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cold-front.org;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=mesmtp; t=1691682008;
	 x=1691768408; bh=mWjIdl/pgrJ9ZMjCvcO4Ju+B6WfVfuWVZGRXSkiTM5M=; b=
	Z/mTftnP0e+CnC93O2yZgL/34mEnUfOXhaVvaC5kZSTZjTXl1yr9dvs2Zk9Epu1O
	faKB2CoUJejDz6QdBvVYc43N/t3ErS8rlebqsPtheabWORJ+6RmlokdQLvIC5sef
	uF0hfcJBNOI5u/tWfmCWCC72rRnLiSs8CwWIoBvJoQo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1691682008; x=
	1691768408; bh=mWjIdl/pgrJ9ZMjCvcO4Ju+B6WfVfuWVZGRXSkiTM5M=; b=G
	OBNZ8WHGvbDzJoh2lrskHZi3AzJ8un1/qbrTeNNAHYcDHLmMQvhbhPIGKeEHBpfl
	yqxx6nBZAPiWPXzfVmFLEGMjdlpXmkMN1w+Uk6Q4H40tNsa4hVDOGeQUI2oQSwIB
	HwT0UjAYiop6cJmVF3Y+ESp7vodAzVSO2SvIBNrRktRMhbYtBPYu0sPf6wPDYaw+
	K8fE2td1CF7pHAiprEAB97zH/Wh/o7K2xldO1qU85WX9PjvlZiKUcDiuwSlBQhL7
	GPvTLixUiezPxhxhrXAsO4s01oVIPsrKTokd8WViouUPvJkR9OwUk6J0g6RBZJ+f
	uJV4qbLSupkV+dLOoKOAA==
X-ME-Sender: <xms:2ATVZP_kt3hqormrPvtjKoEJqCFhBGvuSK5_BujLDk7JGMLZYBpHvg>
    <xme:2ATVZLu2EyOraE6mXI23X2I006Knck9ERpR9AghCMaWGWG8MqsoLs2QL4hUHQ9YTv
    GyiUQY75YGCmFEJiQ>
X-ME-Received: <xmr:2ATVZNAnVTsK4pwEHXkjpMlYL5T7lyfgzhuYdtOeNoJ_UyrcD9SUJ2DVqA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrleeigdeludcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomheplfhushhtihhnuceurhhonhguvghruceojhhssghrohhnuggv
    rhestgholhguqdhfrhhonhhtrdhorhhgqeenucggtffrrghtthgvrhhnpeevteehuddule
    dtheeigeefveetfedtteevhfdvgfejudfgieeiieffudehhffgteenucffohhmrghinhep
    ghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomhepjhhssghrohhnuggvrhestgholhguqdhfrhhonhhtrdhorhhg
X-ME-Proxy: <xmx:2ATVZLc_qh3OlZtq6firuYF67tpiPMWKo7Y3t1jELAqt0izSZx9srQ>
    <xmx:2ATVZENPs0HBsSYso0yVV-HVEUPx4DCg-7T6xh-j5g_daGJw6QJ5JA>
    <xmx:2ATVZNmNOb_tghTgiMLF42JZI6xnoXmsdZQxyOBK1IM_OLbr_5taqg>
    <xmx:2ATVZOVuEaNWgAPjhfhhHzKIvJnke2-yoompO0gOH1uMfAbAZA8zWQ>
Feedback-ID: iea0042cb:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Aug 2023 11:40:07 -0400 (EDT)
From: Justin Bronder <jsbronder@cold-front.org>
To: openembedded-devel@lists.openembedded.org
Cc: Justin Bronder <jsbronder@cold-front.org>
Subject: [meta-python][PATCH 3/5] python3-types-psutil: add 5.9.5.16
Date: Thu, 10 Aug 2023 11:39:50 -0400
Message-ID: <20230810153953.17293-3-jsbronder@cold-front.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230810153953.17293-1-jsbronder@cold-front.org>
References: <20230810153953.17293-1-jsbronder@cold-front.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Aug 2023 15:40:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104327

Dependency of python3-mypy.

Signed-off-by: Justin Bronder <jsbronder@cold-front.org>
---
 .../python/python3-types-psutil_5.9.5.16.bb            | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-types-psutil_5.9.5.16.bb

diff --git a/meta-python/recipes-devtools/python/python3-types-psutil_5.9.5.16.bb b/meta-python/recipes-devtools/python/python3-types-psutil_5.9.5.16.bb
new file mode 100644
index 000000000..02245be62
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-types-psutil_5.9.5.16.bb
@@ -0,0 +1,10 @@
+SUMMARY = "Typing stubs for psutil"
+HOMEPAGE = "https://github.com/python/typeshed"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=ef4dc1e740f5c928f1608a4a9c7b578e"
+
+inherit pypi setuptools3
+
+SRC_URI[sha256sum] = "4e9b219efb625d3d04f6bf106934f87cab49aa41a94b0a3b3089403f47a79228"
+
+BBCLASSEXTEND = "native"
-- 
2.41.0


