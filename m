Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id DFEB371A72
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Jan 2018 09:13:25 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id b141so349573wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Jan 2018 01:13:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=WFRDfgCQpascqazvaNrmjazvCJTeFUdAYYQiUgMx0Ew=;
	b=ASRa2zRQVCVSoTjXnAIoXVzOZqGdD+KV19TxpOpZLbcEBgyR3eXGPY2IpyEhxRFdwh
	9haUWC2I3T6OUZ0lgo+PhBkG5IDY9ehgx1lExr9xMwNK1OPVUdGcUdMOopf8nw3Pn3Ej
	AvTjTc0+D1O+tfElAfE5bYJv8kU1RnGDX5k5mBVeGIZo3PLyLG4LGVPnuPF1q5OKMWrL
	m4Fe3sQHVMU7L6c0hT1GKEVVWjsk+uDK2OlyL1aZTQFjZcRvu4MxCgW8SIksTiVNIj1v
	mt6ZNjs5jp7YFUEDNVFMjt1Rkw25KRZGm8OkQNp1wJ9UlUsyWzEdTGVEjOTeTG63idK7
	v5hA==
X-Gm-Message-State: AKGB3mJb6zwaxSw1qsOhW+ibaVH6VcSLHKJWDFg5gTIFUvfvZJgm3BBr
	nVGVL0XTqkS+SoYX8sXx9IEey+AY
X-Google-Smtp-Source: ACJfBovvIkcCxwcvG0+4yW3oYUehuj3Ru39Mgn7Y1T4LTN1QwA8REh1b1zfXF2UXXDwJ0848oUriuA==
X-Received: by 10.80.164.197 with SMTP id x5mr46284394edb.53.1516007606615;
	Mon, 15 Jan 2018 01:13:26 -0800 (PST)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	s8sm14938334edh.51.2018.01.15.01.13.25
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 Jan 2018 01:13:26 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 15 Jan 2018 09:13:25 +0000
Message-Id: <20180115091325.942-1-git@andred.net>
X-Mailer: git-send-email 2.15.1
MIME-Version: 1.0
Subject: [meta-networking][PATCH] ntimed: use beginline= in LIC_FILES_CHKSUM
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
X-List-Received-Date: Mon, 15 Jan 2018 09:13:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

'startline' is not a recognised keyword, it's beginline.

  ntimed: The new md5 checksum is 89db8e76f2951f3fad167e7aa9718a44
  ntimed: Here is the selected license text:
  vvvvvvvvvvvvvvvvvvvvvvvvvvvv beginline=2 vvvvvvvvvvvvvvvvvvvvvvvvvvvvv
   * Copyright (c) 2014 Poul-Henning Kamp
   * All rights reserved.
   *
   * Redistribution and use in source and binary forms, with or without
   * modification, are permitted provided that the following conditions
   * are met:
   * 1. Redistributions of source code must retain the above copyright
   *    notice, this list of conditions and the following disclaimer.
   * 2. Redistributions in binary form must reproduce the above copyright
   *    notice, this list of conditions and the following disclaimer in the
  ...
   * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
   * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
   * ARE DISCLAIMED.  IN NO EVENT SHALL AUTHOR OR CONTRIBUTORS BE LIABLE
   * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
   * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
   * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
   * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
   * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
   * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
   * SUCH DAMAGE.
  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ endline=24 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Signed-off-by: André Draszik <andre.draszik@jci.com>
---
 meta-networking/recipes-support/ntimed/ntimed_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/ntimed/ntimed_git.bb b/meta-networking/recipes-support/ntimed/ntimed_git.bb
index 527ea33b5..a749b1659 100644
--- a/meta-networking/recipes-support/ntimed/ntimed_git.bb
+++ b/meta-networking/recipes-support/ntimed/ntimed_git.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/bsdphk/Ntimed"
 SECTION = "net"
 
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://main.c;startline=2;endline=24;md5=eda11d21005319bb76cbb6f911f0f66d"
+LIC_FILES_CHKSUM = "file://main.c;beginline=2;endline=24;md5=89db8e76f2951f3fad167e7aa9718a44"
 
 SRC_URI = "git://github.com/bsdphk/Ntimed \
            file://use-ldflags.patch"
-- 
2.15.1


