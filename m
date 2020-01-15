Return-Path: <costamagna.gianfranco@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8149F7F971
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jan 2020 16:44:50 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id y11so16423948wrt.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jan 2020 08:44:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=jU8jmd3zb/gridrq9quPJp7IoMqCDsEkc/RAhwu9qWg=;
	b=RLEu0OHRLcE4Vx8w1oQXUg/KPOP11POf0LtJsTQUCBjBhh8gGmYhQwljZUceiNabX0
	9zIR5WLPdWtCuMLbEKzXF0BoabbDF4/pk4fSx5fkC2EoU1DeIMsOPARm/0gCGR61FNro
	ABwnRlaJ/KRo3/Djjsm77uRO0O+fb1P0xBO/BccTB344WYhcvEhxs2XPDK65sgToNw+k
	5M5LtyB+vL+aRDOuGqku8a5jMim2z6uWsrInxl4wi0tyXOvnOwphE6mikRK3/Nbnpe1D
	yQ9+Ez9erSkZiFuM7ugh3fKow3JS1Q5h/FmsCb+jgocBOud4vmPxz7ypSXb3XsJ06VDa
	0yLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=jU8jmd3zb/gridrq9quPJp7IoMqCDsEkc/RAhwu9qWg=;
	b=oAvjtq8FOTwr7+eNWLq9IYWEmfyloDo/GM5Aj8vpRMbWwNUKwwkvosQShNzXRKyCt6
	1LcOfRZtEQquqpS8jnQmqBM/zG6HfeNd/VceDRVZ9U3lVtDLSfarMZNX5q/zFEnh7EKh
	PUVaLd2Lj6z96PgsO4NBDWDOgPENIRRIjVWgeXYCdB6iFiqutsPH7EZynDgVdSCoU0Im
	KudTAP5P19zSKYQil3323Y0pnu61pLvU7+ZvD7H06Y7FeLeA88X67WcDrK3C3ed/FOFg
	e1GfidSOq5pn+PsAgUemrslTyUj+aUxV3lW6lDGaWmhlbWVrW9Y+Wv9ZoK9xEXX3sZPg
	xVAQ==
X-Gm-Message-State: APjAAAVVK2EiS45IFt2Blc3pVyM9qEywpl6MOHYdi4B5sfgvq5twLda5
	tf2KmMYbNfrMS70mGlQ8GldPBc/I
X-Google-Smtp-Source: APXvYqzPGny4/KsmhIYRqVkIDgBa0oZg83JMwKGssnwJ85ClOCnNA4Pr3nlGrCgAnA6z3B6ygGnDfQ==
X-Received: by 2002:adf:fa12:: with SMTP id m18mr31213048wrr.309.1579106690719;
	Wed, 15 Jan 2020 08:44:50 -0800 (PST)
Received: from localhost.localdomain (mob-31-157-147-31.net.vodafone.it.
	[31.157.147.31])
	by smtp.gmail.com with ESMTPSA id o7sm479646wmh.11.2020.01.15.08.44.49
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 15 Jan 2020 08:44:49 -0800 (PST)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 Jan 2020 17:44:46 +0100
Message-Id: <20200115164446.6801-1-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.17.1
Cc: Gianfranco Costamagna <locutusofborg@debian.org>,
	Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Subject: [meta-oe][PATCH] vboxguestdrivers: update to new version 6.1.2
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 15 Jan 2020 16:44:50 -0000

drop export.patch, now part of upstream codebase

Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
---
 .../vboxguestdrivers/export.patch             | 77 -------------------
 ...ers_6.1.0.bb => vboxguestdrivers_6.1.2.bb} |  5 +-
 2 files changed, 2 insertions(+), 80 deletions(-)
 delete mode 100644 meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/export.patch
 rename meta-oe/recipes-support/vboxguestdrivers/{vboxguestdrivers_6.1.0.bb => vboxguestdrivers_6.1.2.bb} (93%)

diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/export.patch b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/export.patch
deleted file mode 100644
index bfba3332b..000000000
--- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/export.patch
+++ /dev/null
@@ -1,77 +0,0 @@
-Index: src/VBox/Additions/linux/export_modules.sh
-===================================================================
---- a/src/VBox/Additions/linux/export_modules.sh
-+++ b/src/VBox/Additions/linux/export_modules.sh
-@@ -46,7 +46,13 @@
- VBOX_VERSION_MAJOR=`sed -e "s/^ *VBOX_VERSION_MAJOR *= \+\([0-9]\+\)/\1/;t;d" $PATH_ROOT/Version.kmk`
- VBOX_VERSION_MINOR=`sed -e "s/^ *VBOX_VERSION_MINOR *= \+\([0-9]\+\)/\1/;t;d" $PATH_ROOT/Version.kmk`
- VBOX_VERSION_BUILD=`sed -e "s/^ *VBOX_VERSION_BUILD *= \+\([0-9]\+\)/\1/;t;d" $PATH_ROOT/Version.kmk`
--VBOX_SVN_REV=`sed -e 's/^ *VBOX_SVN_REV_FALLBACK *:= \+\$(patsubst *%:,, *\$Rev: *\([0-9]\+\) *\$ *) */\1/;t;d' $PATH_ROOT/Config.kmk`
-+VBOX_SVN_CONFIG_REV=`sed -e 's/^ *VBOX_SVN_REV_CONFIG_FALLBACK *:= \+\$(patsubst *%:,, *\$Rev: *\([0-9]\+\) *\$ *) */\1/;t;d' $PATH_ROOT/Config.kmk`
-+VBOX_SVN_VERSION_REV=`sed -e 's/^ *VBOX_SVN_REV_VERSION_FALLBACK *:= \+\$(patsubst *%:,, *\$Rev: *\([0-9]\+\) *\$ *) */\1/;t;d' $PATH_ROOT/Version.kmk`
-+if [ "$VBOX_SVN_CONFIG_REV" -gt "$VBOX_SVN_VERSION_REV" ]; then
-+    VBOX_SVN_REV=$VBOX_SVN_CONFIG_REV
-+else
-+    VBOX_SVN_REV=$VBOX_SVN_VERSION_REV
-+fi
- VBOX_VENDOR=`sed -e 's/^ *VBOX_VENDOR *= \+\(.\+\)/\1/;t;d' $PATH_ROOT/Config.kmk`
- VBOX_VENDOR_SHORT=`sed -e 's/^ *VBOX_VENDOR_SHORT *= \+\(.\+\)/\1/;t;d' $PATH_ROOT/Config.kmk`
- VBOX_PRODUCT=`sed -e 's/^ *VBOX_PRODUCT *= \+\(.\+\)/\1/;t;d' $PATH_ROOT/Config.kmk`
-Index: src/VBox/HostDrivers/linux/export_modules.sh
-===================================================================
---- a/src/VBox/HostDrivers/linux/export_modules.sh
-+++ b/src/VBox/HostDrivers/linux/export_modules.sh
-@@ -100,12 +100,26 @@
- VBOX_VERSION_MINOR=`sed -e "s/^ *VBOX_VERSION_MINOR *= \+\([0-9]\+\)/\1/;t;d" $PATH_ROOT/Version.kmk`
- VBOX_VERSION_BUILD=`sed -e "s/^ *VBOX_VERSION_BUILD *= \+\([0-9]\+\)/\1/;t;d" $PATH_ROOT/Version.kmk`
- VBOX_VERSION_STRING=$VBOX_VERSION_MAJOR.$VBOX_VERSION_MINOR.$VBOX_VERSION_BUILD
--VBOX_SVN_REV=`sed -e 's/^ *VBOX_SVN_REV_FALLBACK *:= \+\$(patsubst *%:,, *\$Rev: *\([0-9]\+\) *\$ *) */\1/;t;d' $PATH_ROOT/Config.kmk`                                                                                                        VBOX_VENDOR=`sed -e 's/^ *VBOX_VENDOR *= \+\(.\+\)/\1/;t;d' $PATH_ROOT/Config.kmk`                                     VBOX_VENDOR_SHORT=`sed -e 's/^ *VBOX_VENDOR_SHORT *= \+\(.\+\)/\1/;t;d' $PATH_ROOT/Config.kmk`                         VBOX_PRODUCT=`sed -e 's/^ *VBOX_PRODUCT *= \+\(.\+\)/\1/;t;d' $PATH_ROOT/Config.kmk`                                   VBOX_C_YEAR=`date +%Y`
-+VBOX_VERSION_BUILD=`sed -e "s/^ *VBOX_VERSION_BUILD *= \+\([0-9]\+\)/\1/;t;d" $PATH_ROOT/Version.kmk`
-+VBOX_SVN_CONFIG_REV=`sed -e 's/^ *VBOX_SVN_REV_CONFIG_FALLBACK *:= \+\$(patsubst *%:,, *\$Rev: *\([0-9]\+\) *\$ *) */\1/;t;d' $PATH_ROOT/Config.kmk`
-+VBOX_SVN_VERSION_REV=`sed -e 's/^ *VBOX_SVN_REV_VERSION_FALLBACK *:= \+\$(patsubst *%:,, *\$Rev: *\([0-9]\+\) *\$ *) */\1/;t;d' $PATH_ROOT/Version.kmk`
-+if [ "$VBOX_SVN_CONFIG_REV" -gt "$VBOX_SVN_VERSION_REV" ]; then
-+    VBOX_SVN_REV=$VBOX_SVN_CONFIG_REV
-+else
-+    VBOX_SVN_REV=$VBOX_SVN_VERSION_REV
-+fi
-+VBOX_VENDOR=`sed -e 's/^ *VBOX_VENDOR *= \+\(.\+\)/\1/;t;d' $PATH_ROOT/Config.kmk`
-+VBOX_VENDOR_SHORT=`sed -e 's/^ *VBOX_VENDOR_SHORT *= \+\(.\+\)/\1/;t;d' $PATH_ROOT/Config.kmk`
-+VBOX_PRODUCT=`sed -e 's/^ *VBOX_PRODUCT *= \+\(.\+\)/\1/;t;d' $PATH_ROOT/Config.kmk`
-+VBOX_C_YEAR=`date +%Y`
-+VBOX_WITH_PCI_PASSTHROUGH=`sed -e "s/^ *VBOX_WITH_PCI_PASSTHROUGH *= *\(1\?\)/\1/;t;d" $PATH_ROOT/Config.kmk`
- 
- . $PATH_VBOXDRV/linux/files_vboxdrv
- . $PATH_VBOXNET/linux/files_vboxnetflt
- . $PATH_VBOXADP/linux/files_vboxnetadp
--. $PATH_VBOXPCI/linux/files_vboxpci
-+if [ "$VBOX_WITH_PCI_PASSTHROUGH" -eq "1" ]; then
-+    . $PATH_VBOXPCI/linux/files_vboxpci
-+fi
- 
- # Temporary path for creating the modules, will be removed later
- rm -rf "$PATH_TMP"
-@@ -187,14 +201,16 @@
- fi
- 
- # vboxpci (VirtualBox host PCI access kernel module)
--mkdir $PATH_TMP/vboxpci || exit 1
--for f in $VBOX_VBOXPCI_SOURCES; do
--    install -D -m 0644 `echo $f|cut -d'=' -f1` "$PATH_TMP/vboxpci/`echo $f|cut -d'>' -f2`"
--done
--if [ -n "$VBOX_WITH_HARDENING" ]; then
--    cat                                   $PATH_VBOXPCI/linux/Makefile > $PATH_TMP/vboxpci/Makefile
--else
--    sed -e "s;VBOX_WITH_HARDENING;;g" < $PATH_VBOXPCI/linux/Makefile > $PATH_TMP/vboxpci/Makefile
-+if [ "$VBOX_WITH_PCI_PASSTHROUGH" -eq "1" ]; then
-+    mkdir $PATH_TMP/vboxpci || exit 1
-+    for f in $VBOX_VBOXPCI_SOURCES; do
-+        install -D -m 0644 `echo $f|cut -d'=' -f1` "$PATH_TMP/vboxpci/`echo $f|cut -d'>' -f2`"
-+    done
-+    if [ -n "$VBOX_WITH_HARDENING" ]; then
-+        cat                                   $PATH_VBOXPCI/linux/Makefile > $PATH_TMP/vboxpci/Makefile
-+    else
-+        sed -e "s;VBOX_WITH_HARDENING;;g" < $PATH_VBOXPCI/linux/Makefile > $PATH_TMP/vboxpci/Makefile
-+    fi
- fi
- 
- install -D -m 0644 $PATH_LINUX/Makefile $PATH_TMP/Makefile
diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.0.bb b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.2.bb
similarity index 93%
rename from meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.0.bb
rename to meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.2.bb
index be18b10c6..62c2b509f 100644
--- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.0.bb
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.2.bb
@@ -13,10 +13,9 @@ VBOX_NAME = "VirtualBox-${PV}"
 
 SRC_URI = "http://download.virtualbox.org/virtualbox/${PV}/${VBOX_NAME}.tar.bz2 \
     file://Makefile.utils \
-    file://export.patch;patchdir=${WORKDIR}/${VBOX_NAME} \
 "
-SRC_URI[md5sum] = "484b550f4692c9d61896b08bb0a1be7f"
-SRC_URI[sha256sum] = "49005ed94454f893fc3955e1e2b9607e85c300235cb983b39d1df2cfcf29f039"
+SRC_URI[md5sum] = "f4f42fd09857556b04b803fb99cc6905"
+SRC_URI[sha256sum] = "4326576e8428ea3626194fc82646347576e94c61f11d412a669fc8a10c2a1e67"
 
 S = "${WORKDIR}/vbox_module"
 
-- 
2.17.1


