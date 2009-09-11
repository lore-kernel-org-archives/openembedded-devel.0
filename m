Received: from [209.85.221.191] (helo=mail-qy0-f191.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1Mlwum-0004bu-Gr
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Sep 2009 05:35:15 +0200
Received: by qyk29 with SMTP id 29so650410qyk.16
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Sep 2009 20:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=h3hC7X2PP7/yeofBjQOfkx5FXl4S67GTQf3ZxBN0T9k=;
	b=dCUR+hNeF5HZZ4u6OWNz7t3MxnEyd21KYBpNEV3cILWpEYKxJuYBHZAjoK2Ncswp4m
	8lN+QApn3vJBsAieYH6ke9IqaQ9GoMfIxlL8Yb/mXpSlyfOp57JnCByaDWll/nbdEf4z
	5gmOuw89aIgvunwp8oG2E9GJ6F3VebbJ3A2eQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=TCOxbz2/UjejHJJFqV+EQLo8nb+7AANa6tM5imxM3t2j2AjPSiBr/Leu1qfRlZdsGD
	PUKJGDSl+c/dW/C9Kq2V7SiXV+z9Fuj/AuGAKIQU+9IDczyF/q49oFdeGE25naaVBJFn
	uMTHn6b3LIYomQwMZJGjPrDG7Y9sf/9dy8mok=
Received: by 10.224.90.69 with SMTP id h5mr2090782qam.237.1252640084139;
	Thu, 10 Sep 2009 20:34:44 -0700 (PDT)
Received: from ?10.0.0.19? (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id 8sm709919qwj.58.2009.09.10.20.34.42
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 10 Sep 2009 20:34:43 -0700 (PDT)
Message-ID: <4AA9C54B.5050707@gmail.com>
Date: Fri, 11 Sep 2009 13:04:35 +0930
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Thunderbird 2.0.0.23 (X11/20090812)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.221.191
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] Fix lesstif compilation.
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
X-List-Received-Date: Fri, 11 Sep 2009 03:35:15 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Failed like this:

| /bin/sh ../mipsel-angstrom-linux-libtool --tag=CC   --mode=link mipsel-angstrom-linux-gcc  -isystem/home/grg/oe/tmp/staging/mipsel-angstrom-linux/usr/include -fexpensive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb3  -L/home/grg/oe/tmp/staging/mipsel-angstrom-linux/usr/lib -Wl,-rpath-link,/home/grg/oe/tmp/staging/mipsel-angstrom-linux/usr/lib -Wl,-O1 -o man2html man2html.o  -L/home/grg/oe/tmp/staging/mipsel-angstrom-linux/usr/lib -lfreetype -L -lXft -lXrender
| mipsel-angstrom-linux-libtool: link: require no space between `-L' and `-lXft'
| make[2]: *** [man2html] Error 1
| make[2]: Leaving directory `/home/grg/oe/tmp/work/mipsel-angstrom-linux/lesstif-0.95.0-r1/lesstif-0.95.0/scripts'
| make[1]: *** [all-recursive] Error 1
| make[1]: Leaving directory `/home/grg/oe/tmp/work/mipsel-angstrom-linux/lesstif-0.95.0-r1/lesstif-0.95.0/scripts'
| make: *** [all-recursive] Error 1
| FATAL: oe_runmake failed


Signed-off-by: Graham Gower <graham.gower@gmail.com>
---
 recipes/lesstif/lesstif_0.95.0.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/lesstif/lesstif_0.95.0.bb b/recipes/lesstif/lesstif_0.95.0.bb
index cb348e7..5af87e3 100644
--- a/recipes/lesstif/lesstif_0.95.0.bb
+++ b/recipes/lesstif/lesstif_0.95.0.bb
@@ -1,7 +1,7 @@
 SECTION = "libs"
 DESCRIPTION = "Free OSM/Motif implementation."
 LICENSE = "LGPL"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "\
 	${SOURCEFORGE_MIRROR}/lesstif/${BP}.tar.bz2 \
@@ -40,7 +40,7 @@ addtask preconfigure after do_patch before do_configure
 EXTRA_OECONF = "\
 	--with-gnu-ld --disable-verbose --disable-build-12 --disable-build-20 \
 	--enable-build-21 --enable-xrender --enable-production --without-motif \
-	--x-includes=. \
+	--x-includes=. --x-libraries=. \
 "
 
 PACKAGES += "${PN}-bin"
-- 
1.6.0.3



