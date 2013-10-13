Return-Path: <andrea.adami@gmail.com>
Received: from mail-ee0-f47.google.com (mail-ee0-f47.google.com [74.125.83.47])
	by mail.openembedded.org (Postfix) with ESMTP id ECE6F6CD55
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Oct 2013 23:26:50 +0000 (UTC)
Received: by mail-ee0-f47.google.com with SMTP id d49so3003493eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Oct 2013 16:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=n6fvw50vhrxEaXTADePErevGpiliO2+3aTjRmBlFzJk=;
	b=0Qqg0yPY0N0nIBAjBHHaw037O/jMkDhvgf37C6uoXon9W4iiHBFlTk80FBmM50NBzv
	r8Qr5T74PMGJjE1NKuPx35mqUshMhiFoufqM34xDhCfUc/QDmfDRjT7tUs7BVk0OEubB
	xtGT+Qnj1vVbjhWZ/TYZeX91DJ4Ex8ulMjZQyE9/vXGjZR+lXGL5BkF27dTXMMJWlJbW
	7WXXPCnHfvfk6oC7rJTa4EwWu7bL3/JUl1JuAo2BUHIno8yCnYh4jUStPeQ3lssLISN2
	u097Z3o1PbSDw1mkLhpPNHC9rBDEyQTtOtc41/OYVVdwTrk/5O1ZbSGp4bW1q8Si2qCA
	Kc/A==
X-Received: by 10.14.198.197 with SMTP id v45mr28822een.52.1381706812291;
	Sun, 13 Oct 2013 16:26:52 -0700 (PDT)
Received: from mizar.localdomain
	(host121-51-dynamic.0-79-r.retail.telecomitalia.it. [79.0.51.121])
	by mx.google.com with ESMTPSA id
	m54sm145933934eex.2.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 13 Oct 2013 16:26:51 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 14 Oct 2013 01:26:44 +0200
Message-Id: <1381706804-21803-3-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
In-Reply-To: <1381706804-21803-1-git-send-email-andrea.adami@gmail.com>
References: <1381706804-21803-1-git-send-email-andrea.adami@gmail.com>
Subject: [meta-handheld][PATCH 3/3] linux.inc: remove LOGO_SIZE logic. BTW old linux.inc is deprecated.
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
X-List-Received-Date: Sun, 13 Oct 2013 23:26:51 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 recipes-kernel/linux/linux.inc | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/recipes-kernel/linux/linux.inc b/recipes-kernel/linux/linux.inc
index f920b84..81c096a 100644
--- a/recipes-kernel/linux/linux.inc
+++ b/recipes-kernel/linux/linux.inc
@@ -14,13 +14,6 @@ ARM_KEEP_OABI ?= "1"
 # You can define CMDLINE_DEBUG in your local.conf or distro.conf to override this behaviour
 CMDLINE_DEBUG ?= "loglevel=3"
 
-# Kernel bootlogo is distro-specific (default is OE logo).
-# Logo resolution (qvga, vga, ...) is machine-specific.
-LOGO_SIZE ?= '${@base_conditional("MACHINE_GUI_CLASS", "bigscreen", "vga", "qvga", d)}'
-# To use this, add file://${LOGO_SIZE}/logo_linux_clut224.ppm.bz2 or similar
-# to your kernel recipe, and then structure your logos for each resolution
-# accordingly.
-
 LOCALVERSION ?= ""
 
 kernel_conf_variable() {
-- 
1.8.1.5


