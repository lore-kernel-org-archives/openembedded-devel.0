Received: from mail-wi0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1S4qjZ-00071D-8X
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Mar 2012 10:31:05 +0100
Received: by wibhq12 with SMTP id hq12so2597951wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Mar 2012 01:22:29 -0800 (PST)
Received-SPF: pass (google.com: domain of koen@dominion.thruhere.net
	designates 10.216.137.74 as permitted sender)
	client-ip=10.216.137.74; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	koen@dominion.thruhere.net designates 10.216.137.74 as
	permitted sender) smtp.mail=koen@dominion.thruhere.net
Received: from mr.google.com ([10.216.137.74])
	by 10.216.137.74 with SMTP id x52mr5717205wei.77.1331025749982
	(num_hops = 1); Tue, 06 Mar 2012 01:22:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references:x-gm-message-state;
	bh=eovtBwl+W2p89CjCcs/5m/qU1sitg+qlDlH+PC5FvgI=;
	b=i7U1JI/VFr5IltKJ/gtr3Bw7b4CmJoBby4+K1nPFTdfCWHMK5qk6atiz80/fktS04v
	pMYzLIsCkXZeH7m0PcjSTqfRO4dX+Dyo3/Y19vM88vRLj1yWi/Rh42vR7ToxApbesFIp
	nhfDfJRIJsahPMYCLUUU77CAN3QxYW6wrrL3BS5XrhIksIR9bcWYrhLNmxhnV1DfLxaK
	TNNVMf0lETBZOBOVoWFFO8uxSlhm2mDy9bj2yi01OHzuZrEMGtXo4QIvJoee6A9GKXyW
	gZa/Qc3NXX0A/DqD532gJ/L3CobmrxzUoRCk0xjXj0QPIJYf4ykarmKNiSfZnHEMJ520
	m4PQ==
MIME-Version: 1.0
Received: by 10.216.137.74 with SMTP id x52mr4621658wei.77.1331025749886;
	Tue, 06 Mar 2012 01:22:29 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id fl2sm76204736wib.4.2012.03.06.01.22.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 06 Mar 2012 01:22:28 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  6 Mar 2012 10:22:20 +0100
Message-Id: <1331025741-26216-2-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1331025741-26216-1-git-send-email-koen@dominion.thruhere.net>
References: <1331025741-26216-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQkuKSY2imLjcQ4Klc+XXpvateTYf3cUb1PPHbMH1r6wpf3cJyOoZV4u+7HbIKfm0ew8ub5k
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][PATCH v2 2/3] systemd: enable logging to disk instead of tmpfs
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
X-List-Received-Date: Tue, 06 Mar 2012 09:31:05 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-oe/recipes-core/systemd/systemd_git.bb |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-core/systemd/systemd_git.bb b/meta-oe/recipes-core/systemd/systemd_git.bb
index 2b549a0..4a8e9a1 100644
--- a/meta-oe/recipes-core/systemd/systemd_git.bb
+++ b/meta-oe/recipes-core/systemd/systemd_git.bb
@@ -14,7 +14,7 @@ inherit gitpkgv
 PKGV = "v${GITPKGVTAG}"
 
 PV = "git"
-PR = "r18"
+PR = "r19"
 
 inherit useradd pkgconfig autotools vala perlnative
 
@@ -59,6 +59,9 @@ do_install() {
 
 	# provide support for initramfs
 	ln -s ${base_bindir}/systemd ${D}/init
+
+	# create dir for journal
+	install -d ${D}${localstatedir}/log/journal
 }
 
 python populate_packages_prepend (){
-- 
1.7.2.5



