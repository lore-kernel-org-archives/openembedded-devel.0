Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RVfTE-0008LO-VH
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Nov 2011 09:24:49 +0100
Received: by mail-ey0-f175.google.com with SMTP id d13so325412eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Nov 2011 00:18:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=Sr8+CGQT1KleDYCTD2YmlljAnVU4eIqOIJYO26uNej0=;
	b=M1Gw27SGu+cO9/HFwUalhiUjs4vcfkfTVVunRVc3OScJnmBzhlcowDTYh01kvnRGCJ
	Ir8S+C5YN6ATZgIXzbxCQrrpFWHaOrcXS9GachZjLeNITosLLIaEEOUDBFHu10Evd7aF
	FIVc/DFYkYphPF83XEUjxmlcKlrLoh/h3bhT8=
Received: by 10.213.26.11 with SMTP id b11mr185629ebc.117.1322641091099;
	Wed, 30 Nov 2011 00:18:11 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id q28sm3666988eea.6.2011.11.30.00.18.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 30 Nov 2011 00:18:10 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Nov 2011 09:16:54 +0100
Message-Id: <ec55dac74706f161c53c7dda81f7df99305cf7ff.1322640506.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.rc4
In-Reply-To: <55137a5d61c11567ab74d1c1382e04da35cecd5f.1322640506.git.Martin.Jansa@gmail.com>
References: <a>
	<55137a5d61c11567ab74d1c1382e04da35cecd5f.1322640506.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1322640506.git.Martin.Jansa@gmail.com>
References: <cover.1322640506.git.Martin.Jansa@gmail.com>
Subject: [meta-efl 07/11] eeze: pass /bin/true instead of eject which is not available
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
X-List-Received-Date: Wed, 30 Nov 2011 08:24:49 -0000

* hopefully better fix will be available upstream later
  09:03:03 < discomfitor> only if an app makes an eject call
  09:03:36 < discomfitor> in which case, the resulting exe call would be "/bin/true $mountpoint"
  09:03:39 < discomfitor> which would do nothing
  09:03:55 < discomfitor> so you would break those apps, but it doesn't seem to be an issue for embedded...
  09:08:06 < JaMa> ok, I meant if it would be better for those apps to know that eject functionality is not available, but if this is fine for you I can live
                 with it too :)
  09:09:26 < discomfitor> JaMa: hmm
  09:09:37 < discomfitor> JaMa: I will consider that

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/eeze.inc |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta-efl/recipes-efl/efl/eeze.inc b/meta-efl/recipes-efl/efl/eeze.inc
index 4b13984..7a06f9d 100644
--- a/meta-efl/recipes-efl/efl/eeze.inc
+++ b/meta-efl/recipes-efl/efl/eeze.inc
@@ -8,6 +8,9 @@ inherit efl
 BBCLASSEXTEND = "native"
 INC_PR = "r2"
 
+# to make configure happy, but we don't have (and usually don't need)  eject on target
+EXTRA_OECONF += "--with-eject=${base_bindir}/true"
+
 # Some upgrade path tweaking
 AUTO_LIBNAME_PKGS = ""
 
-- 
1.7.8.rc4



