Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f42.google.com (mail-ee0-f42.google.com [74.125.83.42])
	by mail.openembedded.org (Postfix) with ESMTP id 011E26028B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jul 2013 12:40:57 +0000 (UTC)
Received: by mail-ee0-f42.google.com with SMTP id c4so212173eek.15
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jul 2013 05:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=Kw3Id7fuabheaV4ZG1+0OnLMKeTvm5ev5s8D2f+RBPg=;
	b=rjCExE/oWkVX2hGhvPBzj2eONipgs/66V/eA4kIpHYXQAGBARL6oVoZpKxprVGc61c
	9ePih9jS8QMSCNBL2tAgbO9VrdC8rakj6PZgFq+kraXg2UIFG8wiDIkn2Zvm1XfJt0AM
	lA6ax3Y+kSjXGBPW3p/oAko7TcXgTsN/241zT2ldvlpfnY3lYrni0GzhZ81oByiZKmpc
	7aO1kvCQ6Q15CdG94mjDz94NZA/wLAKrtyvtgrfJD0TCr3ICnlh2jSIGMZwjMFNCQTs/
	oVjW4axoeYZCGX30Qy037wlu2ceoEhD5p1jeveUHRTMXqAJ+WCRXQY6hIPrXrd9M8jZw
	BW9w==
X-Received: by 10.15.21.199 with SMTP id d47mr37014366eeu.36.1374669658168;
	Wed, 24 Jul 2013 05:40:58 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	n45sm65924504eew.1.2013.07.24.05.40.57 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 24 Jul 2013 05:40:57 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 24 Jul 2013 14:40:48 +0200
Message-Id: <5ce129a2d3a1f99aed5f182b36863f1be272e576.1374669516.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <bddf85b42118361920fbde7c54baffd0e085d5a7.1374669516.git.Martin.Jansa@gmail.com>
References: <bddf85b42118361920fbde7c54baffd0e085d5a7.1374669516.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1374669516.git.Martin.Jansa@gmail.com>
References: <cover.1374669516.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 04/29] atftp: add PACKAGECONFIG for pcre, readline, tcp-wrapper
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
X-List-Received-Date: Wed, 24 Jul 2013 12:40:58 -0000

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


