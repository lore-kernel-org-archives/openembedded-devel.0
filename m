Return-Path: <trevor.woerner@linaro.org>
Received: from mail-ig0-f176.google.com (mail-ig0-f176.google.com
	[209.85.213.176])
	by mail.openembedded.org (Postfix) with ESMTP id 52C9465E61
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Apr 2014 02:13:19 +0000 (UTC)
Received: by mail-ig0-f176.google.com with SMTP id uy17so7224473igb.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Apr 2014 19:13:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=LYTS2hbQDFEns5D6qP8XFHB42/GT7MAfC5ANBYnHnco=;
	b=lVWnIbOZqazrE2FdYoTvei0MkDy6ugGNSfseJG/6RIbtL7asdtoIULsMnqDolMLnbT
	n4LPWjh9iW2wPfN2PUfq7u43fGX0ua8QIeckWgXLyfUwzCDAVIK0v3IL8UV6xDMO6NI8
	pcvAcZVuNsyPunoeaC4d6hVxv+iPJYgpuTmZOVn8GkweXBk3+2rY/Q1zJIf/zRqQXERo
	q5WQGQ9T3KjCOqiijtQNJSEQ3z61W2zAMBsbuFrcXuR83uIz8YBYZnmnflvabPqlzHCJ
	o+n+5WENLdYGlE3L3c13MAy4jhe4qE+x8PzrXa3wAh60gAm6mGeBOPoqD9yxfPfj/6qT
	rFMQ==
X-Gm-Message-State: ALoCoQmq3DtYcS3Zl6OG1uneQSis1bTCADgHXbUG5jhvxONu0tA22Z0uqxQk5ai0cmexwAE0Gxp1
X-Received: by 10.50.32.70 with SMTP id g6mr13717180igi.0.1397096000526;
	Wed, 09 Apr 2014 19:13:20 -0700 (PDT)
Received: from openSUSE-i7.site (69-165-220-158.dsl.teksavvy.com.
	[69.165.220.158])
	by mx.google.com with ESMTPSA id s8sm9664674ige.4.2014.04.09.19.13.19
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 09 Apr 2014 19:13:20 -0700 (PDT)
From: Trevor Woerner <trevor.woerner@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 Apr 2014 22:12:51 -0400
Message-Id: <1397095971-17039-2-git-send-email-trevor.woerner@linaro.org>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <1397095971-17039-1-git-send-email-trevor.woerner@linaro.org>
References: <1397095971-17039-1-git-send-email-trevor.woerner@linaro.org>
Cc: patches@linaro.org
Subject: [meta-gnome][PATCH] abiword: force build order
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
X-List-Received-Date: Thu, 10 Apr 2014 02:13:20 -0000

There is a race condition whereby "libgoffice.la" must be built (and exist)
before the rest of the code in "src" is built.

Signed-off-by: Trevor Woerner <trevor.woerner@linaro.org>
---
 meta-gnome/recipes-gnome/abiword/abiword_3.0.0.bb | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta-gnome/recipes-gnome/abiword/abiword_3.0.0.bb b/meta-gnome/recipes-gnome/abiword/abiword_3.0.0.bb
index 69d62ef..073622a 100644
--- a/meta-gnome/recipes-gnome/abiword/abiword_3.0.0.bb
+++ b/meta-gnome/recipes-gnome/abiword/abiword_3.0.0.bb
@@ -50,6 +50,14 @@ do_configure() {
     autotools_do_configure
 }
 
+do_compile() {
+    cd ${S}/goffice-bits2
+    make goffice-paths.h
+    make libgoffice.la
+    cd ${S}
+    oe_runmake
+}
+
 PACKAGES += " ${PN}-clipart ${PN}-strings ${PN}-systemprofiles ${PN}-templates "
 
 FILES_${PN} += " \
-- 
1.9.0


