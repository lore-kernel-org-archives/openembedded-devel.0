Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SRTPd-0001j1-4N
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 May 2012 21:16:01 +0200
Received: by mail-wg0-f43.google.com with SMTP id dr1so4416002wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 May 2012 12:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=CQwNVWLfdehe1EtWwY3p5aHR9x5ca7wUiA14uOSlbts=;
	b=zDdQrKy4VnfPZJd8BDWIA4gf6CgKnkvKbbJKaXByocN6km4xMf1ExroJ5MiIQjL/ym
	m5uFqVzcimvuRzzMBjsIDqbVCef9sxrgAi6WVKH6inVYSTeYcRLIdmSJaVCFUPQLmrkC
	q3IftCChzvY/PZ7xue5bxD4YIQehZ/oyAFhfrOHWYVBLqUxR/kKlghjyHkAtbYOrQ1Oa
	v1Z3wiEBqkn/R1l18TPBxnawqk2raag8JLS8cE7rEye/+Kx/SNodXT/oZbGIPQYQAC8v
	uoRI3AB4AxzidHYYfp9kd8x817/eFfSz3//v1Cyn+1+Bh7hQelNMaTa7oADawuslaLtl
	BCmw==
Received: by 10.216.138.130 with SMTP id a2mr4106503wej.35.1336417572776;
	Mon, 07 May 2012 12:06:12 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fn2sm36948818wib.0.2012.05.07.12.06.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 07 May 2012 12:06:12 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  7 May 2012 21:05:44 +0200
Message-Id: <43bbae5f510e0ab19cf3d799047207242ae0fa23.1336417488.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1336417488.git.Martin.Jansa@gmail.com>
References: <cover.1336417488.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1336417488.git.Martin.Jansa@gmail.com>
References: <cover.1336417488.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][meta-gpe][PATCH 2/5] libgee: upgrade to 0.6.4
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
X-List-Received-Date: Mon, 07 May 2012 19:16:01 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../libgee/{libgee_0.6.0.bb => libgee_0.6.4.bb}    |   11 +++++------
 1 files changed, 5 insertions(+), 6 deletions(-)
 rename meta-oe/recipes-devtools/libgee/{libgee_0.6.0.bb => libgee_0.6.4.bb} (46%)

diff --git a/meta-oe/recipes-devtools/libgee/libgee_0.6.0.bb b/meta-oe/recipes-devtools/libgee/libgee_0.6.4.bb
similarity index 46%
rename from meta-oe/recipes-devtools/libgee/libgee_0.6.0.bb
rename to meta-oe/recipes-devtools/libgee/libgee_0.6.4.bb
index 4e305b6..4e2c643 100644
--- a/meta-oe/recipes-devtools/libgee/libgee_0.6.0.bb
+++ b/meta-oe/recipes-devtools/libgee/libgee_0.6.4.bb
@@ -1,12 +1,11 @@
 require libgee.inc
 PE = "1"
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.0"
 #autoreconf needs introspection.m4 (staged by gobject-introspection-native) after http://git.gnome.org/browse/libgee/commit/?id=d026a29b38ca1a3388981c6e75a92602212373d8
 DEPENDS += "gobject-introspection-native"
 DEPENDS_virtclass-native += "gobject-introspection-native"
 
-SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/libgee/0.6/${BPN}-${PV}.tar.bz2"
-S = "${WORKDIR}/${BPN}-${PV}"
-
-SRC_URI[md5sum] = "4eb513b23ab6ea78884989518a4acf6f"
-SRC_URI[sha256sum] = "e586678d0a88637abeaaf850b62231000772e79ea6d9c4b45dc3cea99f778a7a"
+SHRT_VER = "${@bb.data.getVar('PV',d,1).split('.')[0]}.${@bb.data.getVar('PV',d,1).split('.')[1]}"
+SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/libgee/${SHRT_VER}/${BP}.tar.xz"
+SRC_URI[md5sum] = "a32bf498cf33d5e3417823a7b252ad22"
+SRC_URI[sha256sum] = "55f39f3b28e676f6cbd9377d83edd031084436a4da41280a9503c94faffb1665"
-- 
1.7.8.6



