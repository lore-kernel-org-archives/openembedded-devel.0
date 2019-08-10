Return-Path: <roman.stratiienko@globallogic.com>
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
	[209.85.208.182])
	by mail.openembedded.org (Postfix) with ESMTP id BB89E7ED22
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 10 Aug 2019 17:41:25 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id p17so94941385ljg.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 10 Aug 2019 10:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=globallogic.com; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=qCdS47TlzPfwKL+yk+gQcnSV+0Nwtx+AXxL4nwnPVxA=;
	b=PSVlF3DZgFNfOyUFbuIk40zvCCZPrkbEfd5aJzgpnVui8Q4MhXTt4aMzkN7wSK5tPH
	/dDm9B8TDNWOhE3U6C70H4v0vfQ9sIKqIXliCt4uwYVmMSdIfJuMW2pk6A9kxuaWzCct
	no/qo3YKoy4ZSwyv/WCTGkS/DN8cARG+UBiR3nDqdzZtiXc6MbG+vxvjaQXBCVJ38Vpu
	TIuL2RGkx5HVJB0KcE38qkufxYY7u1sYW+rjnol+8/0Siw+ADf/0m7JmTpix4JvnCchy
	vKGzcVAC3TRcTV3qlZVXyClMcRUyfrEzTsqLEzscgEvlL4Xr/J3AxLcCK28siQh+S0m+
	gSUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=qCdS47TlzPfwKL+yk+gQcnSV+0Nwtx+AXxL4nwnPVxA=;
	b=acPpdZ28Y+cvLyqDq2+kbqwoBNX7dR1l03h9W3O04SNJilEpfb2h7mCy5quEQGmkox
	BTdq3DtiRAoYM/vfovrFR4DzOvkqFxyNQQKGB3fstgrsWjGZQ0tybbY/YXLBRjIuRPmT
	YSJKh0KFITGaWXVuvEfsZWuOz0bny6DgTA5I2wkLCLpjIGTmaZCbak0wpr94EShsn5Gu
	IdktYGDlPm9vHIu8VbLUxUM6ekwDY/ARA7TEkiU2Mk5R7Imq+wRDhh599nKI8XWRK9u5
	lhGOuvpmvfupTRi1DBpkgqBkRVywKdLxqgMcuAh6cyydM7e0h6bVdHajCxItgcQudokx
	LFfQ==
X-Gm-Message-State: APjAAAVd0nFVH14pduUby4G+vzFjsviPdTCZrla+W3uuAgCzFm10HpYG
	4mYQAxMpGQr1clRP6ySW3MigAVCjKzQ=
X-Google-Smtp-Source: APXvYqxRdaAmertxjEj+kIa2g4WOv7AuczzMnQ4KVaSMv0F4CvSG+KPalIhwnfP+kpR1mMIZiTtdIA==
X-Received: by 2002:a2e:8e99:: with SMTP id z25mr2476335ljk.121.1565458886147; 
	Sat, 10 Aug 2019 10:41:26 -0700 (PDT)
Received: from virtualhost-PowerEdge-R810.synapse.com ([195.238.92.107])
	by smtp.gmail.com with ESMTPSA id
	r5sm18150080lfn.89.2019.08.10.10.41.25
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sat, 10 Aug 2019 10:41:25 -0700 (PDT)
From: roman.stratiienko@globallogic.com
To: openembedded-devel@lists.openembedded.org
Date: Sat, 10 Aug 2019 20:41:16 +0300
Message-Id: <20190810174116.21284-1-roman.stratiienko@globallogic.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] glmark2: Upgrade SRCREV to latest
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
X-List-Received-Date: Sat, 10 Aug 2019 17:41:26 -0000

From: Roman Stratiienko <roman.stratiienko@globallogic.com>

Fixes QA Issue: /usr/bin/glmark2-es2-drm contained in package glmark2 requires
libgbm.so, libEGL.so, libGLESv2.so, but no providers found in RDEPENDS_glmark2.

Fixes missing libraries listed above at runtime in glmark2-es2-drm.

Signed-off-by: Roman Stratiienko <roman.stratiienko@globallogic.com>
---
 meta-oe/recipes-benchmark/glmark2/glmark2_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb b/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
index 7ed5cd028..605417634 100644
--- a/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
+++ b/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
@@ -15,7 +15,7 @@ PV = "20190205+${SRCPV}"
 COMPATIBLE_HOST_rpi  = "${@bb.utils.contains('MACHINE_FEATURES', 'vc4graphics', '.*-linux*', 'null', d)}"
 
 SRC_URI = "git://github.com/glmark2/glmark2.git;protocol=https"
-SRCREV = "0c90dd48df43a6b0db1d9aabca6298240f4968f7"
+SRCREV = "c17fd14505f30d9e4dbad276f7aa956fd21a637b"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


