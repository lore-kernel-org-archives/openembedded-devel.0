Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f176.google.com (mail-ea0-f176.google.com
	[209.85.215.176])
	by mail.openembedded.org (Postfix) with ESMTP id 85DE96BD5F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 15:51:05 +0000 (UTC)
Received: by mail-ea0-f176.google.com with SMTP id q16so341200ead.7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 08:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=VkznQgRaX/xIAYYeFA/tWrR7TdqZgf+okWdPculYvkk=;
	b=dXaX05FV8yP4xg95eh9PyLMr2mu/+hhQYC9/kEv/a5dbjDHA6NjV42o8KfzV5iBPW4
	6NKFB7rXnp0uPSMqwLopyXFn37c55sRsEyyl1grZkL9ntg4nDGb5Xm4oNLWbI8kCnxVu
	JnVZmfugNpSc6w/eSXUNqCOYNXJsMEvA01CqNJE92CmmPfJ9G4DpG5Fh7WQNhLcJQJ1y
	HqgmfrCjca0iwTCCMNdhcX5hig7nRWvQZW+EcA3YV8yXDN4cLnllvlDV36GAsAvmBY/e
	fh+oEY82HHJok7jyK3NUNKDMxCDI5R75QLsYSX+k8ori4A/drzvmNEra7zWCF2TwAaw1
	CABQ==
X-Received: by 10.14.218.197 with SMTP id k45mr5401959eep.32.1377791465927;
	Thu, 29 Aug 2013 08:51:05 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	f49sm47154951eec.7.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 08:51:05 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Aug 2013 17:51:06 +0200
Message-Id: <caca5c6ec9ff211b95053156c53560c0172ef3a7.1377791377.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
Subject: [WIP][PATCH 13/66] entrance: Add PACKAGECONFIG for consolekit
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 29 Aug 2013 15:51:06 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/entrance_svn.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-efl/recipes-efl/efl/entrance_svn.bb b/meta-efl/recipes-efl/efl/entrance_svn.bb
index 9a85f7b..36f78e1 100644
--- a/meta-efl/recipes-efl/efl/entrance_svn.bb
+++ b/meta-efl/recipes-efl/efl/entrance_svn.bb
@@ -11,6 +11,9 @@ SRC_URI = "${E_SVN}/trunk/PROTO;module=${SRCNAME};protocol=http;scmdata=keep \
 "
 S = "${WORKDIR}/${SRCNAME}"
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[consolekit] = "--enable-consolekit,--disable-consolekit,consolekit"
+
 EXTRA_OECONF = "--with-edje-cc=${STAGING_BINDIR_NATIVE}/edje_cc ${@base_contains('DISTRO_FEATURES', 'pam', '', '--disable-pam', d)}"
 
 PR = "r4"
-- 
1.8.3.2


