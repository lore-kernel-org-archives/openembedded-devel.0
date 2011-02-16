Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1PpfQy-0002dg-Ou
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Feb 2011 12:20:36 +0100
Received: by yie16 with SMTP id 16so532819yie.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Feb 2011 03:19:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references;
	bh=SGUB+X7jmflcfyH7FQE+fg3tllpym0VTlbgC1BgQ1oM=;
	b=SQJghoqkUjSVwsyqJzHjoa0x1OxkG/T5+meg5Xmedn0/6pAgJAbdolaQ6uSdDlfrLN
	M+0pfPxjhFsnsrVTYNoz3GroqTfGtuspJRIsbnjyj83GHrfNEuZYofpq0Fn6y31BVU8G
	XidNjDlvyupM+iND+xc63utCr+9Unx8dFqfCg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=mK8k5mke+2Qc7K8RkIjn4ghQKtAvoXjLcMZiXZLiKctM3tBdRBkBCCBleuuCb4vSO4
	Ng/nubep9eOqTQVOZ8MY2aOQvCw/Rdyy3PSpCPHP4R1TxFBZxKDtcT/RbFHK5rlRtZ69
	AU1s4ojZIzMZROuwKFRD5BmbqxB26E1cxMqmo=
Received: by 10.236.110.14 with SMTP id t14mr866040yhg.57.1297855165350;
	Wed, 16 Feb 2011 03:19:25 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id 68sm3057927yhl.19.2011.02.16.03.19.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 16 Feb 2011 03:19:24 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 16 Feb 2011 11:18:49 +0000
Message-Id: <1297855134-19216-8-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1297855134-19216-1-git-send-email-otavio@ossystems.com.br>
References: <1297855134-19216-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 08/13] cdparanoia (svn): use build variables to fix packaging when using empty prefix
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
X-List-Received-Date: Wed, 16 Feb 2011 11:20:37 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 recipes/cdparanoia/cdparanoia_svn.bb |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes/cdparanoia/cdparanoia_svn.bb b/recipes/cdparanoia/cdparanoia_svn.bb
index c40d979..a845e49 100644
--- a/recipes/cdparanoia/cdparanoia_svn.bb
+++ b/recipes/cdparanoia/cdparanoia_svn.bb
@@ -4,7 +4,7 @@
 
 HOMEPAGE = "http://www.xiph.org/paranoia/"
 DESCRIPTION = "Audio CD digital audio extraction application"
-PR = "r0"
+PR = "r1"
 LICENSE = "GPLv2"
 
 PV = "10.2+svnr${SRCPV}"
@@ -37,8 +37,8 @@ FILES_libcdparanoia-dev = "${includedir} ${libdir}/lib*${SOLIBSDEV}"
 FILES_libcdparanoia-static = "${libdir}/*.a"
 
 do_install() {
-	oe_runmake BINDIR="${D}/usr/bin" MANDIR="${D}/usr/share/man/" \
-		   INCLUDEDIR="${D}/usr/include/" LIBDIR="${D}/usr/lib" \
-		   PKGCONFIGDIR="${D}/usr/lib/pkgconfig" \
+	oe_runmake BINDIR="${D}${bindir}" MANDIR="${D}${datadir}/man/" \
+		   INCLUDEDIR="${D}${includedir}" LIBDIR="${D}${libdir}" \
+		   PKGCONFIGDIR="${D}${libdir}/pkgconfig" \
 		   install
 }
-- 
1.7.2.3



