Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by mail.openembedded.org (Postfix) with ESMTP id D341078A69
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Mar 2018 05:12:50 +0000 (UTC)
Received: by mail-pl0-f65.google.com with SMTP id d9-v6so3769284plo.8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Mar 2018 21:12:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=FuzDf48dsZ0TTRdtlc4GPDerMxnWdOlJ1S6fSDq3U/Y=;
	b=NX5gLw8nSqIdIQMIIEFeRFkK8RzHYhFesUuC0Kk5981Z8e+03XuXyoUlGGS92z+0Vl
	Rrp+kZFTmXBS+9GtWps88D/VhfSaaKcCNPWRfZra/vLbnbObqWYz6i7A9/IA6qmAUIuS
	S5hz415gOeBPjjw8WsU9j4CE6rh/XmHaU+FDUrtKHXDqkwUNqUaIOFRZ765jEJbOGODb
	N0bNJXsDrNb/yvggq8P8Mf724Z6LQILXEMX80bLSDvB5EENf/9+RAN7hKX88gHEcSgdH
	QP9Glk9FDgEmDTkSUVqra4ulPx0+r2DiCSlPWjcClPThaFx/l8FVdDxmMnpJRY/0f6zW
	OZxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=FuzDf48dsZ0TTRdtlc4GPDerMxnWdOlJ1S6fSDq3U/Y=;
	b=OaVTR2QLvEh2E2rw2tbQtA4f/Llc2fCf2fpPdADLktZvLcjJ0iDh8JEjUcmYhxKZc0
	KBGhxqT+Yz0ZjtxhcM3aTd7bafaPnZoMwrmnXAJ9DaYG2SRl/7PjQfI1sPB2OruZabPD
	4ORkLt9mQdpVTrTdWlbO/3VjUXAiNiaHUMht8XVahi1AD7FgLutAawsCcYjacQkJJkam
	8DdDu/VskwuzsuPycSRRZiwR0GPM7xmSpa7/VosvmuhTW/QdkumWdkMJvdC686OQAtkU
	MBHzn+D7x9DX/4Jyka1Jj/derlDZzhHWUo+zO0gn57VNTAhfcYi7L8EPJEh4aifQiuTt
	nxGw==
X-Gm-Message-State: AElRT7HHGgzg8TJCs2jAv9g3jZWr0SSYKZxrL63TvKnJIvf8rCRrMkTV
	2pJF99vx6nnDtzrrkM9D3pKAfw==
X-Google-Smtp-Source: AG47ELtnsi442JCpgSLroAOWFFORSU56VqP769Jr4+YYm3i34vkVGtdIkaU8lu/v1g89hUVQA0gwRA==
X-Received: by 2002:a17:902:7885:: with SMTP id
	q5-v6mr7357672pll.207.1520313171704; 
	Mon, 05 Mar 2018 21:12:51 -0800 (PST)
Received: from localhost.localdomain ([2601:646:8880:466c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	p14sm22091153pgf.75.2018.03.05.21.12.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Mar 2018 21:12:51 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  5 Mar 2018 21:12:42 -0800
Message-Id: <20180306051242.21648-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180306051242.21648-1-raj.khem@gmail.com>
References: <20180306051242.21648-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] mpv: Adjust for the recent waf bbclass updates
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
X-List-Received-Date: Tue, 06 Mar 2018 05:12:50 -0000

waf bbclass now expects waf to be an executable script
in ${S} before do_configure, otherwise it ends up in ugly python stack traces

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-multimedia/mplayer/mpv_0.26.0.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-multimedia/mplayer/mpv_0.26.0.bb b/meta-oe/recipes-multimedia/mplayer/mpv_0.26.0.bb
index 44d92a098..de78de27f 100644
--- a/meta-oe/recipes-multimedia/mplayer/mpv_0.26.0.bb
+++ b/meta-oe/recipes-multimedia/mplayer/mpv_0.26.0.bb
@@ -16,7 +16,7 @@ LICENSE_FLAGS = "commercial"
 
 SRC_URI = " \
     https://github.com/mpv-player/mpv/archive/v${PV}.tar.gz;name=mpv \
-    http://www.freehackers.org/~tnagy/release/waf-1.8.12;name=waf;subdir=${BPN}-${PV} \
+    http://www.freehackers.org/~tnagy/release/waf-1.8.12;name=waf;downloadfilename=waf;subdir=${BPN}-${PV} \
 "
 SRC_URI[mpv.md5sum] = "038d0b660de07ff645ad6a741704ecab"
 SRC_URI[mpv.sha256sum] = "daf3ef358d5f260f2269f7caabce27f446c291457ec330077152127133b71b46"
@@ -64,9 +64,10 @@ EXTRA_OECONF = " \
     ${PACKAGECONFIG_CONFARGS} \
 "
 
-do_configure_prepend () {
-    ln -sf waf-1.8.12 ${S}/waf
+adjust_waf_perms() {
     chmod +x ${S}/waf
 }
 
+do_patch[postfuncs] += "adjust_waf_perms"
+
 FILES_${PN} += "${datadir}/icons"
-- 
2.16.2


