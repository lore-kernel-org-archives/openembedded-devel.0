Return-Path: <andrea.adami@gmail.com>
Received: from mail-we0-f174.google.com (mail-we0-f174.google.com
	[74.125.82.174])
	by mail.openembedded.org (Postfix) with ESMTP id CE0D2708A6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Jul 2014 22:58:08 +0000 (UTC)
Received: by mail-we0-f174.google.com with SMTP id x48so3458001wes.19
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Jul 2014 15:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=jGEtAOHrn/DETlRrCKicrH/Wja9UEM3CTYnVB33OZK8=;
	b=igvdWfqRNbGCB04ov2uxzyQ3JyfeaWeeUVGkflqk1X3qKqWIiLG3U4vnzxVke6P0Uv
	Ev9sOlKHnb1F2X9gabpFX0X+N/Rb2dGLnqtHKm+sgUlkQ0Ke3jD0Kbk/IA2BJ94f1HJ/
	YaPZOCpsm6183k1EfOBlrEnCop6qWlL9mzBqWRtNLcLgtnlvFyQX0MtNTjx5oBImVctK
	m9LCsmenmXwo5XxjGFfnHoAkCPx7+7oP78IoDGraJoPBmpsP4l+tM2A+45utp/dQ1GK8
	hpk3XJZfdXAjAzvWx9/XrVCN5PNSX87Y9JsxY9TyY8l6vi9FcXxgsfkY8B8Rdr1qFrpK
	P/Gw==
X-Received: by 10.194.89.168 with SMTP id bp8mr1934099wjb.73.1406847489329;
	Thu, 31 Jul 2014 15:58:09 -0700 (PDT)
Received: from mizar.208.67.220.220
	(host115-254-dynamic.11-79-r.retail.telecomitalia.it.
	[79.11.254.115])
	by mx.google.com with ESMTPSA id u10sm2371048wix.14.2014.07.31.15.58.08
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 31 Jul 2014 15:58:08 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  1 Aug 2014 00:58:05 +0200
Message-Id: <1406847485-17420-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-initramfs][PATCH] kexec_tools_klibc_2.0.2: update x86_vfscanf.patch
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
X-List-Received-Date: Thu, 31 Jul 2014 22:58:13 -0000

fgets in while loops is expected to check for != NULL

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../recipes-kernel/kexec/kexec-tools-klibc-2.0.2/x86_vfscanf.patch      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/x86_vfscanf.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/x86_vfscanf.patch
index 14f4d2a..cad6951 100644
--- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/x86_vfscanf.patch
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/x86_vfscanf.patch
@@ -16,7 +16,7 @@
 -	retno = vfscanf(fp, scanf_line, argptr);
 +
 +	line = xmalloc(sizeof(line) * line_size);
-+	while(fgets(line, sizeof(line), fp) != 0 ) {
++	while(fgets(line, sizeof(line), fp) != NULL ) {
 +		line_size += MAX_LINE;
 +		line = xrealloc(line,line_size);
 +	}
-- 
1.9.1


