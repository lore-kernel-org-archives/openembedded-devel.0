Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
	[209.85.210.174])
	by mail.openembedded.org (Postfix) with ESMTP id 181387FCFF
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Jan 2020 16:39:11 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id q10so2688182pfs.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Jan 2020 08:39:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=6hDnSotiiw08eJ7JQDec1Qh6soJbF6Lqup2XKHGR+tU=;
	b=RNkIkPljG0SW7OBCYe3soARX4FOTMchWLDDbZ0wbfqPYTXmHZEWT9uEd90CWTcUqNh
	DZf349Tsz+CJwqBSKHB/VYk6wAY2s1eS/YR2kBQnkibr6zFfokZ4fe5sF20Bf07cq13+
	fhjK5FXqRIdTXVnJa6J5APnLQA2BJXhh+5YHgCRmO+Ds2g+kXriO9kmTw1Gt/1XA60uJ
	8eoYTLliyaDzIctBSVKsp+a3T00WIANjjadmtoeqvPgtcV+SqIluIU8/5g8qZm5jIAg8
	MjChjwItE3LyfnmLNsO4+L3sYFHhCOhWHYRcRbvXJkys8UYJWL8E5tQeS4niMIHHUHhO
	7txQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=6hDnSotiiw08eJ7JQDec1Qh6soJbF6Lqup2XKHGR+tU=;
	b=GQv/AwDSj+/Tn8/tAhsZzjhvexQ1zaULSaQJvJXk6JjLHmIjMJKoO02mfAi51RpmI1
	M+/DcAaWROF4fCoKEJllWLJyk9u+bwnRHnVCrwEO1MFoahBskJEkOiyjfvfwrXZ7yJuY
	OpNL4sHYDV8fgp5I51P4D6BaqmCB/VlZEWXLaHg3aAyiB/HAF7+zPHpz/0q//RN6MPey
	ZXNRlQbiuGuIld+0TwZRAOtORWkI7/zTMhhDfE+3Q515rAqhVyLvAcnxUDKRMvdffLAT
	skHAZCE5W6ehoGCUG1RLSxSXjT+MTkzPlLW6Lgg0h7/fFG/prwTjT1eOhz4obJGT2NJz
	GS3Q==
X-Gm-Message-State: APjAAAXYBK8iq4CBDqfo1RQcbZkI3KSXtVq1xtDtrz/s08Jtfh8ZmYGw
	6LZUdAaHDcBmcrqNu+A3c9W/iuw0C5o=
X-Google-Smtp-Source: APXvYqzIEKz+h7y/nohJTc5VV4OMrAiJpbqFPgg3+8yOONGx+8e47KvU4w2t9tfa23Hj4zSl19P1eg==
X-Received: by 2002:a63:b26:: with SMTP id 38mr11781822pgl.116.1578760752644; 
	Sat, 11 Jan 2020 08:39:12 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::a983])
	by smtp.gmail.com with ESMTPSA id y6sm7196521pgc.10.2020.01.11.08.39.11
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 11 Jan 2020 08:39:12 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 11 Jan 2020 08:39:05 -0800
Message-Id: <20200111163906.675731-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200111163906.675731-1-raj.khem@gmail.com>
References: <20200111163906.675731-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 4/5] rocksdb: Disable Werror
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
X-List-Received-Date: Sat, 11 Jan 2020 16:39:12 -0000
Content-Transfer-Encoding: 8bit

Using newer compilers e.g. gcc10/clang10 it spews new warnings so its
better to disable warning as errors for now

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb b/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb
index 44a451cd36..713d5bb145 100644
--- a/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb
+++ b/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb
@@ -32,6 +32,7 @@ EXTRA_OECMAKE = "\
     -DPORTABLE=ON \
     -DWITH_TESTS=OFF \
     -DWITH_TOOLS=OFF \
+    -DFAIL_ON_WARNINGS=OFF \
 "
 
 do_install_append() {
-- 
2.24.1


