Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id E1B9A73200
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Feb 2017 19:47:54 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id w20so1927291qtb.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Feb 2017 11:47:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:organization;
	bh=fwJNo+pLNkn1FM87b0Ld9PY2V+UZ5LBsUgxDXuDgw3w=;
	b=JXy/kF1k0THD/SrxGcAj6F5KSASAmRXIPglF5VKzfA8U4b+eSFc5jL/luJWCWGKD9t
	8nsHm8Icz5La8BI0dF22oXBpc0bZJ7OEOhC5+DPItVinc2a1qRMbglGsd4SHv1T2kRKu
	HbozyJmN5H44ukbk0yJHJm4ODHbKUudL7qkvzmLyBqq4mfH8KSdV7KUguhjWXOm5elvB
	BKfup/ob+V2FaBqm82dZc9GI3ITHQxlwaIE5ziQiCrxmu7hNpBqtGhT/20dqPu8X90ul
	RmwcswSCEZrFkvkycsdJnE3IIz3L4qbK2BuVwLaNGr0KUWH6Fh5AHDy55ynH9jIpkSBM
	rlDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=fwJNo+pLNkn1FM87b0Ld9PY2V+UZ5LBsUgxDXuDgw3w=;
	b=sisq/mqZ8/xg0BjleAIVQRNlrR0wJaHAGpwIRQ4SVnhAW3YIt1SSPJrBGwCAd/TW4J
	DQaxGEI29UkvL4z70tyl+zFlkCwiUFizBdYQ1VP2gJduwZ7yTT4mIz4mDinY+uF90bdA
	bvlZuePSnPmAegTBj0Xwvb8QPv9nWXGrnxJAM/YPsWawXzGV3rQnT5N+QJlya1FRicrU
	XsZvmvweyxUM91Cq1lkqU9DaQKgeEy9sOLeq9uH65R8NZeEjlwJCXTMh5R1WwxQ+EJgk
	FqZDSQWZmSTPOTrmP6Al1jM8W6CVnvEM01i7aLTVUSEWU1jp+2BzbW2sKlEZmxy7FG/W
	fR9w==
X-Gm-Message-State: AMke39mdQcCkFKVYjvqw3QzAEb7dNx4dSJenbo+lcSB8ljjve+SaqJk1s8fxEgeNZUgqGQ==
X-Received: by 10.237.41.229 with SMTP id o92mr4270387qtd.223.1486669674704;
	Thu, 09 Feb 2017 11:47:54 -0800 (PST)
Received: from centrium.lab.ossystems.com.br ([189.114.111.135])
	by smtp.gmail.com with ESMTPSA id
	h40sm10055850qtb.6.2017.02.09.11.47.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 09 Feb 2017 11:47:53 -0800 (PST)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  9 Feb 2017 17:48:19 -0200
Message-Id: <20170209194821.30766-1-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.11.0
Organization: O.S. Systems Software LTDA.
Subject: [meta-oe][PATCH v3 1/3] libev: Add recipe for version 4.24
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
X-List-Received-Date: Thu, 09 Feb 2017 19:47:55 -0000

The provided compatibility layer with libevent is still basic,
so we need to drop event.h for now to avoid conflicting with libevent.

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 meta-oe/recipes-connectivity/libev/libev_4.24.bb | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/libev/libev_4.24.bb

diff --git a/meta-oe/recipes-connectivity/libev/libev_4.24.bb b/meta-oe/recipes-connectivity/libev/libev_4.24.bb
new file mode 100644
index 000000000..5e0f3a5ed
--- /dev/null
+++ b/meta-oe/recipes-connectivity/libev/libev_4.24.bb
@@ -0,0 +1,22 @@
+SUMMARY = "A full-featured and high-performance event loop that is loosely \
+modelled after libevent."
+HOMEPAGE = "http://software.schmorp.de/pkg/libev.html"
+LICENSE = "BSD-2-Clause | GPL-2.0+"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d6ad416afd040c90698edcdf1cbee347"
+
+SRC_URI = "http://dist.schmorp.de/libev/Attic/${BP}.tar.gz"
+
+SRC_URI[md5sum] = "94459a5a22db041dec6f98424d6efe54"
+SRC_URI[sha256sum] = "973593d3479abdf657674a55afe5f78624b0e440614e2b8cb3a07f16d4d7f821"
+
+S = "${WORKDIR}/${PN}-${PV}"
+
+inherit autotools
+
+EXTRA_OECONF += "--with-pic"
+
+do_install_append() {
+    # Avoid conflicting with libevent. The provided compatibility layer is
+    # still basic so drop it for now.
+    rm ${D}${includedir}/event.h
+}
-- 
2.11.0


