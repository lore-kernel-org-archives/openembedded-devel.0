Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qe0-f54.google.com (mail-qe0-f54.google.com
	[209.85.128.54])
	by mail.openembedded.org (Postfix) with ESMTP id F0CF961222
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Dec 2013 00:31:29 +0000 (UTC)
Received: by mail-qe0-f54.google.com with SMTP id cy11so4642321qeb.27
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Dec 2013 16:31:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=29jeykP8S0Y7eUt32t7AtNWv26S7LKGGlrDYuOHQk5I=;
	b=YsJ9/LGQ3fDVaynhe7d9nGSl7y3yWXjgq7E1juCLBt51LPwmK3jIJ4SZwwHtdaLF1m
	JRPpGklmU1Z1Q0zbRVwouCsT+uFLcqOhLZoJU0l1/fVdLYP3p8fH7C1VUn9Azz1ut/oM
	/sJOj7az2+mZmAO4mHApbgPctn94b7yeLNmnjA+9ftDvzX494E4IolvXPmL369tv3BmW
	PnkMD9+4q46VJDtaMe0FKxhcEESz4Ernm0m478r3RNTZ2KTpIvt1l9X3eiQHDS+iJaaj
	Iut1E1EPsOvDWC/KWRBroUAlRRJtMLMVInjtSZF3Tv9uEJvz6+5kS793vnmzaWd9zAqA
	Jfcg==
X-Received: by 10.49.75.10 with SMTP id y10mr37958781qev.56.1387240289676;
	Mon, 16 Dec 2013 16:31:29 -0800 (PST)
Received: from nano.lab.ossystems.com.br ([187.90.230.254])
	by mx.google.com with ESMTPSA id
	f19sm50901478qaq.12.2013.12.16.16.31.26 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Dec 2013 16:31:27 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by nano.lab.ossystems.com.br (Postfix, from userid 1000)
	id 36FC217643BB3; Mon, 16 Dec 2013 22:31:14 -0200 (BRST)
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Mon, 16 Dec 2013 22:31:00 -0200
Message-Id: <1387240261-7045-5-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.4.3
In-Reply-To: <1387240261-7045-1-git-send-email-otavio@ossystems.com.br>
References: <1387240261-7045-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe PATCH v2 5/6] ntfs-3g-ntfsprogs: Fix runtime dependency for development package
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
X-List-Received-Date: Tue, 17 Dec 2013 00:31:30 -0000

The -dev has a runtime dependency against ${PN} which is empty; we
allow it to be empty to satisfy the dependency instead of mangingling
the -dev dependencies.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
Changes in v2: None

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


