Return-Path: <koen.kooi@linaro.org>
Received: from mail-wg0-f44.google.com (mail-wg0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 5B9E06B6A8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jan 2014 09:11:44 +0000 (UTC)
Received: by mail-wg0-f44.google.com with SMTP id l18so4251959wgh.35
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jan 2014 01:11:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=cDnHacTkxyTm7X2iQFwSNQM3cQa+GtkaSE682sZGbls=;
	b=FXEQluDqvYpfEFHnUB0/EnabFVaStKbR2qBO1Vbq8DsQWV57R8fVDdiTDAz9loa63I
	/b1UFakVibaVqDXwgz8PfRAzr+jpAGhb/DSPDLtp3sRADfyLyE1XKXZO6YqUk8cpEoGE
	xqblhVYlwL8Diov9UpQ1cNgRBuPo86b/ZAE/1eeLdU/Fyjv4+jl6FdwWLaz+YDYqJ1zn
	ONqj4J+9RhAXlFDBwcjnHWCUDBo+hd0slcYvcIQnawm+X8Vg6Cq2hPiDz+ti5X1qL8vr
	8eutbld2aqb+09eTV/fpF3ypvZ1VX+qPu128ZQtgQPSmSxGgU8EPre+5uvSS09mBRca5
	RRBw==
X-Gm-Message-State: ALoCoQnpQHWZQl4ffi079c7ssdv3cvRnif2zKrq4fE3S+ufkUh2+NI30+GZbStIFxuxe77f+/QDq
X-Received: by 10.180.81.38 with SMTP id w6mr1150284wix.27.1389949904493;
	Fri, 17 Jan 2014 01:11:44 -0800 (PST)
Received: from localhost ([2001:610:612:0:5e51:4fff:fec8:7c15])
	by mx.google.com with ESMTPSA id p1sm2148302wie.1.2014.01.17.01.11.43
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 17 Jan 2014 01:11:43 -0800 (PST)
From: Koen Kooi <koen.kooi@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 17 Jan 2014 10:11:39 +0100
Message-Id: <1389949899-29086-1-git-send-email-koen.kooi@linaro.org>
X-Mailer: git-send-email 1.8.4.2
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [meta-oe][PATCH] acpica: update to 20140114 release
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 17 Jan 2014 09:11:44 -0000

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---
 .../acpica/{acpica_20131115.bb => acpica_20140114.bb}                | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-extended/acpica/{acpica_20131115.bb => acpica_20140114.bb} (91%)

diff --git a/meta-oe/recipes-extended/acpica/acpica_20131115.bb b/meta-oe/recipes-extended/acpica/acpica_20140114.bb
similarity index 91%
rename from meta-oe/recipes-extended/acpica/acpica_20131115.bb
rename to meta-oe/recipes-extended/acpica/acpica_20140114.bb
index 8c9ecd4..5cc2d5a 100644
--- a/meta-oe/recipes-extended/acpica/acpica_20131115.bb
+++ b/meta-oe/recipes-extended/acpica/acpica_20140114.bb
@@ -15,9 +15,8 @@ SRC_URI = "https://acpica.org/sites/acpica/files/acpica-unix2-${PV}.tar.gz \
     file://cross-compile.patch \
     file://no-werror.patch \
     "
-
-SRC_URI[md5sum] = "1bd5b14c4c567ca2a113c05f4b28f29c"
-SRC_URI[sha256sum] = "d699a880b84e04205eda2d5ad048c1c38a57289240caa5f0fb7ebdcd3aac83d2"
+SRC_URI[md5sum] = "fcd4b7304f1bfabc7d4b9cfdecc6b0c6"
+SRC_URI[sha256sum] = "0d5bd32690ab77e21ab143ef25361c314a4ed13c33a5fb3ddd6f5559ab24ebc3"
 
 S = "${WORKDIR}/acpica-unix2-${PV}"
 
-- 
1.8.4.2


