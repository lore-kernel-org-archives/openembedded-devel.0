Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f50.google.com (mail-wg0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 3BEF86FA40
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Apr 2014 17:15:19 +0000 (UTC)
Received: by mail-wg0-f50.google.com with SMTP id x13so7627186wgg.21
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Apr 2014 10:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=oghx8sZOUJh9aFgjZaTtcUElKCBYj/Vjh+FBxmkWH5c=;
	b=mIgzUa69XdrTAWsTbt+4snp4vA0lACJh1qRZksdic3fSe2BlJeqQbwj31o4kBJ59Gf
	WdNeD5BG5KqrRzIdVNOCHCz0GNY9wYPSVbCObfWedK4i4eFLwpT/gk05nLNLblB8csCT
	hQLLKFwEHvKrAp3uhlUIuyLdYzAa80VvDpw0NbluMxnwD0mGKFyP0L9hV/0C1M9331GB
	pBErmz+kpzBJ4F+uxrZUwGKgCdgxJTLIRyLSGTRQlW+OmpaYnHRjCLexyyRRQ3mSNSRn
	TIjDY1VJryO1O/Atwgu58vswmPoHWAX4YYKj0bjqvuv7Xnf9hM2cT4sCkHQD3KxUxRiE
	mE7A==
X-Received: by 10.180.97.37 with SMTP id dx5mr21592748wib.53.1396372520423;
	Tue, 01 Apr 2014 10:15:20 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	l42sm41863938eew.19.2014.04.01.10.15.19 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Apr 2014 10:15:19 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 Apr 2014 19:13:43 +0200
Message-Id: <1396372434-10710-35-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1396372434-10710-1-git-send-email-Martin.Jansa@gmail.com>
References: <1396372434-10710-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 35/46] atftp: include whole sysconfdir in PN
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
X-List-Received-Date: Tue, 01 Apr 2014 17:15:20 -0000

* when sysv script is removed QA warn is shown:
  atftp-0.7.1+gitAUTOINC+be3291a18c: atftp: Files/directories were installed but not shipped
    /etc
  empty dir doesn't cost much, so just include it

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-networking/recipes-daemons/atftp/atftp_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-daemons/atftp/atftp_git.bb b/meta-networking/recipes-daemons/atftp/atftp_git.bb
index ffc0bc8..ee84f77 100644
--- a/meta-networking/recipes-daemons/atftp/atftp_git.bb
+++ b/meta-networking/recipes-daemons/atftp/atftp_git.bb
@@ -49,7 +49,7 @@ PACKAGES =+ "${PN}d"
 FILES_${PN} = "${bindir}/*"
 
 FILES_${PN}d = "${sbindir}/* \
-    ${sysconfdir}/init.d/* \
+    ${sysconfdir} \
     /srv/tftp \
     ${systemd_unitdir}/system/atftpd.service \
 "
-- 
1.9.1


