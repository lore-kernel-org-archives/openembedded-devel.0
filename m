Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1S14nX-0005Jp-Is
	for openembedded-devel@lists.openembedded.org;
	Sat, 25 Feb 2012 00:43:35 +0100
Received: by eaal10 with SMTP id l10so1368621eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Feb 2012 15:35:12 -0800 (PST)
Received-SPF: pass (google.com: domain of schnitzeltony@googlemail.com
	designates 10.14.94.66 as permitted sender)
	client-ip=10.14.94.66; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	schnitzeltony@googlemail.com designates 10.14.94.66 as
	permitted sender) smtp.mail=schnitzeltony@googlemail.com;
	dkim=pass header.i=schnitzeltony@googlemail.com
Received: from mr.google.com ([10.14.94.66])
	by 10.14.94.66 with SMTP id m42mr2558459eef.66.1330126512580 (num_hops
	= 1); Fri, 24 Feb 2012 15:35:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=wAta/yjvN0Sio5nDZbBAadSrG3rwbANLaY0IOQanxUU=;
	b=NeIZTzc2D9WA6Mo+ObaXH51N2JC3ghl1OsAINCzW+fOpyzars+YHui3owCc7l+V9Ct
	wl+CMh4rjfgcMEeX5bkBNT1t/nIZHOstWTGCplLWW9CAnTB1qIEC9UQ5WmBK9tRu8FLZ
	F11ZsPZwEF/YKINFKABAOJRMqPdAdLWN+QEcI=
Received: by 10.14.94.66 with SMTP id m42mr1911683eef.66.1330126512420;
	Fri, 24 Feb 2012 15:35:12 -0800 (PST)
Received: from localhost.localdomain (p5B0A1464.dip.t-dialin.net.
	[91.10.20.100])
	by mx.google.com with ESMTPS id u11sm16588122eeb.1.2012.02.24.15.35.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 24 Feb 2012 15:35:11 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 25 Feb 2012 00:38:14 +0100
Message-Id: <1330126696-4716-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
MIME-Version: 1.0
Subject: [meta-mozilla, v2 1/3] firefox-gen-l10n-recipes: INC_PR as PR for l10n-recipes
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
X-List-Received-Date: Fri, 24 Feb 2012 23:43:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 scripts/firefox-gen-l10n-recipes |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/scripts/firefox-gen-l10n-recipes b/scripts/firefox-gen-l10n-recipes
index 435697b..65126a2 100755
--- a/scripts/firefox-gen-l10n-recipes
+++ b/scripts/firefox-gen-l10n-recipes
@@ -26,7 +26,7 @@ cat > firefox-l10n-${lang_code}_$1.bb <<EOF
 
 require firefox-l10n.inc
 
-PR = "\${INC_PR}.1"
+PR = "\${INC_PR}"
 
 SRC_URI[md5sum] = "$md5"
 SRC_URI[sha256sum] = "$sha256"
-- 
1.7.4.4



