Return-Path: <jpuhlman@gmail.com>
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
	[209.85.215.169])
	by mail.openembedded.org (Postfix) with ESMTP id 84BDE613ED
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Feb 2020 17:51:49 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id j15so6824512pgm.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Feb 2020 09:51:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=mf6bPkgwowwzl8qjChfT+JtsSAFVK06M/xLCjoD67Zc=;
	b=dB73RGDHBpVB6OiTThACyeFMaG5ZjcIJAp20pMwH05cClvaLhqKSGZ7G2PxKLSuDDi
	9sF0RlKseS7bWorG5LdmZl7dG5eMIMjWhzAGXVTCWHJ/LBVoZXhOjoQDTFTPLtf9FYeZ
	+WhiZX3piqVuQMTO49uNV7iNdLOE8+qgDK9ndJ6r4ckaKZ3ecZTfgHXOfqy72hO1SSL+
	b5Oz0t0KQZhbof0ChNRQxsKvjP1FhYqEqR0/Se9Z5xI4c6M5sJ20iZ5KXqZjCXP4cM/D
	lBzur6ZPBjODpJQn4jRGPdtPO0TlwayYB4YvEJov4G29bpiutKKKOwJMLqXniWVbdt+z
	SUKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=mf6bPkgwowwzl8qjChfT+JtsSAFVK06M/xLCjoD67Zc=;
	b=DYRtds5kA9OSZLgvHP5wxojN75wsfG55FFz+spuTusZtRZT5vodUxYChHYPx5bB4S5
	IPiCEtB6shxJa2tl1kD3SU+MUD5JE+Td9YlAYIxRgMCS6GWGtsyWr+F1ZT5q5LXmA1EW
	lzEf84LqeURmLjSUgRdzSv8ZczGMiT7bqZOgCG8cKehAo0HjiwpCBli2rdMLfv47cL5d
	VrBk7c9z2z9KLBQf3BEomh+n7d4jPBs5hvlJ8kL9ccHjvUzO1wF18PgsubppnQRV14KC
	DjLMVS8KSTD4+xSJ5sw1tusF0XH2FKkV2UBGVcn3FtTsswf1VtDAC3mzd+YXPlUYM1Uc
	TGrA==
X-Gm-Message-State: APjAAAU4Ogf02k0fAOznCdYc5UCwlyGYbktJWCOXfvOBlxVjgiuZ8HTm
	jr/DxObz1sPiVbepMAXSEInFyDk1weU=
X-Google-Smtp-Source: APXvYqz/rvAM3HchxEKFL5Km6gOZcn8WeFdmIHpukIrdlcymJzv1rwege6ZQZG2tKmti7wyXCUKQHQ==
X-Received: by 2002:a63:c14b:: with SMTP id p11mr9692150pgi.290.1581789110403; 
	Sat, 15 Feb 2020 09:51:50 -0800 (PST)
Received: from workhorse.localdomain
	([2600:1700:4c90:60a0:56be:f7ff:fe12:d0bd])
	by smtp.gmail.com with ESMTPSA id
	f81sm10806631pfa.118.2020.02.15.09.51.49
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 15 Feb 2020 09:51:50 -0800 (PST)
Sender: Jeremy Puhlman <jpuhlman@gmail.com>
Received: by workhorse.localdomain (Postfix, from userid 1000)
	id 3B4962A0506; Sat, 15 Feb 2020 09:51:49 -0800 (PST)
From: Jeremy Puhlman <jpuhlman@mvista.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 15 Feb 2020 09:51:44 -0800
Message-Id: <20200215175144.23550-2-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20200215175144.23550-1-jpuhlman@mvista.com>
References: <20200215175144.23550-1-jpuhlman@mvista.com>
Subject: [meta-python][PATCH 2/2] python3-colorlog: add new package
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
X-List-Received-Date: Sat, 15 Feb 2020 17:51:49 -0000

A colored formatter for the python logging module
---
 meta-python/recipes-devtools/python/python3-colorlog_4.1.0.bb | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-colorlog_4.1.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-colorlog_4.1.0.bb b/meta-python/recipes-devtools/python/python3-colorlog_4.1.0.bb
new file mode 100644
index 000000000..ea4c575eb
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-colorlog_4.1.0.bb
@@ -0,0 +1,11 @@
+DESCRIPTION = "A colored formatter for the python logging module"
+HOMEPAGE = "https://github.com/borntyping/python-colorlog"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://README.md;md5=05592f7a5b83bfc756f62dbd70a9b9b5"
+
+inherit pypi setuptools3
+
+PYPI_PACKAGE = "colorlog"
+
+SRC_URI[md5sum] = "25f79b76421132e2a9e08da15e4e0a73"
+SRC_URI[sha256sum] = "30aaef5ab2a1873dec5da38fd6ba568fa761c9fa10b40241027fa3edea47f3d2"
-- 
2.13.3


