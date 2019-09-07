Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id 403FA7D2E6
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  7 Sep 2019 18:28:46 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id y22so6648742pfr.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Sep 2019 11:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=D9pEKYtOQbHSqNa92Sc+yNTyxeyY+woheNhUNnIW57g=;
	b=AEr6gqU0SKbcJh/cbJWQbeJ9y0F1+anbbS+EhdOHxTjTJWlOHKvcRoARqDLTLSocn0
	1niGXhW+IMheouvkGF+vo2J042EvotynDkSfAtp29lyKuSvCzzr1enkrW+HqicoDiGhR
	+EmhwbUlmOjjNEP77Bi3O0CZXx4mq6SkJswIs1D8YveXSocm33hzpvWaa2VrROG3Ys/8
	fIBM0hBe3c8/MXoK5hKYTPNEwux0m5lJouEaMOZA4zWSPv+d87yZHi2qtE56IlWOMh9f
	5WbeGmgoUMjxiwE/BJvgzh7yDj6C1oLEUac3XZ9CpcuLMDQNbchn1W8i65P43gmz50Qv
	7CRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=D9pEKYtOQbHSqNa92Sc+yNTyxeyY+woheNhUNnIW57g=;
	b=VclrVPOFHFQAc64OKnKBnNmXZ1PLLRhKpZOE7IDqM3VCKSnaPWJmAj0/3SavrmncXZ
	jx3JQW5Jh1IGY9SryZjSMFF4KZNne78YLzcBzhqVcFC1eqXqtoDjr+W3FagWcq9qepa8
	kjsf2Li5ZnTlwd0WnbewhnBFQZ2MaX0MoKeHdhOCYx+gON2cmWzn9biKctis53MoGzhs
	Vc38sHJITCAI0NYkC4kmTRND8YIXHeuDmh2ti2neWaALxReHMU3wY49LTj5sFYadJ2gg
	1E7dSNI3PVDFHKX33dy9kuUq2Xp7tG9f1OIzaUEmo9D27HDI/igiDUbelGFpUc1vzIEx
	xceA==
X-Gm-Message-State: APjAAAUDHLtgFbqKseyP7e6O8Q1s98Mmm6wsjbZwv7bQCMFemogSa/uz
	tNzQfQXC3aOXFrzLoRdsZn9XnRvBlqg=
X-Google-Smtp-Source: APXvYqxMdJuo0UEoW/DwpkCjyYUDQvUDI8S2zCCnxr4U7kGg/OkUqtvonFfzuIAfqGNq0xsgXyDhoA==
X-Received: by 2002:a63:2004:: with SMTP id g4mr13090799pgg.97.1567880926660; 
	Sat, 07 Sep 2019 11:28:46 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	w21sm8920672pjh.19.2019.09.07.11.28.45
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 07 Sep 2019 11:28:45 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  7 Sep 2019 11:28:36 -0700
Message-Id: <20190907182837.6419-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [meta-networking][PATCH 1/2] drbd, netkit-rusers: Blacklist packages
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
X-List-Received-Date: Sat, 07 Sep 2019 18:28:46 -0000
Content-Transfer-Encoding: 8bit

These fail to build always

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-netkit/netkit-rusers/netkit-rusers_0.17.bb          | 1 +
 meta-networking/recipes-support/drbd/drbd_9.0.19-1.bb           | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/meta-networking/recipes-netkit/netkit-rusers/netkit-rusers_0.17.bb b/meta-networking/recipes-netkit/netkit-rusers/netkit-rusers_0.17.bb
index 716794f447..ba1ad3f7f3 100644
--- a/meta-networking/recipes-netkit/netkit-rusers/netkit-rusers_0.17.bb
+++ b/meta-networking/recipes-netkit/netkit-rusers/netkit-rusers_0.17.bb
@@ -69,3 +69,4 @@ RDEPENDS_${PN}-server += "tcp-wrappers xinetd rpcbind"
 
 # http://errors.yoctoproject.org/Errors/Details/186962/
 COMPATIBLE_HOST_libc-musl = 'null'
+PNBLACKLIST[netkit-rusers] = "Fails to build rup.c:51:10: fatal error: rstat.h: No such file or directory"
diff --git a/meta-networking/recipes-support/drbd/drbd_9.0.19-1.bb b/meta-networking/recipes-support/drbd/drbd_9.0.19-1.bb
index 6683781af5..23fe2021be 100644
--- a/meta-networking/recipes-support/drbd/drbd_9.0.19-1.bb
+++ b/meta-networking/recipes-support/drbd/drbd_9.0.19-1.bb
@@ -21,3 +21,5 @@ EXTRA_OEMAKE += "KDIR='${STAGING_KERNEL_DIR}'"
 do_install () {
     oe_runmake install DESTDIR="${D}"
 }
+
+PNBLACKLIST[drbd] = "Kernel module Needs forward porting to kernel 5.2+"
-- 
2.23.0


