Received: from mail-ea0-f182.google.com ([209.85.215.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1ULexS-0007aA-7q
	for openembedded-devel@lists.openembedded.org;
	Fri, 29 Mar 2013 20:27:26 +0100
Received: by mail-ea0-f182.google.com with SMTP id q15so337351ead.13
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Mar 2013 12:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=Yd8VJv5znqS4xPznTsS+cblYaMaKF2CSOsLLA//5NhY=;
	b=M7lzjbf/AmIJ3pCU8ulE6GjKG0MMCHtrUcLT7AFvp4opdECwhEWd1FS6+wUydFiQLF
	TgNcoriB5iJNawwTzhvQV6OyMtxKLH6D5aB8Gpde5sjjJsbW7YqAXy1A6DVnMtUedCcl
	xAYsqw0LEZeW0rnD0z1xJUhardQe47aO19yBMrV+TVB1q6yCYAVjUPuc2yi2Cyce/fvT
	VnSQhQszKuFVfNxkIf5syslWBSVwa7k3nAwJY2NWhs7Gg1gVtqtbmlR+2PW/V0BYR486
	hLY63HL68e0fc+FWt3tbm+F5EN/HsJDWrRRzpS2xbfagC0Sb4g15espfjsCdR+0AQG1t
	qdCA==
X-Received: by 10.14.3.133 with SMTP id 5mr10383337eeh.43.1364584222049;
	Fri, 29 Mar 2013 12:10:22 -0700 (PDT)
Received: from localhost.localdomain (p4FDF04AD.dip.t-dialin.net.
	[79.223.4.173])
	by mx.google.com with ESMTPS id r4sm5769042eeo.12.2013.03.29.12.10.20
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Fri, 29 Mar 2013 12:10:21 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 29 Mar 2013 20:10:05 +0100
Message-Id: <1364584207-3047-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1364584207-3047-1-git-send-email-schnitzeltony@googlemail.com>
References: <1364584207-3047-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce 2/4] exo: split out exo-csource to exo-dev - it is not required on target
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
X-List-Received-Date: Fri, 29 Mar 2013 19:27:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-xfce/recipes-xfce/exo/exo_0.10.2.bb |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/meta-xfce/recipes-xfce/exo/exo_0.10.2.bb b/meta-xfce/recipes-xfce/exo/exo_0.10.2.bb
index e859cfa..e7247ff 100644
--- a/meta-xfce/recipes-xfce/exo/exo_0.10.2.bb
+++ b/meta-xfce/recipes-xfce/exo/exo_0.10.2.bb
@@ -4,7 +4,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 DEPENDS = "gtk+ libxfce4util libxfce4ui virtual/libx11 perl-native cairo"
 DEPENDS_virtclass-native = "glib-2.0-native xfce4-dev-tools-native"
-PR = "r1"
+PR = "r2"
 
 inherit xfce pythonnative
 
@@ -36,4 +36,7 @@ FILES_${PN} += "${datadir}/xfce4/ \
 FILES_${PN}-dbg += "${libdir}/gio/modules/.debug \
                    "
 
+FILES_${PN}-dev += "${bindir}/gio/exo-csource \
+                   "
+
 BBCLASSEXTEND = "native"
-- 
1.7.4.4



