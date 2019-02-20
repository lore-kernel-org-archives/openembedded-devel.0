Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 64D7C7C98C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Feb 2019 08:57:05 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x1K8uZJH026958
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Feb 2019 00:56:56 -0800
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.435.0; Wed, 20 Feb 2019 00:56:52 -0800
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 20 Feb 2019 16:56:19 +0800
Message-ID: <1550652980-292761-5-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1550652980-292761-1-git-send-email-changqing.li@windriver.com>
References: <1550652980-292761-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/5] multipath-tools: upgrade 0.7.9 -> 0.8.0
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
X-List-Received-Date: Wed, 20 Feb 2019 08:57:05 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../0021-RH-fixup-udev-rules-for-redhat.patch      | 24 +++++----------
 ...-the-property-blacklist-exception-builtin.patch | 31 +++++++++----------
 ...ds-from-kernel-cmdline-mpath.wwids-with-A.patch | 36 ++++++++++------------
 ...ath-tools_0.7.9.bb => multipath-tools_0.8.0.bb} |  2 +-
 4 files changed, 38 insertions(+), 55 deletions(-)
 rename meta-oe/recipes-support/multipath-tools/{multipath-tools_0.7.9.bb => multipath-tools_0.8.0.bb} (98%)

diff --git a/meta-oe/recipes-support/multipath-tools/files/0021-RH-fixup-udev-rules-for-redhat.patch b/meta-oe/recipes-support/multipath-tools/files/0021-RH-fixup-udev-rules-for-redhat.patch
index 4ef3e70..e88e256 100644
--- a/meta-oe/recipes-support/multipath-tools/files/0021-RH-fixup-udev-rules-for-redhat.patch
+++ b/meta-oe/recipes-support/multipath-tools/files/0021-RH-fixup-udev-rules-for-redhat.patch
@@ -10,18 +10,21 @@ false warnings that gcc throws because of the changed options. Fix these
 too.
 
 Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
+
+Update patch to 0.8.0
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
 ---
  Makefile.inc        | 2 +-
  kpartx/kpartx.rules | 2 +-
  multipath/Makefile  | 4 ++--
- multipath/main.c    | 2 +-
- 4 files changed, 5 insertions(+), 5 deletions(-)
+ 3 files changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/Makefile.inc b/Makefile.inc
-index af2f5ba..0b271ea 100644
+index fc728ca..2f0bcea 100644
 --- a/Makefile.inc
 +++ b/Makefile.inc
-@@ -51,7 +51,7 @@ endif
+@@ -48,7 +48,7 @@ endif
  prefix		=
  exec_prefix	= $(prefix)
  usr_prefix	= $(prefix)
@@ -64,19 +67,6 @@ index 0828a8f..b9bbb3c 100644
  	$(RM) $(DESTDIR)$(man8dir)/$(EXEC).8.gz
  	$(RM) $(DESTDIR)$(man5dir)/$(EXEC).conf.5.gz
  
-diff --git a/multipath/main.c b/multipath/main.c
-index 3f0a6aa..6fdde03 100644
---- a/multipath/main.c
-+++ b/multipath/main.c
-@@ -389,7 +389,7 @@ static int find_multipaths_check_timeout(const struct path *pp, long tmo,
- 	struct timespec now, ftimes[2], tdiff;
- 	struct stat st;
- 	long fd;
--	int r, err, retries = 0;
-+	int r, err = 0, retries = 0;
- 
- 	clock_gettime(CLOCK_REALTIME, &now);
- 
 -- 
 2.7.4
 
diff --git a/meta-oe/recipes-support/multipath-tools/files/0022-RH-Remove-the-property-blacklist-exception-builtin.patch b/meta-oe/recipes-support/multipath-tools/files/0022-RH-Remove-the-property-blacklist-exception-builtin.patch
index a5c2b5e..fd10608 100644
--- a/meta-oe/recipes-support/multipath-tools/files/0022-RH-Remove-the-property-blacklist-exception-builtin.patch
+++ b/meta-oe/recipes-support/multipath-tools/files/0022-RH-Remove-the-property-blacklist-exception-builtin.patch
@@ -1,10 +1,7 @@
-From 1fede9514566a21cdf3da99e22ddf5a7b2c856c6 Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Fri, 23 Nov 2018 16:47:31 +0800
-Subject: [PATCH] From 0000000000000000000000000000000000000000 Mon Sep 17
- 00:00:00 2001 From: Benjamin Marzinski <bmarzins@redhat.com> Date: Wed, 2 Jul
- 2014 12:49:53 -0500 Subject: [PATCH] RH: Remove the property blacklist
- exception builtin
+From 0000000000000000000000000000000000000000 Mon Sep 17  00:00:00 2001
+From:Benjamin Marzinski <bmarzins@redhat.com> 
+Date: Wed, 2 Jul  2014 12:49:53 -0500 
+Subject: [PATCH] RH: Remove the property blacklist  exception builtin
 
 Multipath set the default property blacklist exceptions to
 (ID_SCSI_VPD|ID_WWN).  This has the effect of blacklisting some internal
@@ -18,21 +15,21 @@ Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
 
 Upsteam-Status: Pending
 
-update this patch to new version
+Update patch to 0.8.0
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
 ---
  libmultipath/blacklist.c | 13 +++++--------
  1 file changed, 5 insertions(+), 8 deletions(-)
 
 diff --git a/libmultipath/blacklist.c b/libmultipath/blacklist.c
-index 318ec03..145fed3 100644
+index e0d0279..9f58313 100644
 --- a/libmultipath/blacklist.c
 +++ b/libmultipath/blacklist.c
 @@ -192,12 +192,6 @@ setup_default_blist (struct config * conf)
  	char * str;
  	int i;
  
--	str = STRDUP("^(ram|raw|loop|fd|md|dm-|sr|scd|st|dcssblk)[0-9]");
+-	str = STRDUP("^(ram|zram|raw|loop|fd|md|dm-|sr|scd|st|dcssblk)[0-9]");
 -	if (!str)
 -		return 1;
 -	if (store_ble(conf->blist_devnode, str, ORIGIN_DEFAULT))
@@ -41,17 +38,17 @@ index 318ec03..145fed3 100644
  	str = STRDUP("^(td|hd|vd)[a-z]");
  	if (!str)
  		return 1;
-@@ -415,8 +409,11 @@ filter_property(struct config * conf, struct udev_device * udev)
+@@ -415,8 +409,11 @@ filter_property(struct config *conf, struct udev_device *udev, int lvl)
  		}
  	}
  
--	log_filter(devname, NULL, NULL, NULL, env, NULL, r);
+-	log_filter(devname, NULL, NULL, NULL, env, NULL, r, lvl);
 -	return r;
-+	if (VECTOR_SIZE(conf->elist_property)) {
-+		log_filter(devname, NULL, NULL, NULL, env, NULL, r);
-+		return r;
-+	}
-+	return 0;
++       if (VECTOR_SIZE(conf->elist_property)) {
++               log_filter(devname, NULL, NULL, NULL, env, NULL, r, lvl);
++               return r;
++       }
++       return 0;
  }
  
  static void free_ble(struct blentry *ble)
diff --git a/meta-oe/recipes-support/multipath-tools/files/0026-RH-add-wwids-from-kernel-cmdline-mpath.wwids-with-A.patch b/meta-oe/recipes-support/multipath-tools/files/0026-RH-add-wwids-from-kernel-cmdline-mpath.wwids-with-A.patch
index 912832a..938262b 100644
--- a/meta-oe/recipes-support/multipath-tools/files/0026-RH-add-wwids-from-kernel-cmdline-mpath.wwids-with-A.patch
+++ b/meta-oe/recipes-support/multipath-tools/files/0026-RH-add-wwids-from-kernel-cmdline-mpath.wwids-with-A.patch
@@ -1,10 +1,7 @@
-From 694a2a6c7e4b523603b30a109b6efb1c30a7cec3 Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Mon, 26 Nov 2018 10:17:58 +0800
-Subject: [PATCH] From 0000000000000000000000000000000000000000 Mon Sep 17
- 00:00:00 2001 From: Benjamin Marzinski <bmarzins@redhat.com> Date: Fri, 17
- Oct 2014 11:20:34 -0500 Subject: [PATCH] RH: add wwids from kernel cmdline
- mpath.wwids with -A
+From 0000000000000000000000000000000000000000 Mon Sep 17  00:00:00 2001 
+From: Benjamin Marzinski <bmarzins@redhat.com>
+Date: Fri, 17  Oct 2014 11:20:34 -0500
+Subject: [PATCH] RH: add wwids from kernel cmdline  mpath.wwids with -A
 
 This patch adds another option to multipath, "-A", which reads
 /proc/cmdline for mpath.wwid=<WWID> options, and adds any wwids it finds
@@ -19,16 +16,16 @@ Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
 
 Upstream-Status: Pending
 
-Update this patch to new version
+Update this patch to new version 0.8.0
 
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
 ---
  libmultipath/wwids.c          | 44 +++++++++++++++++++++++++++++++++++++++++++
  libmultipath/wwids.h          |  1 +
- multipath/main.c              | 10 ++++++++--
+ multipath/main.c              |  9 ++++++++-
  multipath/multipath.8         |  3 +++
  multipathd/multipathd.service |  1 +
- 5 files changed, 57 insertions(+), 2 deletions(-)
+ 5 files changed, 57 insertions(+), 1 deletion(-)
 
 diff --git a/libmultipath/wwids.c b/libmultipath/wwids.c
 index 53e7951..9ba9b62 100644
@@ -95,19 +92,18 @@ index 0c6ee54..e32a0b0 100644
  enum {
  	WWID_IS_NOT_FAILED = 0,
 diff --git a/multipath/main.c b/multipath/main.c
-index ffa5b22..bcf8885 100644
+index 5abb118..c751b31 100644
 --- a/multipath/main.c
 +++ b/multipath/main.c
-@@ -120,7 +120,7 @@ usage (char * progname)
- {
+@@ -134,6 +134,7 @@ usage (char * progname)
  	fprintf (stderr, VERSION_STRING);
  	fprintf (stderr, "Usage:\n");
--	fprintf (stderr, "  %s [-a|-c|-w|-W] [-d] [-r] [-i] [-v lvl] [-p pol] [-b fil] [-q] [dev]\n", progname);
+ 	fprintf (stderr, "  %s [-a|-c|-w|-W] [-d] [-r] [-i] [-v lvl] [-p pol] [-b fil] [-q] [dev]\n", progname);
 +	fprintf (stderr, "  %s [-a|-A|-c|-w|-W] [-d] [-r] [-i] [-v lvl] [-p pol] [-b fil] [-q] [dev]\n", progname);
  	fprintf (stderr, "  %s -l|-ll|-f [-v lvl] [-b fil] [-R num] [dev]\n", progname);
  	fprintf (stderr, "  %s -F [-v lvl] [-R num]\n", progname);
  	fprintf (stderr, "  %s [-t|-T]\n", progname);
-@@ -134,6 +134,8 @@ usage (char * progname)
+@@ -147,6 +148,8 @@ usage (char * progname)
  		"  -f      flush a multipath device map\n"
  		"  -F      flush all multipath device maps\n"
  		"  -a      add a device wwid to the wwids file\n"
@@ -116,18 +112,18 @@ index ffa5b22..bcf8885 100644
  		"  -c      check if a device should be a path in a multipath device\n"
  		"  -C      check if a multipath device has usable paths\n"
  		"  -q      allow queue_if_no_path when multipathd is not running\n"
-@@ -868,7 +870,7 @@ main (int argc, char *argv[])
- 		exit(1);
+@@ -870,7 +873,7 @@ main (int argc, char *argv[])
+ 		exit(RTVL_FAIL);
  	multipath_conf = conf;
  	conf->retrigger_tries = 0;
 -	while ((arg = getopt(argc, argv, ":adcChl::FfM:v:p:b:BrR:itTquUwW")) != EOF ) {
-+	while ((arg = getopt(argc, argv, ":aAdcChl::FfM:v:p:b:BrR:itquUwW")) != EOF ) {
++	while ((arg = getopt(argc, argv, ":aAdcChl::FfM:v:p:b:BrR:itTquUwW")) != EOF ) {
  		switch(arg) {
  		case 1: printf("optarg : %s\n",optarg);
  			break;
-@@ -935,6 +937,10 @@ main (int argc, char *argv[])
+@@ -937,6 +940,10 @@ main (int argc, char *argv[])
  		case 't':
- 			r = dump_config(conf, NULL, NULL);
+ 			r = dump_config(conf, NULL, NULL) ? RTVL_FAIL : RTVL_OK;
  			goto out_free_config;
 +		case 'A':
 +			if (remember_cmdline_wwid() != 0)
diff --git a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.7.9.bb b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.0.bb
similarity index 98%
rename from meta-oe/recipes-support/multipath-tools/multipath-tools_0.7.9.bb
rename to meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.0.bb
index 9cf104e..0cff48d 100644
--- a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.7.9.bb
+++ b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.0.bb
@@ -46,7 +46,7 @@ SRC_URI = "git://git.opensvc.com/multipath-tools/.git;protocol=http \
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
 
-SRCREV = "5c67a8b5944dd13542e6b44fa2ae9803e0cc4282"
+SRCREV = "eb688e1833e9533bfd9496ddc37eecc93590defa"
 
 S = "${WORKDIR}/git"
 
-- 
2.7.4


