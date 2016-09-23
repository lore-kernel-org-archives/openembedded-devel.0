Return-Path: <net147@gmail.com>
Received: from mail-pa0-f67.google.com (mail-pa0-f67.google.com
	[209.85.220.67])
	by mail.openembedded.org (Postfix) with ESMTP id 61C89600BC
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Sep 2016 02:39:34 +0000 (UTC)
Received: by mail-pa0-f67.google.com with SMTP id oz2so4374561pac.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Sep 2016 19:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=GIG2+huyCIw1l5G0tRa6twIoSLlEhNP72TFyKxpRZdA=;
	b=zSOjL62p3Yiim8DxCRB52BGJF21k+xr+MufVqYxUG8uGBDvPZfk3h4Yh7rvserXOO1
	NpSmbd1VrvHcbcMTNrGic0WyucAHyTPRc9NEnSnp53CuOhh5uvFLZf31kXWhYM/EIVFF
	Typx+kO0yfRgICOThentF1dGfB970ojKb9BwuwodsBRAVN/vdXEkwKrYy47e603d93US
	9ln0P2n3ok8v7mWSjUjmjmUKRCeFSHcXz69+nEI0FcB0Vnz+fG8xtaFlaWX7n1PNXqIx
	Jipufxc1bDwyLfYTld0DgH9lDvOoCLU38qpWV3XBHFC/31ULf+tDwDWjEsEH49/9rs/A
	rH2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=GIG2+huyCIw1l5G0tRa6twIoSLlEhNP72TFyKxpRZdA=;
	b=XMz/0kTQBNNRttopWh3qY1klyuWWjGZATLszaKND7qinweFlxtbEjDuAEh4q28X17h
	skozH6J4e6tAtS0kJlHpvHqOVc36dQj4xbEanHF7LvRRdFI5ZACUUFlw0LYzBo20Ibxg
	LYTEWZXyIRxOtVd//tYDH5r2sox3ybfDiVBK09mftRKQjtL59HTSnxpsqBp3+lwCutb7
	j+nmPm2kZeb7WoSciwnJlrH0Idd/E6LIKtvR5tEZCafE4njkwgmtuZLlGkyWUN/1Z/S9
	nn7wr9PVR4sMI2dZ+ZJsYGl3921e2FZiBpcvsBTsZAw7tpqPd3qN2ewGgj+EsJYmzNlR
	GU/g==
X-Gm-Message-State: AE9vXwPs8YeahSH2uarCTDHT67Jg41k2CBiZYfs3nDfSozIutBigeUmdZtZPCXMJFWhZLQ==
X-Received: by 10.66.129.174 with SMTP id nx14mr8506338pab.167.1474598375533; 
	Thu, 22 Sep 2016 19:39:35 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by smtp.gmail.com with ESMTPSA id 70sm6919141pfn.46.2016.09.22.19.39.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 22 Sep 2016 19:39:34 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 23 Sep 2016 12:39:24 +1000
Message-Id: <20160923023924.29771-1-net147@gmail.com>
X-Mailer: git-send-email 2.10.0
Subject: [meta-oe][PATCH] p7zip: do not hardcode path in native wrapper script
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
X-List-Received-Date: Fri, 23 Sep 2016 02:39:34 -0000

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta-oe/recipes-extended/p7zip/p7zip_16.02.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-extended/p7zip/p7zip_16.02.bb b/meta-oe/recipes-extended/p7zip/p7zip_16.02.bb
index 9f87e9f..fdd51db 100644
--- a/meta-oe/recipes-extended/p7zip/p7zip_16.02.bb
+++ b/meta-oe/recipes-extended/p7zip/p7zip_16.02.bb
@@ -29,8 +29,10 @@ do_install_class-native() {
 
     # Create a shell script wrapper to execute next to 7z.so
     mv ${D}${bindir}/7z ${D}${bindir}/7z.bin
-    echo "#! /bin/sh" > ${D}${bindir}/7z
-    echo "exec ${D}${bindir}/7z.bin \"\$@\"" >> ${D}${bindir}/7z
+    cat > ${D}${bindir}/7z << 'EOF'
+#!/bin/sh
+exec "$(dirname "$0")"/7z.bin "$@"
+EOF
     chmod 0755 ${D}${bindir}/7z
 }
 
-- 
2.10.0


