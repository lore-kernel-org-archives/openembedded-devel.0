Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 49023789A8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Mar 2018 13:28:38 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id w6so1577632qkb.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Mar 2018 06:28:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=zYD7pcSHkTDWOMT8tvPRurjnh7vfv2rJ8h++JGnSuKQ=;
	b=cA1iw+XF50dQtZfCgxNkDpxsse0ZnTYSeVlkCiv98RDWSVVQ7azk+P8Nfae0jXCur8
	aslbth3bw3VodrE0wQSR5jPoF/EByJN8V0C9cRRvc5tOks7ivs+Yo5A/bGgEpjq+Mi0h
	FjHOXsDQ5RTkJed7XF4Yk49JQPmTxuAUVE/jpLrhhRPATzhcAUNwj4+ASGzfs/nqcIHH
	kHOAtm90RVaO5ShM/vK5dtLQ1WmK9GAUF3HsHQT7D9xgK6iSsL2OTjaHK2UN3uji/h5l
	8JUQeDwSQnwXA8QyYy9YCN4O9kgZOQxMNk6KrPuXfT0ne5ErV0ErlyS+Y3gIgwg13eMb
	r9cg==
X-Gm-Message-State: AElRT7FN0MZx0TdKx85Pxj2NxC1sN5OrPvfZUv7HdJSTAPfbMqtlCQ+y
	y5alDj3fXL4Q38Q1oLnYAYP1WdtH
X-Google-Smtp-Source: AG47ELtht7UuiCcQKrj7F7Djln0YnZaIAkH1CZ7hUpQtsh575wkbSin8GNdf3vJIAWdjPU69KAaDdQ==
X-Received: by 10.55.42.15 with SMTP id q15mr23808833qkh.9.1521552520057;
	Tue, 20 Mar 2018 06:28:40 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	n187sm1678073qke.48.2018.03.20.06.28.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 20 Mar 2018 06:28:39 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 20 Mar 2018 09:28:33 -0400
Message-Id: <1521552513-10173-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-humanize: add datetime to RDEPENDS
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
X-List-Received-Date: Tue, 20 Mar 2018 13:28:39 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-humanize.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-humanize.inc b/meta-python/recipes-devtools/python/python-humanize.inc
index d9fac09..17a3449 100644
--- a/meta-python/recipes-devtools/python/python-humanize.inc
+++ b/meta-python/recipes-devtools/python/python-humanize.inc
@@ -7,4 +7,8 @@ LIC_FILES_CHKSUM = "file://LICENCE;md5=d2eff82fc25dd07c919a02465884f02e"
 SRC_URI[md5sum] = "e8473d9dc1b220911cac2edd53b1d973"
 SRC_URI[sha256sum] = "a43f57115831ac7c70de098e6ac46ac13be00d69abbf60bdcac251344785bb19"
 
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-datetime \
+"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.7.4


