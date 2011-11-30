Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RVfTj-0008LO-99
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Nov 2011 09:25:19 +0100
Received: by mail-ey0-f175.google.com with SMTP id d13so325412eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Nov 2011 00:18:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=6aiqk2U/FWLNPvD2t3Fc0w5NEk8SG9yIqbeGi4Di35s=;
	b=CWT9qIZDWJ+9EE4/zwpfaYbNFa0ippkAMFd8Gi4tvbkjuKhw1OJX007f5oc32WnKmd
	kB5v5k68OUS1DSJuo85MNV3dgFZ12SRquFcggVVPUw4f4SyCytFAQwTxpoUjLmgOBRnl
	x8AMQ9CGIyjqIyygwBjLR4RdNu75hI4OvGqEU=
Received: by 10.213.20.16 with SMTP id d16mr194033ebb.38.1322641121650;
	Wed, 30 Nov 2011 00:18:41 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 8sm3653836eei.8.2011.11.30.00.18.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 30 Nov 2011 00:18:40 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Nov 2011 09:16:58 +0100
Message-Id: <ecba1c3e0b6a24b2dfe237b04ad6789b32014391.1322640506.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.rc4
In-Reply-To: <55137a5d61c11567ab74d1c1382e04da35cecd5f.1322640506.git.Martin.Jansa@gmail.com>
References: <a>
	<55137a5d61c11567ab74d1c1382e04da35cecd5f.1322640506.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1322640506.git.Martin.Jansa@gmail.com>
References: <cover.1322640506.git.Martin.Jansa@gmail.com>
Subject: [meta-efl 11/11] elementary: disable web support
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
X-List-Received-Date: Wed, 30 Nov 2011 08:25:19 -0000

* we don't have webkit-efl in DEPENDS so it depends on build order
  if it's autodetected or not for elementary
* libewebkit0 is quite bit so we don't want to pull it to every image
  with elementary
* and we cannot split elementary web support to different package
  because libewebkit is linked directly from
  libelementary-ver-pre-svn-09.so.0.8.0

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/elementary_svn.bb |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta-efl/recipes-efl/efl/elementary_svn.bb b/meta-efl/recipes-efl/efl/elementary_svn.bb
index 840cb11..6e9347e 100644
--- a/meta-efl/recipes-efl/efl/elementary_svn.bb
+++ b/meta-efl/recipes-efl/efl/elementary_svn.bb
@@ -14,6 +14,7 @@ S = "${WORKDIR}/${SRCNAME}"
 EXTRA_OECONF = "\
   --with-edje-cc=${STAGING_BINDIR_NATIVE}/edje_cc \
   --with-eet-eet=${STAGING_BINDIR_NATIVE}/eet \
+  --disable-web \
 "
 
 do_compile_append() {
-- 
1.7.8.rc4



