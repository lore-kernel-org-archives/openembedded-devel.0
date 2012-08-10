Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Szpkv-0003Mh-P7
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Aug 2012 16:00:01 +0200
Received: by mail-wg0-f43.google.com with SMTP id dr1so1221497wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Aug 2012 06:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=raX9nWeroV5xAn81RKNvaLa4ZO3PKnYIS0bSkWSz3i4=;
	b=UbRUpfJSEgAP/Uik524+n3NTt2CqHPCFmfv/WhZE5vKMa4xBQoOVTXYwd9vOVbtnM9
	yjG+nFvm7iOPGEDRtkdRz+NrkS2dCkIGqToyiIAjauMAtGA07BwYhSTgfWYRhWtBgRcM
	sj7FZH0IBZAIPIJ0HK6X6IvPYZmtci3OqLDVo7GexWnW5MCYIgxoRz1cwVN2tJ1imTjW
	ITKiAOv5K6+Ei9/CsXvvgQKVwgx+VT7vgaB4pNIG4+K+tyUwYKOY6cFFVZvoB+4M+LFy
	YffkPOZwzgeOwpsDLBsmbLN3MduboAmpV2WHpjHm7wG48VW/bQAXUljoc6OcKqVtppIi
	qYwQ==
Received: by 10.180.93.8 with SMTP id cq8mr6228956wib.16.1344606494381;
	Fri, 10 Aug 2012 06:48:14 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id el6sm7834878wib.8.2012.08.10.06.48.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 10 Aug 2012 06:48:13 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 Aug 2012 15:43:28 +0200
Message-Id: <ae147f6031abc9f225e42cfae2d6e15403e43327.1344601517.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1344601517.git.Martin.Jansa@gmail.com>
References: <cover.1342645937.git.Martin.Jansa@gmail.com>
	<cover.1344601517.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1344601517.git.Martin.Jansa@gmail.com>
References: <cover.1344601517.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 33/46] edje: add eio to DEPENDS
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
X-List-Received-Date: Fri, 10 Aug 2012 14:00:02 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/edje_svn.bb |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta-efl/recipes-efl/efl/edje_svn.bb b/meta-efl/recipes-efl/efl/edje_svn.bb
index ffc8cf7..435b899 100644
--- a/meta-efl/recipes-efl/efl/edje_svn.bb
+++ b/meta-efl/recipes-efl/efl/edje_svn.bb
@@ -5,6 +5,8 @@ PV = "1.2.1+svnr${SRCPV}"
 PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
 
+DEPENDS += "eio"
+
 SRC_URI = "\
   ${E_SVN}/trunk;module=${SRCNAME};protocol=http;scmdata=keep \
 "
-- 
1.7.8.6



