Received: from [72.14.220.156] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dbaryshkov@gmail.com>) id 1KzAiW-0001bz-HG
	for openembedded-devel@lists.openembedded.org;
	Sun, 09 Nov 2008 14:52:40 +0100
Received: by fg-out-1718.google.com with SMTP id l26so2045121fgb.20
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 09 Nov 2008 05:50:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=1wSFTMJqZw7jTwPRMADgJtLNNtCS58nG6jLCQ003Bno=;
	b=CkLeYXCoTYDWbG6yrt5dnGlELBMlP93/N9eTckc8rjLjlci5mdpgKNt2eu6H5iF2Fy
	OH1YzWYQtCtgW+wxrCejfMSTMsb8L3dnyn7sZGVQuJLnDJv0QyP+SsuXdw1PVf4PYNNM
	iNfnqsaRxBfPXp7Z48mvQpeW3rnnk/cT0fppo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=s8U2QwwTNuoeM1Fog0bnXeoUalD3+rIVsAdf4F4ck8DEeQY0mxBNvmh2t1B63ZD+1J
	i5Nz3NV/LhdaN1dW/lP9R6ZFkb8Vh6u7bbxlCc5diOTWNxdUgtGRqeiwcNK4jEtLridb
	fYKdQakHgG+EaUGVsoif0MKyt4IfUOG46hqRw=
Received: by 10.86.79.19 with SMTP id c19mr6165854fgb.41.1226237362903;
	Sun, 09 Nov 2008 05:29:22 -0800 (PST)
Received: from localhost.localdomain (ppp89-110-5-254.pppoe.avangarddsl.ru
	[89.110.5.254])
	by mx.google.com with ESMTPS id l12sm8088339fgb.6.2008.11.09.05.29.20
	(version=SSLv3 cipher=RC4-MD5); Sun, 09 Nov 2008 05:29:21 -0800 (PST)
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  9 Nov 2008 16:28:14 +0300
Message-Id: <1226237296-11012-14-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.5.6.5
In-Reply-To: <1226237296-11012-13-git-send-email-dbaryshkov@gmail.com>
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
	<1226237296-11012-13-git-send-email-dbaryshkov@gmail.com>
Cc: Dmitry Baryshkov <dbaryshkov@gmail.com>
Subject: [PATCH] contacts: fix build error
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
X-List-Received-Date: Sun, 09 Nov 2008 13:52:40 -0000

contacts' source defines e_util_unicode_get_utf8() as both static
function() in .c file and as non-static one in the header. As this
function is unused outside of that file, drop non-static declaration.

Signed-off-by: Dmitry Baryshkov <dbaryshkov@gmail.com>
---
 .../pimlico/contacts-0.8/contacts-util-fixup.diff  |   13 +++++++++++++
 packages/pimlico/contacts_0.8.bb                   |    1 +
 2 files changed, 14 insertions(+), 0 deletions(-)
 create mode 100644 packages/pimlico/contacts-0.8/contacts-util-fixup.diff

diff --git a/packages/pimlico/contacts-0.8/contacts-util-fixup.diff b/packages/pimlico/contacts-0.8/contacts-util-fixup.diff
new file mode 100644
index 0000000..95c3dbb
--- /dev/null
+++ b/packages/pimlico/contacts-0.8/contacts-util-fixup.diff
@@ -0,0 +1,13 @@
+Index: contacts-0.8/src/contacts-utils.h
+===================================================================
+--- contacts-0.8.orig/src/contacts-utils.h	2008-10-30 13:42:03.527971013 +0300
++++ contacts-0.8/src/contacts-utils.h	2008-10-30 13:42:08.140177662 +0300
+@@ -22,8 +22,6 @@
+ #include <libebook/e-book.h>
+ #include "contacts-defs.h"
+
+-char *e_util_unicode_get_utf8 (const char *text, gunichar * out);
+-
+ const char *kozo_utf8_strstrcasestrip (const char *haystack,
+				       const gunichar * needle);
+
diff --git a/packages/pimlico/contacts_0.8.bb b/packages/pimlico/contacts_0.8.bb
index d596d45..861e83a 100644
--- a/packages/pimlico/contacts_0.8.bb
+++ b/packages/pimlico/contacts_0.8.bb
@@ -6,4 +6,5 @@ SRC_URI = "http://pimlico-project.org/sources/${PN}/${PN}-${PV}.tar.gz \
 	   file://stock_contact.png \
 	   file://stock_person.png  \
 	   file://contacts-owl-window-menu.patch;patch=1 \
+	   file://contacts-util-fixup.diff;patch=1 \
 	  "
-- 
1.5.6.5



