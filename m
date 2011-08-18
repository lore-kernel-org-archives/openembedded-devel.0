Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Qtxol-0005hU-PZ
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Aug 2011 10:19:13 +0200
Received: by mail-bw0-f47.google.com with SMTP id zu17so1460188bkb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Aug 2011 01:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=w5w7bbs1MuNzrxCM2yxjaPr5YWvNGWvOhV+jAPo002Q=;
	b=kKXPcFdAhPH4zmXXZgXzAc8kuHWjyhSBx3oon9g9YyVuHl4lvkmULa/Z/w/Ug5+b+K
	aJzfnQBGV1lB5uo+kKvb0U3zbqOFqM28UJIJ0FGZJnYPCry7p7ZwAD4y5Z1S0fbTpTEa
	IjrNGdkiKk6YEXIBw/DTp7wwWbYfTqbpHAb68=
Received: by 10.204.186.1 with SMTP id cq1mr206373bkb.24.1313655274851;
	Thu, 18 Aug 2011 01:14:34 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id f9sm641426bkt.3.2011.08.18.01.14.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 18 Aug 2011 01:14:33 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 18 Aug 2011 10:14:21 +0200
Message-Id: <fbbd50a1943962eb08b7474937867267b9fca50d.1313655217.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <b70d3308cd1493c12b7e1ba39fbfa5bb38c8ecc1.1313655217.git.Martin.Jansa@gmail.com>
References: <b70d3308cd1493c12b7e1ba39fbfa5bb38c8ecc1.1313655217.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1313655217.git.Martin.Jansa@gmail.com>
References: <cover.1313655217.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 2/3] kexec-tools: add bbappend to keep old packaging with separate kexec and kdump
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
X-List-Received-Date: Thu, 18 Aug 2011 08:19:13 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../kexec/kexec-tools_2.0.2.bbappend               |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-kernel/kexec/kexec-tools_2.0.2.bbappend

diff --git a/meta-oe/recipes-kernel/kexec/kexec-tools_2.0.2.bbappend b/meta-oe/recipes-kernel/kexec/kexec-tools_2.0.2.bbappend
new file mode 100644
index 0000000..c59c916
--- /dev/null
+++ b/meta-oe/recipes-kernel/kexec/kexec-tools_2.0.2.bbappend
@@ -0,0 +1,4 @@
+PACKAGES =+ "kexec kdump"
+
+FILES_kexec = "${sbindir}/kexec"
+FILES_kdump = "${sbindir}/kdump"
-- 
1.7.6



