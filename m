Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
	[209.85.208.45])
	by mail.openembedded.org (Postfix) with ESMTP id A88657E25A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jun 2019 07:52:49 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id k8so25672578edr.11
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jun 2019 00:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=3/k4FOTMEhJmVTmsYOoWhndH2wuJagxfvR62aoozJYg=;
	b=kYRqpmy530kjpTEgcq6jzJokgCMfVeC4i5A72VqEzwHvaBiQOHpS+vNIL1L3MQTwwV
	0h7WFe4crPtGv1QJ80KXzqxL7csjvrSl2+mlsh4aZ3Q8jgJ7yjElXd8eMZZASDdQuSuM
	7tUu784/KCkCLbtA2IPoYurOIZj8H3nd7fllDyeGldoQJjCA+trHGR702apguJ3dntnn
	iObQ3hWUUy/7B506udzeMXqhnaZ8mIQ+ChAVjabVmHDjiWyjR4Ye0Qk/79s8Fn+k0zBz
	gFI1k8CFL4ualYBMqob5inIQ5cW6ms2CokGRE9iIlCGe6eLVqasdqfF3msXD1QTr9rGK
	rPmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=3/k4FOTMEhJmVTmsYOoWhndH2wuJagxfvR62aoozJYg=;
	b=P4L/kD3W896pKI9z+rYvE6997b+LHcrvKA2wlcS8JhaUBhufD+GKf5saAyUAzxi+B8
	OAexQa2ZfZlTQ8bEcxpV10kuKfkkP85HzswE2eDgQZjy8/I4gNaoqcGVx8TCEFwahh/W
	CRIXYo0EMx2ABBxa32D1HllGnEgSLMSxOqCR+soqs8X6ecF5NueJdwf3lOJjRS2csW8p
	Nvd/Mp80GENbZMSqnSq/Hl8yTRYpnMu0ENb4+kxJ2HaBeOgGlVT8Ra1BBasDD3krNWwC
	II+EdpY1Z+UF0CLW8ydEciBjnAa9r3jdtcnnX7ePwRCpE06u7mU/C+Q2iYkHU29TlZWN
	qHXQ==
X-Gm-Message-State: APjAAAWF/RMHZBWDPb6pEkzvw7+nS5w+wMnQ+85/WcPhOvRXRLQODIyG
	LuP7wnBsVfJgLVnxqHgaX+S2iFZVq5Q=
X-Google-Smtp-Source: APXvYqzA7Wv+Xx2Bn+08ek4ZT6qEDjZ/T+JqzdRABjaeTJ5/XcfcnWaUtLiFa99v7RSMn4JIYNv1rw==
X-Received: by 2002:a50:b161:: with SMTP id
	l30mr150247995edd.278.1561449170244; 
	Tue, 25 Jun 2019 00:52:50 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id
	y22sm4308640edw.94.2019.06.25.00.52.49
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 25 Jun 2019 00:52:49 -0700 (PDT)
Sender: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
From: Ricardo Ribalda Delgado <ricardo@ribalda.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 25 Jun 2019 09:52:17 +0200
Message-Id: <20190625075223.13585-18-ricardo@ribalda.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190625075223.13585-1-ricardo@ribalda.com>
References: <20190625075223.13585-1-ricardo@ribalda.com>
MIME-Version: 1.0
Cc: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Subject: [meta-java][PATCH 17/23] jaxen: Do not build an all PACKAGE_ARCH
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
X-List-Received-Date: Tue, 25 Jun 2019 07:52:50 -0000
Content-Transfer-Encoding: 8bit

jaxen depends on non -native recipes and breaks multiconfig.

Fixes:

| 138 problems (138 warnings)rm: cannot remove 'build/org/jdom/input': Directory not empty
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_compile (log file is located at /workdir/build/tmp/work/all-poky-linux/jaxen/1.1.6-r0/temp/log.do_compile.21778)
NOTE: recipe jaxen-1.1.6-r0: task do_compile: Failed
ERROR: Task (multiconfig:inteli7:/workdir/repo/poky/../meta-java/recipes-core/xml-commons/jaxen_1.1.6.bb:do_compile) failed with exit code '1'

Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
---
 recipes-core/xml-commons/jaxen_1.1.6.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-core/xml-commons/jaxen_1.1.6.bb b/recipes-core/xml-commons/jaxen_1.1.6.bb
index d75ce75..2741f2c 100644
--- a/recipes-core/xml-commons/jaxen_1.1.6.bb
+++ b/recipes-core/xml-commons/jaxen_1.1.6.bb
@@ -23,6 +23,8 @@ SRC_URI[jdom.sha256sum] = "a13549087141be24ad176b659afdc2c675f1ffa5288ff999a193d
 
 S = "${WORKDIR}/git/jaxen"
 
+PACKAGE_ARCH = "${TUNE_PKGARCH}"
+
 inherit java-library
 
 do_compile() {
-- 
2.20.1


