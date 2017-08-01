Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 84E8878355
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Aug 2017 14:16:09 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id c65so2498927pfl.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Aug 2017 07:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=UlZCKyE5/1SqZ4a82uzTl60jjoVoHk2MSuZ6WB02Tz0=;
	b=qPikolUNjYAN8cL6Y3zghkPdGNYOrqD8fnA+oU+ZdDfDtcrlpEEY4UczB/t8tmw1HG
	/lEpFxhZv5GVrnd2/TzLSKZdQ81tYX5lQYR43PKNDhcjK6L+lLKYp5ql3NBlczA0ZF43
	C7a6dNhDM1CllSWHHbzPlLJHNoVdx3N9GZ3wWfhxZ5NOMKWrpl9P4pweyaFRSQcFY/p/
	4d5n1NeWbnJYs2kTQMK0rY8CXHUzb6ws2M/MqdpyfRE3ILJpfS5Ze0Si6yaQSvJo/Gze
	wfM9M1EBbI5cRP44IL2r1LSQ4UmdOc8OuAlPKYODEEJN8w9yUQ/JCriXgT0uNwqG+PkI
	kHSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=UlZCKyE5/1SqZ4a82uzTl60jjoVoHk2MSuZ6WB02Tz0=;
	b=UL4KvA/S3TFeemRZFIDVvlax4vpii+KVfXQUH64fuTb0FzIO9XYh0YrjwIzl0L/6/6
	mP1Hw9b729U0FqV5V567FVzGsov+gpuVPel05Ou90eaoJT2+lJVFyMRwegY+jNdnn+wH
	CdCHEywcSkpOlWIAqsNpAIm5NEeiiwFZqEfnQ9YHJpBxGzYXNTjYCG5yo2KzHmqn1sxr
	ukSj82xUdCGE3VPYTxZRz+D+zwOTx0wh2a/XyrpbtJR80QAfSx8KlNGy0vhOCRaJXUSq
	LigtKfCm6/BPQ0lIecH0HQZxw8opiEAedxwA1RT6GL00l5ch6G8MEZW0338G4pWu0G1F
	w1iQ==
X-Gm-Message-State: AIVw113CfO9hTQszxJvnjzOzSzKsYwmccU+aSWKGTRLgR5jcVdvxwZk7
	OmW10B22ehd5QjGZ
X-Received: by 10.84.133.11 with SMTP id 11mr21705047plf.77.1501596970600;
	Tue, 01 Aug 2017 07:16:10 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::1f6f])
	by smtp.gmail.com with ESMTPSA id
	l17sm58510561pfk.146.2017.08.01.07.16.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Aug 2017 07:16:09 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 Aug 2017 07:15:58 -0700
Message-Id: <20170801141559.17067-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170801141559.17067-1-raj.khem@gmail.com>
References: <20170801141559.17067-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 3/4] ndisc6: Upgrade to 1.0.3
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
X-List-Received-Date: Tue, 01 Aug 2017 14:16:09 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-support/ndisc6/{ndisc6_1.0.2.bb => ndisc6_1.0.3.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/ndisc6/{ndisc6_1.0.2.bb => ndisc6_1.0.3.bb} (94%)

diff --git a/meta-networking/recipes-support/ndisc6/ndisc6_1.0.2.bb b/meta-networking/recipes-support/ndisc6/ndisc6_1.0.3.bb
similarity index 94%
rename from meta-networking/recipes-support/ndisc6/ndisc6_1.0.2.bb
rename to meta-networking/recipes-support/ndisc6/ndisc6_1.0.3.bb
index bea5e13f5..0b5c9e467 100644
--- a/meta-networking/recipes-support/ndisc6/ndisc6_1.0.2.bb
+++ b/meta-networking/recipes-support/ndisc6/ndisc6_1.0.3.bb
@@ -12,8 +12,8 @@ RDEPENDS_${PN}-misc += "perl"
 
 SRC_URI = "http://www.remlab.net/files/ndisc6/ndisc6-${PV}.tar.bz2 \
 "
-SRC_URI[md5sum] = "50cb4c19606cf6ff2b7388e71832f579"
-SRC_URI[sha256sum] = "6acec8a0cb9efa3ac98456f46c3016aeec0598b0c7557c95242b5228ad62ca7a"
+SRC_URI[md5sum] = "21afdaa3a5a5c1ce50eb7f2b7d795989"
+SRC_URI[sha256sum] = "0f41d6caf5f2edc1a12924956ae8b1d372e3b426bd7b11eed7d38bc974eec821"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-- 
2.13.3


