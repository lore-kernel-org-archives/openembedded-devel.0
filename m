Received: from mail-ee0-f51.google.com ([74.125.83.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UR0nX-0007Tn-T7
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Apr 2013 15:47:21 +0200
Received: by mail-ee0-f51.google.com with SMTP id c4so1591868eek.38
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Apr 2013 06:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=utrOkDHKxgHt9AMPMy7NDcpaTRpX48bdmrLOtfD2HbA=;
	b=QZtaI5V0coaAmXuVjbfQE2S0Cojoy8pbU772lYaLgxLfzBHbEfvb/VZ1SdUFL3OY1u
	cfzsuXlqnQPaZy3VLjlpM40a+s9UrLW8m1krmi8rVU161pNiScGJgt8jULNegZoY5pOi
	SEuDBVGwsPaivSDniIOgR5QXgVZqKBQRy8b6rc0uXQdO28ILt3kOi/XJZZT/UqHwjBjM
	cMMVsLkOBDMALPRE5z7wvMieJLaPOUfSzSuqmdrhtxruISxooWE74MEbgdiF4y5360ru
	Vn6UGxZDrehMDD7bKUC3gcXVjRvcH0Dzh5zW3kn8ta7InnsPDSbJdspUZZh9I+3g7XNF
	pU+g==
X-Received: by 10.14.182.137 with SMTP id o9mr39504945eem.13.1365859794262;
	Sat, 13 Apr 2013 06:29:54 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id n48sm2907355eeg.12.2013.04.13.06.29.53
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 13 Apr 2013 06:29:53 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 13 Apr 2013 15:29:21 +0200
Message-Id: <1365859790-20947-4-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.5
In-Reply-To: <1365859790-20947-1-git-send-email-Martin.Jansa@gmail.com>
References: <1365859790-20947-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-systemd][PATCH 04/33] rpcbind: move bbappend to oe-core subdirectory
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
X-List-Received-Date: Sat, 13 Apr 2013 13:47:41 -0000
X-List-Received-Date: Sat, 13 Apr 2013 13:47:41 -0000
X-List-Received-Date: Sat, 13 Apr 2013 13:47:41 -0000
X-List-Received-Date: Sat, 13 Apr 2013 13:47:41 -0000
X-List-Received-Date: Sat, 13 Apr 2013 13:47:41 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../{meta-oe => oe-core}/recipes-extended/rpcbind/rpcbind/rpcbind.service | 0
 .../{meta-oe => oe-core}/recipes-extended/rpcbind/rpcbind_0.2.0.bbappend  | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-systemd/{meta-oe => oe-core}/recipes-extended/rpcbind/rpcbind/rpcbind.service (100%)
 rename meta-systemd/{meta-oe => oe-core}/recipes-extended/rpcbind/rpcbind_0.2.0.bbappend (100%)

diff --git a/meta-systemd/meta-oe/recipes-extended/rpcbind/rpcbind/rpcbind.service b/meta-systemd/oe-core/recipes-extended/rpcbind/rpcbind/rpcbind.service
similarity index 100%
rename from meta-systemd/meta-oe/recipes-extended/rpcbind/rpcbind/rpcbind.service
rename to meta-systemd/oe-core/recipes-extended/rpcbind/rpcbind/rpcbind.service
diff --git a/meta-systemd/meta-oe/recipes-extended/rpcbind/rpcbind_0.2.0.bbappend b/meta-systemd/oe-core/recipes-extended/rpcbind/rpcbind_0.2.0.bbappend
similarity index 100%
rename from meta-systemd/meta-oe/recipes-extended/rpcbind/rpcbind_0.2.0.bbappend
rename to meta-systemd/oe-core/recipes-extended/rpcbind/rpcbind_0.2.0.bbappend
-- 
1.8.1.5



