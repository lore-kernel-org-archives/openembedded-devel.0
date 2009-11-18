Received: from mail-bw0-f217.google.com ([209.85.218.217])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1NAkzp-000307-6S
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Nov 2009 14:55:00 +0100
Received: by bwz9 with SMTP id 9so1149076bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Nov 2009 05:53:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=P/oZcgeAjJa/kTD4Mzvf50bdCraRYtrE2dgTCIhMe/0=;
	b=O6I/vdJQ7x8Fj3srOxMZXzuwDQnQxD+Qcp62ySiku7xrCzYj1i9MDMoK/44XsDaib4
	niAmgJNPSNj+/OoMyEoZ9yYUInKnLBtTqEZG5ry/dEu3Jrpe20qTFg06Vj8urNURKELL
	0q2HutuMxczh17IaUK+Pmhszb/zcZEhF8rOUg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=Qzwhn7NefXXpGVUWzJtSyXiT0Io1Ju+VDotPGP3Wic3Qtr7UJkvD/S35nQ1APjH46m
	afqhH8yLH7KegfVRS7WixTC3BW3DjFrABZ1k9qNoQte2f3EDfhaIZ4QamiAnmhnOOq/P
	bJVGhmCXjTQGXOwTjlJ2vw18gh2dh4sh9pHHs=
Received: by 10.204.175.83 with SMTP id w19mr6095822bkz.24.1258552412828;
	Wed, 18 Nov 2009 05:53:32 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 13sm36154fxm.1.2009.11.18.05.53.32
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 18 Nov 2009 05:53:32 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 18 Nov 2009 14:53:23 +0100
Message-Id: <1258552403-11571-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.6.5.3
In-Reply-To: <1258552403-11571-1-git-send-email-Martin.Jansa@gmail.com>
References: <1258552403-11571-1-git-send-email-Martin.Jansa@gmail.com>
X-SA-Exim-Connect-IP: 209.85.218.217
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH 07/51] update-alternatives-cworth: use latest installed alternative
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
X-List-Received-Date: Wed, 18 Nov 2009 13:55:00 -0000

* if there is more alternatives with higest priority, use the one last
  in alternatives file (latest installed)
* if target exists and its directory, remove link, otherwise new
  alternative link is created inside that direstory
---
 .../update-alternatives-cworth.inc                 |    5 ++-
 .../update-alternatives.use.last.patch             |   34 ++++++++++++++++++++
 .../update-alternatives-cworth_0.99.154.bb         |    2 +
 3 files changed, 39 insertions(+), 2 deletions(-)
 create mode 100644 recipes/update-alternatives/update-alternatives-cworth/update-alternatives.use.last.patch

diff --git a/recipes/update-alternatives/update-alternatives-cworth.inc b/recipes/update-alternatives/update-alternatives-cworth.inc
index f23bfe8..e53e9dd 100644
--- a/recipes/update-alternatives/update-alternatives-cworth.inc
+++ b/recipes/update-alternatives/update-alternatives-cworth.inc
@@ -1,7 +1,8 @@
 LICENSE = "GPL"
 SECTION = "base"
-SRC_URI = "${HANDHELDS_CVS};module=familiar/dist/ipkg;tag=${@'V' + bb.data.getVar('PV',d,1).replace('.', '-')}"
+SRC_URI = "${HANDHELDS_CVS};module=familiar/dist/ipkg;tag=${@'V' + bb.data.getVar('PV',d,1).replace('.', '-')} \
+           file://update-alternatives.use.last.patch;patch=1"
 S = "${WORKDIR}/ipkg/C"
 PACKAGE_ARCH = "all"
 
-PR = "r1"
+PR = "r2"
diff --git a/recipes/update-alternatives/update-alternatives-cworth/update-alternatives.use.last.patch b/recipes/update-alternatives/update-alternatives-cworth/update-alternatives.use.last.patch
new file mode 100644
index 0000000..7bd5bd2
--- /dev/null
+++ b/recipes/update-alternatives/update-alternatives-cworth/update-alternatives.use.last.patch
@@ -0,0 +1,34 @@
+diff -uNr C.orig/update-alternatives C/update-alternatives
+--- C.orig/update-alternatives	2003-03-28 17:39:45.000000000 +0100
++++ C/update-alternatives	2009-09-17 16:46:59.000000000 +0200
+@@ -97,8 +97,8 @@
+ 
+ ##	path=`sed -ne "1!p" $ad/$name | sort -nr -k2 | head -1 | sed 's/ .*//'`
+ ## busybox safe:
+-	path=`sed -ne "1!p" $ad/$name | sed -e "s/\(.*\) \(.*\)/\2 \1/g" | sort -nr | head -n 1 | sed 's/[^ ]* //'`
+-	if [ -z "$path" ]; then
++	prio=`sed -ne "1!p" $ad/$name | sed -e "s/\(.*\) \(.*\)/\2 \1/g" | sort -nr | head -n 1 | sed 's/ [^ ]*$//'`
++	if [ -z "$prio" ]; then
+ 		echo "update-alternatives: removing $link as no more alternatives exist for it"
+ 		rm $ad/$name
+ 		if [ -L $link ]; then
+@@ -107,11 +107,19 @@
+ 		return 0
+ 	fi
+ 
++	## find last line with highest priority
++	path=`grep "${prio}$" $ad/$name | tail -n 1 | sed 's/ [^ ]*$//'`
++
+ 	if [ ! -e $link -o -L $link ]; then
+ 		local link_dir=`dirname $link`
+ 		if [ ! -d $link_dir ]; then
+ 			mkdir -p $link_dir
+ 		fi
++		if [ -h $link -a -d $link ]; then
++			# if $link exists and the target is directory, than ln -sf $path $link, doesn't replace link to that directory, but creates new link inside
++			echo "update-alternatives: Removing $link"
++			rm -f $link
++		fi
+ 		ln -sf $path $link
+ 		echo "update-alternatives: Linking $link to $path"
+ 	else
diff --git a/recipes/update-alternatives/update-alternatives-cworth_0.99.154.bb b/recipes/update-alternatives/update-alternatives-cworth_0.99.154.bb
index 6cab1e5..c260e40 100644
--- a/recipes/update-alternatives/update-alternatives-cworth_0.99.154.bb
+++ b/recipes/update-alternatives/update-alternatives-cworth_0.99.154.bb
@@ -2,6 +2,8 @@ require update-alternatives-cworth.inc
 
 RPROVIDES_${PN} = "update-alternatives"
 
+PR="r2"
+
 do_install () {
     install -d ${D}${sbindir} \
                ${D}${sysconfdir}/alternatives \
-- 
1.6.5.3



