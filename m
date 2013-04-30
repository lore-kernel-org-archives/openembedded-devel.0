Received: from mail-da0-f48.google.com ([209.85.210.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UXDoz-0001MH-60
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Apr 2013 18:54:33 +0200
Received: by mail-da0-f48.google.com with SMTP id f10so316097dak.21
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Apr 2013 09:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=N7MAbHTw32842ZRR4grRzJhcXA39/zYg9Y0r3ztiuhE=;
	b=tO3UWU3E/UVqU+O8LHmfyeRbD0JB9vLN/Wwc90nhlepBncTHUAdwVjwp223fXgqU9g
	QbYfCyHpCWXLd0DqaoimeNCxFLLQkigaPee4G+/MH+ZnrUJIUxg2SKNC9ijaFW/aq6GU
	XCwwpwYo4IR0gknBE+T0VqL79M6dkJQc5splThp6XG5lyCdEWsf0UTCbXvsNIrGCKfzn
	9ikGsWlKp3ssWMN2fWF+vhioza1hMVIa9JPTjhG4XPvcAtfHXNIw+8f0dWZlynA5JTv/
	avktaiZ3obIzC6UfHY4iSKvmAGJxxkdaYdZvGGlgvcUAnxUzKedfhemQMnDphbzcXwgg
	xlAw==
X-Received: by 10.68.130.34 with SMTP id ob2mr78878087pbb.134.1367339797596;
	Tue, 30 Apr 2013 09:36:37 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	x2sm29098442pba.32.2013.04.30.09.36.33 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 30 Apr 2013 09:36:36 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 30 Apr 2013 18:33:00 +0200
Message-Id: <2c6ca829dd29b11150dce6b5b92635e9dc7f8846.1367339450.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.2.1
In-Reply-To: <cover.1367339449.git.Martin.Jansa@gmail.com>
References: <cover.1367339449.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1367339449.git.Martin.Jansa@gmail.com>
References: <cover.1367339449.git.Martin.Jansa@gmail.com>
Cc: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
Subject: [meta-oe][dylan][PATCH 10/12] toolchain-layer, meta-networking: README: add dylan to subject-prefix and update branch in depends
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
X-List-Received-Date: Tue, 30 Apr 2013 16:56:35 -0000
X-List-Received-Date: Tue, 30 Apr 2013 16:56:35 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-networking/MAINTAINERS | 2 +-
 toolchain-layer/README      | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-networking/MAINTAINERS b/meta-networking/MAINTAINERS
index 953e603..c076c79 100644
--- a/meta-networking/MAINTAINERS
+++ b/meta-networking/MAINTAINERS
@@ -8,7 +8,7 @@ When sending single patches, please use something like:
 
    git send-email -1 -M \
         --to openembedded-devel@lists.openembedded.org \
-        --subject-prefix=meta-networking][PATCH
+        --subject-prefix=meta-networking][dylan][PATCH
 
 You may also contact the maintainers directly.
 
diff --git a/toolchain-layer/README b/toolchain-layer/README
index 1f9be50..448693f 100644
--- a/toolchain-layer/README
+++ b/toolchain-layer/README
@@ -1,13 +1,13 @@
 This layer depends on:
 
 URI: git://git.openembedded.org/openembedded-core
-branch: master
+branch: dylan
 revision: HEAD
 
 Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-oe][toolchain-layer]' in the subject'
 
 When sending single patches, please use something like:
-'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-oe][toolchain-layer][PATCH'
+'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-oe][toolchain-layer][dylan][PATCH'
 
 You are encouraged to fork the mirror on github https://github.com/openembedded/meta-oe/ to share your patches, this is preferred for patch sets consisting of more than one patch. Other services like gitorious, repo.or.cz or self hosted setups are of course accepted as well, 'git fetch <remote>' works the same on all of them. We recommend github because it is free, easy to use, has been proven to be reliable and has a really good web GUI.
 
-- 
1.8.2.1



