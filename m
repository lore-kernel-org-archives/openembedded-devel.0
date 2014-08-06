Return-Path: <joe.macdonald@gmail.com>
Received: from mail-ig0-f169.google.com (mail-ig0-f169.google.com
	[209.85.213.169])
	by mail.openembedded.org (Postfix) with ESMTP id DE10C60809
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Aug 2014 13:39:31 +0000 (UTC)
Received: by mail-ig0-f169.google.com with SMTP id r2so10382982igi.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Aug 2014 06:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id;
	bh=rymyzKt7o9YEplZF0wrHqs5s8m9w5BbccO3bZ5Mfowo=;
	b=uHQT9ZhsgULLcVhp2EIh+EhaAyfEImK7f4O9qfqEjYQzTcLk6HNy8Iyy1+pI7dWfPM
	06fWJT3sWwm+Xk2jkTb52k9ondsnQ7T3P0Mk3vnAjVBvWxKUq12LVKqPl5hY3fWjTz7x
	IAbaOB8/B9xwx4jbuugAoPeakOfKfkHCk2NzQOLSyqtfd9yDxKMqBnks5jaWvbJYsg/n
	8dWuxywrHyDEvxTeD7JeEZ0sZxQmhMIz0N2mWZ1LkPjqCy2yTk3nhhRh5SrUci1fqtcD
	Zqb8sYLWMK8ShmzQH/93pP/kU7CKfaTS61anHQ6qT4BnhWDNyRZ8YslHFCcvkREbZk2F
	r98g==
X-Received: by 10.50.138.195 with SMTP id qs3mr18582517igb.14.1407332372801;
	Wed, 06 Aug 2014 06:39:32 -0700 (PDT)
Received: from skynet.deserted.net (24-246-4-250.cable.teksavvy.com.
	[24.246.4.250])
	by mx.google.com with ESMTPSA id bf4sm7716175igb.17.2014.08.06.06.39.30
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Aug 2014 06:39:31 -0700 (PDT)
Sender: Joe MacDonald <joe.macdonald@gmail.com>
From: Joe MacDonald <joe_macdonald@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  6 Aug 2014 09:39:29 -0400
Message-Id: <1407332369-386-1-git-send-email-joe_macdonald@mentor.com>
X-Mailer: git-send-email 2.0.0.257.g75cc6c6
Subject: [meta-networking][PATCH] README: Update layer dependencies
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
X-List-Received-Date: Wed, 06 Aug 2014 13:39:41 -0000

There are a few recipes in meta-networking that depend unconditionally on
components in meta-oe, so indicate that in the README.

Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
---
 meta-networking/README | 8 ++++++++
 1 file changed, 8 insertions(+)

Roy's question on the list reminded me of a change I've been meaning to do
for ages now.  This follows the form used in meta-webserver.


diff --git a/meta-networking/README b/meta-networking/README
index 872b013..339d40e 100644
--- a/meta-networking/README
+++ b/meta-networking/README
@@ -21,6 +21,14 @@ URI: git://github.com/openembedded/oe-core.git
 branch: master
 revision: HEAD
 
+For some recipes, the meta-oe layer is required:
+
+URI: git://github.com/openembedded/meta-oe.git
+subdirectory: meta-oe
+branch: master
+revision: HEAD
+
+
 Maintenance
 -----------
 
-- 
2.0.0.257.g75cc6c6


