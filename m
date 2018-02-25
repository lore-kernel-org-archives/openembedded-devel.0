Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f68.google.com (mail-pl0-f68.google.com
	[209.85.160.68])
	by mail.openembedded.org (Postfix) with ESMTP id 46D9C78704
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Feb 2018 21:33:34 +0000 (UTC)
Received: by mail-pl0-f68.google.com with SMTP id d4so8116685pll.5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Feb 2018 13:33:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=CnZriUDamy949F+6XEZ0OT1Je8N33pIPwlMz+MlPXso=;
	b=BTO0N6iDm1HWHzy8mks9mH+PBP9fjIHvI6OZzPCB0ytElt0XeJbjXPpQ5HCQ9W4UaL
	vwtwturTkOn4ciUKupW+HQmQ76mwZiOAvhujzN7SUe4oJVkkIb5wrLUkB3Us2qF6favH
	4je5i8kUEaXgt/dLILcb9VN1PTL7mIoijN2C4UWSklWMWwDTaLKnDtFRC8WIO/QB5Sqx
	q9fMjfPy+W3NQ+ZveF/uXWc54/JzoSomGTXllZoalPmrFI/wmkJGneWb8A8x9BLQuP6R
	wqBhncNz1+oxf/8gSwHPnGvppFzCvXAzPr8MQIaYpxrdWBmPuXCwpKc0dGrfTqQHo7uQ
	MKWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=CnZriUDamy949F+6XEZ0OT1Je8N33pIPwlMz+MlPXso=;
	b=WftzZs6Y6t2O6iYjPpMg83rnd1PmNrBUHdGDLEYOJNkHwkMfhMK7pIZCpYiOaLZtwO
	1kH8r4KZB87/8MhmBP6duQsszDQ82uz9coUJ3WFOpujb1O2oybdp3fKu1S93k5arEqXp
	iEJB1ryTWGIkt3Q5AaadN/glja0elP+Mwpd6kqqnSLqFd4sBGrxx3VAnEuqiA/CQ59f+
	NAmw9Zq3BFC0rGTHyoFGs4aK8W+BNjTzRot7l5c0QnoPCAlCFpfgIxjFyX+O4qfkpLXU
	KbzYduU6Zcd3QyBDQvRtHWtUw9ntYVXgIOjwsfCYsEc8pSVo2qFyilM7yqlS/vJwhOzM
	cryQ==
X-Gm-Message-State: APf1xPByoEvdqOPQw+YoZjO+1Wr3A3eseiCADuv6ulCsnOJlZb/9q380
	CkaqsdFQ9p+jsWnaQhBN9OTyfw==
X-Google-Smtp-Source: AH8x226ecSrtxmeYCsD22AUqKtbRbrokiEGa4dVCDvblg6tb5QNPsP3zB4/efBGOsxqiWSC2e3dspA==
X-Received: by 2002:a17:902:8c97:: with SMTP id
	t23-v6mr8513744plo.372.1519594416333; 
	Sun, 25 Feb 2018 13:33:36 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4000:1184:ad95:2a34:2e02:2fdf])
	by smtp.gmail.com with ESMTPSA id
	64sm12014600pgj.39.2018.02.25.13.33.35
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 25 Feb 2018 13:33:35 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 25 Feb 2018 13:32:59 -0800
Message-Id: <1519594406-24490-9-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1519594406-24490-1-git-send-email-akuster808@gmail.com>
References: <1519594406-24490-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 09/36] ipmitool: move to recipes-kernel
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 25 Feb 2018 21:33:35 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/{recipes-support => recipes-kernel}/ipmitool/ipmitool_1.8.18.bb | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-oe/{recipes-support => recipes-kernel}/ipmitool/ipmitool_1.8.18.bb (100%)

diff --git a/meta-oe/recipes-support/ipmitool/ipmitool_1.8.18.bb b/meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.18.bb
similarity index 100%
rename from meta-oe/recipes-support/ipmitool/ipmitool_1.8.18.bb
rename to meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.18.bb
-- 
2.7.4


