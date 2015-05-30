Return-Path: <gyurco@freemail.hu>
X-Greylist: delayed 1039 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 30 May 2015 13:02:25 UTC
Received: from smarthost05.digicable.hu (smarthost05.digicable.hu
	[94.21.128.15])
	by mail.openembedded.org (Postfix) with ESMTP id 267C46AC36
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 May 2015 13:02:25 +0000 (UTC)
Received: from [92.249.128.188] (helo=relay02.digicable.hu)
	by smarthost05.digicable.hu with esmtp
	id 1Yyg8O-0003jO-Qq for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 May 2015 14:45:04 +0200
Received: from [78.131.10.118] (helo=gyurco.localdomain)
	by relay02.digicable.hu with esmtpa
	id 1Yyg8O-0002CK-NP for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 May 2015 14:45:04 +0200
From: Szombathelyi =?ISO-8859-1?Q?Gy=F6rgy?= <gyurco@freemail.hu>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 30 May 2015 14:45:04 +0200
Message-ID: <1808222.ViaJgov4XC@gyurco.localdomain>
User-Agent: KMail/4.14.7 (Linux/4.0.2-300.fc22.x86_64; KDE/4.14.7; x86_64; ; )
MIME-Version: 1.0
X-Original: 78.131.10.118
X-Original: 92.249.128.188
Subject: [meta-networking]Fix postfix-native on Linux 4.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 30 May 2015 13:02:28 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

    
    Make postfix compilable on 4.0 kernel.
    
    Signed-off-by: Gyorgy Szombathelyi <gyurco@freemail.hu>

diff --git a/meta-networking/recipes-daemons/postfix/files/makedefs.patch 
b/meta-networking/recipes-daemons/postfix/files/makedefs.patch
index 32c31b0..ea1e994 100644
--- a/meta-networking/recipes-daemons/postfix/files/makedefs.patch
+++ b/meta-networking/recipes-daemons/postfix/files/makedefs.patch
@@ -10,14 +10,11 @@ for Linux2 and Linux3 systems.
 Upstreamstatus: Inappropriate [embedded specific]
 
 Signed-off-by: Yao Zhao <yao.zhao@windriver.com>
----
- makedefs |   27 +++++++++++----------------
- 1 files changed, 11 insertions(+), 16 deletions(-)
 
-diff --git a/makedefs b/makedefs
-index dd5f256..e6fb795 100644
---- a/makedefs
-+++ b/makedefs
+5)add Linux 4.0 support
+
+--- a/makedefs	2015-05-30 13:38:50.346033228 +0200
++++ b/makedefs	2015-05-30 13:40:19.375364795 +0200
 @@ -87,9 +87,6 @@
 
  # Defaults for most sane systems
@@ -68,7 +65,7 @@ index dd5f256..e6fb795 100644
  		       then
  			   echo CCARGS="$CCARGS -DNO_EPOLL"
  		       else
-@@ -356,8 +353,6 @@ int     main(int argc, char **argv)
+@@ -356,22 +353,20 @@
  }
  EOF
  			   ${CC-gcc} -o makedefs.test makedefs.test.c || exit 1
@@ -77,7 +74,9 @@ index dd5f256..e6fb795 100644
  			   rm -f makedefs.test makedefs.test.[co]
  		       fi;;
  		esac
-@@ -366,12 +361,12 @@ EOF
+ 		;;
+-    Linux.3*)	SYSTYPE=LINUX3
++    Linux.3*|Linux.4*)	SYSTYPE=LINUX3
  		case "$CCARGS" in
  		 *-DNO_DB*) ;;
  		 *-DHAS_DB*) ;;
@@ -111,6 +110,3 @@ index dd5f256..e6fb795 100644
  		    do
  			test -e $lib/lib$name.a -o -e $lib/lib$name.so && {
  			    SYSLIBS="$SYSLIBS -l$name"
---
-1.7.1
-

