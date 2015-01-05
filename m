Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f42.google.com (mail-wg0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id C210872856
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Jan 2015 12:54:45 +0000 (UTC)
Received: by mail-wg0-f42.google.com with SMTP id k14so27489710wgh.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Jan 2015 04:54:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=C1C/15Uk5iAQ5AsVwP1lDaxnEnVoD94anmNf10ABUD8=;
	b=wIsl6gESgEOtF1TJtnB6xT9R7toL20bmnAFVhDVSqMpHkSLsOHh3wXAxNYpm6Xbrs3
	SEbNQD4RNUxk8LnBN7OK4iC7gB5a0RxW3aPNo/xQ31jMp4ZuK47ytiRaY+fSB804pwva
	XVXhiNMaZcsRb9fu3ub5CocCkeRzgCUldOUdwhwc31vkQB/xzeg8Z7DrBQQVpildy6/F
	jLW0EfS9teK9STbGx5Ugdk+Odxs/gymHe2PrcrkSltXEN4YL3G/1wSXt5XRLT1jnNWYX
	A7f+eg2oa4LrTB04aoMqudKdXzebli/lHN/F/53opc2gXzPzh/srlHB0MNiB1XtlD7ca
	OFjQ==
X-Received: by 10.180.94.163 with SMTP id dd3mr25923535wib.82.1420462484647;
	Mon, 05 Jan 2015 04:54:44 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	dn2sm9806859wib.14.2015.01.05.04.54.43
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Jan 2015 04:54:44 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  5 Jan 2015 13:54:41 +0100
Message-Id: <1420462481-19889-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <1420462481-19889-1-git-send-email-Martin.Jansa@gmail.com>
References: <1420462481-19889-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 2/2] xfce4-wavelan-plugin: Fix LICENSE format
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
X-List-Received-Date: Mon, 05 Jan 2015 12:54:46 -0000

* the COPYING file looks more like slightly modified BSD license and BenediktMeurer, FlorianRivoal
  are just names of Copyright holders, but I'll leave that to recipe maintainer
  fixes:
    WARNING: Recipe xfce4-wavelan-plugin, LICENSE (BenediktMeurer FlorianRivoal)
    has invalid format, LICENSES must have operator "([&|() ])" between them.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-xfce/recipes-panel-plugins/wavelan/xfce4-wavelan-plugin_0.5.11.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-xfce/recipes-panel-plugins/wavelan/xfce4-wavelan-plugin_0.5.11.bb b/meta-xfce/recipes-panel-plugins/wavelan/xfce4-wavelan-plugin_0.5.11.bb
index 1883a0c..487a5b8 100644
--- a/meta-xfce/recipes-panel-plugins/wavelan/xfce4-wavelan-plugin_0.5.11.bb
+++ b/meta-xfce/recipes-panel-plugins/wavelan/xfce4-wavelan-plugin_0.5.11.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Panel plugin displaying stats from a wireless lan interface"
 HOMEPAGE = "http://goodies.xfce.org/projects/panel-plugins/xfce4-wavelan-plugin"
-LICENSE = "BenediktMeurer FlorianRivoal"
+LICENSE = "BenediktMeurer & FlorianRivoal"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e1e5872df9c5cf1a23f16493d9104920"
 
 inherit xfce-panel-plugin
-- 
2.2.1


