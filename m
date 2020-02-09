Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
	[209.85.214.181])
	by mail.openembedded.org (Postfix) with ESMTP id D62F360CD9
	for <openembedded-devel@openembedded.org>;
	Sun,  9 Feb 2020 16:17:26 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id y1so1798606plp.7
	for <openembedded-devel@openembedded.org>;
	Sun, 09 Feb 2020 08:17:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=293X4Ccn18ti1YbxIC104cHqDwvS4g4eQWHYG6sPzjw=;
	b=YgW6gZV/6MjCUMpiD8ISG3G3zbnoCaEBaDzc8/JXsG/GfhYrsrs9Hes5jZKtIrgwPF
	239uhm4YZXVRrmIv5GR4rBHt3bVEkN5lYjmrmJO62nLEHeG9VJunaIYVEwRfe0fnEXBn
	PZ7I/MTp3NHKbf8rUCizzAxE7su9twgvBoD+zNuEhJjZoZ0M4ZuphmontC+WSAVsU0WT
	/GNgDQnDJC0PWkxH+VZyn+HO9ESnS5xUInPmnQe99y6B1f8ApmT3oryR93CWueJAb80F
	ksVONcK46Wb6lDK5Bip1aFISPlBbgRMhOMd+pAUT3c7iK+oN3Op2f3k6DuSlhwPaTuyt
	8+wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=293X4Ccn18ti1YbxIC104cHqDwvS4g4eQWHYG6sPzjw=;
	b=d6QQW5A6OVav5fdMeKmDoU7b7qPXpYG6I4UVG5hkwq3tuexaht0VAXM+m7Gb1Zi4bZ
	ywJV0OizwOOeN58zSO0gvDRUnM6aGKB2zUdWHdYOJkS2MbkEbBkeGQnofpzQe4nNQkZq
	3rkrjcN8DSK6FxIbN57yvHCJlLjd6sPdZ6qIwmirg6UWqjuJSsDH6tH+ns9YIpVj+0Ku
	kXFYO6yrb5dtT/nntwtjozReIt7MXgyoXp/pnf29zlGszpFQUxnSGcKsCkobbIf91ftA
	jbJOor6wiC5Ylm7boJNQ+a1WVU3wItyfsj+tVYsDVyVpXrEvP/56Ij6HcQA2xg5YHEPw
	dVnQ==
X-Gm-Message-State: APjAAAV9L9WWDWZE9eztDW+8nVxFp1CBGCTyKvGSAxBYuRbotR/S4vkm
	KbCSotWt7maFSDSHe78p0nDDZH0z
X-Google-Smtp-Source: APXvYqx5x3LoaT9zPorRyIrU1EItipB8A9VEAehWzBwH+1d/Y6E/tlpf63rYC9SbV23YjiOv2zu/wg==
X-Received: by 2002:a17:902:bb88:: with SMTP id
	m8mr8735564pls.63.1581265047578; 
	Sun, 09 Feb 2020 08:17:27 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:154b:3780:5122:4aa9])
	by smtp.gmail.com with ESMTPSA id
	a19sm8831737pju.11.2020.02.09.08.17.26
	for <openembedded-devel@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 09 Feb 2020 08:17:27 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@openembedded.org
Date: Sun,  9 Feb 2020 08:17:12 -0800
Message-Id: <12390fd0d6f0ddca04783b2920a5d60fecd78b6a.1581264950.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1581264950.git.akuster808@gmail.com>
References: <cover.1581264950.git.akuster808@gmail.com>
Subject: [zeus 04/11] pyhamcrest: add python3 version of recipe
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
X-List-Received-Date: Sun, 09 Feb 2020 16:17:26 -0000

From: Trevor Gamblin <trevor.gamblin@windriver.com>

Twisted requires pyhamcrest for /usr/bin/twistd to work, but in zeus
there is only a python2 recipe for this package, thus the twistd daemon
won't be able to run properly for python3.

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../python/python3-pyhamcrest_1.9.0.bb                 | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pyhamcrest_1.9.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-pyhamcrest_1.9.0.bb b/meta-python/recipes-devtools/python/python3-pyhamcrest_1.9.0.bb
new file mode 100644
index 0000000000..04aa9b47f0
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pyhamcrest_1.9.0.bb
@@ -0,0 +1,10 @@
+SUMMARY = "Hamcrest framework for matcher objects"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=f6df1318c6071dd1707f5e3b6c11f24f"
+
+PYPI_PACKAGE = "PyHamcrest"
+
+SRC_URI[md5sum] = "8b833a3fa30197455df79424f30c8c3f"
+SRC_URI[sha256sum] = "8ffaa0a53da57e89de14ced7185ac746227a8894dbd5a3c718bf05ddbd1d56cd"
+
+inherit pypi setuptools3
-- 
2.17.1


