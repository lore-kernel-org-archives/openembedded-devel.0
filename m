Return-Path: <yevgenyp@pointgrab.com>
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67])
	by mail.openembedded.org (Postfix) with ESMTP id D7B627981F
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Sep 2018 18:10:20 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id v77-v6so12745892lfa.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Sep 2018 11:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=pointgrab-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=kqVI+j40wVIx6KCGyT9eG7WYwE10dBr8Oxj17gEiW7g=;
	b=OE/DL3pxKotjqxtXpw9SlWjX7A4UHUQlC4OdvbKmzFdjY5DCS6MEtescfDbAEUJTGw
	DcOK5e0d8xg444cbQiF/tqwisMd221UqsWj84qw7yIcSAgPqVQlrtiE0siYp4o0LQfMC
	w9/8vUw8KEU6bbmO9+SiMk69kvwsTqvS0sPuqwSvQmV2n0JkgwGsueDTTQn58Uq16y7P
	M0qCMEWlOy74Ipv9LvWo/KcylCPAt3UBKNRB97KjFlq3HrHLG1SN+wVrxebWTbDaI94j
	cI8ndqGwkMBjIZk4F/zD0k42SVpx5zUPxcnPPiEiYbWqBZROQoNe5MWokgLYNwIov9cf
	S4Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=kqVI+j40wVIx6KCGyT9eG7WYwE10dBr8Oxj17gEiW7g=;
	b=WNVRVppwhd2vl/tz9OCw8tckOcoR0Hc6kXlr7HhlWOcgGoCkJpynzEucuSs6FEvVns
	1w6/pay5d7qUv6Xr45xMYekiVebQcvApkjIPTMCL/XORQ+6w7xnodDQxn+nJUPibVOyt
	LzR7R6IdLpJuPkkNuDrBJ8Y+u5YfGohGhJ3rNMJXO+e1TXX9RJ6iUrj+e/t730OzY9FS
	tQ/noxdjmA4mrYI8arTIXBM/0tx5cesbyNIApRG0ph/2Jm5QmXcVIxTshXAnHtzLiyb6
	lBx298SBmrnLg7mUPMkzW9wz5cjbQdWFlLLRjNkBKPBQzMc504Dk2x9D5Ag/8EiiBRWR
	kYCA==
X-Gm-Message-State: APzg51DLpeBmcIBzGfxpx2VTD2y0u/qFv3BXwoVBWMPyhJ7/dPTHSlTd
	H9Bz4KvStmWFkVL3touibETWd2XvabE=
X-Google-Smtp-Source: ANB0VdZwWPirPaFdSiy4AodqzgZ/6hkRkSeHRtMv7kUbx3pHAflgca9lizbZGZ3qt3kDxxSiXBfZJQ==
X-Received: by 2002:ac2:4308:: with SMTP id l8-v6mr6045053lfh.35.1536343821381;
	Fri, 07 Sep 2018 11:10:21 -0700 (PDT)
Received: from yevgeny-lnx.localdomain ([77.222.132.139])
	by smtp.gmail.com with ESMTPSA id
	j24-v6sm1391050lfb.62.2018.09.07.11.10.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 07 Sep 2018 11:10:20 -0700 (PDT)
From: Yevgeny Popovych <yevgenyp@pointgrab.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  7 Sep 2018 21:10:09 +0300
Message-Id: <1536343810-87649-3-git-send-email-yevgenyp@pointgrab.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1536343810-87649-1-git-send-email-yevgenyp@pointgrab.com>
References: <1536343810-87649-1-git-send-email-yevgenyp@pointgrab.com>
Cc: andre.draszik@jci.com
Subject: [meta-java][PATCH 2/3] ca-certificates-java: Don't fail when called via hook on do_rootfs
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
X-List-Received-Date: Fri, 07 Sep 2018 18:10:21 -0000

It is possible that ca-certificates-java hook will be called via
update-ca-certificates hook during do_roofs (the case when D is set
and JVM_LIBDIR is not).
This is a valid case so don't fail.

Change-Id: I908e2f0acec487c41499543014014e29919bd6ab
Signed-off-by: Yevgeny Popovych <yevgenyp@pointgrab.com>
---
 .../ca-certificates-java/ca-certificates-java.hook.in               | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-core/ca-certificates-java/ca-certificates-java/ca-certificates-java.hook.in b/recipes-core/ca-certificates-java/ca-certificates-java/ca-certificates-java.hook.in
index 89c764f..611a4ef 100755
--- a/recipes-core/ca-certificates-java/ca-certificates-java/ca-certificates-java.hook.in
+++ b/recipes-core/ca-certificates-java/ca-certificates-java/ca-certificates-java.hook.in
@@ -14,9 +14,9 @@ jvm_libdir="@@libdir_jvm@@"
 if [ -n "${D:-}" ] ; then
     # called from postinst as part of image build on host
     if [ -z "${JVM_LIBDIR:-}" ] ; then
-        # should never happen, this is supposed to be passed in
-        echo "$0: no JVM_LIBDIR specified" >&2
-        false
+        # if JVM_LIBDIR is not present - we were called as a hook
+        echo "called as a hook of ca-certificates on do_rootfs, exiting"
+        exit 0
     fi
 fi
 if [ -n "${JVM_LIBDIR:-}" ] ; then
-- 
2.7.4


