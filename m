Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
	[209.85.221.41])
	by mail.openembedded.org (Postfix) with ESMTP id 116B76182C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Feb 2020 13:53:51 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id z15so6500099wrl.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Feb 2020 05:53:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=pTsn1n1Jo6ynOqqiPhcx3etpZUJ63v0nKI77uSnNscI=;
	b=Ax93a+6DIR8p/Up0zOL4A8dJMTvcGFPnMAv7EzUuCNkB15ilK3HoZBOR6p0uL+99u9
	IjJqrzuHD2NDzWUxTbaghM60Jv/fzMnC9NbD4e2DfXd/bXb7k/p5EXu1JymyE5gQk30j
	bbUTCS9PVqJFD/DgGPYaqE4qNzpW4AnKlvcsviDL7XF9U5f82R9YxQb2pQpv8lBB58jo
	a4XWlz7wSE5uSISWCaVf1mLrU5hO8O2nzm7EdiRHCQgKrLJUaYQX1XUfZgJnONRY0kjB
	0yq8okYASe8JgJ22VlfU0e8o0C0L0rqXePyx16T7XKV7wisJjr1A+dJQojE16MniCRu8
	Fbig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=pTsn1n1Jo6ynOqqiPhcx3etpZUJ63v0nKI77uSnNscI=;
	b=Bm0NmpcPfkBp23TP+vNigbBXQ7jH3IPHvVmtQVxtcksoNdcKNcZmyNxoGSgVptKnlb
	YV0LxelOG+LTU99QPTL1CSdYoIfqNb2UYP/J6YFxwpxnnjx+XmOA8TuVB5xaAhH6F2g2
	zmYlmV92PldldpjrUGyJU6ckjZR4BMzJfDzORgXBL516022fBrqpkjfUJesGEJ09Yjo+
	nawu9di3x6A02Hcds0xZom8kO+aYLV6HCMX4US3oOHZXH3ahtKxZk1UNjTkXE/Fwfy86
	F2K347/EwTcOKeMGuFKFZEMSaqxrl7ihpZj9csKWXsaEeYGzhmzaYyCRhGC45QsT0Iw1
	hRgw==
X-Gm-Message-State: APjAAAUQc+2/takIeQnBJCFGbGCqAX4g59E9nyHY5W3KyM/12CD3YVIv
	W+l7uM4lpNyIKJhNdfmXmwJKvdMT
X-Google-Smtp-Source: APXvYqykWIqZGqk2iogNwPgmCES9S2+l28AJOW80udp+P6CufK8IQyvlRtvSU0j8pauM4ZKBODOakQ==
X-Received: by 2002:adf:e88f:: with SMTP id d15mr70070959wrm.186.1582638831570;
	Tue, 25 Feb 2020 05:53:51 -0800 (PST)
Received: from localhost ([109.238.218.228]) by smtp.gmail.com with ESMTPSA id
	f12sm4241440wmj.10.2020.02.25.05.53.50
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 25 Feb 2020 05:53:50 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 25 Feb 2020 14:53:45 +0100
Message-Id: <20200225135346.13344-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta-python2][PATCH 1/2] python-backports-functools-lru-cache: enable native and nativesdk
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
X-List-Received-Date: Tue, 25 Feb 2020 13:53:52 -0000
Content-Transfer-Encoding: 8bit

* since this change:
  commit d1a1c57d0e73251e86591214f30fc90010d5c111
  Author: Tim Orling <ticotimo@gmail.com>
  Date:   Mon Jan 20 11:31:59 2020 -0800

    python-beautifulsoup4: fix target RDEPENDS syntax

  there is now this dependency:
  'python-beautifulsoup4-native', 'python-soupsieve-native', 'python-backports-functools-lru-cache-native'
  and error in world builds:
  ERROR: Nothing RPROVIDES 'python-backports-functools-lru-cache-native' (but virtual:native:meta-python2/recipes-devtools/python/python-soupsieve_1.9.4.bb RDEPENDS on or otherwise requires it)

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../python/python-backports-functools-lru-cache_1.6.1.bb        | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-devtools/python/python-backports-functools-lru-cache_1.6.1.bb b/recipes-devtools/python/python-backports-functools-lru-cache_1.6.1.bb
index 8c40cf5..aee130f 100644
--- a/recipes-devtools/python/python-backports-functools-lru-cache_1.6.1.bb
+++ b/recipes-devtools/python/python-backports-functools-lru-cache_1.6.1.bb
@@ -25,3 +25,5 @@ do_install() {
 }
 
 FILES_${PN} = "${PYTHON_SITEPACKAGES_DIR}/backports/functools_lru_cache.py"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.20.1


