Received: from mail-fx0-f220.google.com ([209.85.220.220])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael.lippautz@gmail.com>) id 1NkeM4-0000ZO-2F
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Feb 2010 15:06:23 +0100
Received: by fxm20 with SMTP id 20so5823688fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Feb 2010 06:03:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=Uh5RKlDw06tushwNtIBmB7/dKj29JgLHPFfskQu71/Q=;
	b=AUQlk//6gCzFyqJMiTkzjmdB1r+NQaXqpjr+VrIepzjnMQrWnlFHjkuwk4+DzpCiGb
	np5oUYC1lzbf3nh7p5k89iOieu5bXhUnWpvwRB++p0ly/V0L7TcjyFvD24fn/9m0+2vD
	d0fZCn/16JM7YQyy1t6I+o0n5Wulo0S+2uu6A=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=gyrx+uz1zAvPSaCEH1mO+KkKhcItwq3O24HDmuorxQHqTAFJ9ECiWE/1c1DG6/9r/O
	Fmaj7aeGgI4kNdyqlZj7mQQwRBmyBRKkjIbHlB+0oS/z4NbkvVYnPpUzeaIG6Qfr+o6e
	CyvAnnc/6KcywMMbgcrqU9N1gGKX/4+fW0Grc=
Received: by 10.102.211.34 with SMTP id j34mr908252mug.5.1267106609716;
	Thu, 25 Feb 2010 06:03:29 -0800 (PST)
Received: from localhost.localdomain ([62.218.44.194])
	by mx.google.com with ESMTPS id b9sm14554564mug.24.2010.02.25.06.03.28
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 25 Feb 2010 06:03:29 -0800 (PST)
From: Michael Lippautz <michael.lippautz@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 25 Feb 2010 15:03:49 +0100
Message-Id: <1267106629-4897-1-git-send-email-michael.lippautz@gmail.com>
X-Mailer: git-send-email 1.6.4.4
In-Reply-To: <n>
References: <n>
X-SA-Exim-Connect-IP: 209.85.220.220
X-SA-Exim-Mail-From: michael.lippautz@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_PASS autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] libyaml: Bump version to 0.1.3
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
X-List-Received-Date: Thu, 25 Feb 2010 14:06:25 -0000

* Additionally fix staging
---
 recipes/libyaml/libyaml_0.1.3.bb |   13 +++++++++++++
 1 files changed, 13 insertions(+), 0 deletions(-)
 create mode 100644 recipes/libyaml/libyaml_0.1.3.bb

diff --git a/recipes/libyaml/libyaml_0.1.3.bb b/recipes/libyaml/libyaml_0.1.3.bb
new file mode 100644
index 0000000..6c53db1
--- /dev/null
+++ b/recipes/libyaml/libyaml_0.1.3.bb
@@ -0,0 +1,13 @@
+DESCRIPTION = "LibYAML is a YAML parser and emitter written in C."
+HOMEPAGE = "http://pyyaml.org/wiki/LibYAML"
+SECTION = "libs/devel"
+LICENSE = "MIT"
+PR="r0"
+
+SRC_URI = "http://pyyaml.org/download/libyaml/yaml-${PV}.tar.gz;name=libyaml"
+SRC_URI[libyaml.md5sum] = "b8ab9064e8e0330423fe640de76608cd"
+SRC_URI[libyaml.sha256sum] = "a8bbad7e5250b3735126b7e3bd9f6fce9db19d6be7cc13abad17a24b59ec144a"
+
+S = "${WORKDIR}/yaml-${PV}"
+
+inherit autotools
-- 
1.6.4.4



