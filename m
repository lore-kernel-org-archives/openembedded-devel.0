Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1OwTsB-00012r-03
	for openembedded-devel@lists.openembedded.org;
	Fri, 17 Sep 2010 07:52:36 +0200
Received: by pwj1 with SMTP id 1so642087pwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Sep 2010 22:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=8PKkBAmghs4q0Gdj/3gjXbBvzJJQ5EiP7A4pfmW2AyY=;
	b=qAwnVCgxDjjrteZn9j4akuNjx0VQ4CYXRe6K/2ZkMs4u/DDal3dlW52sbx+RTntjB5
	kMGSwDi0WmkUNBeJ/uliVIILcpK/ndlzRPeEOxBZwqsyPcvuhYOVjicLdljtWWTV7iSq
	XXoQfLCwSSK/mVNM0CYySJIZVQv5HjCGAKS9M=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=G0wTTJWal3OULvt4UMMRfgA3UBucMNaPuGRsTanXsb0OhnHoKFevBCOThxbhGC9GnZ
	Aig9pkw3edkS3uSrPrD4LqxFqh4w65blhA8HPZqjSeTXThuP1ZkLJ5/BtVULIl8aR0o4
	JywkL8x5OL1gmi/u38pJO7B/LwhMgdV6DzeEo=
Received: by 10.114.131.6 with SMTP id e6mr4942802wad.90.1284702699500;
	Thu, 16 Sep 2010 22:51:39 -0700 (PDT)
Received: from [10.0.0.5] (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id d2sm5837777wam.14.2010.09.16.22.51.37
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 16 Sep 2010 22:51:38 -0700 (PDT)
Message-ID: <4C9301E6.8010901@gmail.com>
Date: Fri, 17 Sep 2010 15:21:34 +0930
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.12) Gecko/20100909 Thunderbird/3.0.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] xkbd_0.8.15.bb: Fix geometry flag to accept negative offsets.
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
X-List-Received-Date: Fri, 17 Sep 2010 05:52:36 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit


Signed-off-by: Graham Gower <graham.gower@gmail.com>
---
 .../xkbd-0.8.15/xkbd-0.8.15-fix-geometry.patch     |   37 ++++++++++++++++++++
 recipes/xkbd/xkbd_0.8.15.bb                        |    3 +-
 2 files changed, 39 insertions(+), 1 deletions(-)
 create mode 100644 recipes/xkbd/xkbd-0.8.15/xkbd-0.8.15-fix-geometry.patch

diff --git a/recipes/xkbd/xkbd-0.8.15/xkbd-0.8.15-fix-geometry.patch b/recipes/xkbd/xkbd-0.8.15/xkbd-0.8.15-fix-geometry.patch
new file mode 100644
index 0000000..65deb8d
--- /dev/null
+++ b/recipes/xkbd/xkbd-0.8.15/xkbd-0.8.15-fix-geometry.patch
@@ -0,0 +1,37 @@
+Fix handling of the -geometry option.
+Author: Gautam Iyer, see http://bugs.gentoo.org/214353
+diff -ruN xkbd-0.8.15/src/xkbd.c xkbd-0.8.15-new/src/xkbd.c
+--- xkbd-0.8.15/src/xkbd.c	2003-09-29 10:29:35.000000000 -0700
++++ xkbd-0.8.15-new/src/xkbd.c	2008-03-23 02:43:20.000000000 -0700
+@@ -307,19 +307,20 @@
+ 				0, BlackPixel(display, screen_num),
+ 				WhitePixel(display, screen_num));
+       
++      wret = DisplayWidth(display, screen_num);
++      hret = DisplayHeight(display, screen_num)/4;
++      xret = 0;
++      yret = DisplayHeight(display, screen_num) - hret;
++
+       if (geometry != NULL)
+ 	{
+-	  XParseGeometry(geometry, &xret, &yret, &wret, &hret );
+-	}
+-      else
+-	{
+-	  if (wm_type != WM_MATCHBOX)
+-	    {
+-	      wret = DisplayWidth(display, screen_num);
+-	      hret = DisplayHeight(display, screen_num)/4;
+-	      xret = 0;
+-	      yret = DisplayHeight(display, screen_num) - hret;
+-	    }
++	  int flags;
++
++	  flags = XParseGeometry(geometry, &xret, &yret, &wret, &hret );
++	  if( flags & XNegative )
++	      xret += DisplayWidth( display, screen_num ) - wret;
++	  if( flags & YNegative )
++	      yret += DisplayHeight( display, screen_num ) - hret;
+ 	}
+       
+       /* check for user selected keyboard conf file */
diff --git a/recipes/xkbd/xkbd_0.8.15.bb b/recipes/xkbd/xkbd_0.8.15.bb
index 309d7d8..cda2be9 100644
--- a/recipes/xkbd/xkbd_0.8.15.bb
+++ b/recipes/xkbd/xkbd_0.8.15.bb
@@ -4,9 +4,10 @@ SRC_URI = "http://www.angstrom-distribution.org/unstable/sources/xkbd-${PV}-CVS.
 	   file://fix-circumkey.patch \
 	   file://add-default-common-slides.patch \
 	   file://differentiate-desktop-name.patch \
+	   file://xkbd-0.8.15-fix-geometry.patch \
 	   file://xkbd.png"
 LICENSE = "GPL"
-PR = "r4"
+PR = "r5"
 
 SECTION = "x11"
 DEPENDS = "libxpm libxtst libxft"
-- 
1.7.1



