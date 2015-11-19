Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 47C896057A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Nov 2015 19:45:22 +0000 (UTC)
Received: by wmec201 with SMTP id c201so42214761wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Nov 2015 11:45:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:content-transfer-encoding:subject:message-id:date
	:to:mime-version;
	bh=GDr1oZ6RSUiPUZlE4mQXtVwiBv/JJ4T2jrzblHzqatM=;
	b=qLMp01fcRtAsKLeLcsptx/j4egnOT0ITpHroOS8rGxhBJPunCvwoE05so4vYvJZgpx
	h+Hg1jJNOshgLduJ1S7RcBfqKimJCl0fNitq9RnA7OTFvdvPcCakeC5czJxTSUsF1kMz
	FfCDOmtHYpAi8ykLFoimT0/DvJHXO+F7g81E5/TE0wCdy2tEtAnB6WR5hcZZn4ghmFpp
	Z00dpySUUJI8OMkIzgfxNZC9h2NBbK1V13MTaD49Mvn9uzvwtehgnpSyvi41wEE5mb2E
	zFIIAKZ5spmAJ39JUlJkEuladVsbX9Gd+Gh0so39d9XNrnon7fHTTtpmLxPzycy8XkK8
	31gw==
X-Received: by 10.28.101.65 with SMTP id z62mr4719629wmb.84.1447962322637;
	Thu, 19 Nov 2015 11:45:22 -0800 (PST)
Received: from ernie.rdm.local (rademacherexchange.de. [46.245.221.222])
	by smtp.gmail.com with ESMTPSA id
	d66sm35625971wma.21.2015.11.19.11.45.22
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 19 Nov 2015 11:45:22 -0800 (PST)
From: Jens Rehsack <rehsack@gmail.com>
Message-Id: <0F7623F9-A450-400A-8137-2914DA382D13@gmail.com>
Date: Thu, 19 Nov 2015 20:45:21 +0100
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Mailer: Apple Mail (2.2104)
Subject: [meta-networking][PATCH 3/6] samba: fix typo distinguishing between plain sysv init and lsb init
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
X-List-Received-Date: Thu, 19 Nov 2015 19:45:22 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


During fix for distinguishing between lsb flavoured sysv init and pure, =
on the
rocks version, author introduced a typo.

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 meta-networking/recipes-connectivity/samba/samba_4.1.12.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb =
b/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb
index 40afce8..a2d3a2c 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb
@@ -117,7 +117,7 @@ do_install_append() {
 	install -m 0755 packaging/LSB/samba.sh ${D}${sysconfdir}/init.d
 	update-rc.d -r ${D} samba.sh start 20 3 5 .
 	update-rc.d -r ${D} samba.sh start 20 0 1 6 .
-    elif ${@bb.utils.contains('PACKAGECONFIG', 'lsb', 'true', 'false', =
d)}; then
+    elif ${@bb.utils.contains('PACKAGECONFIG', 'sysv', 'true', 'false', =
d)}; then
 	install -d ${D}${sysconfdir}/init.d
 	install -m 0755 packaging/sysv/samba.init =
${D}${sysconfdir}/init.d/samba.sh
 	update-rc.d -r ${D} samba.sh start 20 3 5 .
--=20
1.9.1

--=20
Jens Rehsack - rehsack@gmail.com


