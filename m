Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
	[209.85.214.172])
	by mail.openembedded.org (Postfix) with ESMTP id 042B7610EC
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Feb 2020 22:47:38 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id ay11so4260598plb.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Feb 2020 14:47:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=GbtejPkibBMDZr+5qK3XLgz2Ijza5vXbb5XUqH1k7Kc=;
	b=jmJqRUQUhledF6ONW6VriUFupg9dC1eWfkahfB3TmaKWjBWkCSLCUS/9ZmzWs0Jom7
	5hdh4A8qeOvWk+dnnK0nO5HRRmhuahbtKmsBLPNH/pHOa+fDSuFV6px7T+UVcI29dVkA
	2PEPpg+VI5/7fYBvpYOMxuwg9pdyRAvsvwlmEgfvP4KIoteGnb5T6MK1ozPGGgH6izrG
	8chf1EL0/a7YAsXDpU9eQYzsYh+h78i8193ivxEQrjjd0iCfvhoCIRs0oQpiV8gKjGU+
	tXFLDko/5OnYPQjw+5FcQlOrD8SL7hCaKvgrDnPb36rBW1vldfsxwJggvIepqtTNkGev
	rDiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=GbtejPkibBMDZr+5qK3XLgz2Ijza5vXbb5XUqH1k7Kc=;
	b=tpFvZdGDdDIxQ0n2ElL1JcRzn5TnbjqTurn/EoEI+JgTj9DKCWu+R7Ji0EfoLeqaDw
	FQNw/yCTCxtx04JbMyH+fhpIus0CtDzhEYFIewSZvESvouHZ2stHFQRYSgP6nlp93rvs
	bQAGw1oEnKyaSTrUc87Pg/06Fm/jonwv1LZQglfOnUVh+2zzh4bOXte5bwYo1WV+aCMH
	jtOI5FPaIHjsMoNH0IiZh7R9viTkOmYTlxcOGn0dVSHa+RV73E0P4a7gQmNwj/lF9usr
	T2yfikh3/f5Pu/huYJkKeYMHs6SQ12h6B7pYwM652oVFHAxFxjcUZz7nkrocU997WpLy
	7/+w==
X-Gm-Message-State: APjAAAXEj/+ZEkBzJytiaW4+DF3SJyxWngRLgarkqEM5EOfLTFLw7fR3
	+LwM6NlD+7Nr5V9Rxd+Z+tMVNn/Nhn4=
X-Google-Smtp-Source: APXvYqyzwIIVwJm8bfLXI8KAf0stNnlybgxMeu+tqDz0xACRBrxAb1pn4IG2bgLETr8Iw6DCS0HWVw==
X-Received: by 2002:a17:90a:858c:: with SMTP id
	m12mr5861719pjn.127.1581720459444; 
	Fri, 14 Feb 2020 14:47:39 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::709])
	by smtp.gmail.com with ESMTPSA id
	l13sm7527088pjq.23.2020.02.14.14.47.38
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 14 Feb 2020 14:47:39 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 14 Feb 2020 14:47:42 -0800
Message-Id: <20200214224742.3270717-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] packagegroup-meta-oe: Remove python2 packages from packagegroup-meta-oe-devtools
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
X-List-Received-Date: Fri, 14 Feb 2020 22:47:39 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 777623ba88..bad4aa769e 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -116,7 +116,6 @@ RDEPENDS_packagegroup-meta-oe-devtools ="\
     mpich msgpack-c nlohmann-json openocd pax-utils \
     ipc-run libdbd-mysql-perl libdbi-perl libio-pty-perl php \
     protobuf protobuf-c python3-distutils-extra \
-    python-cpuset python-distutils-extra python-futures python-pygobject \
     rapidjson serialcheck sip3 tclap uftrace uw-imap valijson \
     xmlrpc-c yajl yasm \
     ${@bb.utils.contains("DISTRO_FEATURES", "x11", "geany geany-plugins glade tk", "", d)} \
-- 
2.25.0


