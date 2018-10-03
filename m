Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
	[209.85.128.51])
	by mail.openembedded.org (Postfix) with ESMTP id 26D6D72EB7
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Oct 2018 19:25:20 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id a8-v6so2730964wmf.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Oct 2018 12:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=4sZqenyMvKpguIg1FQE3a/Hyf0tp2hm3n9MGWExJ+S8=;
	b=LP13CUaBqg99mC+38k/ozPa+RMj9qC2I/7i67w/3xDlz9WJtVPgE2cZw14wqh4DkBN
	J3UNNRJzEdNZ2UXqejQv58bQ7nC11GChplSoaJKQag8IHUuWAOZPs00Me015sM+Ahd6a
	MvtIn5hg660dWNU6FEulJ6BvcWF7HXPMCQC7B626vwXPJfLB1LRegiti6TXK1IPERstJ
	kaqDJZ9LA4lwfRU750LuHLEJ34Qtc82I8drb5Ff9yPVxTrEzcA8h6/601L2U4R++YASp
	Nud1uH6lCPC6S8Yguqn/D8TDgfpzIYoRSjE9B6SFNrau5hIVvJnsE5he8ajdb9ksZ7yp
	yEkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=4sZqenyMvKpguIg1FQE3a/Hyf0tp2hm3n9MGWExJ+S8=;
	b=lHL66YvlbZDHBrFkdRZouyPQXfa3MMvUvD6qG1eDQPb/7YYYvBgSsIwfnZjqQPKpck
	YneJSv4SeB2UbjuO67W5JCgoBaZI+4fiOAU8AFW1vRSW9WTgU699bVvjVo4nrmg7bRNk
	c9/1kM+sCpSqjsFfZGCOVvUM1i0TV84gKLbFeT5IG49Jqf7uKp0WYV5NKd0nh5u18BiM
	uXoE1c7vPZVF4/YpJLH129FGUEYhOQjBtX212sX52gvuz0N75CRsMRHCR9ocSpcK87l+
	CSWaDCvur09SC22wSRJlwD9z5D2CoTh91Wt1dPEjRQO1U45ShBqX52d9hC91Zwz4Ek3z
	dqXg==
X-Gm-Message-State: ABuFfohQ01yzYeyIs/UgM8wRLQmwpfWGCQ5m5RbXsfML3y6ACcpJerYU
	n7ZZmkc4tgjjTFf0mHbXF1QjxUoF
X-Google-Smtp-Source: ACcGV610Pc+Vf+K8EuM5csyCfc588QhiMpz9KXD0GkTB4Br+yb6VKWTe6bDUDgemS6nOf0LsGxixcw==
X-Received: by 2002:a1c:4c16:: with SMTP id
	z22-v6mr1107048wmf.89.1538594720538; 
	Wed, 03 Oct 2018 12:25:20 -0700 (PDT)
Received: from localhost.localdomain
	(p200300F07BC1EA401E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc1:ea40:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	143-v6sm3533019wmv.6.2018.10.03.12.25.19
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 03 Oct 2018 12:25:19 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  3 Oct 2018 21:24:53 +0200
Message-Id: <20181003192455.24921-6-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.4
In-Reply-To: <20181003192455.24921-1-schnitzeltony@gmail.com>
References: <20181003192455.24921-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 6/8] xfce4-cpufreq-plugin: upgrade 1.2.0 -> 1.2.1
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
X-List-Received-Date: Wed, 03 Oct 2018 19:25:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../{xfce4-cpufreq-plugin_1.2.0.bb => xfce4-cpufreq-plugin_1.2.1.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/cpufreq/{xfce4-cpufreq-plugin_1.2.0.bb => xfce4-cpufreq-plugin_1.2.1.bb} (64%)

diff --git a/meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin_1.2.0.bb b/meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin_1.2.1.bb
similarity index 64%
rename from meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin_1.2.0.bb
rename to meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin_1.2.1.bb
index e8ce6b09d..3f5587d80 100644
--- a/meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin_1.2.0.bb
+++ b/meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin_1.2.1.bb
@@ -5,5 +5,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1f6f1c0be32491a0c8d2915607a28f36"
 
 inherit xfce-panel-plugin
 
-SRC_URI[md5sum] = "152c4c5d9fd926081753d289c18a04c3"
-SRC_URI[sha256sum] = "fec60f14ab02b7079798809c11a79b4930abaeb0e4217068a336cb63cb47970a"
+SRC_URI[md5sum] = "ccd8f0f7aef51bc4caf1049986d9614f"
+SRC_URI[sha256sum] = "c5e044c0dc401d2066f208a3df82a588b3e51ff01425f155d0a1d0f8fce8f5b5"
-- 
2.14.4


