Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1S3ohl-00053E-Ae
	for openembedded-devel@lists.openembedded.org;
	Sat, 03 Mar 2012 14:08:57 +0100
Received: by eaae1 with SMTP id e1so724882eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 03 Mar 2012 05:00:25 -0800 (PST)
Received-SPF: pass (google.com: domain of schnitzeltony@googlemail.com
	designates 10.14.194.134 as permitted sender)
	client-ip=10.14.194.134; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	schnitzeltony@googlemail.com designates 10.14.194.134 as
	permitted sender) smtp.mail=schnitzeltony@googlemail.com;
	dkim=pass header.i=schnitzeltony@googlemail.com
Received: from mr.google.com ([10.14.194.134])
	by 10.14.194.134 with SMTP id m6mr8081575een.4.1330779625457 (num_hops
	= 1); Sat, 03 Mar 2012 05:00:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=CHtOIZsCO2TzflVi6RxDCzwz/XTdAfZG1qe3r3VUamo=;
	b=qv5sUkCTQUinj6gQ8JmRt10vjLrAHylgdZ1raHKukzsVky+WgAaCC+IuE83LLKJecZ
	izX/dupNoxwh41WI3YhBIawstAuh3v5F7enGApqlgF8y+QHjwf9Soqt8htiy09TGy5Lp
	Qll4SqkKWFcXGASm1YDNk2+znwgji8UzTegrStLAysS0tGcKk3D1pV3NcqkwRuf4b3T/
	eA4Oh3F1wXmFc+22C+7vWQZmHV991/yPENp0NoW4rfMcvqqac5VlNisAxCZAaBH7e3qP
	m0ZnGDHPUbu4G0LFj2spWywa2VKenwrBsNeUvWJqaVtnd1RLYxRjR06BRhA7HZeZ9vsf
	4vPA==
Received: by 10.14.194.134 with SMTP id m6mr6205122een.4.1330779625367;
	Sat, 03 Mar 2012 05:00:25 -0800 (PST)
Received: from localhost.localdomain (p4FDF1A4D.dip.t-dialin.net.
	[79.223.26.77])
	by mx.google.com with ESMTPS id n17sm33808936eei.3.2012.03.03.05.00.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 03 Mar 2012 05:00:24 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  3 Mar 2012 14:04:01 +0100
Message-Id: <1330779841-3649-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
MIME-Version: 1.0
Subject: [meta-oe] systemd-systemctl-native: multiple service files not looped properly
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
X-List-Received-Date: Sat, 03 Mar 2012 13:08:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../systemd/systemd-systemctl-native/systemctl     |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-core/systemd/systemd-systemctl-native/systemctl b/meta-oe/recipes-core/systemd/systemd-systemctl-native/systemctl
index 72b9da3..b86f3cd 100755
--- a/meta-oe/recipes-core/systemd/systemd-systemctl-native/systemctl
+++ b/meta-oe/recipes-core/systemd/systemd-systemctl-native/systemctl
@@ -31,7 +31,7 @@ while [ $# != 0 ]; do
 	esac
 done
 
-for service in "$services"; do
+for service in $services; do
 	# find service file
 	for p in $ROOT/etc/systemd/system \
 		 $ROOT/lib/systemd/system \
-- 
1.7.4.4



