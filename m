Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id 2CD8F6D22D
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Dec 2018 17:46:29 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id b5so8665508plr.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Dec 2018 09:46:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=/fhXtxKSoyM87Yg/yLI4s2nfduMaGMld3c1h2ztDR1o=;
	b=jPprgF3Z7pbNpzo0Q2OKj+tv5elqLleUaBig7KbjGNe/AfEzdtbElReulEZAdLXGz8
	P3lh3bj82P1TgxLY3voddDPZ0QjziiNj1VEWw30HwY+Vh//WWXSk2nmZIoOuPW6ebK13
	B37FLkY2HvgmsJ/ZZE1MIHvQ8QZCcEfdkAYaOhIUzEi/cDDqZrivlXiqSPAyMMdjCmqk
	gZDsdrfWzk4MAa1Y1Hx48mJ0cbkEe6/Y75SRmVTw9Kw0ByzozokAztxyqRkShY7FSFGF
	ZM11srM3CpIjh8KUNYkJ+jSS2GO53xN7QxbaeZ248TxKv2TPkDh9MThZ8DJBXoz8UOav
	6NDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=/fhXtxKSoyM87Yg/yLI4s2nfduMaGMld3c1h2ztDR1o=;
	b=bqsi/yzCmg1ePDLnUq6anYAi501elxyC6SwkXR6bRM0T1gnPuQJ+I89ZpMDQsRHtQM
	2QKwF9fsdNl6na6+fjNp4Ol5uRHD7y+kuypSGTT1Q9XXvjhHhicxPi4CEEiiTmDmvOvW
	5xa4Bayt9k2ZWC6axS8GA/nqfnMHypol+tF4n7FnzXM6YzCmLfX/Nk1mmGTWwdbRcEP9
	QvzTANeOQadi60i82x0ainFRQRLxo2uVtVTuqkvqvTRqRNkMdrxy5KD/hPjinFqLMRa0
	QOkZNsNG9vDk5Rxkn24+s5PRDveBnCOOKeBxTZvdH3KrLlrtM6ujhaTLGDB3TNiW1g+z
	2NJQ==
X-Gm-Message-State: AA+aEWbmyxolmGIQ5ZGzh4vqLm618NR31ix3OcadEEZrnvBbvyjMGeAb
	xRhSmjoNpdWS94E/qXff1/wfLzomM50=
X-Google-Smtp-Source: AFSGD/VHtLGBY1S6jsAr6pYOkG0gfrSntjUFvFmSHU7m5fwtXkLW348/XMeVSJ+2seDjAN4/xwo14Q==
X-Received: by 2002:a17:902:b48b:: with SMTP id
	y11mr20146479plr.200.1543945590651; 
	Tue, 04 Dec 2018 09:46:30 -0800 (PST)
Received: from localhost.localdomain ([2601:646:877f:9499::5f84])
	by smtp.gmail.com with ESMTPSA id
	i62sm20503065pge.44.2018.12.04.09.46.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 04 Dec 2018 09:46:29 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  4 Dec 2018 09:46:16 -0800
Message-Id: <20181204174618.6271-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/3] bpftool: don't build under musl
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
X-List-Received-Date: Tue, 04 Dec 2018 17:46:30 -0000
Content-Transfer-Encoding: 8bit

uses FTW_SKIP_SUBTREE which is GNU extentions, available in glibc but
not in musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-kernel/bpftool/bpftool.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-kernel/bpftool/bpftool.bb b/meta-oe/recipes-kernel/bpftool/bpftool.bb
index fd0653ab87..dd7eaa2aa6 100644
--- a/meta-oe/recipes-kernel/bpftool/bpftool.bb
+++ b/meta-oe/recipes-kernel/bpftool/bpftool.bb
@@ -14,6 +14,8 @@ EXTRA_OEMAKE = "-C ${S}/tools/bpf/bpftool O=${B} CROSS=${TARGET_PREFIX} CC="${CC
 
 do_configure[depends] += "virtual/kernel:do_shared_workdir"
 
+COMPATIBLE_HOST_libc-musl = 'null'
+
 do_compile() {
     oe_runmake
 }
-- 
2.19.2


