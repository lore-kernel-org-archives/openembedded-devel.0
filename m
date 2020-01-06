Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
	[209.85.215.182])
	by mail.openembedded.org (Postfix) with ESMTP id D6D827FA0C
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Jan 2020 16:20:55 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id q127so27097974pga.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Jan 2020 08:20:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=2PQFLTpft4I4RHmYaiSVuS4s4wdizbv7+pRw3yKbcHg=;
	b=AyslDYZq5ydpvs+77BHy5AxTiN9y3LMhYnGGTt7325UjbCEYfKY/OTTSvu8bSc0o5G
	za5cDX6Pvfcc1PHdjMh8Vvmwjuc2rcT1/t4smRjGwMvA2xS45woKI4CAWDQD/OS8WPse
	XeRDPzp3pe4i2mV2xWvuZNq3mGgHTBEp199/qWJLYUroOYPlbV8YIPc02HJLUFJjg3NR
	DIQiMybDUxf2I5ieqzJWdpNkSG23MCfuQc8nwVdRVh9RUalhJcy1Wwttz0aNaOa2L+rp
	ThNsZvjcnMgoSOphg3KlFDsOqTd9bhKJbvyXFPFp2dhLf8K3r8PdDnGt0uagAB5VU5Wj
	fs4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=2PQFLTpft4I4RHmYaiSVuS4s4wdizbv7+pRw3yKbcHg=;
	b=tAfxHVOQ7YmeoFXrGcRsJZkJIGcpq/q56d4Xp+FqMgL5lkQeNiJgd0V9bMvkuwOnAC
	iiXAxdsCaC7denwGpYKc3x7v8LgaMcAgVzsqUdoM03l+XDrUetUwya42Qw6bDg8ZYniM
	6j0Od2Pm6VRQCrfq+sDUqE6OAj+yBNEHpHKqU/5m5Co1XvUlGEEGLzjZfNh8qXHxXOmv
	JotGr9CAtAd451zaLQymSOt0EbzmJqVMRTLKsKBhh09m+rE34ck+3CipvxZ08GUNdUuP
	hQ4ENkGyVzmzzxTLa0sIKJ4a1RPllTtS7xAEpZFtfYshW5kh+JocAcHg3aCYSsCN4Xdk
	ni2g==
X-Gm-Message-State: APjAAAUH755NL1UZ6z5SA7xz6aOp38QH4tJrGiSLmVd5OFGvACAZtbJp
	9qRWq1ez3C6AIqYC8A2klRNQm5sK
X-Google-Smtp-Source: APXvYqwIGccAKYCN5G0SruICUfNloM3Eou6gD9bJfm+Fof68eNgBvddRyWlEd4YHmPP0pseLT8DJcA==
X-Received: by 2002:a65:68d4:: with SMTP id
	k20mr112911568pgt.142.1578327656639; 
	Mon, 06 Jan 2020 08:20:56 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:6832:e19c:36b9:d5e])
	by smtp.gmail.com with ESMTPSA id
	g26sm69999588pfo.130.2020.01.06.08.20.55
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 06 Jan 2020 08:20:56 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 Jan 2020 08:20:27 -0800
Message-Id: <4c7d689341f471efdf8ab7c2a7c6a19d2d370f5c.1578327474.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578327474.git.akuster808@gmail.com>
References: <cover.1578327474.git.akuster808@gmail.com>
MIME-Version: 1.0
Subject: [1.44 19/25] lib/bb: Add BB_SIGNATURE_LOCAL_DIRS_EXCLUDE to speed-up taskhash on directories
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
X-List-Received-Date: Mon, 06 Jan 2020 16:20:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Aníbal Limón <anibal.limon@linaro.org>

The new BB_SIGNATURE_LOCAL_DIRS_EXCLUDE allows you to specify a list
of directories to exclude when making taskhash, our specific case
is using SRC_URI that points local VCS directory.

Use bb.fetch.module to set default to: "CVS .bzr .git .hg .osc .p4 .repo .svn"

Signed-off-by: Aníbal Limón <anibal.limon@linaro.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 923aff060d8aba8456979c35b16d300ba7c13ff9)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 lib/bb/checksum.py        | 5 +++--
 lib/bb/fetch2/__init__.py | 4 ++--
 lib/bb/siggen.py          | 5 +++--
 3 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/lib/bb/checksum.py b/lib/bb/checksum.py
index 5bc8a8fc..677020f4 100644
--- a/lib/bb/checksum.py
+++ b/lib/bb/checksum.py
@@ -74,7 +74,7 @@ class FileChecksumCache(MultiProcessCache):
             else:
                 dest[0][h] = source[0][h]
 
-    def get_checksums(self, filelist, pn):
+    def get_checksums(self, filelist, pn, localdirsexclude):
         """Get checksums for a list of files"""
 
         def checksum_file(f):
@@ -90,7 +90,8 @@ class FileChecksumCache(MultiProcessCache):
             if pth == "/":
                 bb.fatal("Refusing to checksum /")
             dirchecksums = []
-            for root, dirs, files in os.walk(pth):
+            for root, dirs, files in os.walk(pth, topdown=True):
+                [dirs.remove(d) for d in list(dirs) if d in localdirsexclude]
                 for name in files:
                     fullpth = os.path.join(root, name)
                     checksum = checksum_file(fullpth)
diff --git a/lib/bb/fetch2/__init__.py b/lib/bb/fetch2/__init__.py
index 07de6c26..731c1608 100644
--- a/lib/bb/fetch2/__init__.py
+++ b/lib/bb/fetch2/__init__.py
@@ -1197,14 +1197,14 @@ def get_checksum_file_list(d):
 
     return " ".join(filelist)
 
-def get_file_checksums(filelist, pn):
+def get_file_checksums(filelist, pn, localdirsexclude):
     """Get a list of the checksums for a list of local files
 
     Returns the checksums for a list of local files, caching the results as
     it proceeds
 
     """
-    return _checksum_cache.get_checksums(filelist, pn)
+    return _checksum_cache.get_checksums(filelist, pn, localdirsexclude)
 
 
 class FetchData(object):
diff --git a/lib/bb/siggen.py b/lib/bb/siggen.py
index e484e5e3..f982bf22 100644
--- a/lib/bb/siggen.py
+++ b/lib/bb/siggen.py
@@ -126,6 +126,7 @@ class SignatureGeneratorBasic(SignatureGenerator):
 
         self.unihash_cache = bb.cache.SimpleCache("1")
         self.unitaskhashes = self.unihash_cache.init_cache(data, "bb_unihashes.dat", {})
+        self.localdirsexclude = (data.getVar("BB_SIGNATURE_LOCAL_DIRS_EXCLUDE") or "CVS .bzr .git .hg .osc .p4 .repo .svn").split()
 
     def init_rundepcheck(self, data):
         self.taskwhitelist = data.getVar("BB_HASHTASK_WHITELIST") or None
@@ -222,9 +223,9 @@ class SignatureGeneratorBasic(SignatureGenerator):
 
         if task in dataCache.file_checksums[fn]:
             if self.checksum_cache:
-                checksums = self.checksum_cache.get_checksums(dataCache.file_checksums[fn][task], recipename)
+                checksums = self.checksum_cache.get_checksums(dataCache.file_checksums[fn][task], recipename, self.localdirsexclude)
             else:
-                checksums = bb.fetch2.get_file_checksums(dataCache.file_checksums[fn][task], recipename)
+                checksums = bb.fetch2.get_file_checksums(dataCache.file_checksums[fn][task], recipename, self.localdirsexclude)
             for (f,cs) in checksums:
                 self.file_checksum_values[tid].append((f,cs))
 
-- 
2.17.1


