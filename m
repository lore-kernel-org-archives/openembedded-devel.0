Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f43.google.com (mail-yh0-f43.google.com
	[209.85.213.43])
	by mail.openembedded.org (Postfix) with ESMTP id 4238460DFD
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Dec 2013 05:15:31 +0000 (UTC)
Received: by mail-yh0-f43.google.com with SMTP id a41so1906037yho.30
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Dec 2013 21:15:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=6k049QRzHEKs1nFiPKMTlq1cfbvVAEi7BHXrDuE6+bU=;
	b=n/PomIhB/KELXnoO6c/KeIAhlW8Uhdhw2dFBNValhanmXbtVECpYMWHYY57bWjfp6o
	mF3GSmBBCLQ8Abu86+wDU6PPqbt0msnZWN0No1F3wjkcXKCv5TPa/0zvaUnKK7zh8aG9
	g6W7vdix+DKLAaau5Hzb1FFXMkGh+9QicQLcqxGzrON6MR5JT1JWWE6DbmvayLMHmsey
	JTU8hTdad/d4Kl0Dq4/04CQcO6bPJW0/QJMYbkJx8O0Z6TkPLHCsub6WwFKkfsLcunxA
	RW/M51aOhwX3Nv6B6XGsHRgu9KNA/78LdA001ov0k+4mj0fKSMuH47rrRK8avYBWy4dx
	aW1w==
X-Received: by 10.236.105.236 with SMTP id k72mr32348058yhg.30.1388121332036; 
	Thu, 26 Dec 2013 21:15:32 -0800 (PST)
Received: from nano.lab.ossystems.com.br (72.17.156.179.nw.nuvox.net.
	[72.17.156.179]) by mx.google.com with ESMTPSA id
	r64sm44852204yhc.23.2013.12.26.21.15.24 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 26 Dec 2013 21:15:31 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by nano.lab.ossystems.com.br (Postfix, from userid 1000)
	id F41AB17647491; Fri, 27 Dec 2013 03:15:14 -0200 (BRST)
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Fri, 27 Dec 2013 03:15:14 -0200
Message-Id: <1388121314-6630-3-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.4.3
In-Reply-To: <1388121314-6630-1-git-send-email-otavio@ossystems.com.br>
References: <1388121314-6630-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][for-dora 3/3] ntfs-3g-ntfsprogs: Fix runtime dependency for development package
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
X-List-Received-Date: Fri, 27 Dec 2013 05:15:32 -0000

The -dev has a runtime dependency against ${PN} which is empty; we
allow it to be empty to satisfy the dependency instead of mangingling
the -dev dependencies.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
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


