Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
	[209.85.215.179])
	by mail.openembedded.org (Postfix) with ESMTP id 9A48F7FCA3
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Jan 2020 16:20:45 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id q127so27097778pga.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Jan 2020 08:20:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=2AC/cz9GgoujPhoQ+l1Sr0MEw5HPAPDk9mL7kbmERrg=;
	b=Q9I1aOId5vslfjJMGmfrFn9PFlfFqAhryiXwDGdAVQFDUnu2/BqH8WGl4izGI5hYkd
	m5i5Vbvs7bYPZquCsFITm5H3SIjQe6Km/mp+H8DT0ctff0LLCcMGuqlCgZUtOrZpAHA2
	pej8ldbdYAB/Y8qhcGvK8xruZBHqfKObSEPIvh3Uxdm9UTG7GpnOSdYnpxmCXXB4ByIL
	EPFy+ASz4HpS5ILyolNi24hDILC396QRbju/yaE1TlYYoA12Ewc1/8EtN61L07ARSwXl
	Kw3CPVF+DljxT+OTmkgtT/ZavhJmx886Bt84SGrT/pTQnnwsMZQ+pYqSTv8kxf5Qawcg
	eAZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=2AC/cz9GgoujPhoQ+l1Sr0MEw5HPAPDk9mL7kbmERrg=;
	b=ZGBHUrB1i6obwbig6QbI3C6n+RIt++PAJPEZeWICzekyDxjgwjr/hQAX/aIwiY2JhX
	kF/fYGZjn8lC1u5VlJPgP+c2PNmVOeK6ZBye5LUIfOtMMj0HUK0iuNF5JAI5I6TQaBFh
	aUsf7D4QI0kRXVSCyCevf7qYkI1vUR7N77uhbr4k7TRxk1E3EeXGawCJMqSfLDvv7zyD
	b5JXuCgZMjDRkJqmQZa00M/4TCWOqlY2KrdwbdK2MY1CNtH4CsYZQkkqfayLetdvDimB
	D/Ze00GRKjY/8Z1lPu8nG5JojiI5AhVR6a+fbJepsGehrcYn3YT/bej3QP0irp5fFrre
	LEoQ==
X-Gm-Message-State: APjAAAX8i+nXGWntPruTxCKefZXzfck/eV7jWNW4FmTpKnjUVXC1vn2a
	Sv2k57BKi9Ce7Z4iPzGQ4KxNjuY6
X-Google-Smtp-Source: APXvYqwviUPf7K2G/VbnRXmzCKQzL70+e1v0O8tnyJ6RrxdIWZuKzyjOfaR6qqX2xrL8auI5M88vuA==
X-Received: by 2002:aa7:9290:: with SMTP id j16mr76890214pfa.30.1578327646474; 
	Mon, 06 Jan 2020 08:20:46 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:6832:e19c:36b9:d5e])
	by smtp.gmail.com with ESMTPSA id
	g26sm69999588pfo.130.2020.01.06.08.20.45
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 06 Jan 2020 08:20:45 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 Jan 2020 08:20:17 -0800
Message-Id: <81829ab28afae08e02f4a758ec063fc0d90579ea.1578327474.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578327474.git.akuster808@gmail.com>
References: <cover.1578327474.git.akuster808@gmail.com>
Subject: [1.44 09/25] bb.utils.fileslocked: don't leak files if yield throws
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
X-List-Received-Date: Mon, 06 Jan 2020 16:20:45 -0000

From: Chris Laplante via bitbake-devel <bitbake-devel@lists.openembedded.org>

Discovered with a recipe under devtool. The ${S}/singletask.lock file (added by
externalsrc.bbclass) was leaked, giving a warning like:

  WARNING: <PN>+git999-r0 do_populate_lic: /home/laplante/yocto/sources/poky/bitbake/lib/bb/build.py:582: ResourceWarning: unclosed file <_io.TextIOWrapper name='/home/laplante/yocto/build/workspace/sources/<PN>/singletask.lock' mode='a+' encoding='UTF-8'>
    exec_func(task, localdata)

Signed-off-by: Chris Laplante <chris.laplante@agilent.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6beddf6214e22b4002626761031a9e9d34fb04db)
---
 lib/bb/utils.py | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/lib/bb/utils.py b/lib/bb/utils.py
index 8d40bcdf..d65265c4 100644
--- a/lib/bb/utils.py
+++ b/lib/bb/utils.py
@@ -428,10 +428,11 @@ def fileslocked(files):
         for lockfile in files:
             locks.append(bb.utils.lockfile(lockfile))
 
-    yield
-
-    for lock in locks:
-        bb.utils.unlockfile(lock)
+    try:
+        yield
+    finally:
+        for lock in locks:
+            bb.utils.unlockfile(lock)
 
 @contextmanager
 def timeout(seconds):
-- 
2.17.1


