Received: from fg-out-1718.google.com ([72.14.220.158])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vzapolskiy@gmail.com>) id 1OG6B0-0007y5-Pt
	for openembedded-devel@lists.openembedded.org;
	Sun, 23 May 2010 10:04:51 +0200
Received: by fg-out-1718.google.com with SMTP id 16so726685fgg.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 May 2010 01:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:from:to:cc:subject
	:date:message-id:x-mailer;
	bh=8aGGbrzyCG1dnK+9e4dB/NOMYee3gQPDMljL1nzM5qE=;
	b=R41vsZbtzahpepwHZb1RC9wW22a4AK06Qlf2tCQf9h8prdkseeHpPqjVIjzY/f4+Mg
	JdeuzhxgSJXyoPQJ7K8+rRwAdC7rcvDqTlbEUHU33IULKHhUHcxQU2TXQPscD9qo0pjr
	skH3ahM3pea1Fp13qjE+Qa84qnD4yTqtTnZmw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	b=WN61atoM7CKhIGnhSiFE9edxzoVsyF9MK/axGQLLXymwCVoGH6/tNe2XKyJtYfHGcc
	HFRbSkBngwJZrpNxCU0tnEEEET9ws/JLB2/89tPDOwJttNupLamLw/hSG+RLAHDrpNJu
	xjfLoAvcQHFz7gN6/KyKREc/VNhcdzwVGpG2k=
Received: by 10.87.29.33 with SMTP id g33mr6389347fgj.27.1274601648039;
	Sun, 23 May 2010 01:00:48 -0700 (PDT)
Received: from localhost.localdomain ([94.188.57.8])
	by mx.google.com with ESMTPS id 18sm3971540fks.5.2010.05.23.01.00.46
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 23 May 2010 01:00:47 -0700 (PDT)
Sender: Vladimir Zapolskiy <animist@gmail.com>
From: Vladimir Zapolskiy <vzapolskiy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 May 2010 11:55:29 +0400
Message-Id: <1274601329-18458-1-git-send-email-vzapolskiy@gmail.com>
X-Mailer: git-send-email 1.7.1
X-SA-Exim-Connect-IP: 72.14.220.158
X-SA-Exim-Mail-From: vzapolskiy@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Vladimir Zapolskiy <vzapolskiy@gmail.com>
Subject: [PATCH] autotools: fix libiconv compilation for uclibc toolchain
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
X-List-Received-Date: Sun, 23 May 2010 08:04:51 -0000

Recent commit to autotools.bbclass forces gettext install dependency
for packets with defined AM_GNU_GETTEXT macro. In uclibc platform
gettext depends on libiconv, but the macro is present and reliable in
libiconv configuration script.

Signed-off-by: Vladimir Zapolskiy <vzapolskiy@gmail.com>
Cc: Joshua Lock <josh@linux.intel.com>
---
 classes/autotools.bbclass |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/classes/autotools.bbclass b/classes/autotools.bbclass
index 9bb4f6c..a97a64a 100644
--- a/classes/autotools.bbclass
+++ b/classes/autotools.bbclass
@@ -129,10 +129,6 @@ autotools_do_configure() {
 			    oenote Executing glib-gettextize --force --copy
 			    echo "no" | glib-gettextize --force --copy
 			  fi
-			else if grep "^[[:space:]]*AM_GNU_GETTEXT" $CONFIGURE_AC >/dev/null; then
-			  cp ${STAGING_DATADIR}/gettext/config.rpath ${S}/
-			fi
-
 			fi
 			mkdir -p m4
 			oenote Executing autoreconf --verbose --install --force ${EXTRA_AUTORECONF} $acpaths
-- 
1.7.1



