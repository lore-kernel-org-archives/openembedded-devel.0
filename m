Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
	[209.85.210.177])
	by mail.openembedded.org (Postfix) with ESMTP id E4D9C7D2E6
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  7 Sep 2019 18:28:46 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id q10so6648487pfl.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Sep 2019 11:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=fQ3S1H4reySvoGpgtCiX9/AnOPR/SRMWhrgkpJVoH5s=;
	b=YJGiJVMI9+R5CXKIJyVtrftvLO4Ay//hlXaWuAFtmKP0F7ST3IEvsIk/XJaSU/WRJT
	yiSpdGs/BBephwaYcW8yUp7jBDhycTlJ8OzksMKYq3acX0sogt4a/2mSlETedrnCmvuz
	0im+EK4AksAbZnF0Bj8GTLpsRs6BrAJHaUxfcX2YBF6Uk8h+Vk8flUhOGHM6zJl6ca/Y
	3aW8tDPqnxiNxghTwXbL5zXlUppNQfvOSfz3x0HR3evO+LxYW1dpMQTEqXMawo4+XhGi
	3FOUKvYx1xMUCH95W6CeMOYQDzUnTcVGfbmK1GyYO7lkk4xYnSHgdZuhRSzM3T2x6dqD
	EELQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=fQ3S1H4reySvoGpgtCiX9/AnOPR/SRMWhrgkpJVoH5s=;
	b=DuTFuPgjeLqpNIKmWNldAGbItXQ2MAWLo2N4NN9DvtC5kURh+esEji4VjeJQmhALPe
	/4OvjFRMl71ZTksmvwPglY20t4A0gBKrQSjwGWng4ybZ7JqLl9j5LpZf2v8n8CWGDeH/
	4HHBrMzJNG3SrZpoc+12C7XhvQCljD4Id75Qw1t+yKToTFRD67XksAoqei6/UVvm9Nd0
	16xG8V1XVnVE2Sct7A56zouPf7ASMyG9vgXRkTzcPM6uM3nJkoa1i5Tap7zI8PEdQU2y
	+eTi3zszlGkXd9gbcc8O5b7zaBjCeCaJAtAoXln5IGmPDiE/6+Adf0lslK+43jSqxfVQ
	K9bQ==
X-Gm-Message-State: APjAAAWbvVJThMFEMQiHcWM37ALjBStU6DwQzQTVpAruyfS7T9aVWWYp
	Eb53iFX/W2tMFmkqFjqdsTTaKmO5W50=
X-Google-Smtp-Source: APXvYqwG5fQbnFmc2kQ4u3UJngd0tx26snsmWLyvv+NGMfZ5J/muYNVaq3mAfY2yp+IOF+/eb3ZU5Q==
X-Received: by 2002:a63:f118:: with SMTP id f24mr14019468pgi.322.1567880927463;
	Sat, 07 Sep 2019 11:28:47 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	w21sm8920672pjh.19.2019.09.07.11.28.46
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 07 Sep 2019 11:28:47 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  7 Sep 2019 11:28:37 -0700
Message-Id: <20190907182837.6419-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190907182837.6419-1-raj.khem@gmail.com>
References: <20190907182837.6419-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 2/2] can-isotp,bpftool: Add to Blacklist
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
X-List-Received-Date: Sat, 07 Sep 2019 18:28:47 -0000
Content-Transfer-Encoding: 8bit

They need forward porting to kernel 5.2+

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/socketcan/can-isotp_git.bb | 2 ++
 meta-oe/recipes-kernel/bpftool/bpftool.bb           | 1 +
 2 files changed, 3 insertions(+)

diff --git a/meta-oe/recipes-extended/socketcan/can-isotp_git.bb b/meta-oe/recipes-extended/socketcan/can-isotp_git.bb
index 5df44f21f4..e40e1cd263 100644
--- a/meta-oe/recipes-extended/socketcan/can-isotp_git.bb
+++ b/meta-oe/recipes-extended/socketcan/can-isotp_git.bb
@@ -10,3 +10,5 @@ S = "${WORKDIR}/git"
 inherit module
 
 EXTRA_OEMAKE += "KERNELDIR=${STAGING_KERNEL_DIR}"
+
+PNBLACKLIST[can-isotp] = "Kernel module Needs forward porting to kernel 5.2+"
diff --git a/meta-oe/recipes-kernel/bpftool/bpftool.bb b/meta-oe/recipes-kernel/bpftool/bpftool.bb
index e58bdd4933..6683eccf2d 100644
--- a/meta-oe/recipes-kernel/bpftool/bpftool.bb
+++ b/meta-oe/recipes-kernel/bpftool/bpftool.bb
@@ -32,3 +32,4 @@ python do_package_prepend() {
 }
 
 B = "${WORKDIR}/${BPN}-${PV}"
+PNBLACKLIST[bpftool] = "Needs forward porting to kernel 5.2+"
-- 
2.23.0


