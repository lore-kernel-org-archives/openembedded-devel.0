Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TgJyL-0000DF-3w
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Dec 2012 19:45:30 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so2122427eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Dec 2012 10:31:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=ENH5m5Sm2+CT+l8o0it18eNOsTAb2fUYBOqjtX6rIl8=;
	b=Ts7q4xXhd/qT7Fbx5VHUilCS5gf0ydj5rHd7y3i84N+cy+tGDClEIvpb2pC7UrPWD6
	6OHXPM5rfVpn89Fh6aVbLct/H41tSqAtB4U67JknqMADBos7uUJuiFDtoFfdeveqzl+n
	Tbci6C93tvOIdXwLhh+Ac09S/l6qW5l++zkVOhn8AZWiyeoD+sblSc6MwemjSJlRZxIj
	P4/Ep3ZRqNNvg9O2wRUgGtaRmDUkuLUKg3rD44dPOhGCHCgFYBP+jJXKI/pbCP5caaSK
	bhxhjdjDXPfixFTebG5Fp/8MwYSPfRsxAl2AuaEV1is9UaDMztfFC8AArxmo7IsisO8P
	Yg5w==
Received: by 10.14.194.4 with SMTP id l4mr63385930een.42.1354732267215;
	Wed, 05 Dec 2012 10:31:07 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id q44sm10699687eep.5.2012.12.05.10.31.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 05 Dec 2012 10:31:06 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  5 Dec 2012 19:30:27 +0100
Message-Id: <3223dd9e4a0fbe93f94caf6da0894b36e9275855.1354731625.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <bef5b1c61f91ea5f2b28a981c69a9ed35cf27d74.1354731625.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
	<bef5b1c61f91ea5f2b28a981c69a9ed35cf27d74.1354731625.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354731625.git.Martin.Jansa@gmail.com>
References: <cover.1354731625.git.Martin.Jansa@gmail.com>
Subject: [PATCH 69/77] vim-tiny: package /usr/share/vim in PN-data
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 05 Dec 2012 18:45:30 -0000

* keep it separate from PN so PN is tiny
* fixes warning about a lot of unpackaged files

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/vim/vim-tiny_7.2.446.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-oe/recipes-support/vim/vim-tiny_7.2.446.bb b/meta-oe/recipes-support/vim/vim-tiny_7.2.446.bb
index 25a9205..d29b801 100644
--- a/meta-oe/recipes-support/vim/vim-tiny_7.2.446.bb
+++ b/meta-oe/recipes-support/vim/vim-tiny_7.2.446.bb
@@ -2,4 +2,10 @@ VIMFEATURES = "tiny"
 
 require vim_${PV}.bb
 
+PR = "${INC_PR}.4"
+
 RCONFLICTS_${PN} = "gvim vim"
+
+PACKAGES =+ "${PN}-data"
+
+FILES_${PN}-data = "${datadir}/vim"
-- 
1.8.0



