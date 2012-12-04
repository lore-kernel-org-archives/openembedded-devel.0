Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tfi3f-0002Sw-BV
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Dec 2012 03:16:36 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so1926125eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Dec 2012 18:02:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=HSEG8lx41c9xIOBfvjoxUfGj2nK1i/mwZ5g/UrAYepo=;
	b=qJjim2kXEd9XaqEjeJx37vSUx30amgHd7NhDRF9RpgfAlpq+Hu2L6hHVQvbcvjkN5V
	GGMPya9foZM/r6CAlr0nTC1U6raa2YVylug/fqNPayVNhKTbJ9/IGkqRmcWEFux45QIQ
	DdwS+5otcm5OUDWoVxZSktDU6gKbDmBfUpYc5+EWgCaNtOkIHU3dzov6aAiB9jITCodw
	nt0VscDFmca7XPD4paKpFsyXWfeU6Ke16ohcJ02FKKaBeS5V7PBgUAXLdlbL9Vj48l3b
	PdUnp/1pumBin55cNeJMJ9plxu7Es4a+fIAsRT+klEVjVYUF7YTrXK2lXd/CqBjEzQPI
	D7QQ==
Received: by 10.14.225.4 with SMTP id y4mr13069951eep.6.1354586527776;
	Mon, 03 Dec 2012 18:02:07 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id k2sm34804425eep.15.2012.12.03.18.02.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Dec 2012 18:02:07 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  4 Dec 2012 02:58:51 +0100
Message-Id: <0079bf6e22e6d350a8cc60af3118cdfbde8a692b.1354586187.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <cover.1354586187.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354586187.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
Subject: [PATCH 18/58] cpu: add LIC_FILES_CHKSUM
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
X-List-Received-Date: Tue, 04 Dec 2012 02:16:37 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/e17/cpu_svn.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-efl/recipes-efl/e17/cpu_svn.bb b/meta-efl/recipes-efl/e17/cpu_svn.bb
index ccc6e7e..c0ad6a4 100644
--- a/meta-efl/recipes-efl/e17/cpu_svn.bb
+++ b/meta-efl/recipes-efl/e17/cpu_svn.bb
@@ -1,4 +1,7 @@
 LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=344895f253c32f38e182dcaf30fe8a35 \
+                    file://COPYING-PLAIN;md5=c910b645eda0005ccec46f75203dc96e"
+
 PV = "0.0.1+svnr${SRCREV}"
 PR = "${INC_PR}.0"
 
-- 
1.8.0



