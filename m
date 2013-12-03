Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f47.google.com (mail-yh0-f47.google.com
	[209.85.213.47])
	by mail.openembedded.org (Postfix) with ESMTP id 9AB5D6D5B3
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Dec 2013 21:44:20 +0000 (UTC)
Received: by mail-yh0-f47.google.com with SMTP id 29so10777007yhl.34
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Dec 2013 13:44:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=CFop6powprf0QHeTejt2JbnpZmOXdgKL8jrpg/HEYhc=;
	b=VgIecZCOUhLps5dT9+8hMqjglsYo4oyacqGIhk0ar4TI7LHaw8noAFhcEe09Dd5hKb
	xrEWeVMFT7SB9jUNOZrAkKdbuBQkvq+O7DhfteyTyJmZ9c+lPQymi8WhQIEmRdESZipz
	vtB4tTD5w2dnl/R0gAhvbXQkt5U//8q2WxMVDGApxv84GJneFG1ldnO2HvCcVkXQoGM2
	+3aScrmSUdCMe12MbukNxevjLiht7Ot94QLPrJW4ggOgn5H2kFmyIPeHvAaZJU5ihI1N
	FjGm2IhJbcol30hR10Oss8f1CgDfQtXFnhUxuldR5kH5h3wLO42+8ss+21MuU6J3Y2wT
	164w==
X-Received: by 10.236.42.10 with SMTP id i10mr3354670yhb.130.1386107060150;
	Tue, 03 Dec 2013 13:44:20 -0800 (PST)
Received: from nano.lab.ossystems.com.br ([177.194.208.225])
	by mx.google.com with ESMTPSA id r98sm4073968yhp.3.2013.12.03.13.44.18
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 03 Dec 2013 13:44:19 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by nano.lab.ossystems.com.br (Postfix, from userid 1000)
	id 1D8B4175EF899; Tue,  3 Dec 2013 19:44:16 -0200 (BRST)
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Tue,  3 Dec 2013 19:44:07 -0200
Message-Id: <1386107047-27409-5-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.4.3
In-Reply-To: <1386107047-27409-1-git-send-email-otavio@ossystems.com.br>
References: <1386107047-27409-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe 5/5] ntfs-3g-ntfsprogs: Fix runtime dependency for development package
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
X-List-Received-Date: Tue, 03 Dec 2013 21:44:22 -0000

The -dev has a runtime dependency against ${PN} which is empty; we
allow it to be empty to satisfy the dependency instead of mangingling
the -dev dependencies.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2013.1.13.bb                   | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2013.1.13.bb b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2013.1.13.bb
index c1392cc..2e7a616 100644
--- a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2013.1.13.bb
+++ b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2013.1.13.bb
@@ -34,3 +34,6 @@ do_install_append() {
     # when called. Add the symbolic to let mount could find ntfs.
     ln -sf mount.ntfs-3g ${D}/${base_sbindir}/mount.ntfs
 }
+
+# Satisfy the -dev runtime dependency
+ALLOW_EMPTY_${PN} = "1"
-- 
1.8.4.3


