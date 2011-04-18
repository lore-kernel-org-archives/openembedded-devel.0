Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QBlnq-0007Fg-CW
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Apr 2011 12:35:35 +0200
Received: by mail-fx0-f47.google.com with SMTP id 19so3317704fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Apr 2011 03:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=BNY9iQoovbUJ5P1jdXv+jWXy0yYe4yXL/sHyQxLANiM=;
	b=RT/y926wH6yEtNMNP5n8y7pub/CrTjH/m7AiZCUyjHnk/Qi81Jh0t11HZa6U3uFV8m
	H3T0kkaiPYJ7waq7lqgFlKjiiAF4BRweJ+PFjqiB3eMPg7rxBKHJkviPwPOTpcHmqvhf
	+n5+I1sW0sfhjpkn5Sfc5e/g0YkXiAgXJMsAE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=FGO9WfAU166Pk93qCFQ8X8khMDmOQRJzWXxz7hDuC3btTEMFoQzM8aA+mlRynJ/AcQ
	89JD6OeaJmuJigz4lTFEjiwmxxgYEMVumD6FAVdK4v3u7RajdLw3/hvxYcbzVW5v21XC
	Uq+TjhThQo52tdPKdX3++M/sHj4ZEb66+N4CI=
Received: by 10.223.43.197 with SMTP id x5mr1656019fae.27.1303122796275;
	Mon, 18 Apr 2011 03:33:16 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id j18sm1622578faa.42.2011.04.18.03.33.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 18 Apr 2011 03:33:15 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 18 Apr 2011 12:33:09 +0200
Message-Id: <eca2add8a56342988edd0535dcce4d62f36f52c9.1303122650.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.rc1
In-Reply-To: <cover.1303122650.git.Martin.Jansa@gmail.com>
References: <cover.1303122650.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 03/13] libxft: add native and nativesdk BBCLASSEXTEND
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
X-List-Received-Date: Mon, 18 Apr 2011 10:35:35 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../xorg-lib/libxft_2.2.0.bbappend                 |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-graphics/xorg-lib/libxft_2.2.0.bbappend

diff --git a/meta-oe/recipes-graphics/xorg-lib/libxft_2.2.0.bbappend b/meta-oe/recipes-graphics/xorg-lib/libxft_2.2.0.bbappend
new file mode 100644
index 0000000..608377e
--- /dev/null
+++ b/meta-oe/recipes-graphics/xorg-lib/libxft_2.2.0.bbappend
@@ -0,0 +1 @@
+BBCLASSEXTEND = "native nativesdk"
-- 
1.7.5.rc1



