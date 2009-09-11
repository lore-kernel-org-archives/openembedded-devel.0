Received: from [74.125.92.149] (helo=qw-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1Mlwu2-0004bO-Tm
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Sep 2009 05:34:30 +0200
Received: by qw-out-1920.google.com with SMTP id 4so257394qwk.36
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Sep 2009 20:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=cWY314Z1EZ/Ctn0ylgL8K5EM3sC/PPIiL6sCIiPgyak=;
	b=j8cet83CyVg9VDLJu77OaNu5QdyhSvrPodvS8BvDl/7mK0uOYm1jw4QZF++3Jt/UDc
	atqhOSxsqI583Al/V/XADnMOEJQpfgWxCGlbnhLG1G+jpvAEzL/lzUAcBmPoi+RVx6B5
	/26end1KJ1thpB2h/hAsEN7JhHmG2RXDDNsRo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=XTwplCrdtWVB1wWIP6xY2qHQVNA0oaypWjvB2SX4HIgi/HUha/p8FHpKX8rt3MuL4T
	2LuapMa7jvzK6+9Q+Pk23kcPVukkyF/kjFjwz9jX05vy519ADKRPTCHByLh9msVKUVA1
	2DtJUtRmxhApQoIy9n15R3OeYHuJXjDDisSAo=
Received: by 10.224.89.135 with SMTP id e7mr2123455qam.116.1252640040349;
	Thu, 10 Sep 2009 20:34:00 -0700 (PDT)
Received: from ?10.0.0.19? (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id 7sm579162qwb.14.2009.09.10.20.33.57
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 10 Sep 2009 20:33:59 -0700 (PDT)
Message-ID: <4AA9C51E.3030906@gmail.com>
Date: Fri, 11 Sep 2009 13:03:50 +0930
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Thunderbird 2.0.0.23 (X11/20090812)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.92.149
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] Fix t1lib dependency.
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
X-List-Received-Date: Fri, 11 Sep 2009 03:34:30 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Failed with:

| mipsel-angstrom-linux-libtool: compile:  mipsel-angstrom-linux-gcc -c -isystem/home/grg/oe/tmp/staging/mipsel-angstrom-linux/usr/include -isystem/home/grg/oe/tmp/staging/mipsel-angstrom-linux/usr/include -fexpensive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb3 -fno-strength-reduce -DT1LIB_IDENT=\"5.0.2\" -DGLOBAL_CONFIG_DIR=\"/usr/share/t1lib\" xglyph.c  -fPIC -DPIC -o .libs/xglyph.o
| xglyph.c:47:27: error: X11/Xaw/Label.h: No such file or directory
| xglyph.c:48:29: error: X11/Xaw/Command.h: No such file or directory
| xglyph.c:49:26: error: X11/Xaw/Form.h: No such file or directory
| xglyph.c:50:28: error: X11/Xaw/Dialog.h: No such file or directory
| xglyph.c:51:25: error: X11/Xaw/Box.h: No such file or directory
| xglyph.c:52:28: error: X11/Xaw/Toggle.h: No such file or directory
| xglyph.c:54:31: error: X11/Xaw/AsciiText.h: No such file or directory
| xglyph.c:55:32: error: X11/Xaw/SimpleMenu.h: No such file or directory
| xglyph.c:56:28: error: X11/Xaw/SmeBSB.h: No such file or directory
| xglyph.c:57:26: error: X11/Xaw/List.h: No such file or directory
...
<snip>


Signed-off-by: Graham Gower <graham.gower@gmail.com>
---
 recipes/t1lib/t1lib_5.0.2.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/t1lib/t1lib_5.0.2.bb b/recipes/t1lib/t1lib_5.0.2.bb
index 5da31f7..36acb77 100644
--- a/recipes/t1lib/t1lib_5.0.2.bb
+++ b/recipes/t1lib/t1lib_5.0.2.bb
@@ -1,8 +1,8 @@
 DESCRIPTION = "A Type1 Font Rastering Library"
 SECTION = "libs"
 PRIORITY = "optional"
-DEPENDS = "virtual/libx11"
-PR = "r4"
+DEPENDS = "virtual/libx11 libxaw"
+PR = "r5"
 LICENSE = "LGPL GPL"
 SRC_URI = "${DEBIAN_MIRROR}/main/t/t1lib/t1lib_${PV}.orig.tar.gz \
            file://configure.patch;patch=1 \
-- 
1.6.0.3



