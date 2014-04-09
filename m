Return-Path: <koen.kooi@linaro.org>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id 807B065DEE
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Apr 2014 07:49:25 +0000 (UTC)
Received: by mail-wi0-f178.google.com with SMTP id bs8so2683710wib.11
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Apr 2014 00:49:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=34ovrU61hnIed6x9tTu0OvOTkq9Zha2h4xQtjlYzw44=;
	b=fjVTrEJRd3z44TeoqkZ7UggY7pdoZHHaIsblWHCisORtkdc2cnwZGW7zi9p/dxYkh/
	CbxO58jHq9hyn0M5u6BfwH6KQFmU2TZr9j2xJ3jel4WBPG4LV0rcifwxNNObSV7Bw0aD
	10o+iby0W3dLUVT20X/3deq/OcIqsxnBOruJLQAZl/WA6OcyoRBcPv2YFFXInlYhTIDG
	XVWY8fMGfCWzo/SVe2SHJB2lbJkfGenGbopZkk1PtQHg01e2bpJsg2DZwttzowCM1OX3
	S8uY+XQdc5WUn8cmggJqBS4x7eR9ajWjL95c5kQldg0qcntiZuE90WsQW7ET+NvU7RUP
	4qDA==
X-Gm-Message-State: ALoCoQk9BxbiBHMH4m6BzDY22mXqJGPJOhv9dm9afAPXyAdvut6G7B9FhglWM+kSkoDj04d+Xkuj
X-Received: by 10.180.105.132 with SMTP id gm4mr10859706wib.39.1397029766320; 
	Wed, 09 Apr 2014 00:49:26 -0700 (PDT)
Received: from localhost ([2001:610:612:0:2ad2:44ff:fe4b:bc17])
	by mx.google.com with ESMTPSA id ff9sm8264094wib.11.2014.04.09.00.49.25
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 09 Apr 2014 00:49:25 -0700 (PDT)
From: Koen Kooi <koen.kooi@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 Apr 2014 09:49:18 +0200
Message-Id: <1397029758-23231-1-git-send-email-koen.kooi@linaro.org>
X-Mailer: git-send-email 1.9.0
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [meta-filesystems][PATCH] sshfs-fuse: update to 2.5
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
X-List-Received-Date: Wed, 09 Apr 2014 07:49:26 -0000

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---
 .../sshfs-fuse/{sshfs-fuse_2.4.bb => sshfs-fuse_2.5.bb}              | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-filesystems/recipes-filesystems/sshfs-fuse/{sshfs-fuse_2.4.bb => sshfs-fuse_2.5.bb} (76%)

diff --git a/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_2.4.bb b/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_2.5.bb
similarity index 76%
rename from meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_2.4.bb
rename to meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_2.5.bb
index 2a5546e..722d0ed 100644
--- a/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_2.4.bb
+++ b/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_2.5.bb
@@ -13,6 +13,5 @@ inherit autotools
 
 FILES_${PN} += "${libdir}/sshnodelay.so"
 
-SRC_URI[md5sum] = "3c7c3647c52ce84d09486f1da3a3ce24"
-SRC_URI[sha256sum] = "3c93ba8522568093c94ff9c5a3763929380dd229365d905769ff82475d774dd1"
-
+SRC_URI[md5sum] = "17494910db8383a366b1301e5f5148a9"
+SRC_URI[sha256sum] = "e9171452e5d0150b9c6a2158fd2e2dcefb5d5d03ba4d208949e00a3a46c6e63e"
-- 
1.9.0


