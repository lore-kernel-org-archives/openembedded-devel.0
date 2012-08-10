Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Szpjk-0003Mh-BD
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Aug 2012 15:58:48 +0200
Received: by wgbdr1 with SMTP id dr1so1221497wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Aug 2012 06:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=nxoM7VjS15aJ6nmrc3TAol9HcVa/caTmHE/dzp2ADs8=;
	b=ABFuBCVBYU2P7q9IkSzFjWZ8qu4Nejn/ORYLVHMIlFK9/i+ibd1rCITyfot1bUDhC4
	mLwJ9IDwzo+00BYWDwvn8hIxN9wzF4aVDHXqxNx6pmMXrR9Vep10fjXfYDiwdPHzAe3Q
	UEMDrLDcqnnXMaSoXE6/KTJkzDa9kVJYeP6NOFLZW9vazdkS6iWY1DPCEZ4r4NXGcbD2
	N9HDGkHS4+ZRT4DaQvO9HnyrfkjWboMO/EawU98oS/Ql7etTU0D+4craMTNacJY8uRL5
	iupkYLskI/AfZv9iAeuMotYGAMSOP7OYjkNefrfZlbphgfVPWpfM8kvZBwIiliIkb64w
	yy3w==
Received: by 10.216.209.87 with SMTP id r65mr893497weo.42.1344606418275;
	Fri, 10 Aug 2012 06:46:58 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id l6sm7845557wiz.4.2012.08.10.06.46.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 10 Aug 2012 06:46:57 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 Aug 2012 15:43:18 +0200
Message-Id: <c3d0283656c58d128a7495e53ecd7a394ce0cdb0.1344601517.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1344601517.git.Martin.Jansa@gmail.com>
References: <cover.1342645937.git.Martin.Jansa@gmail.com>
	<cover.1344601517.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1344601517.git.Martin.Jansa@gmail.com>
References: <cover.1344601517.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 23/46] meta-efl: efl.bbclass: package only ${datadir}/${PE} in ${PN}-tests, it was stealing files from ${PN}-locale-*
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
X-List-Received-Date: Fri, 10 Aug 2012 13:58:49 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/classes/efl.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-efl/classes/efl.bbclass b/meta-efl/classes/efl.bbclass
index 7cf8556..bc2f640 100644
--- a/meta-efl/classes/efl.bbclass
+++ b/meta-efl/classes/efl.bbclass
@@ -60,4 +60,4 @@ FILES_${PN}-dbg +=   "${libdir}/${PN}/.debug \
 
 FILES_${PN}-tests  = "${bindir}/${PN} \
                       ${bindir}/*_* \
-                      ${datadir}"
+                      ${datadir}/${PN}"
-- 
1.7.8.6



