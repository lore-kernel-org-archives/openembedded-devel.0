Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1RumrB-0001Jt-Jp
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Feb 2012 16:21:22 +0100
Received: by mail-ey0-f175.google.com with SMTP id l10so1955916eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Feb 2012 07:13:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=1ubuzS//q37oL+Nxo5oOhiIq0U6hLvJk5IGm6612H6I=;
	b=uWeptR6fDeJHwIDr8STlFxEX7KkpY8/oij3Sbys3y+y5sRlxY1UeL0TIERqGiZUHxk
	MYKIjnGuJtBvdiPhN4OymfdlsSduYpON+/sKoyaNB03muraYOR6hzSYvLnbKaSlixOVG
	5BnvWL8S/uqhqtDetd7SK/fS3cWduey7jYNxw=
Received: by 10.213.3.5 with SMTP id 5mr2218895ebl.91.1328627601521;
	Tue, 07 Feb 2012 07:13:21 -0800 (PST)
Received: from localhost.localdomain (ip-95-223-250-190.unitymediagroup.de.
	[95.223.250.190])
	by mx.google.com with ESMTPS id n58sm1424741een.10.2012.02.07.07.13.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 07 Feb 2012 07:13:21 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  7 Feb 2012 16:12:53 +0100
Message-Id: <1328627573-5217-28-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <1328627573-5217-1-git-send-email-schnitzeltony@googlemail.com>
References: <1328627573-5217-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe][RFC 27/27] task-x11: replace systemd specific packets by common ones
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
X-List-Received-Date: Tue, 07 Feb 2012 15:21:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-core/tasks/task-x11_1.0.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-core/tasks/task-x11_1.0.bb b/meta-oe/recipes-core/tasks/task-x11_1.0.bb
index 681e4f3..9cc747f 100644
--- a/meta-oe/recipes-core/tasks/task-x11_1.0.bb
+++ b/meta-oe/recipes-core/tasks/task-x11_1.0.bb
@@ -16,8 +16,8 @@ RRECOMMENDS_${PN} = "\
 # xserver-common, x11-common
 VIRTUAL-RUNTIME_xserver_common ?= "xserver-common"
 
-# elsa, xserver-nodm-init or xserver-nodm-init-systemd
-VIRTUAL-RUNTIME_graphical_init_manager ?= "xserver-nodm-init-systemd"
+# elsa, xserver-nodm-init
+VIRTUAL-RUNTIME_graphical_init_manager ?= "xserver-nodm-init"
 
 RDEPENDS_${PN}-utils = "\
   ${VIRTUAL-RUNTIME_xserver_common} \
-- 
1.7.6.4



