Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66])
	by mail.openembedded.org (Postfix) with ESMTP id 015A37ED03
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Jul 2019 11:18:50 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id i11so7953088edq.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Jul 2019 04:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=IUxboybVBa49WY5X9+EO5DnA8oAara3vk1VLRy/vAVM=;
	b=RjL6i+AaH9clof1q8E53XN4IIjnu3BuItbqB/lFkWV77l5SgtNC46h31+mRIlP+8V1
	ADyNQu8frhyJdHy7A5Gy5+qom21AFrdl++7u3zgO3IDUpEkSFwtCvkLB/ab/6L3dNH+S
	Fw80dTTt97UTJksgUCkiJM3+uHkur3zM6enuTjEKMFUlM5MR9DilVorXRwpRS7a4xKBD
	JI3xTrG9gOGbl0DE0FkbkM3LegzFftC6n4Zu94KZQl/OLHy8tTrZPgwgiQnunYn9Qedo
	zFugGk9iUgCxh7NRtuMZWK7BB1B5GAqIqrjmPhNX6BEakSJixrNIOjYZdzvMj/GzRLah
	29Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=IUxboybVBa49WY5X9+EO5DnA8oAara3vk1VLRy/vAVM=;
	b=bTFZaSh0vPOOE25Opn1bJ+f8YbMBqpXrtqyY7I0hjGGlInmMcE84cjqW+U4lrCnGSA
	Xu1tRqWXIOVZl+hD3HGwJ2E3MR0+e/BUhDLKOaENiIdkMCSQhUnUGPH0x6DSEWsfFZbj
	iUzSU65vPd4iWPY0eDOdmtOatyXfFgu+eyhsu+fHOUrdyuSEffIypIn/PyCMKyoN2/K0
	TsgJtNnsdVkOBgEHdvR48hrb/qpIXY2Hoz3Q8uOkVDRBXxCY0behSPM6M4GQ0dSXYiSv
	fxBmCrU+pQQukgzR63Ntz6IGtK+Lr9n/6Q/wOuzM8rWuZDnYmoHkm0pkIHcTa0xo7Xg/
	UljQ==
X-Gm-Message-State: APjAAAXToqjlStKnlFF0PVpVvNH6rIIAt+PYgG5b28G1VeX2fDjRTB9h
	ILZwQhIR4nACodGH7N31qoASgwNwrio=
X-Google-Smtp-Source: APXvYqzVqiezGzEZJcBlqpcvNPEYfrTiT4TnBP4oTEZjzp/gn1Am8yJD+g+hz5sMGyAHvNWQ94o2tA==
X-Received: by 2002:aa7:c393:: with SMTP id k19mr3499461edq.76.1562325531521; 
	Fri, 05 Jul 2019 04:18:51 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id h10sm136604edh.64.2019.07.05.04.18.50
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 05 Jul 2019 04:18:50 -0700 (PDT)
Sender: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
From: Ricardo Ribalda Delgado <ricardo@ribalda.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  5 Jul 2019 13:18:06 +0200
Message-Id: <20190705111824.22255-6-ricardo@ribalda.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190705111824.22255-1-ricardo@ribalda.com>
References: <20190705111824.22255-1-ricardo@ribalda.com>
MIME-Version: 1.0
Cc: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Subject: [meta-java][PATCH v4 05/23] jamvm: Do not build for aarch64 targets
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
X-List-Received-Date: Fri, 05 Jul 2019 11:18:51 -0000
Content-Transfer-Encoding: 8bit

Avoids:
| configure: error: aarch64-poky-linux-gnu not supported
| NOTE: The following config.log files may provide further information.
| NOTE: /workdir/build/tmp/work/aarch64-poky-linux/jamvm/2.0.0-devel+gitAUTOINC+6cef41d859-r0/build/config.log
| ERROR: configure failed

Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
---
 recipes-core/jamvm/jamvm_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-core/jamvm/jamvm_git.bb b/recipes-core/jamvm/jamvm_git.bb
index 1762ade..57f7e64 100644
--- a/recipes-core/jamvm/jamvm_git.bb
+++ b/recipes-core/jamvm/jamvm_git.bb
@@ -15,3 +15,4 @@ SRC_URI = "git://git.code.sf.net/p/jamvm/code;protocol=git \
 
 S = "${WORKDIR}/git"
 
+COMPATIBLE_MACHINE_aarch64 = "-"
-- 
2.20.1


