Received: from [206.83.81.187] (helo=smtp1.irobot.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <tharvey@irobot.com>) id 1LnJ21-0005X6-4d
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Mar 2009 21:52:01 +0100
Received: from fever2.wardrobe.irobot.com ([192.168.163.187]) by
	smtp1.irobot.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 27 Mar 2009 16:50:08 -0400
Received: from [192.168.69.73] ([192.168.69.73]) by fever2.wardrobe.irobot.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 27 Mar 2009 16:50:08 -0400
Message-ID: <49CD3BFF.2030902@irobot.com>
Date: Fri, 27 Mar 2009 13:50:07 -0700
From: Tim Harvey <tharvey@irobot.com>
User-Agent: Thunderbird 2.0.0.21 (X11/20090318)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-OriginalArrivalTime: 27 Mar 2009 20:50:08.0873 (UTC)
	FILETIME=[9D89B590:01C9AF1D]
Subject: [PATCH] bash: add alternative configuration for bin/sh -> /bin/bash
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
X-List-Received-Date: Fri, 27 Mar 2009 20:52:01 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Add alternative configuration for /bin/sh -> /bin/bash so that for 
example bash can exist (and override) as shell if busybox is also installed

diff --git a/recipes/bash/bash.inc b/recipes/bash/bash.inc
index 4eba689..7c6122b 100644
--- a/recipes/bash/bash.inc
+++ b/recipes/bash/bash.inc
@@ -4,7 +4,7 @@ DEPENDS = "ncurses"
 SECTION = "base/shell"
 LICENSE = "GPL"
 
-inherit autotools gettext
+inherit autotools gettext update-alternatives
 
 PARALLEL_MAKE = ""
 
@@ -33,3 +33,8 @@ pkg_postinst () {
        grep -q "bin/bash" $D${sysconfdir}/shells || echo /bin/bash >> 
$D${sysconfdir}/shells
        grep -q "bin/sh" $D${sysconfdir}/shells || echo /bin/sh >> 
$D${sysconfdir}/shells
 }
+
+ALTERNATIVE_NAME = "sh"
+ALTERNATIVE_LINK = "${base_bindir}/sh"
+ALTERNATIVE_PATH = "${base_bindir}/bash"
+ALTERNATIVE_PRIORITY = "90"
diff --git a/recipes/bash/bash_3.0.bb b/recipes/bash/bash_3.0.bb
index e23887a..8165d07 100644
--- a/recipes/bash/bash_3.0.bb
+++ b/recipes/bash/bash_3.0.bb
@@ -1,5 +1,5 @@
 require bash.inc
-PR = "r11"
+PR = "r12"
 
 SRC_URI += "\
   file://bash-3.0-fixes.patch;patch=1 \
diff --git a/recipes/bash/bash_3.2.bb b/recipes/bash/bash_3.2.bb
index 6a48a4b..e175467 100644
--- a/recipes/bash/bash_3.2.bb
+++ b/recipes/bash/bash_3.2.bb
@@ -1,6 +1,6 @@
 require bash.inc
 
-PR = "r7"
+PR = "r8"
 
 SRC_URI += "\
            file://builtins.patch;patch=1 \



