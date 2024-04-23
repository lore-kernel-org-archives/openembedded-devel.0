Return-Path: <jsbronder@cold-front.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70ED2C4345F
	for <webhook@archiver.kernel.org>; Tue, 23 Apr 2024 20:45:00 +0000 (UTC)
Received: from fout7-smtp.messagingengine.com (fout7-smtp.messagingengine.com [103.168.172.150])
 by mx.groups.io with SMTP id smtpd.web11.831.1713905091646043035
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Apr 2024 13:44:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cold-front.org header.s=fm1 header.b=haIUiw5g;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=QYVsRhFV;
 spf=pass (domain: cold-front.org, ip: 103.168.172.150, mailfrom: jsbronder@cold-front.org)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfout.nyi.internal (Postfix) with ESMTP id 034D01380198;
	Tue, 23 Apr 2024 16:44:51 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Tue, 23 Apr 2024 16:44:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cold-front.org;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1713905090; x=
	1713991490; bh=y7niyBtSbdGCMqaMD8LweMdYjcVQIIwFeuzfpVwPdQY=; b=h
	aIUiw5gys6vV4RJJtwZlGd07c654lZOZ1UXcTU2Mq0d/adPJ8AZDec4LyvCURxDM
	4Tj+crKh1fUmF3aRtWY0K4oIEq6vqdzK4M3k1vymys5XcfNWCrlTabi8cV89nIPv
	KrARDmYsvHOPq88MPczGN39ePHiSBoBALIfgSImG3PXeq3UDJKomuVYKS+Liukmy
	6NkYSjYi/iHRIflK7Z78fFSGwUJVj9CyvB2GcZqKZkJ8iwX0n8CpqMeD0nEUnqYZ
	DEJuuMCRkf2l7jxQ2cqlq/lPwVK4uUHRMWZYNsaNkvstk+oyAGOJdRr/r1J8j1vu
	J7Ght2LsMvT2l36Xz3Nuw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1713905090; x=
	1713991490; bh=y7niyBtSbdGCMqaMD8LweMdYjcVQIIwFeuzfpVwPdQY=; b=Q
	YVsRhFV08/Nfo4LEIM8k2QvuYYhUTR4u47mEBUFMfT3ii4YyrDcidY1LOM8MUdH0
	TI/TMNk+BVPKdRCI3tZ1Z+BVH5nIxVRMlihta/UhX5IFe/gSDgnV493lttYfkyOI
	8XYRZAKlhwSifI/70RKL+Gp5/hqEjclkbSYYj7//WZOX2KExDbpnBRNjLU5gnO8o
	fTcw4fZvWWvwSofD1QxxvrMi+rJyl+jPJyzqd00A/GJ0CMR9XriDEtDiPw3fzl7i
	FMvbBMNCEza/OEMwiZhGVeMdpD8Stuxt1QuxdYo4e35rHJrR7uHBrG42ZGg8iDdi
	git0EA5y/N5rFx2xTU7pQ==
X-ME-Sender: <xms:wh0oZiJ5foImChjVRrCptzTtTUYPL5BYT_fgUqn66R4df_JHUxQLAQ>
    <xme:wh0oZqI7_J_hkyGTAZbf6HvLMW40-dwPm64qKVJZ1AHY8D6AKQTgQYeYVFHhdxisK
    ilwREDjOETndT2Gag>
X-ME-Received: <xmr:wh0oZitIsShF6nxL-pXzSCT0pWV2u0qGafAePFiv1RmNqjMSh9JVjQ1CeWLxuzqVM7fbAH6HH7va5euiw_jbLrXo8cJ7MwDHAbNgnSd7GQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudeluddgudehhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgjfhgggfestd
    ekredtredttdenucfhrhhomheplfhushhtihhnuceurhhonhguvghruceojhhssghrohhn
    uggvrhestgholhguqdhfrhhonhhtrdhorhhgqeenucggtffrrghtthgvrhhnpeevfffhve
    fhteeluddtheduteetieefueeigfetfeffveeluddtjefhkefftedtveenucevlhhushht
    vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjshgsrhhonhguvghrse
    gtohhlugdqfhhrohhnthdrohhrgh
X-ME-Proxy: <xmx:wh0oZnbI2bAsKKAOoI-5VO5RVlzQdO-K_0QB59Rz6vsA6I_LqHs7lg>
    <xmx:wh0oZpYi4FN6tSYhjEcXTUqxzIRrtiBHOPZa5MpD9jcCYFpYtEfrIg>
    <xmx:wh0oZjAasIyZvjUH13BUVE_ScA2UA5rArPwl84HgMJPSsuoYSH4uQw>
    <xmx:wh0oZvbXX1XWIA1C8Pp-Fy3GESSc013QOyuVTDJdGSf2vAcN5eNJTA>
    <xmx:wh0oZoms2OvtoryBgkAfuInYjgWG0SFQuAI1ZqHWyZnjRMI-SEklshmN>
Feedback-ID: iea0042cb:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 23 Apr 2024 16:44:50 -0400 (EDT)
From: Justin Bronder <jsbronder@cold-front.org>
To: openembedded-devel@lists.openembedded.org
Cc: Justin Bronder <jsbronder@cold-front.org>
Subject: [meta-python][PATCH 2/2] python3-gcovr: add dep on python3-colorlog
Date: Tue, 23 Apr 2024 16:44:41 -0400
Message-ID: <20240423204441.22005-2-jsbronder@cold-front.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240423204441.22005-1-jsbronder@cold-front.org>
References: <20240423204441.22005-1-jsbronder@cold-front.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Apr 2024 20:45:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110120

Dependency added in gcov-7.1.

Wrapping lines and alphabetically ordering while touching RDEPENDS.

Signed-off-by: Justin Bronder <jsbronder@cold-front.org>
---
 meta-python/recipes-devtools/python/python3-gcovr_7.2.bb | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-gcovr_7.2.bb b/meta-python/recipes-devtools/python/python3-gcovr_7.2.bb
index 8a61a2de0..517124742 100644
--- a/meta-python/recipes-devtools/python/python3-gcovr_7.2.bb
+++ b/meta-python/recipes-devtools/python/python3-gcovr_7.2.bb
@@ -11,6 +11,13 @@ S = "${WORKDIR}/git"
 
 inherit setuptools3
 
-RDEPENDS:${PN} += "python3-jinja2 python3-lxml python3-setuptools python3-pygments python3-multiprocessing"
+RDEPENDS:${PN} += " \
+    python3-colorlog \
+    python3-jinja2 \
+    python3-lxml \
+    python3-multiprocessing \
+    python3-pygments \
+    python3-setuptools \
+"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.44.0


