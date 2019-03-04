Return-Path: <jan.vermaete@gmail.com>
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com
	[209.85.210.48])
	by mail.openembedded.org (Postfix) with ESMTP id 34B7A7C876
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Mar 2019 19:01:05 +0000 (UTC)
Received: by mail-ot1-f48.google.com with SMTP id t7so5146384otk.8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Mar 2019 11:01:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=Q+mL3QF1ecJ4o7FHmCvs188SAaHSi4gjz6lmk04099Y=;
	b=ELAz+3AcLYIKFn/SJkxysu9/WYHzuygtV1hrKQ3J7EVwtEi2ioE0lJQ4RVljJr1yRB
	HwssprSchprgTGcWOSC1nepRvl6pJKzo+ds9LXeUjlxytciP4wuU6imUS5Pjda+zmeW5
	Ja+kR+H6ATqnVvVcQ49gQmnASYNNb0OUTfukQRlT3VsU5YL5Y2k1SmTL4+E8lpYQc085
	NEJ8n8sPn+E2DuxChrTpmYcNx9ZDipU7XeggBQSKywwWf524pp9y5gaYmu3i0W/LVrMF
	hNhofjmevjsGDw6IiE3YVlGOyoTyJr6TjCvmQx9gGAUJ6c7ut2G+ESXiFlaBR2Q545T7
	iEsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=Q+mL3QF1ecJ4o7FHmCvs188SAaHSi4gjz6lmk04099Y=;
	b=cUZIYObj8DHj5jgwvHDkzjcBF9+MokYEe7GrBMq3UdAUD1uhfmXLRt+JokvZ87VjU/
	Q/REPp/grMIV6WCAm2o95Zu+oUFEbYwjygH74kK1ciY6ZewkYM8xneMaQ6p1wjR+gZfS
	+7+MYkZBl01wMs+VSM44lwgPpYiChu1lVMs4kkhcxN+H1nCi9aj9uR38hBmh1DyAy35w
	Gih/uK1qQQz55kgKBeMl/dNXdN3p1IokWZDrUOGITGo6VeGMXwTK2yxDdlaXV37MicTP
	Ot7a/IBEmQCmZWs8ou49AXIxR+Vk4ejSVt26vF+u/Br/DnTgtlkMFOpXfSKbk9O1JN8E
	+CPw==
X-Gm-Message-State: APjAAAUtxGYBIOaPoFNpmok2LEeExCN67GDPTRQbvpvaLpywq09IZXL6
	6xbGfx9SPhGI4yzjbqYPzvxFOvsue3qUEnR6LdLrYvEQ
X-Google-Smtp-Source: APXvYqwU02k+K8uBuf3pdo4sjjdaG2R9zMWscIBUyYkuH+aIZInavB3QhRKy76cYfSX7aemxTwPRlGe4Crao+682DfA=
X-Received: by 2002:a05:6830:20da:: with SMTP id
	z26mr13977028otq.204.1551726065896; 
	Mon, 04 Mar 2019 11:01:05 -0800 (PST)
MIME-Version: 1.0
From: jan vermaete <jan.vermaete@gmail.com>
Date: Mon, 4 Mar 2019 20:00:54 +0100
Message-ID: <CABF_=yi=0_kWsS9LJt931jnDUv6e9mr+UGyq=ZK7ikhiaeN+0w@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: [PATCH] [meta-python] Replaced cryptograpy by crypt.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 04 Mar 2019 19:01:05 -0000
Content-Type: text/plain; charset="UTF-8"

Replaced 'cryptography' by the much small 'crypto' package.
With cryptography, the build is too big with e.g. cpp included.

PS: this was already a long time the mailinglist.  I guess with my
attempt to attach a patch, this could be processed.

Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
---
 meta-python/recipes-devtools/python/python-attrs.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-attrs.inc
b/meta-python/recipes-devtools/python/python-attrs.inc
index fa73ea5..6de14e5 100644
--- a/meta-python/recipes-devtools/python/python-attrs.inc
+++ b/meta-python/recipes-devtools/python/python-attrs.inc
@@ -9,6 +9,6 @@ SRC_URI[md5sum] = "3f3f3e0750dab74cfa1dc8b0fd7a5f86"
 inherit pypi

 RDEPENDS_${PN}_class-target += " \
-    ${PYTHON_PN}-cryptography \
+    ${PYTHON_PN}-crypt \
     ${PYTHON_PN}-ctypes \
 "
-- 
2.7.4

