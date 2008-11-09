Received: from [72.14.220.152] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dbaryshkov@gmail.com>) id 1KzArw-0002M8-Ig
	for openembedded-devel@lists.openembedded.org;
	Sun, 09 Nov 2008 15:02:24 +0100
Received: by fg-out-1718.google.com with SMTP id l26so2048061fgb.20
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 09 Nov 2008 06:00:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=e1ACtdn4tcopmlEzer2Iuc06OO1A8Ghf5QTOGX2B7xQ=;
	b=Rmq4h+ZCepk430bxCuIRA/XWNdf6MetDyybvkzByeHxf/OQnmulXzPJpXHuJ3znGAn
	4D9BxzxZbLSvf7Y+qQ0iZwV7hgVZ3GFcA1VkmhbzRYf0r06bhl07zwRdlSnnqZvZFzMU
	AmTIpTvZSXqe2sXsx8rehN/HzOFt6oALj3R3Y=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=YBzW3u5qebP2s/QzG2AI3FtegW+xQddm4d4olyOYadfT4qrEaIb/nfryVg94zJdUQo
	kJmSRwdB7vgw68+8WMQAP8nt4KDSu70jeiJJ8GJcKguyiYqEVKkOGGZ6eMYVDQXvSqiL
	S5qim3zoY3J0Xn23oCvZIkoy+TTQ/pru4CeB8=
Received: by 10.86.51.10 with SMTP id y10mr6228197fgy.9.1226237340804;
	Sun, 09 Nov 2008 05:29:00 -0800 (PST)
Received: from localhost.localdomain (ppp89-110-5-254.pppoe.avangarddsl.ru
	[89.110.5.254])
	by mx.google.com with ESMTPS id l12sm8088339fgb.6.2008.11.09.05.28.59
	(version=SSLv3 cipher=RC4-MD5); Sun, 09 Nov 2008 05:29:00 -0800 (PST)
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  9 Nov 2008 16:28:03 +0300
Message-Id: <1226237296-11012-3-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.5.6.5
In-Reply-To: <1226237296-11012-2-git-send-email-dbaryshkov@gmail.com>
References: <1226237296-11012-1-git-send-email-dbaryshkov@gmail.com>
	<1226237296-11012-2-git-send-email-dbaryshkov@gmail.com>
Cc: Dmitry Baryshkov <dbaryshkov@gmail.com>
Subject: [PATCH] libmailwrapper: add 1.2.4 version recipe
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
X-List-Received-Date: Sun, 09 Nov 2008 14:02:24 -0000

Signed-off-by: Dmitry Baryshkov <dbaryshkov@gmail.com>
---
 packages/libmailwrapper/libmailwrapper_1.2.4.bb |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)
 create mode 100644 packages/libmailwrapper/libmailwrapper_1.2.4.bb

diff --git a/packages/libmailwrapper/libmailwrapper_1.2.4.bb b/packages/libmailwrapper/libmailwrapper_1.2.4.bb
new file mode 100644
index 0000000..c3fcddf
--- /dev/null
+++ b/packages/libmailwrapper/libmailwrapper_1.2.4.bb
@@ -0,0 +1,5 @@
+require ${PN}.inc
+
+PR = "r0"
+
+SRC_URI = "${HANDHELDS_CVS};tag=${TAG};module=opie/noncore/net/mail/libmailwrapper"
-- 
1.5.6.5



