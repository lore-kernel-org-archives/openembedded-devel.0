Return-Path: <andrea.adami@gmail.com>
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
	[209.85.221.42])
	by mail.openembedded.org (Postfix) with ESMTP id 9C5FD78FD1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Aug 2018 14:38:59 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id f12-v6so17396715wrv.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Aug 2018 07:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=vkHWIWVVneASazvF84igIG6Ih4bYi/YJMBSpwba67yY=;
	b=INeFNLHXWJRfs/kupW1yOjCk5cWP7wHcT1oM/lemhuDFyDLdjgp8V2dwXPgvLWIVmV
	KrkJOZGZ6cVosr/chuW5tOIJB7+U7wVh2bSsKBMhLN86qMku92iX7/MFP/On+DcG8zH4
	UT787RWTSD5hd70IxwJRhFmuaXieljYvVt7MKbsibANGRraBreIQa5cvbnJF6WoJyhMu
	H2MsMI1DA0VREneu5ooFbuUq6a7MLr/JqTvil+Yjq5RhFsQIug83FASy0gyxhPuQAivr
	emK+J8cXA2MUzyV0lbGfK4+p8cfpAjdIwMohQ7mlF7kurQSq7nlUIN7wZEzxC8u7fl9y
	vn3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=vkHWIWVVneASazvF84igIG6Ih4bYi/YJMBSpwba67yY=;
	b=H+47xlo30ACLKQudcrMlgf8qqJB/l90MfgnTMJnmFTMIYvtDq2byVZlCnFcDb/sreH
	/+WxNLxEoDH0eMs23Al9CxFeVQ720QjTBL3+3X5EvqLeEr+68/e7k9/41ankZ+mRcp3y
	Ogiycklmj2zLO/HOtogDWbdSpgFKZGA1ju9Nu4HBnymtlchBx5GotkpiSx+xY0kS/RUt
	XcGgV2Zj8p/0BEf09drTHsDdjtEeZFLWF/0Nd8R1OGIOfk6eXasRqaH4k0WOL5K5s7gW
	Yt+LMJ+Snv6SuGr21rhAx9EfNRxSzDWFEOS7u0u+Ga5YVMwDo6Y+6n99iuFkUa4RFhJq
	if1A==
X-Gm-Message-State: AOUpUlE6NJ1aAs3JGkpmLcDzztvB7KJfMvQg4DsdmvXo7/rjq6h6hCZM
	ivoSqHfLjULz6o5qUU2QBwtgYCL3
X-Google-Smtp-Source: AA+uWPzCJbAacfQMjnidbPP1iWfJk14aMHQsxpDKv+15a+oVvUY6BotoilRXaEHjTpD0prcyAJMI8w==
X-Received: by 2002:adf:eb87:: with SMTP id
	t7-v6mr13575403wrn.123.1534257540190; 
	Tue, 14 Aug 2018 07:39:00 -0700 (PDT)
Received: from localhost.localdomain
	(host146-228-dynamic.182-80-r.retail.telecomitalia.it.
	[80.182.228.146]) by smtp.gmail.com with ESMTPSA id
	l15-v6sm20296997wrt.67.2018.08.14.07.38.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 14 Aug 2018 07:38:59 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 14 Aug 2018 16:38:17 +0200
Message-Id: <1534257497-12184-2-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1534257497-12184-1-git-send-email-andrea.adami@gmail.com>
References: <1534257497-12184-1-git-send-email-andrea.adami@gmail.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 2/2] pcmciautils: depend on bison-native
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
X-List-Received-Date: Tue, 14 Aug 2018 14:38:59 -0000

pcmciautils needs yacc as well as lex.

Backport of oe-core commit dd5208ae22d4

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta-oe/recipes-bsp/pcmciautils/pcmciautils_018.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-bsp/pcmciautils/pcmciautils_018.bb b/meta-oe/recipes-bsp/pcmciautils/pcmciautils_018.bb
index 2e59f05..fc06455 100644
--- a/meta-oe/recipes-bsp/pcmciautils/pcmciautils_018.bb
+++ b/meta-oe/recipes-bsp/pcmciautils/pcmciautils_018.bb
@@ -5,7 +5,7 @@ SECTION = "kernel/userland"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
-DEPENDS = "udev sysfsutils flex-native"
+DEPENDS = "udev sysfsutils flex-native bison-native"
 RDEPENDS_${PN} = "udev module-init-tools"
 
 PR = "r1"
-- 
2.7.4


