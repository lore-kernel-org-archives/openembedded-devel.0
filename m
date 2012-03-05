Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1S4bzF-0007Gu-L0
	for openembedded-devel@lists.openembedded.org;
	Mon, 05 Mar 2012 18:46:17 +0100
Received: by wgbdr12 with SMTP id dr12so3298028wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Mar 2012 09:37:43 -0800 (PST)
Received-SPF: pass (google.com: domain of koen@dominion.thruhere.net
	designates 10.216.133.231 as permitted sender)
	client-ip=10.216.133.231; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	koen@dominion.thruhere.net designates 10.216.133.231 as
	permitted sender) smtp.mail=koen@dominion.thruhere.net
Received: from mr.google.com ([10.216.133.231])
	by 10.216.133.231 with SMTP id q81mr5478452wei.45.1330969063191
	(num_hops = 1); Mon, 05 Mar 2012 09:37:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references:x-gm-message-state;
	bh=IkV0d3NKEr8o2FOJjHo2nGAH59CqWq6nw6qJKrN2X/4=;
	b=DYyXzMb67P4WBrYuZ2tKpDZj/RDCuN7H1N9wZSWhmuIyAq23RtfePJcFvj/RHGJ+He
	LOjcDVuorj7AT6G0A9woG/UcVm3jpPQCnkvNEq7u2aUuVQe2QdFd/2un7hhgPW8ACu6g
	Xgoxrc2xg99i8K9HwM/5E2Q2TV3DGnun71boph59CeiNFfL9Wxo398lIBxlf/hXdqAD7
	yI+valmpa37mklozLTnbDLeeSqWsCUPw3XIrnGr+C5IQ2dOeEQTpCpCi1I8Tm/ETYPML
	RnTtpXFXd+cKcpqKvGedv2YhFVlFa3+Je1zoh5QqPefz0plKPGzCS3trgE6ZA5X9EpR/
	VoaQ==
MIME-Version: 1.0
Received: by 10.216.133.231 with SMTP id q81mr4358311wei.45.1330969063111;
	Mon, 05 Mar 2012 09:37:43 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id df3sm22224869wib.1.2012.03.05.09.37.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 05 Mar 2012 09:37:42 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  5 Mar 2012 18:37:31 +0100
Message-Id: <1330969051-9867-3-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1330969051-9867-1-git-send-email-koen@dominion.thruhere.net>
References: <1330969051-9867-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQlbQeQHZ8Wf5xb+Dt2EK19QUEqZvnQBbv84nitN8JhvRBalBpQVJdByvbsEz1LBjgDK/3YB
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe 3/3] systemd: enable logging to disk instead of tmpfs
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
X-List-Received-Date: Mon, 05 Mar 2012 17:46:17 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-oe/recipes-core/systemd/systemd_git.bb |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-core/systemd/systemd_git.bb b/meta-oe/recipes-core/systemd/systemd_git.bb
index 7a8f6e4..2a3b118 100644
--- a/meta-oe/recipes-core/systemd/systemd_git.bb
+++ b/meta-oe/recipes-core/systemd/systemd_git.bb
@@ -14,7 +14,7 @@ inherit gitpkgv
 PKGV = "v${GITPKGVTAG}"
 
 PV = "git"
-PR = "r19"
+PR = "r20"
 
 inherit useradd pkgconfig autotools vala perlnative
 
@@ -58,6 +58,9 @@ do_install() {
 
 	# provide support for initramfs
 	ln -s ${base_libdir}/systemd/systemd ${D}/init
+
+	# create dir for journal
+	install -d ${D}${localstatedir}/log/journal
 }
 
 python populate_packages_prepend (){
-- 
1.7.2.5



