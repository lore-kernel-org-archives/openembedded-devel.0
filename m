Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 131D6785CC
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Nov 2017 13:30:08 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id u40so10746483wrf.10
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Nov 2017 05:30:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=uhRFlN190Iv1cqahXz8/ztRwOyPsozutXhhhIFTyM/4=;
	b=dpdR36MSMLZnX2ImfmUbrRcv8Oqzett0FeiwR0nGv31mKlYr6sANSQnjYeMQTGESXw
	AGlF7GMsJ68mT+VWdpEnEyePXDHh2d/ECk5LhQ8Jmll19/wv8l1vXRVXSd7XfYKvi1QP
	PB0ifivpaPJ3HCrT2o7AUXmKqWVKRgOwDGp7xY4OxLPxFFWQJFVf+WyODPj33yZoE4q5
	12Or6P3TVHPSLH6BM8z8wWe/0bqWuUz8rcwucRboIevzCozcjc7AnLfilB0Eyzq+URnV
	HaVja7dMcsGg3AJMhx7gcCV1utp/9jMIEh9vjcNbfvazfYwSw7yauLG0PDd8X6rDBWcx
	K+JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=uhRFlN190Iv1cqahXz8/ztRwOyPsozutXhhhIFTyM/4=;
	b=FZ4Qp4ta0Xzb4EI0MGr95SkOi5PJzYu/PZ4NX/PifGBuB8IunDKhz47k8JMeJ7aQBx
	hZ+eMOu7dsaORahlmvhi/JU7O6sGEs9E0Hx0vwxu78nSjEt5lJXjZoWrtI+rt+a2d0wQ
	qWZAFyCLtArUG/8ceSLDIs9Xf7H6BPBIBf+tyOIgVDXN/x0cYDBHxFZdcRHPWY3h+f+N
	LNeQqyRoSdnzsXVJW9SYuDFSmdgIMVVYsyHPHIXMipsjK4jGUQRhgz1ZPAUa9biofjck
	510q/IfLShPBn6B9bm1ihGCMkZDzD5Z6C4u9C9UXOYKUha8zMZOWwlVUQzF+HcEIF+7E
	YaPA==
X-Gm-Message-State: AJaThX7rYcArEsS8DVEGIin0EjPkRu5fthjx2OYrDHBjUJH4qn+UrLVp
	caV4FSgxj1wJyl/2xubRIeR8zA==
X-Google-Smtp-Source: AGs4zMZ9VDxwfY9IxwX5jLScryGuLK6yNtbewYU1WEv9Yk9oJs/WyTJYb+Z7Iu5aAsNKPHA6qEB2yg==
X-Received: by 10.223.165.19 with SMTP id i19mr3036960wrb.227.1510407009327;
	Sat, 11 Nov 2017 05:30:09 -0800 (PST)
Received: from PC192-168-2-116.speedport.ip
	(p20030070ED074A591E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:70:ed07:4a59:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	195sm16189805wmj.3.2017.11.11.05.30.08
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 11 Nov 2017 05:30:08 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 11 Nov 2017 14:29:44 +0100
Message-Id: <20171111132950.12570-8-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <20171111132950.12570-1-schnitzeltony@gmail.com>
References: <20171111132950.12570-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH][v2 07/13] xfce4-xkb-plugin: update 0.8.0 -> 0.8.1
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
X-List-Received-Date: Sat, 11 Nov 2017 13:30:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Andreas Müller <schnitzeltony@googlemail.com>

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../xkb/{xfce4-xkb-plugin_0.8.0.bb => xfce4-xkb-plugin_0.8.1.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/xkb/{xfce4-xkb-plugin_0.8.0.bb => xfce4-xkb-plugin_0.8.1.bb} (75%)

diff --git a/meta-xfce/recipes-panel-plugins/xkb/xfce4-xkb-plugin_0.8.0.bb b/meta-xfce/recipes-panel-plugins/xkb/xfce4-xkb-plugin_0.8.1.bb
similarity index 75%
rename from meta-xfce/recipes-panel-plugins/xkb/xfce4-xkb-plugin_0.8.0.bb
rename to meta-xfce/recipes-panel-plugins/xkb/xfce4-xkb-plugin_0.8.1.bb
index 5e62c03..8ee3740 100644
--- a/meta-xfce/recipes-panel-plugins/xkb/xfce4-xkb-plugin_0.8.0.bb
+++ b/meta-xfce/recipes-panel-plugins/xkb/xfce4-xkb-plugin_0.8.1.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=496f09f084b0f7e6f02f769a84490c6b"
 
 inherit xfce-panel-plugin
 
-SRC_URI[md5sum] = "e4e897741ebe2827192971c2aaad835d"
-SRC_URI[sha256sum] = "3b0d3b9f4b7c3e3e7be668e2f7c845b89b16e0ed3db2bacb544a17272682ced0"
+SRC_URI[md5sum] = "72530bf59d7cd902326469e5a7a9892b"
+SRC_URI[sha256sum] = "c19ecf126201deb6148741c521124771ad396adc874471512ab5ffe1946567a1"
 
 DEPENDS += "libxklavier libwnck3 librsvg garcon"
 
-- 
2.9.5


