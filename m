Received: from [72.14.220.153] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dbaryshkov@gmail.com>) id 1KzAhD-0001Zf-4M
	for openembedded-devel@lists.openembedded.org;
	Sun, 09 Nov 2008 14:51:19 +0100
Received: by fg-out-1718.google.com with SMTP id l26so2044586fgb.20
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 09 Nov 2008 05:49:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=NMAOmSOERJLQ02M63x7Uk02Vi39fKm/obCZ02f4YyzE=;
	b=nmeufxiUk+wi87UQMzak2RGkBJWYylxQqttVwYuzoCvdTI6snR8A+t1SDRtZuEpYMA
	f7ppcmlGaE4c1m+OYAptr7R9ONoXl3WmF8Oz1pQDiNZEQzMjohYIIyfu7oGc/MlVz6TI
	QtHoR5y9jTjFndQDyRwst5AHVGJdxZ9q6qz48=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=rKnGVfzVNT2uVd/Fyi9nvIO3ysYE5wq4l2+7Rp7Sue69MDaftOBwEC6js+KK8jVpzC
	+Un4TeBkO58ksi8yj2ttlOhIUXYDW6rdUmHX0nMROzzGl+CxXjukc7FE/k8vZkiikcDk
	t+g8ifsUvf4fbQx7/LSFBKkKj4+WT2irI+eGk=
Received: by 10.181.235.6 with SMTP id m6mr1723567bkr.131.1226237356781;
	Sun, 09 Nov 2008 05:29:16 -0800 (PST)
Received: from localhost.localdomain (ppp89-110-5-254.pppoe.avangarddsl.ru
	[89.110.5.254])
	by mx.google.com with ESMTPS id l12sm8088339fgb.6.2008.11.09.05.29.15
	(version=SSLv3 cipher=RC4-MD5); Sun, 09 Nov 2008 05:29:15 -0800 (PST)
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  9 Nov 2008 16:28:11 +0300
Message-Id: <1226237296-11012-11-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.5.6.5
In-Reply-To: <1226237296-11012-10-git-send-email-dbaryshkov@gmail.com>
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
Cc: Dmitry Baryshkov <dbaryshkov@gmail.com>
Subject: [PATCH] gloox: fix gloox.pc in the staging
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
X-List-Received-Date: Sun, 09 Nov 2008 13:51:19 -0000

As gloox.pc included @CFLAGS@ substitution, it got populated with
-isystem CFLAGS, thus breaking staging QA. Fix that by dropping
unnecessary @CFLAGS@ substitution.

Signed-off-by: Dmitry Baryshkov <dbaryshkov@gmail.com>
---
 packages/gloox/gloox/gloox-fix-pc.diff |   10 ++++++++++
 packages/gloox/gloox_0.8.9.bb          |    3 ++-
 2 files changed, 12 insertions(+), 1 deletions(-)
 create mode 100644 packages/gloox/gloox/gloox-fix-pc.diff

diff --git a/packages/gloox/gloox/gloox-fix-pc.diff b/packages/gloox/gloox/gloox-fix-pc.diff
new file mode 100644
index 0000000..70cb84e
--- /dev/null
+++ b/packages/gloox/gloox/gloox-fix-pc.diff
@@ -0,0 +1,10 @@
+Index: gloox-0.8.9/gloox.pc.in
+===================================================================
+--- gloox-0.8.9.orig/gloox.pc.in	2008-11-04 04:20:26.896779618 +0300
++++ gloox-0.8.9/gloox.pc.in	2008-11-04 04:20:32.665427239 +0300
+@@ -7,4 +7,4 @@ Name: gloox
+ Description: A high-level XMPP/Jabber library for C++
+ Version: @VERSION@
+ Libs: -L${libdir} -lgloox @LIBS@
+-Cflags: -I${includedir} @CFLAGS@
++Cflags: -I${includedir}
diff --git a/packages/gloox/gloox_0.8.9.bb b/packages/gloox/gloox_0.8.9.bb
index 09004a8..562fb90 100644
--- a/packages/gloox/gloox_0.8.9.bb
+++ b/packages/gloox/gloox_0.8.9.bb
@@ -8,7 +8,8 @@ DEPENDS = "iksemel libidn gnutls"
 
 inherit autotools pkgconfig
 
-SRC_URI = "http://camaya.net/download/${P}.tar.bz2"
+SRC_URI = "http://camaya.net/download/${P}.tar.bz2 \
+	   file://gloox-fix-pc.diff;patch=1"
 
 do_stage () {
 	autotools_stage_all
-- 
1.5.6.5



