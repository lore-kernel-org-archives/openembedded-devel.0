Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1PqUOh-0007Dq-4F
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Feb 2011 18:45:39 +0100
Received: by mail-yi0-f47.google.com with SMTP id 16so1651053yie.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Feb 2011 09:44:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references;
	bh=082OHakQ3z0x81Kqd4qA8iy5Jozpm7aShOzwy8oZ/N0=;
	b=Y/dHBT/6LfXxUK3dT84K3hpFV9pjlHzDX33U1AaTktTuFuoQRalzu6+KlDJlJ0wErj
	TYXlJdIH1PfBnFtbQav5Od/2pG84hbEoGbiyJVHIVpTR9mEGvpG1fjW6RBODxYgUMDxq
	wzdTTdoXpvhbj2DRcQn1BLdYJaPP8DPWjcFbE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=W3ft5BH3m6tW6yqabY9LA15KbPPRSCkgCEAhfexrU2TJAMmEe9j23FOguzxHjfaF3Z
	MjDGm07OUkOuNVRD3MuBEJR4d8CWqYgHQA8wTmqW8vlQUcPlgd+apGK+EUIcsebXp1bj
	jvSidfkn73+fu7eHSuNkRn2znxqhnUf+a5JTg=
Received: by 10.150.191.16 with SMTP id o16mr1328089ybf.442.1298051067495;
	Fri, 18 Feb 2011 09:44:27 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id 23sm1480538yhl.23.2011.02.18.09.44.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 18 Feb 2011 09:44:25 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 18 Feb 2011 17:43:31 +0000
Message-Id: <1298051011-10445-17-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1298051011-10445-1-git-send-email-otavio@ossystems.com.br>
References: <1298051011-10445-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 16/16] distro/micro.conf: drop exec_prefix_native since it is unused
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
X-List-Received-Date: Fri, 18 Feb 2011 17:45:39 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
Acked-by: Khem Raj <raj.khem@gmail.com>
---
 conf/distro/micro.conf |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/conf/distro/micro.conf b/conf/distro/micro.conf
index 963afa8..b1f8f1e 100644
--- a/conf/distro/micro.conf
+++ b/conf/distro/micro.conf
@@ -91,7 +91,6 @@ PACKAGE_SNAP_LIB_SYMLINKS = "1"
 prefix = ""
 exec_prefix = ""
 prefix_native = ""
-exec_prefix_native = ""
 
 # Don't install ldconfig and associated gubbins
 USE_LDCONFIG = "0"
-- 
1.7.2.3



