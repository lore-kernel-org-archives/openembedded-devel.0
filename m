Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RlHMZ-0007dH-LJ
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Jan 2012 10:54:27 +0100
Received: by mail-ee0-f47.google.com with SMTP id d17so496708eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Jan 2012 01:46:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=NZg3zBKZAoyNi0Wim+98ZCy7FlmmdUhgnLuMy6+EbNQ=;
	b=kqgyAZ+HexeKriCOuLhAcAc2iKz2Es5pwfiaRfsZDTZojZJE4e9TA3NmWHbvu0E3Iz
	/341uTUpf2/++WTEMcAT4/NtfB0Pw35voP46CPwVted53c7LO7dalweY+JB6XpkEv+ib
	QScjOg2MdTHePHSgIIxxQh0f2X7FroYbL+os0=
Received: by 10.14.51.136 with SMTP id b8mr1078037eec.65.1326361619067;
	Thu, 12 Jan 2012 01:46:59 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id t1sm17458679eeb.3.2012.01.12.01.46.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 12 Jan 2012 01:46:58 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Jan 2012 10:46:18 +0100
Message-Id: <8ff502a3db138d35a53b8a0a31581a503f53318a.1326361490.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.3
In-Reply-To: <0796505f34620059cfed707c33f08b68f346937f.1326361490.git.Martin.Jansa@gmail.com>
References: <0796505f34620059cfed707c33f08b68f346937f.1326361490.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1326361490.git.Martin.Jansa@gmail.com>
References: <cover.1326361490.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 4/7] elementary: package examples to PN-tests
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
X-List-Received-Date: Thu, 12 Jan 2012 09:54:27 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/elementary_svn.bb |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta-efl/recipes-efl/efl/elementary_svn.bb b/meta-efl/recipes-efl/efl/elementary_svn.bb
index fd5c911..adca217 100644
--- a/meta-efl/recipes-efl/efl/elementary_svn.bb
+++ b/meta-efl/recipes-efl/efl/elementary_svn.bb
@@ -52,6 +52,7 @@ FILES_${PN}-tests = "\
   ${bindir}/elementary* \
   ${datadir}/elementary/images \
   ${datadir}/elementary/objects \
+  ${datadir}/elementary/examples \
   ${datadir}/applications/* \
   ${datadir}/icons/* \
   ${libdir}/elementary/modules/test_entry/* \
-- 
1.7.8.3



