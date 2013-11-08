Return-Path: <andrea.adami@gmail.com>
Received: from mail-ea0-f179.google.com (mail-ea0-f179.google.com
	[209.85.215.179])
	by mail.openembedded.org (Postfix) with ESMTP id C65756D7CA
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Nov 2013 01:02:42 +0000 (UTC)
Received: by mail-ea0-f179.google.com with SMTP id q15so594068ead.38
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Nov 2013 17:02:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=CPB7Z8Gge4EKORhtm8sjVqcz0QZB64tc+msNTQI7XSY=;
	b=RG1mcf2pfHYwY1yZ8eXzygR0QxMfq9oFIQXszYADxDwPvcRsfmJ361wocLxjVU9D8S
	Mak0wopS8zFB+d6PiJ4Fd1O0zrcQ24Qtw8mtb7p74lHJtL6DEKYYQ4m4DsIpOYeLqJ5f
	Nvg/z4dnWQN50gpSX2yXSzfSnvI6zgBm/zLUrpqp9ICur3TN8fKjlVPzfmM2qXRgmtqT
	aD1X4NPgMeQ8hbBoNo4hYqUb45R3Fl3+88ojCGpWwWyxspH6jua4P4LzOE7lrPkRdonA
	pGOeqQns4WfXUoCMR5q4OS3wiG6t96BSV8a/5OqNpaq0CzBw9dcLPmUyQmLPbE83AGYw
	w2LQ==
X-Received: by 10.14.87.3 with SMTP id x3mr6467eee.76.1383872564259;
	Thu, 07 Nov 2013 17:02:44 -0800 (PST)
Received: from mizar.localdomain
	(host33-1-dynamic.51-79-r.retail.telecomitalia.it. [79.51.1.33])
	by mx.google.com with ESMTPSA id
	v45sm15949739eef.11.2013.11.07.17.02.43 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Nov 2013 17:02:43 -0800 (PST)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  8 Nov 2013 02:02:28 +0100
Message-Id: <05e77b776b0dc83f0423738b2b91e040ad0776af.1383870605.git.andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
In-Reply-To: <cover.1383870605.git.andrea.adami@gmail.com>
References: <cover.1383870605.git.andrea.adami@gmail.com>
In-Reply-To: <cover.1383870605.git.andrea.adami@gmail.com>
References: <cover.1383870605.git.andrea.adami@gmail.com>
Subject: [meta-handheld][PATCH 1/6] linux-yocto: remove POWER_SUPPLY_DEBUG as default
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
X-List-Received-Date: Fri, 08 Nov 2013 01:02:43 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 recipes-kernel/linux/linux-yocto-3.10/zaurus-hardware.cfg | 1 -
 1 file changed, 1 deletion(-)

diff --git a/recipes-kernel/linux/linux-yocto-3.10/zaurus-hardware.cfg b/recipes-kernel/linux/linux-yocto-3.10/zaurus-hardware.cfg
index 9973944..903b810 100644
--- a/recipes-kernel/linux/linux-yocto-3.10/zaurus-hardware.cfg
+++ b/recipes-kernel/linux/linux-yocto-3.10/zaurus-hardware.cfg
@@ -148,7 +148,6 @@ CONFIG_GPIO_SYSFS=y
 # MODULbus GPIO expanders:
 #
 CONFIG_POWER_SUPPLY=y
-CONFIG_POWER_SUPPLY_DEBUG=y
 CONFIG_PDA_POWER=y
 CONFIG_APM_POWER=y
 CONFIG_HWMON=y
-- 
1.8.1.5


