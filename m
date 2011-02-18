Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1PqUOI-0007Da-6z
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Feb 2011 18:45:15 +0100
Received: by mail-yw0-f47.google.com with SMTP id 41so337920ywl.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Feb 2011 09:44:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references;
	bh=zpFOMppg4Kmj6cpzRqwXUXVINgs5yeJePCcwEjBe+gI=;
	b=BSopbDf5VTy///Jj+mHMlwLMmC/nVOj0au9IJk3Xm6gQSUahIWZwSYs2TVatWi9YnX
	EcVStXQbc7b/CGgnkiM3VKT8Hl6kxoWgAnKUwlkFjkSSsDLErEKr07SRBHYeerbsB9nj
	N6/hNeuY3dbR1bN/ytdlaY8ckl5Ad5qtddJBI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=AYFazj8dSiWNXGEId8bnWtVBwo66aQVdvKfwVKb+Q9umEvHGBv87hIu7odsH4xq2VX
	IbM/TMA8pMQK4LwhZnYpWCZfwZNqiA4NTS38SQpxdkuMSdY6spHuzked899E8OJ3H78W
	gWukRI+v6A47D9n1IBU5nybfp6H61aYCyjVl4=
Received: by 10.90.91.20 with SMTP id o20mr1501320agb.27.1298051041545;
	Fri, 18 Feb 2011 09:44:01 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id 23sm1480538yhl.23.2011.02.18.09.43.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 18 Feb 2011 09:44:00 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 18 Feb 2011 17:43:21 +0000
Message-Id: <1298051011-10445-7-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1298051011-10445-1-git-send-email-otavio@ossystems.com.br>
References: <1298051011-10445-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 06/16] cups: add textonly filter and split packages
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
X-List-Received-Date: Fri, 18 Feb 2011 17:45:15 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
---
 recipes/cups/cups-1.4.4/text.convs   |    6 ++
 recipes/cups/cups-1.4.4/textonly     |  124 ++++++++++++++++++++++++++++++++++
 recipes/cups/cups-1.4.4/textonly.ppd |   47 +++++++++++++
 recipes/cups/cups_1.4.4.bb           |   30 ++++++++-
 4 files changed, 205 insertions(+), 2 deletions(-)
 create mode 100644 recipes/cups/cups-1.4.4/text.convs
 create mode 100644 recipes/cups/cups-1.4.4/textonly
 create mode 100644 recipes/cups/cups-1.4.4/textonly.ppd

diff --git a/recipes/cups/cups-1.4.4/text.convs b/recipes/cups/cups-1.4.4/text.convs
new file mode 100644
index 0000000..20a845d
--- /dev/null
+++ b/recipes/cups/cups-1.4.4/text.convs
@@ -0,0 +1,6 @@
+application/x-cshell text/plain 100 -
+application/x-csource text/plain 100 -
+application/x-perl text/plain 100 -
+application/x-shell text/plain 100 -
+text/html text/plain 100 -
+text/css text/plain 100 -
diff --git a/recipes/cups/cups-1.4.4/textonly b/recipes/cups/cups-1.4.4/textonly
new file mode 100644
index 0000000..25850cc
--- /dev/null
+++ b/recipes/cups/cups-1.4.4/textonly
@@ -0,0 +1,124 @@
+#!/bin/bash
+## Copyright (C) 2003-2006 Red Hat, Inc.
+## Copyright (C) 2003-2006 Tim Waugh <twaugh@redhat.com>
+## Changed on 2007/05/17, Opher Shachar, LADPC Ltd.
+##     Added support for page-ranges option.
+##     Added page accounting.
+
+## This program is free software; you can redistribute it and/or modify
+## it under the terms of the GNU General Public License as published by
+## the Free Software Foundation; either version 2 of the License, or
+## (at your option) any later version.
+
+## This program is distributed in the hope that it will be useful,
+## but WITHOUT ANY WARRANTY; without even the implied warranty of
+## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+## GNU General Public License for more details.
+
+## You should have received a copy of the GNU General Public License
+## along with this program; if not, write to the Free Software
+## Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
+
+if [ $# == 0 ]; then
+  echo >&2 "ERROR: $0 job-id user title copies options [file]"
+  exit 1
+fi
+
+# Extract the papersize
+SENDFF=`grep '^\*DefaultSendFF' "$PPD" | cut -d\  -f2`
+COPIES=1
+if [ $# -ge 4 ]; then
+  COPIES="$4"
+fi
+
+if [ "$COPIES" -gt 1 ] && [ $# -lt 6 ]; then
+  unset TMPFILE
+  trap -- 'rm -f "$TMPFILE"' EXIT
+  TMPFILE=$(mktemp ${TMPDIR:-/tmp}/textonly.XXXXXX)
+  cat > "$TMPFILE"
+else
+  TMPFILE="$6"
+fi
+
+PR=${5#*page-ranges=}
+# Do options specify page-ranges?
+if [[ "$PR" != "$5" ]]; then
+  PR=${PR%% *}
+else
+  #unset PR
+  PR=1-999999
+fi
+
+if [[ "$PR" ]]; then
+  TMPFILE2=$(mktemp ${TMPDIR:-/tmp}/textonly2.XXXXXX)
+  pagenum=0
+  EOF=
+  { 
+  while [[ "$PR" ]]; do
+    pl=${PR%%,*}		;# take first subrange
+    PR=${PR#$pl};PR=${PR#,}	;# remove from range list
+    pu=${pl#*-}			;# extract upper and lower
+    pl=${pl%-*}			;# pages of subrange
+    # Allows interpreting 0-5,3-10 as 1-5,6-10 rejects 5-1 or 1-
+    (( pagenum >= pl )) && pl=$(( pagenum + 1 ))
+    (( pl > pu )) && continue
+    
+    # Loop reading pages until at or over lower page of subrange.
+    while read -d `echo -ne '\f'` -r; do
+      (( pagenum++ ))
+      (( pagenum == pl )) && break
+    done
+    # Did we reach lower page of subrange or EOF?
+    if (( pagenum < pl )); then
+      [[ ! "$REPLY" ]] && break		;# empty last page - we're done.
+      (( pagenum++ ))
+      EOF=y
+    fi
+    # Output page and report to page log
+    if (( pagenum == pl )); then
+      echo -n "${REPLY}" >>"$TMPFILE2"
+      # If EOF then page has no final FF
+      [[ ! "$EOF" ]] && echo -ne '\f' >>"$TMPFILE2"
+      echo "PAGE: $pagenum $COPIES" >&2
+    fi
+    [[ "$EOF" ]] && break
+    # Is the current subrange a single page?
+    (( pagenum == pu )) && continue
+    while read -d `echo -ne '\f'` -r; do
+      (( pagenum++ ))
+      echo -ne "${REPLY}\f" >>"$TMPFILE2"
+      echo "PAGE: $pagenum $COPIES" >&2
+      (( pagenum == pu )) && break
+    done
+    # Could be that we reached EOF before page boundry
+    if (( pagenum < pu )); then
+      if [[ "$REPLY" ]]; then
+        (( pagenum++ ))
+        echo -n "${REPLY}" >>"$TMPFILE2"
+        echo "PAGE: $pagenum $COPIES" >&2
+      fi
+      break
+    fi
+  done
+  } <"$TMPFILE"
+else
+  TMPFILE2="$TMPFILE"
+  pc=$(grep -co `echo -ne '\f'` "$TMPFILE2")
+  pc=$(( pc * $COPIES ))
+  echo "PAGE: $pc" >&2
+fi
+
+while [ "$COPIES" -gt 0 ]; do
+  # Just translate LF->CRLF at the moment, until the PPD has options added.
+  sed -e 's/$/'`echo -ne '\r'`'/g' "$TMPFILE2"
+
+  if [ "$SENDFF" == "True" ]
+    then
+    echo -ne \\14
+  fi
+
+  COPIES=$(($COPIES - 1))
+done
+# Cleanup
+[[ "$TMPFILE" != "$TMPFILE2" ]] && rm -f "$TMPFILE2"
+exit 0
diff --git a/recipes/cups/cups-1.4.4/textonly.ppd b/recipes/cups/cups-1.4.4/textonly.ppd
new file mode 100644
index 0000000..89060bc
--- /dev/null
+++ b/recipes/cups/cups-1.4.4/textonly.ppd
@@ -0,0 +1,47 @@
+*PPD-Adobe: "4.3"
+*%
+*% Text-only printer definition
+*%
+*FormatVersion:	"4.3"
+*FileVersion:	"1.1"
+*LanguageVersion: English
+*LanguageEncoding: ISOLatin1
+*PCFileName:	"TEXTONLY.PPD"
+*Manufacturer:	"Generic"
+*Product:	"(Generic)"
+*cupsVersion:   1.0
+*cupsManualCopies: True
+*cupsModelNumber:  2
+*cupsFilter:    "text/plain 0 textonly"
+*ModelName:     "Generic text-only printer"
+*ShortNickName: "Generic text-only printer"
+*NickName:      "Generic text-only printer"
+*PSVersion:	"(2017.000) 0"
+*LanguageLevel:	"2"
+*ColorDevice:	False
+*DefaultColorSpace: Gray
+*FileSystem:	False
+*Throughput:	"8"
+*LandscapeOrientation: Plus90
+*VariablePaperSize: False
+*TTRasterizer:	Type42
+*DefaultImageableArea: Letter
+*ImageableArea Letter/US Letter:	"18 36 594 756"
+*DefaultPaperDimension: Letter
+*PaperDimension Letter/Letter:		"612 792"
+*OpenUI *PageSize/Media Size: PickOne
+*OrderDependency: 10 AnySetup *PageSize
+*DefaultPageSize: Letter
+*PageSize Letter/Letter:	"<</PageSize[612 792]/ImagingBBox null>>setpagedevice"
+*CloseUI: *PageSize
+*OpenUI *PageRegion: PickOne
+*OrderDependency: 10 AnySetup *PageRegion
+*DefaultPageRegion: Letter
+*PageRegion Letter/Letter:	"<</PageSize[612 792]/ImagingBBox null>>setpagedevice"
+*CloseUI: *PageRegion
+
+*OpenUI *SendFF: Boolean
+*DefaultSendFF: False
+*SendFF True/True:        ""
+*SendFF False/False:   ""
+*CloseUI: *SendFF
diff --git a/recipes/cups/cups_1.4.4.bb b/recipes/cups/cups_1.4.4.bb
index 709edf1..c469dae 100644
--- a/recipes/cups/cups_1.4.4.bb
+++ b/recipes/cups/cups_1.4.4.bb
@@ -5,12 +5,15 @@ LICENSE = "GPL LGPL"
 DEPENDS = "gnutls libpng jpeg dbus dbus-glib zlib fakeroot-native"
 DEPENDS += "virtual/libusb0"
 PROVIDES = "cups14"
-PR = "r3"
+PR = "r4"
 
 SRC_URI = "ftp://ftp.easysw.com/pub/cups/${PV}/cups-${PV}-source.tar.bz2 \
            file://use_echo_only_in_init.patch \
            file://skip_tools.patch \
            file://configure.patch \
+           file://textonly.ppd \
+           file://textonly \
+           file://text.convs \
            "
 SRC_URI[md5sum] = "8776403ad60fea9e85eab9c04d88560d"
 SRC_URI[sha256sum] = "d25ffa35add3abeeec0eba60be2cffc89425b649c64ef3a73dfc724683a59aa3"
@@ -57,10 +60,24 @@ do_compile () {
                "-I."
 }
 
-PACKAGES =+ "${PN}-lib ${PN}-libimage"
+PACKAGES =+ "${PN}-lib ${PN}-libimage ${PN}-filter-textonly ${PN}-filters ${PN}-models"
+
+PACKAGES_DYNAMIC += "${PN}-backend-*"
+
+python populate_packages_prepend() {
+	backend_dir = bb.data.expand('${libdir}/cups/backend/', d)
+	do_split_packages(d, backend_dir, '^(.*)$', 'cups-backend-%s',
+	                  '${PN} backend for %s', prepend=True, allow_links=True)
+}
 
 FILES_${PN}-lib = "${libdir}/libcups.so.*"
 FILES_${PN}-libimage = "${libdir}/libcupsimage.so.*"
+FILES_${PN}-filter-textonly += "${datadir}/ppd/cups-included/textonly.ppd \
+                                ${datadir}/cups/mime/text.convs \
+                                ${libdir}/cups/filter/textonly \
+                                "
+FILES_${PN}-filters += "${libdir}/cups/filter/*"
+FILES_${PN}-models += "${datadir}/cups/model/*"
 FILES_${PN}-dbg += "${libdir}/cups/backend/.debug \
                     ${libdir}/cups/cgi-bin/.debug \
                     ${libdir}/cups/filter/.debug \
@@ -82,6 +99,15 @@ fakeroot do_install () {
     oe_runmake "DSTROOT=${D}" install
     # This directory gets installed with perms 511, which makes packaging fail
     chmod 0711 "${D}/${localstatedir}/run/cups/certs"
+
+    install -d ${D}/${libdir}/cups/filter
+    install -m 755 ${WORKDIR}/textonly ${D}/${libdir}/cups/filter
+
+    install -d ${D}/${datadir}/cups/mime
+    install -m 644 ${WORKDIR}/text.convs ${D}/${datadir}/cups/mime
+
+    install -d ${D}/${datadir}/ppd/cups-included
+    install -m 644 ${WORKDIR}/textonly.ppd ${D}/${datadir}/ppd/cups-included
 }
 
 python do_package_append() {
-- 
1.7.2.3



