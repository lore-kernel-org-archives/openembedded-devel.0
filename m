Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f50.google.com (mail-ee0-f50.google.com [74.125.83.50])
	by mail.openembedded.org (Postfix) with ESMTP id 2CB086B7D2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 07:19:39 +0000 (UTC)
Received: by mail-ee0-f50.google.com with SMTP id d51so183056eek.9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 00:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=Kw3Id7fuabheaV4ZG1+0OnLMKeTvm5ev5s8D2f+RBPg=;
	b=xeqRqtvdXoEoNmvzzZryF90WLIPVcxEVWavVF37PlOhKai50x+t5CariILduscrFIN
	yA7YlMGZXU2uw8sn7OltEfA/GCKTZPpNvATAlx08fyfKGTMsowElYXSq19pNcsIk2FHC
	QoQ9uNqZcIzGRqw+lV6oTqBkL1odcygKkqtDQCgZ6hPXvaaS6/VdVqA7HEmQjoRGo4b/
	OQMm93UEfi5srkv/iHlqFH01YOD8/Ci5oQwo+YQDH5Fje3J/gjzllYxkVb4Loa/Bkl26
	bFOkgzQY5LR4u/pJRNAUUyPawtLQLaNFOf2fUcjvQoFDZ5c1MvhaNkdV6i1emIrEZQcB
	bMiA==
X-Received: by 10.15.35.196 with SMTP id g44mr20796663eev.18.1376551179613;
	Thu, 15 Aug 2013 00:19:39 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	a4sm81929084eez.0.2013.08.15.00.19.38
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 15 Aug 2013 00:19:39 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Aug 2013 09:19:15 +0200
Message-Id: <76518a4bd1691093c18695deb6653c319caffab6.1376551135.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1376551134.git.Martin.Jansa@gmail.com>
References: <cover.1376551134.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1376551134.git.Martin.Jansa@gmail.com>
References: <cover.1376551134.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][dylan][PATCH 35/60] atftp: add PACKAGECONFIG for pcre, readline, tcp-wrapper
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
X-List-Received-Date: Thu, 15 Aug 2013 07:19:39 -0000

* it's autodetected from sysroot

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-networking/recipes-daemons/atftp/atftp_git.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-networking/recipes-daemons/atftp/atftp_git.bb b/meta-networking/recipes-daemons/atftp/atftp_git.bb
index 09451bc..4b9ff05 100644
--- a/meta-networking/recipes-daemons/atftp/atftp_git.bb
+++ b/meta-networking/recipes-daemons/atftp/atftp_git.bb
@@ -18,6 +18,11 @@ S = "${WORKDIR}/git"
 
 inherit autotools update-rc.d useradd systemd
 
+PACKAGECONFIG ??= "tcp-wrappers"
+PACKAGECONFIG[pcre] = "--enable-libpcre,--disable-libpcre,libpcre"
+PACKAGECONFIG[tcp-wrappers] = "--enable-libwrap,--disable-libwrap,tcp-wrappers"
+PACKAGECONFIG[readline] = "--enable-libreadline,--disable-libreadline,readline"
+
 INITSCRIPT_PACKAGES = "${PN}d"
 INITSCRIPT_NAME_${PN}d = "atftpd"
 INITSCRIPT_PARAMS_${PN}d = "defaults 80"
-- 
1.8.3.2


