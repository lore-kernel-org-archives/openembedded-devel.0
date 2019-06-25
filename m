Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8B77F7DD6E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jun 2019 07:52:33 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id z25so25719761edq.9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jun 2019 00:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=IUxboybVBa49WY5X9+EO5DnA8oAara3vk1VLRy/vAVM=;
	b=TUQZvVK0LsTGuszWQuBV11/uTdpQuR7kXplaY8cc3KHtUtHtaVceTHrVTbZuoeTdut
	Sq4WCDHGo5GrFQU7DbF0G0OdaWjMWcfCkLxzPOmPcs7nswJqyDHVeQDrR9l5g6Hgwy8J
	47VGTGdQ85JUKfB7cnOAF4uJRvss59BWnE5iAlPJeJNiAMm+b0iNg2yZRNBqI9TDPM2N
	MfLOeskQhEXy4T/CD2GOS/0f/jN8sLGSa8Q4DB4l1VwuE3rbijV9+BvTBOSFdYQys87m
	UOqCYEdF07U/xXWolw1/fsqqIBzGou2QSxxU3Kc2XT+VgITCt0oj0dGo0F042uomvaKZ
	/WTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=IUxboybVBa49WY5X9+EO5DnA8oAara3vk1VLRy/vAVM=;
	b=QAVErQTYIVcolDRXafkNnTEYAX9gV3q+mGoMr3dhXXjspreWKYn+BbZeR/OD5SacVp
	rsDFe9hhkoK7zysqC14RANQZzPOBcDiraKNbp3gScs4NAHr77Lb1oC/Swi0jUEAZIiTU
	/Em8SRRaPej8bZkdhn9kGOTn6qZkRjrEJdkIUy4gk30b6PspSQxOjI4S5kcTrH8UId8P
	ViwXUbPfjKx2QCCBnIB26ptPDfh+V6ivjoPRvuKP1FMxzTfx/QeQx/IdnSmnKZeXUZaw
	dbg5cWRxc4dyBdt6dvz3usFSJV+MhVLOLOlxX6eWym1aidOVe9cEshzBKT4MhNVFuiJs
	7VgA==
X-Gm-Message-State: APjAAAVs3/dJ3FluvOeP9DrHd95N+7HW+Sm484HofR+w8Cd+J0Kn5Ulx
	tobtG6TJ+aqRiOoXQJ2kn1Zu/Fy5VZk=
X-Google-Smtp-Source: APXvYqz9wRhvuPDCeitrxTBDSUsDcecAIkDyjhjkjKQ+7CrcXv4KUpGPN6yFpZwXV7I6REQgO75jow==
X-Received: by 2002:a50:97da:: with SMTP id f26mr133512721edb.88.1561449154148;
	Tue, 25 Jun 2019 00:52:34 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id
	y22sm4308640edw.94.2019.06.25.00.52.32
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 25 Jun 2019 00:52:33 -0700 (PDT)
Sender: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
From: Ricardo Ribalda Delgado <ricardo@ribalda.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 25 Jun 2019 09:52:05 +0200
Message-Id: <20190625075223.13585-6-ricardo@ribalda.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190625075223.13585-1-ricardo@ribalda.com>
References: <20190625075223.13585-1-ricardo@ribalda.com>
MIME-Version: 1.0
Cc: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Subject: [meta-java][PATCH 05/23] jamvm: Do not build for aarch64 targets
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
X-List-Received-Date: Tue, 25 Jun 2019 07:52:33 -0000
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


