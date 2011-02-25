Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Pszb7-00044M-Sz
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Feb 2011 16:28:49 +0100
Received: by fxm8 with SMTP id 8so1679718fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Feb 2011 07:27:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=sYou20xb1lltQiPPW5ZUVKTzERs4lEeOYaSaTPBGUZI=;
	b=Zb0AqHijdqd8QeJC65XSJT0Ulp2Gsg5qK0Kaa5AJ8cyEMSw9AnHqntOxOEFLS8AZGH
	rIeh7nAIVlfEaViQO3Vk/SY81KC+G7RkTPz+T+AHmrGiWws4F4pzqvznxZXxpOvkVS03
	fjW55YjbsUPiLcObsNSbhpaM8ESSlQZC1GOfU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=nLTror3hEi9t/GFsZbRFBFTMb6mYcuaAcKAJS+1RXMq5F51ECUTisN0MwKyHDXcwq3
	IwIlijQ+dfSTDpwV4jThyxf3wAB6OJfbRWwt+PMK3dWRzNXsHLFnzC91l0sQSfMvzNZD
	4gWYmTc8JqIf0xEBBfftP7IJWwfKP4DBNzMD0=
Received: by 10.223.101.140 with SMTP id c12mr2848643fao.16.1298647647989;
	Fri, 25 Feb 2011 07:27:27 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id e6sm348540fav.8.2011.02.25.07.27.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 25 Feb 2011 07:27:27 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 25 Feb 2011 16:27:16 +0100
Message-Id: <1298647636-13022-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <20110224164519.GA12581@jama.jama.net>
References: <20110224164519.GA12581@jama.jama.net>
Subject: [PATCH] bitbake.conf: define shared PERSISTENT_DIR and point it outside TMPDIR
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
X-List-Received-Date: Fri, 25 Feb 2011 15:28:50 -0000

* import from poky 6a11cf7dfe930461a6660e3b783b546fa2634900
* we had CACHE var pointing to machine specific dir since 2006
  caf077679022f37ce55d758101f130e4e93bd7b5
* current bitbake is looking for cache dir like this:
  cachedir = (bb.data.getVar("PERSISTENT_DIR", d, True) or
              bb.data.getVar("CACHE", d, True))
  which without PERSISTENT_DIR defined picks machine-specific CACHE dir
  so LOCALCOUNT numbers in SRCPV keeps rolling with every MACHINE switch
  in same builddir :/

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 classes/sanity.bbclass |   12 ++++++++++++
 conf/bitbake.conf      |    2 ++
 conf/sanity.conf       |    1 +
 3 files changed, 15 insertions(+), 0 deletions(-)

diff --git a/classes/sanity.bbclass b/classes/sanity.bbclass
index 1e6b170..ffe3a49 100644
--- a/classes/sanity.bbclass
+++ b/classes/sanity.bbclass
@@ -189,6 +189,18 @@ def check_sanity(e):
 	if messages != "":
 		raise_sanity_error(messages)
 
+	#
+	# Check there isn't old persistent cache
+	#
+	cache = data.getVar('CACHE', e.data, True)
+	persistent_dir = data.getVar('PERSISTENT_DIR', e.data, True)
+	persistent_cache_filename = data.getVar('SANITY_PERSIST_DATA_FILE', e.data, True)
+	if os.path.exists(cache + '/' + persistent_cache_filename):
+		messages = messages + "Error, persistent cache file '%s' exists in old location '%s', please migrate it to new location '%s' and merge them together if you have one for each MACHINE.\n" % (persistent_cache_filename, cache, persistent_dir)
+
+	if messages != "":
+		raise_sanity_error(messages)
+
 python check_sanity_eventhandler() {
     if isinstance(e, bb.event.BuildStarted):
         check_sanity(e)
diff --git a/conf/bitbake.conf b/conf/bitbake.conf
index 88ad2ba..0c11cdb 100644
--- a/conf/bitbake.conf
+++ b/conf/bitbake.conf
@@ -294,6 +294,8 @@ FILESDIR = "${@bb.which(d.getVar('FILESPATH', 1), '.')}"
 
 TMPDIR = "${TOPDIR}/tmp"
 CACHE = "${TMPDIR}/cache${@['', '/' + str(bb.data.getVar('MACHINE', d, 1))][bool(bb.data.getVar('MACHINE', d, 1))]}"
+# The persistent cache should be shared by all builds
+PERSISTENT_DIR = "${TOPDIR}/conf/persistent"
 CO_DIR = "${DL_DIR}"
 CVSDIR = "${CO_DIR}/cvs"
 SVNDIR = "${CO_DIR}/svn"
diff --git a/conf/sanity.conf b/conf/sanity.conf
index e9902f6..c1ac332 100644
--- a/conf/sanity.conf
+++ b/conf/sanity.conf
@@ -7,5 +7,6 @@ BB_MIN_VERSION = "1.10.2"
 
 SANITY_ABIFILE = "${TMPDIR}/abi_version"
 SANITY_PRFILE = "${TMPDIR}/distro_pr"
+SANITY_PERSIST_DATA_FILE = "bb_persist_data.sqlite3"
 
 INHERIT += "sanity"
-- 
1.7.4.1



