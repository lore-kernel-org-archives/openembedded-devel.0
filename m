Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1OjjU7-00018q-QL
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Aug 2010 03:55:05 +0200
Received: by pvg6 with SMTP id 6so651272pvg.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Aug 2010 18:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=YPoWQmVf3J0Gz+xVta+Hha5LlDWZTerQDpZAMUzQ528=;
	b=xFB7W8J6iBg0iLzHACcQbpPC5+L2eDf1JVZFB2NKlyNXT/9+APpW2et5F5R+MVHyyE
	fv8hLPyH+tSf5gvuci7jXstZ0shIKsxI9PFXGsfPszTZlkfeclfiT1/Xo74xGJdWsmko
	thzI0gCB48F+W6ipAW64uKrMk3yHdr4dKCpaI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=pfPjRP6ZgQtsVoAvwzoXjQrYI9oBJLxyDnn6Dpur/PkeVG8EnLEQ2tGtAQS6EW9oFY
	invgtPHnnBtyY6BZlIpjuI9r5f3ivMGN7k05ofOr+UJ8y1hF2Z+isQr1JwMJ5ffNThOw
	iaKuvefsKvKPn6+yzPKK/OpTMy73gQzum+mvc=
Received: by 10.114.136.18 with SMTP id j18mr1037981wad.99.1281664484262;
	Thu, 12 Aug 2010 18:54:44 -0700 (PDT)
Received: from [10.0.0.5] (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id q6sm3488699waj.10.2010.08.12.18.54.42
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 12 Aug 2010 18:54:43 -0700 (PDT)
Message-ID: <4C64A5DE.8010603@gmail.com>
Date: Fri, 13 Aug 2010 11:24:38 +0930
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.11) Gecko/20100721 Thunderbird/3.0.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS,
	WEIRD_PORT autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: gnome-doc-utils: Add dependency upon gettext-native.
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
X-List-Received-Date: Fri, 13 Aug 2010 01:55:05 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Failing log.do_configure:

automake (GNU automake) 1.11.1
Copyright (C) 2009 Free Software Foundation, Inc.
License GPLv2+: GNU GPL version 2 or later <http://gnu.org/licenses/gpl-2.0.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.

Written by Tom Tromey <tromey@redhat.com>
       and Alexandre Duret-Lutz <adl@gnu.org>.
AUTOV is 1.11
NOTE: Executing autoreconf --verbose --install --force --exclude=autopoint -I /mnt/oe/tmp/work/x86_64-linux/gnome-doc-utils-native-0.19.2-r5.2/gnome-doc-utils-0.19.2/m4/ -I /mnt/oe/tmp/work/x86_64-linux/gnome-doc-utils-native-0.19.2-r5.2/gnome-doc-utils-0.19.2/tools/ -I/mnt/oe/tmp/sysroots/x86_64-linux/usr/share/aclocal-1.11 -I /mnt/oe/tmp/sysroots/x86_64-linux/usr/share/aclocal
autoreconf: Entering directory `.'
autoreconf: configure.in: not using Gettext
autoreconf: running: aclocal -I /mnt/oe/tmp/work/x86_64-linux/gnome-doc-utils-native-0.19.2-r5.2/gnome-doc-utils-0.19.2/m4/ -I /mnt/oe/tmp/work/x86_64-linux/gnome-doc-utils-native-0.19.2-r5.2/gnome-doc-utils-0.19.2/tools/ -I /mnt/oe/tmp/sysroots/x86_64-linux/usr/share/aclocal-1.11 -I /mnt/oe/tmp/sysroots/x86_64-linux/usr/share/aclocal -I /mnt/oe/tmp/work/x86_64-linux/gnome-doc-utils-native-0.19.2-r5.2/gnome-doc-utils-0.19.2/m4/ -I /mnt/oe/tmp/work/x86_64-linux/gnome-doc-utils-native-0.19.2-r5.2/gnome-doc-utils-0.19.2/tools/ -I /mnt/oe/tmp/sysroots/x86_64-linux/usr/share/aclocal-1.11 -I /mnt/oe/tmp/sysroots/x86_64-linux/usr/share/aclocal --force -I m4
configure.in:44: warning: AM_NLS is m4_require'd but not m4_defun'd
/mnt/oe/tmp/work/x86_64-linux/gnome-doc-utils-native-0.19.2-r5.2/gnome-doc-utils-0.19.2/m4/intltool.m4:27: IT_PROG_INTLTOOL is expanded from...
configure.in:44: the top level
autoreconf: configure.in: tracing
configure.in:44: warning: AM_NLS is m4_require'd but not m4_defun'd
aclocal.m4:1824: IT_PROG_INTLTOOL is expanded from...
configure.in:44: the top level
autoreconf: configure.in: not using Libtool
autoreconf: running: /mnt/oe/tmp/sysroots/x86_64-linux/usr/bin/autoconf --include=/mnt/oe/tmp/work/x86_64-linux/gnome-doc-utils-native-0.19.2-r5.2/gnome-doc-utils-0.19.2/m4/ --include=/mnt/oe/tmp/work/x86_64-linux/gnome-doc-utils-native-0.19.2-r5.2/gnome-doc-utils-0.19.2/tools/ --include=/mnt/oe/tmp/sysroots/x86_64-linux/usr/share/aclocal-1.11 --include=/mnt/oe/tmp/sysroots/x86_64-linux/usr/share/aclocal --force --warnings=cross
configure.in:44: warning: AM_NLS is m4_require'd but not m4_defun'd
aclocal.m4:1824: IT_PROG_INTLTOOL is expanded from...
configure.in:44: the top level
configure:3319: error: possibly undefined macro: AM_NLS
      If this token and others are legitimate, please use m4_pattern_allow.
      See the Autoconf documentation.
autoreconf: /mnt/oe/tmp/sysroots/x86_64-linux/usr/bin/autoconf failed with exit status: 1
FATAL: autoreconf execution failed.

Signed-off-by: Graham Gower <graham.gower@gmail.com>
---
 recipes/gnome/gnome-doc-utils.inc |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/gnome/gnome-doc-utils.inc b/recipes/gnome/gnome-doc-utils.inc
index 61db29f..b5bbae1 100644
--- a/recipes/gnome/gnome-doc-utils.inc
+++ b/recipes/gnome/gnome-doc-utils.inc
@@ -1,6 +1,6 @@
 LICENSE = "GPL LGPL"
-DEPENDS = "libxml2 libxslt libxslt-native libxml2-native"
-DEPENDS_virtclass-native = "libxslt-native libxml2-native"
+DEPENDS = "libxml2 libxslt libxslt-native libxml2-native gettext-native"
+DEPENDS_virtclass-native = "libxslt-native libxml2-native gettext-native"
 
 INC_PR = "r5"
 
-- 
1.7.1



