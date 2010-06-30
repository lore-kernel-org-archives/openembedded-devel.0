Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <joaohf@gmail.com>) id 1OTlQu-0001MU-D0
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Jun 2010 02:45:45 +0200
Received: by gwj18 with SMTP id 18so143942gwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Jun 2010 17:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=ZWDD++9r23g4XdUS5dSNw6Qu9wRarCLFiEDQUWdmhLg=;
	b=NfjvbMTcT5a/pQiDq4No4mgDa7jNehb03btq84K1TidkFP+jnBGat8rHzXpR3b6ZHU
	qQywc0UVp/THu7XkuVkbioi2rmJN4WgxzBRC4B7PrTuzQesvFdVnsycxYzTSZZYL9oQw
	iKIxB+B5riMuZpBihRxpqd9jDUK2hYsw0Z+uU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=OIxagxTBpMRIc+6YEGL67EjJnJaL9+bB3bweKj+6jlFrtet+uEdHuRR63KQk01t9X8
	Z1d36B84ZjiHaLDA7gTVymCyNFgyxQzeaPEOrhJ6wz6d6wpCnj7gJ6vmSu5X0cKp4p/v
	R2nghOUWaE82Nm0ueFvfCfVDA2a8bUmuI+Jy8=
Received: by 10.101.5.40 with SMTP id h40mr9682084ani.133.1277858459896;
	Tue, 29 Jun 2010 17:40:59 -0700 (PDT)
Received: from localhost.localdomain ([201.53.204.31])
	by mx.google.com with ESMTPS id 36sm344282ybr.8.2010.06.29.17.40.58
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 29 Jun 2010 17:40:59 -0700 (PDT)
From: "Joao H. Freitas" <joaohf@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 29 Jun 2010 21:40:39 -0300
Message-Id: <1277858443-27280-2-git-send-email-joaohf@gmail.com>
X-Mailer: git-send-email 1.7.0.2
In-Reply-To: <1277858443-27280-1-git-send-email-joaohf@gmail.com>
References: <1277858443-27280-1-git-send-email-joaohf@gmail.com>
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: joaohf@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 1/5] Add cgreen. Library to do unit test for C language
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
X-List-Received-Date: Wed, 30 Jun 2010 00:45:45 -0000

---
 recipes/cgreen/cgreen.inc    |   15 +++++++++++++++
 recipes/cgreen/cgreen_svn.bb |   21 +++++++++++++++++++++
 2 files changed, 36 insertions(+), 0 deletions(-)
 create mode 100644 recipes/cgreen/cgreen.inc
 create mode 100644 recipes/cgreen/cgreen_svn.bb

diff --git a/recipes/cgreen/cgreen.inc b/recipes/cgreen/cgreen.inc
new file mode 100644
index 0000000..9c71db5
--- /dev/null
+++ b/recipes/cgreen/cgreen.inc
@@ -0,0 +1,15 @@
+DESCRIPTION = "Cgreen is a unit test framework for C language"
+SECTION = "libs"
+PRIORITY = "optional"
+LICENSE = "GPLv2"
+
+S = "${WORKDIR}/${BPN}-${PV}"
+
+INC_PR = "r0"
+
+BBCLASSEXTEND = "native sdk"
+
+inherit cmake
+
+#FILES_${PN}-dev += "${bindir}/*-config"
+#FILES_${PN}-utils = ""
diff --git a/recipes/cgreen/cgreen_svn.bb b/recipes/cgreen/cgreen_svn.bb
new file mode 100644
index 0000000..88dad6d
--- /dev/null
+++ b/recipes/cgreen/cgreen_svn.bb
@@ -0,0 +1,21 @@
+require cgreen.inc
+
+SRCREV = "334"
+PR = "${INC_PR}.0"
+
+S = "${WORKDIR}/cgreen"
+
+SRC_URI = "svn://cgreen.svn.sourceforge.net/svnroot/cgreen/trunk;module=cgreen;proto=https"
+
+EXTRA_OECONF = ""
+EXTRA_OEMAKE = "INSTALL_PREFIX=${D}"
+
+EXTRA_OECMAKE = ""
+
+OECMAKE_SOURCEPATH = "../cgreen"
+
+PARALLEL_MAKE = ""
+CCACHE = ""
+
+
+
-- 
1.7.0.2



