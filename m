Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
	[209.85.215.181])
	by mail.openembedded.org (Postfix) with ESMTP id 842FF7FC1B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2020 06:38:26 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id z124so2893773pgb.13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jan 2020 22:38:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=bykYlNbRNbqf08+0ErTZG0vAyXmD4AVEJ2R4gP6wi+w=;
	b=GcpMpD9IIFOt6vyYdmwxo4QD1JS9rPkDV4ad47lvbaK8ztaEwH70r+yGrsG+voQsNo
	jBoLHHbUVmkRxsOPNfC2/Cq2I/jFKfs2QwDg1nsi+MhnchtW+OoUh3lv02+m+JRQVBJn
	4gnUFWl+Cxt0EACiCJ7+yxHlhZLl9RxEawZwGy+zsDnfHoTl/CaZVWbFmkL6CNjUzG23
	7xAKzKJqhx5PXjfV97PZ/6p6cXi+f1mAp8AzZglvJQAfbsSBJc2q+LRpJtB9/0T1PCl4
	IKmt1j/p1F4ok0HqEOx28bkafcIjnrKKPX/IxxAHB60uMVnCQobTzj4SirhhzaJHMi2u
	POMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=bykYlNbRNbqf08+0ErTZG0vAyXmD4AVEJ2R4gP6wi+w=;
	b=imi88equaiKMdbnbLpi7Cj3Fwl5JuCVm9l+eE/uvSXIiTBKeUK9AygO/PIxan8d9Rn
	UxYqKqSBtNgkgHqkthxAk1vmpKVuedUvVeCYtrxiXJp+eJ/QyCk+R+ZWdEVCdfTCZ7vx
	50aVf4OIib03sajjrGiYKZXBNftOzOING41SrGpcQQbvLCYjGQSUwYTWx7PhpkMXZbap
	fYkbNoaP0jhWPQK1+3uuNakVDqHzI+tzuzClu5J1Zc1JMB8drbK0yg97+fwiV0wjjnMr
	LfU7/ADNAZsSrvOsJV8ZUwhqNsGTXyYMaR1Yv1EFwtEpSjSq9Kffro7Jc0FhMhsJ5B6H
	t3Ww==
X-Gm-Message-State: APjAAAX5a/e5aN4PB5hJz8DdKMuqFgtmWsC9zeeQdMeKQt/JVr7qh5c3
	sfGZcwY6j6D2NxMxaft5fklEMcPn2eQ=
X-Google-Smtp-Source: APXvYqzQoXGNxpWGdnpkmi7GLR98rOXp7nwDYiFc8nIaNZCXokWVJcXqXfCDaX6qsuteLSz/ufeXdA==
X-Received: by 2002:a62:5214:: with SMTP id g20mr1216535pfb.101.1579675107171; 
	Tue, 21 Jan 2020 22:38:27 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::cab1])
	by smtp.gmail.com with ESMTPSA id
	100sm1600283pjo.17.2020.01.21.22.38.26
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 21 Jan 2020 22:38:26 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 21 Jan 2020 22:38:16 -0800
Message-Id: <20200122063823.242098-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200122063823.242098-1-raj.khem@gmail.com>
References: <20200122063823.242098-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 05/12] rrdtool: Disable python packageconfig by default
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
X-List-Received-Date: Wed, 22 Jan 2020 06:38:26 -0000
Content-Transfer-Encoding: 8bit

This needs python2 which is in another layer

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/rrdtool/rrdtool_1.7.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/rrdtool/rrdtool_1.7.2.bb b/meta-oe/recipes-extended/rrdtool/rrdtool_1.7.2.bb
index c7dbb6e39e..d96fe8131f 100644
--- a/meta-oe/recipes-extended/rrdtool/rrdtool_1.7.2.bb
+++ b/meta-oe/recipes-extended/rrdtool/rrdtool_1.7.2.bb
@@ -24,7 +24,7 @@ SYSTEMD_SERVICE_rrdcached = "rrdcached.socket rrdcached.service"
 
 EXTRA_AUTORECONF = "-I m4 --exclude=autopoint"
 
-PACKAGECONFIG ??= "python perl ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
+PACKAGECONFIG ??= "perl ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
 
 PACKAGECONFIG[python] = "--enable-python=yes \
 am_cv_python_pythondir=${STAGING_LIBDIR}/python${PYTHON_BASEVERSION}/site-packages \
-- 
2.25.0


