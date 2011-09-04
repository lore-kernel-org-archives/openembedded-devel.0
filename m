Received: from mailrelay04.sunrise.ch ([194.158.229.47]
	helo=smtp-be-02.be08.sunrise.ch)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dv@vollmann.ch>) id 1R0KDp-0008C6-EY
	for openembedded-devel@lists.openembedded.org;
	Sun, 04 Sep 2011 23:27:21 +0200
Received: from localhost.localdomain (212-98-43-140.static.adslpremium.ch
	[212.98.43.140])
	by smtp-be-02.be08.sunrise.ch (8.13.1/8.12.10) with ESMTP id
	p84LMOdm004136; Sun, 4 Sep 2011 23:22:38 +0200
From: "Detlef Vollmann" <dv@vollmann.ch>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  4 Sep 2011 23:21:33 +0200
Message-Id: <1315171293-11256-3-git-send-email-dv@vollmann.ch>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1315171293-11256-1-git-send-email-dv@vollmann.ch>
References: <1315171293-11256-1-git-send-email-dv@vollmann.ch>
Subject: [PATCH 2/2] stage-manager: allow for upper case in package names
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
X-List-Received-Date: Sun, 04 Sep 2011 21:27:21 -0000

From: Detlef Vollmann <dv@vollmann.ch>


diff --git a/bin/stage-manager-opkg-build b/bin/stage-manager-opkg-build
index 6deceef..0261e71 100755
--- a/bin/stage-manager-opkg-build
+++ b/bin/stage-manager-opkg-build
@@ -118,7 +118,7 @@ You probably want to chown these to a system user: " >&2
 	disallowed_filename=`disallowed_field Filename`
 	[ "$?" -ne 0 ] && PKG_ERROR=1
 
-	if echo $pkg | grep '[^a-z0-9.+-]'; then
+	if echo $pkg | grep '[^A-Za-z0-9.+-]'; then
 		echo "*** Error: Package name $pkg contains illegal characters, (other than [a-z0-9.+-])" >&2
 		PKG_ERROR=1;
 	fi
-- 
1.7.0.4



