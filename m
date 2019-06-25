Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67])
	by mail.openembedded.org (Postfix) with ESMTP id 2C45C7DE74
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jun 2019 07:52:34 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id r12so25768155edo.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jun 2019 00:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Uut61i1OTQP2oAgbEx5XxfBHQvqkq5RGiBpS3b9LTxI=;
	b=rT571UxV5qundZL/Mj1m5g3xKZ8an+ig94wR2YfAReaak3ZvGhf/YRfob1R3Atffyd
	kscM37Q/MRR3qAM6GKl1pJL0+F20lF4HpBY9e+v/L4qCLkwpioz/z6BQF/inMrs7R811
	54pdDS5z44ruV7J61PILKGFPrtodD4lDhWJT7BhHDdddZShOPYdmMqgMXC8WnlqC+Ws2
	DHlAQxZSB2PzThJ8fHaM4f+DiRu4sc4bwIRMq0/QEoFbN0ccALrxUaFlo8ozl7kh/dAR
	mmJBUXJOig8S7NZHGyhnyh8EjLAYamM/7op9t+1kA+aUn57D6MtmxsPg3gv+y+N2BopJ
	x37w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=Uut61i1OTQP2oAgbEx5XxfBHQvqkq5RGiBpS3b9LTxI=;
	b=P2nyiTcQDI4VYCdeybSkip5taZ1aayM21ngdzoF6W15zcY5luq9XG5VQ2QrP9k7fj4
	t8GnB845oGnTv9Cw7JWLdwGfu9+K68pEgmAJ+4zXwZi7zjhHUzBKSD7E8PKh+FO1n0oo
	yz97fo39/Gcw1f9Gdjhn1SA9rLUzMf7cqxMIUZnXPlLkPvMiHDBw85jyRVtEuKm4zZog
	KxR6pomNwpfR3B8TzJczwZcgo/FSv4R2cmcOg0Z0G85BWywuH5sVf2AgeZN1eSFzNgf9
	RvHSWnEiDOSVXc2qBtSrcPOxfkHCsUJfZ7+MMBH1Vu/adoqBnWFW+Dhjqb5k8JsKEIdL
	eYEA==
X-Gm-Message-State: APjAAAW1DQMMTmgpu+HI5+TfaxXM/CCvSvL1L+TXzawdin8mjmBgG0N0
	HNxeEbPEYIpxERPWNmwjlmj7MbS+GhU=
X-Google-Smtp-Source: APXvYqxnhE4vRWLspexSsXZKqn8us05RE1YKqlA9E8rYtwD2YTUSFFjBud4O4P9BlacS/zhGEX1OtQ==
X-Received: by 2002:a50:9871:: with SMTP id h46mr150822692edb.69.1561449155473;
	Tue, 25 Jun 2019 00:52:35 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id
	y22sm4308640edw.94.2019.06.25.00.52.34
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 25 Jun 2019 00:52:34 -0700 (PDT)
Sender: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
From: Ricardo Ribalda Delgado <ricardo@ribalda.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 25 Jun 2019 09:52:06 +0200
Message-Id: <20190625075223.13585-7-ricardo@ribalda.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190625075223.13585-1-ricardo@ribalda.com>
References: <20190625075223.13585-1-ricardo@ribalda.com>
MIME-Version: 1.0
Cc: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Subject: [meta-java][PATCH 06/23] cacao: Do not build for aarch64 targets
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
X-List-Received-Date: Tue, 25 Jun 2019 07:52:35 -0000
Content-Transfer-Encoding: 8bit

Avoids:
| configure: error: aarch64 systems are currently not supported.
| NOTE: The following config.log files may provide further information.
| NOTE: /workdir/build/tmp/work/aarch64-poky-linux/cacao/1.6.1-r0/cacao-1.6.1/src/mm/boehm-gc/libatomic_ops/config.log /workdir/build/tmp/work/aarch64-poky-linux/cacao/1.6.1-r0/cacao-1.6.1/config.log

Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
---
 recipes-core/cacao/cacao_1.6.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-core/cacao/cacao_1.6.1.bb b/recipes-core/cacao/cacao_1.6.1.bb
index 1074ff5..a55d877 100644
--- a/recipes-core/cacao/cacao_1.6.1.bb
+++ b/recipes-core/cacao/cacao_1.6.1.bb
@@ -63,3 +63,5 @@ FILES_${PN}-dbg += "${bindir}/.debug ${libdir}/.debug/lib*.so*"
 FILES_${PN}-doc += "${datadir}/gc"
 
 BBCLASSEXTEND = "native"
+
+COMPATIBLE_MACHINE_aarch64 = "-"
-- 
2.20.1


