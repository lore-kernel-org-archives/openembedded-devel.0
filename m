Received: from [72.14.220.152] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dbaryshkov@gmail.com>) id 1KzArq-0002M8-Qo
	for openembedded-devel@lists.openembedded.org;
	Sun, 09 Nov 2008 15:02:18 +0100
Received: by fg-out-1718.google.com with SMTP id l26so2048061fgb.20
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 09 Nov 2008 06:00:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=P19/0Tda08/0Fl7XBa245a3nga6EF9S4wKGzZShK63w=;
	b=W36b95e1Jc5KUJOq+mNIEPq4Cnc7psefw4EwuZ9PzQAy8R04blpH5pBN9jEKjywpqj
	/6Gr5UJEYOv1sK/1YiwQjDqA6PDzmdy+7n+Mh+j8HLXmLWLf596MLFwb72IyHrl6KRhQ
	p5nZSRU82uY17buy8TfiVisEcx9TRv1evNoYU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=ELkfGTpw4GT21LSStnfXqH30gUGY6Y3ViJNak44EmmwdqkWHDKKGxcoYPbWdA5n7s1
	5YD+MzgD8DStFw6xUVSwT1CrMFneEUD+p38OHwNgVlVGoWTIMeNPLV6NCaGNMRcSYzuf
	f1Yen4iR3QCI2plHWJPWaRY0ACmUIRrdg1vz0=
Received: by 10.86.97.7 with SMTP id u7mr5803087fgb.37.1226237360649;
	Sun, 09 Nov 2008 05:29:20 -0800 (PST)
Received: from localhost.localdomain (ppp89-110-5-254.pppoe.avangarddsl.ru
	[89.110.5.254])
	by mx.google.com with ESMTPS id l12sm8088339fgb.6.2008.11.09.05.29.19
	(version=SSLv3 cipher=RC4-MD5); Sun, 09 Nov 2008 05:29:19 -0800 (PST)
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  9 Nov 2008 16:28:13 +0300
Message-Id: <1226237296-11012-13-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.5.6.5
In-Reply-To: <1226237296-11012-12-git-send-email-dbaryshkov@gmail.com>
References: <1226237296-11012-1-git-send-email-dbaryshkov@gmail.com>
	<1226237296-11012-2-git-send-email-dbaryshkov@gmail.com>
	<1226237296-11012-3-git-send-email-dbaryshkov@gmail.com>
	<1226237296-11012-4-git-send-email-dbaryshkov@gmail.com>
	<1226237296-11012-5-git-send-email-dbaryshkov@gmail.com>
	<1226237296-11012-6-git-send-email-dbaryshkov@gmail.com>
	<1226237296-11012-7-git-send-email-dbaryshkov@gmail.com>
	<1226237296-11012-8-git-send-email-dbaryshkov@gmail.com>
	<1226237296-11012-9-git-send-email-dbaryshkov@gmail.com>
	<1226237296-11012-10-git-send-email-dbaryshkov@gmail.com>
	<1226237296-11012-11-git-send-email-dbaryshkov@gmail.com>
	<1226237296-11012-12-git-send-email-dbaryshkov@gmail.com>
Cc: Dmitry Baryshkov <dbaryshkov@gmail.com>
Subject: [PATCH] linphone: fix building with current speex
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
X-List-Received-Date: Sun, 09 Nov 2008 14:02:18 -0000

Signed-off-by: Dmitry Baryshkov <dbaryshkov@gmail.com>
---
 .../linphone/linphone-1.6.0/linphone-speex.diff    |   13 +++++++++++++
 packages/linphone/linphone_1.6.0.bb                |    3 ++-
 2 files changed, 15 insertions(+), 1 deletions(-)
 create mode 100644 packages/linphone/linphone-1.6.0/linphone-speex.diff

diff --git a/packages/linphone/linphone-1.6.0/linphone-speex.diff b/packages/linphone/linphone-1.6.0/linphone-speex.diff
new file mode 100644
index 0000000..930c774
--- /dev/null
+++ b/packages/linphone/linphone-1.6.0/linphone-speex.diff
@@ -0,0 +1,13 @@
+Index: linphone-1.6.0/mediastreamer2/configure.ac
+===================================================================
+--- linphone-1.6.0.orig/mediastreamer2/configure.ac	2008-11-04 03:41:04.936798321 +0300
++++ linphone-1.6.0/mediastreamer2/configure.ac	2008-11-04 03:41:09.589036036 +0300
+@@ -253,7 +253,7 @@ dnl	check for various codecs libraries
+ dnl	*************************************
+
+ dnl check for installed version of speex
+-PKG_CHECK_MODULES(SPEEX, speex >= 1.1.12,
++PKG_CHECK_MODULES(SPEEX, speex >= 1.1.12 speexdsp,
+	[ AC_DEFINE(HAVE_SPEEX_NOISE,1,[tells whether the noise arg of speex_echo_cancel can be used]) ],
+	[try_other_speex=yes]
+ )
diff --git a/packages/linphone/linphone_1.6.0.bb b/packages/linphone/linphone_1.6.0.bb
index fe40b6a..64b2daf 100644
--- a/packages/linphone/linphone_1.6.0.bb
+++ b/packages/linphone/linphone_1.6.0.bb
@@ -21,7 +21,8 @@ PROVIDES += "linphone linphonec liblinphone"
 PR = "r3"
 
 SRC_URI = "http://download.savannah.nongnu.org/releases/linphone/1.6.x/sources/linphone-${PV}.tar.gz \
-           http://download.devbase.at/voip/linphone-1.6.0-pl0.patch;patch=1"
+           http://download.devbase.at/voip/linphone-1.6.0-pl0.patch;patch=1 \
+           file://linphone-speex.diff;patch=1"
 
 S = "${WORKDIR}/linphone-${PV}"
 
-- 
1.5.6.5



