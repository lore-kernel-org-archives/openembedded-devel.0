Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
	[209.85.215.171])
	by mail.openembedded.org (Postfix) with ESMTP id 40E397459D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Sep 2018 04:17:53 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id d1-v6so915229pgo.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Sep 2018 21:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=hz7/ksFloxCKKM7Z2Cv7AUzXAHxur1Cvf271gyzgiOc=;
	b=i8+1Q1HmSfOiDPGciZPiEjXccsOzIs/XMYCYJDXLC8ePdYWqecLLm19CsvhDqVKmh7
	HRhJelousn7+9vUjv7ozTKrepGVt1qsQO8Qpyku8WbmdKvKb2ZTTbRxh8dH6vWaeptgd
	W/W4MppSdubmnWRK/wQ/LzWh+ySbdqcswMM6rTwkqx2rXe1LkuzxYA9qtlzGhnItwOb2
	aIJHBX0q7BNzaqpQ9cIueYBWGrOiRN8PByQtpzkA/IPHpqjlHUYLMH6iI6b51S+mh0bK
	gvDp5RSLfwCpjyzsOJeJTt3Csjvt4lEEkbGISdS0kZ7XId3P5qM9QG53/FWpLDd6DKn0
	hFgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=hz7/ksFloxCKKM7Z2Cv7AUzXAHxur1Cvf271gyzgiOc=;
	b=rP7q6os+nY9kMfE7W2Z9TA7HpkaZCUTlLnki1icSnyXSDQwLBstlfhWS6PuphDtD0H
	Y/j/RoMUZkIqRnZKsLzMV5cua+eMXrnV4rtlS3p7F1tiWCUn/o5HOUMJDew83LhJvXBe
	nMztuIkzxP+AJk79owefkR6ic/2iV5PoAGUQ9Cs8rdGzq+40V960rG8urm5ps5DfDxzG
	8vn/LFJLb5Qf3DisGa0289LPChM8iFW8YFHrssCjffc+Glo66dj48QfCR2Zhd+6I27bR
	h5oEQcTPRJ3JETeSe/+UIfZM1Mx3YvlK9ierwm9JetFuFNPriGz9qb5/m8Lf3atX0B9z
	B53Q==
X-Gm-Message-State: ABuFfohcy3mJl7QmFFrSUfxOmjb+lhyw1LMzvB+PxRQ45dTnNKRNLoE8
	K9id+M/kSpAVnFJx9R/QAaHY/4hR
X-Google-Smtp-Source: ACcGV63XXdOAN/EqeEUCDABs1C33vDJtRYCY6Jam9zgTFbFgGrFMqeSI6E/tOC8GP2FMpTA+DIMQLg==
X-Received: by 2002:a63:10c:: with SMTP id 12-v6mr8215363pgb.62.1538021873787; 
	Wed, 26 Sep 2018 21:17:53 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::b1b1])
	by smtp.gmail.com with ESMTPSA id
	l85-v6sm1021774pfk.34.2018.09.26.21.17.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Sep 2018 21:17:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 26 Sep 2018 21:17:42 -0700
Message-Id: <20180927041743.2769-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.19.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] kernel-selftest: Remove bpf on x86/32bit
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
X-List-Received-Date: Thu, 27 Sep 2018 04:17:53 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
index 58f0543d9a..71bf83cfd7 100644
--- a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
+++ b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
@@ -19,6 +19,7 @@ SRC_URI += "file://run-ptest \
 # bpf was added in 4.10 with: https://github.com/torvalds/linux/commit/5aa5bd14c5f8660c64ceedf14a549781be47e53d
 # if you have older kernel than that you need to remove it from PACKAGECONFIG
 PACKAGECONFIG ??= "bpf vm"
+PACKAGECONFIG_remove_x86 = "bpf"
 
 PACKAGECONFIG[bpf] = ",,elfutils libcap libcap-ng rsync-native,"
 PACKAGECONFIG[vm] = ",,libcap,libgcc bash"
-- 
2.19.0


