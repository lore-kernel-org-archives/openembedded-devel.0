Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id D18196FFCD
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Nov 2017 21:56:06 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id r39so41120872qtr.13
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Nov 2017 13:56:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=inJTIv/aWU7ixBZ5y6g9XnHsezdFNKyP7N1msr2SVg8=;
	b=GhVaasw4O08hqTezV/ERQSSHWpsxpycwqZ9LMwpVMCt8haKsiE3R/K/jHnfh3zLtAT
	t+wclIvQkO7YlHZJKkSqpXevShQod2QPwHiy1CZmheG1M9j3T/i3Hc+DFzKJn6AhVae7
	/jIcw1xDQtjVd1FdtzX+4oHYxfuQ0d140rj2f50pYx7MIlwzIO0zaxMdEZTUi7/DJpy8
	uuds2ROU9qCAaqbrDsfViPD9YtKRy4s+DA93dP8W0q4Lyf8mQ6NKSJA5pgmGzOuG5Wji
	qeMcl3s1Qxgu1XFJVFfeHxo7iVSbslTME7aNnOUCCEnswTzMiPbJsm93ulLD443APVn8
	b87Q==
X-Gm-Message-State: AJaThX73oJd5Y1UdFnXgaSCLOHZbyerlyfF82XnFP2w+ORaEyF51v5FZ
	wpres2esSIvTPRXeFpaXHgmGtYfc
X-Google-Smtp-Source: AGs4zMZ3gtkZOMIYUzXeoyAm8ySDJJUTEBZx02ad6H6flVcHKqESdPv6YapET2QfTk7RdZbcmQPjIA==
X-Received: by 10.200.26.171 with SMTP id x40mr39349434qtj.43.1511819767413;
	Mon, 27 Nov 2017 13:56:07 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	k1sm17867034qtf.11.2017.11.27.13.56.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 27 Nov 2017 13:56:06 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 27 Nov 2017 16:55:53 -0500
Message-Id: <1511819753-30312-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][rocko][PATCH] python-cryptography: add -pthread to LD_FLAGS
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
X-List-Received-Date: Mon, 27 Nov 2017 21:56:07 -0000

The OpenSSL bindings require pthread to avoid runtime issues that end in stack traces:

File "/usr/lib/python2.7/site-packages/OpenSSL/__init__.py", line 8, in <module>
    from OpenSSL import crypto, SSL
  File "/usr/lib/python2.7/site-packages/OpenSSL/crypto.py", line 16, in <module>
    from OpenSSL._util import (
  File "/usr/lib/python2.7/site-packages/OpenSSL/_util.py", line 6, in <module>
    from cryptography.hazmat.bindings.openssl.binding import Binding
  File "/usr/lib/python2.7/site-packages/cryptography/hazmat/bindings/openssl/binding.py", line 13, in <module>
    from cryptography.hazmat.bindings._openssl import ffi, lib
ImportError: /usr/lib/python2.7/site-packages/cryptography/hazmat/bindings/_openssl.so: undefined symbol: pthread_atfork

[YOCTO #12339]

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-cryptography.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-cryptography.inc b/meta-python/recipes-devtools/python/python-cryptography.inc
index a4d1bbb..87ff16c 100644
--- a/meta-python/recipes-devtools/python/python-cryptography.inc
+++ b/meta-python/recipes-devtools/python/python-cryptography.inc
@@ -55,4 +55,6 @@ FILES_${PN}-dbg += " \
     ${libdir}/${PYTHON_PN}2.7/site-packages/${SRCNAME}/hazmat/bindings/.debug \
 "
 
+LDFLAGS_append = " -pthread"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.7.4


