Return-Path: <Changqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id AA3197F39A
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Oct 2019 04:57:27 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id x994vS3U024439
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 8 Oct 2019 21:57:28 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.468.0; Tue, 8 Oct 2019 21:57:27 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 9 Oct 2019 12:57:26 +0800
Message-ID: <1570597046-200888-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] multipath-tools: upgrade 0.8.1 -> 0.8.2
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
X-List-Received-Date: Wed, 09 Oct 2019 04:57:27 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ...-the-property-blacklist-exception-builtin.patch | 16 +++---
 ...ds-from-kernel-cmdline-mpath.wwids-with-A.patch | 57 ++++++++++++----------
 ...-warn-on-invalid-regex-instead-of-failing.patch | 31 ++++++------
 ...ath-tools_0.8.1.bb => multipath-tools_0.8.2.bb} |  2 +-
 4 files changed, 54 insertions(+), 52 deletions(-)
 rename meta-oe/recipes-support/multipath-tools/{multipath-tools_0.8.1.bb => multipath-tools_0.8.2.bb} (98%)

diff --git a/meta-oe/recipes-support/multipath-tools/files/0022-RH-Remove-the-property-blacklist-exception-builtin.patch b/meta-oe/recipes-support/multipath-tools/files/0022-RH-Remove-the-property-blacklist-exception-builtin.patch
index fd10608..21b8ec6 100644
--- a/meta-oe/recipes-support/multipath-tools/files/0022-RH-Remove-the-property-blacklist-exception-builtin.patch
+++ b/meta-oe/recipes-support/multipath-tools/files/0022-RH-Remove-the-property-blacklist-exception-builtin.patch
@@ -1,7 +1,7 @@
-From 0000000000000000000000000000000000000000 Mon Sep 17  00:00:00 2001
-From:Benjamin Marzinski <bmarzins@redhat.com> 
-Date: Wed, 2 Jul  2014 12:49:53 -0500 
-Subject: [PATCH] RH: Remove the property blacklist  exception builtin
+From 0000000000000000000000000000000000000000 Mon Sep 17
+00:00:00 2001 From:Benjamin Marzinski <bmarzins@redhat.com> Date: Wed, 2 Jul
+2014 12:49:53 -0500 Subject: [PATCH] RH: Remove the property blacklist
+exception builtin
 
 Multipath set the default property blacklist exceptions to
 (ID_SCSI_VPD|ID_WWN).  This has the effect of blacklisting some internal
@@ -15,14 +15,14 @@ Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
 
 Upsteam-Status: Pending
 
-Update patch to 0.8.0
+Update patch to 0.8.2
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
 ---
  libmultipath/blacklist.c | 13 +++++--------
  1 file changed, 5 insertions(+), 8 deletions(-)
 
 diff --git a/libmultipath/blacklist.c b/libmultipath/blacklist.c
-index e0d0279..9f58313 100644
+index 00e8dbd..5204501 100644
 --- a/libmultipath/blacklist.c
 +++ b/libmultipath/blacklist.c
 @@ -192,12 +192,6 @@ setup_default_blist (struct config * conf)
@@ -38,8 +38,8 @@ index e0d0279..9f58313 100644
  	str = STRDUP("^(td|hd|vd)[a-z]");
  	if (!str)
  		return 1;
-@@ -415,8 +409,11 @@ filter_property(struct config *conf, struct udev_device *udev, int lvl)
- 		}
+@@ -437,8 +431,11 @@ filter_property(struct config *conf, struct udev_device *udev, int lvl,
+ 			r = MATCH_NOTHING;
  	}
  
 -	log_filter(devname, NULL, NULL, NULL, env, NULL, r, lvl);
diff --git a/meta-oe/recipes-support/multipath-tools/files/0026-RH-add-wwids-from-kernel-cmdline-mpath.wwids-with-A.patch b/meta-oe/recipes-support/multipath-tools/files/0026-RH-add-wwids-from-kernel-cmdline-mpath.wwids-with-A.patch
index 938262b..724bef8 100644
--- a/meta-oe/recipes-support/multipath-tools/files/0026-RH-add-wwids-from-kernel-cmdline-mpath.wwids-with-A.patch
+++ b/meta-oe/recipes-support/multipath-tools/files/0026-RH-add-wwids-from-kernel-cmdline-mpath.wwids-with-A.patch
@@ -1,7 +1,10 @@
-From 0000000000000000000000000000000000000000 Mon Sep 17  00:00:00 2001 
-From: Benjamin Marzinski <bmarzins@redhat.com>
-Date: Fri, 17  Oct 2014 11:20:34 -0500
-Subject: [PATCH] RH: add wwids from kernel cmdline  mpath.wwids with -A
+From 0f54b3120ca06ff3168cdbf901a27b68c4638398 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Thu, 26 Sep 2019 16:29:48 +0800
+Subject: [PATCH] From 0000000000000000000000000000000000000000 Mon Sep 17 
+ 00:00:00 2001 From: Benjamin Marzinski <bmarzins@redhat.com> Date: Fri, 17 
+ Oct 2014 11:20:34 -0500 Subject: [PATCH] RH: add wwids from kernel cmdline 
+ mpath.wwids with -A
 
 This patch adds another option to multipath, "-A", which reads
 /proc/cmdline for mpath.wwid=<WWID> options, and adds any wwids it finds
@@ -16,7 +19,7 @@ Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
 
 Upstream-Status: Pending
 
-Update this patch to new version 0.8.0
+Update this patch to new version 0.8.2
 
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
 ---
@@ -28,10 +31,10 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com>
  5 files changed, 57 insertions(+), 1 deletion(-)
 
 diff --git a/libmultipath/wwids.c b/libmultipath/wwids.c
-index 53e7951..9ba9b62 100644
+index ef74812..19c4d68 100644
 --- a/libmultipath/wwids.c
 +++ b/libmultipath/wwids.c
-@@ -443,3 +443,47 @@ int op ## _wwid(const char *wwid) \
+@@ -444,3 +444,47 @@ int op ## _wwid(const char *wwid) \
  declare_failed_wwid_op(is_failed, false)
  declare_failed_wwid_op(mark_failed, true)
  declare_failed_wwid_op(unmark_failed, true)
@@ -92,27 +95,27 @@ index 0c6ee54..e32a0b0 100644
  enum {
  	WWID_IS_NOT_FAILED = 0,
 diff --git a/multipath/main.c b/multipath/main.c
-index 5abb118..c751b31 100644
+index 96a1146..5fc65ef 100644
 --- a/multipath/main.c
 +++ b/multipath/main.c
-@@ -134,6 +134,7 @@ usage (char * progname)
- 	fprintf (stderr, VERSION_STRING);
- 	fprintf (stderr, "Usage:\n");
- 	fprintf (stderr, "  %s [-a|-c|-w|-W] [-d] [-r] [-i] [-v lvl] [-p pol] [-b fil] [-q] [dev]\n", progname);
-+	fprintf (stderr, "  %s [-a|-A|-c|-w|-W] [-d] [-r] [-i] [-v lvl] [-p pol] [-b fil] [-q] [dev]\n", progname);
- 	fprintf (stderr, "  %s -l|-ll|-f [-v lvl] [-b fil] [-R num] [dev]\n", progname);
- 	fprintf (stderr, "  %s -F [-v lvl] [-R num]\n", progname);
- 	fprintf (stderr, "  %s [-t|-T]\n", progname);
-@@ -147,6 +148,8 @@ usage (char * progname)
+@@ -139,6 +139,7 @@ usage (char * progname)
+ 	fprintf (stderr, "  %s [-v level] [-l|-ll] [device]\n", progname);
+ 	fprintf (stderr, "  %s [-v level] [-a|-w] device\n", progname);
+ 	fprintf (stderr, "  %s [-v level] -W\n", progname);
++        fprintf (stderr, "  %s [-v level] -A\n", progname);
+ 	fprintf (stderr, "  %s [-v level] [-i] [-c|-C] device\n", progname);
+ 	fprintf (stderr, "  %s [-v level] [-i] [-u|-U]\n", progname);
+ 	fprintf (stderr, "  %s [-h|-t|-T]\n", progname);
+@@ -151,6 +152,8 @@ usage (char * progname)
  		"  -f      flush a multipath device map\n"
  		"  -F      flush all multipath device maps\n"
  		"  -a      add a device wwid to the wwids file\n"
-+		"  -A      add devices from kernel command line mpath.wwids\n"
-+		"          parameters to wwids file\n"
++                "  -A      add devices from kernel command line mpath.wwids\n"
++                "          parameters to wwids file\n"
  		"  -c      check if a device should be a path in a multipath device\n"
  		"  -C      check if a multipath device has usable paths\n"
  		"  -q      allow queue_if_no_path when multipathd is not running\n"
-@@ -870,7 +873,7 @@ main (int argc, char *argv[])
+@@ -905,7 +908,7 @@ main (int argc, char *argv[])
  		exit(RTVL_FAIL);
  	multipath_conf = conf;
  	conf->retrigger_tries = 0;
@@ -121,17 +124,17 @@ index 5abb118..c751b31 100644
  		switch(arg) {
  		case 1: printf("optarg : %s\n",optarg);
  			break;
-@@ -937,6 +940,10 @@ main (int argc, char *argv[])
- 		case 't':
- 			r = dump_config(conf, NULL, NULL) ? RTVL_FAIL : RTVL_OK;
- 			goto out_free_config;
+@@ -998,6 +1001,10 @@ main (int argc, char *argv[])
+ 		case 'R':
+ 			retries = atoi(optarg);
+ 			break;
 +		case 'A':
 +			if (remember_cmdline_wwid() != 0)
 +				exit(1);
 +			exit(0);
- 		case 'T':
- 			cmd = CMD_DUMP_CONFIG;
- 			break;
+ 		case ':':
+ 			fprintf(stderr, "Missing option argument\n");
+ 			usage(argv[0]);
 diff --git a/multipath/multipath.8 b/multipath/multipath.8
 index 9cdd05a..1e120f3 100644
 --- a/multipath/multipath.8
diff --git a/meta-oe/recipes-support/multipath-tools/files/0027-RH-warn-on-invalid-regex-instead-of-failing.patch b/meta-oe/recipes-support/multipath-tools/files/0027-RH-warn-on-invalid-regex-instead-of-failing.patch
index 95624ad..c59edbb 100644
--- a/meta-oe/recipes-support/multipath-tools/files/0027-RH-warn-on-invalid-regex-instead-of-failing.patch
+++ b/meta-oe/recipes-support/multipath-tools/files/0027-RH-warn-on-invalid-regex-instead-of-failing.patch
@@ -1,10 +1,7 @@
-From 56d65ecb1c6d814929f6ff3159ade09dc203cc83 Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Mon, 26 Nov 2018 10:31:30 +0800
-Subject: [PATCH] From 0000000000000000000000000000000000000000 Mon Sep 17
- 00:00:00 2001 From: Benjamin Marzinski <bmarzins@redhat.com> Date: Mon, 6 Nov
- 2017 21:39:28 -0600 Subject: [PATCH] RH: warn on invalid regex instead of
- failing
+From 0000000000000000000000000000000000000000 Mon Sep 17
+00:00:00 2001 From: Benjamin Marzinski <bmarzins@redhat.com> Date: Mon, 6 Nov
+2017 21:39:28 -0600 Subject: [PATCH] RH: warn on invalid regex instead of
+failing
 
 multipath.conf used to allow "*" as a match everything regular expression,
 instead of requiring ".*". Instead of erroring when the old style
@@ -15,10 +12,9 @@ Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
 
 Upstream-Status: Pending
 
-update this patch to new version
+update this patch to 0.8.2
 
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
-
 ---
  libmultipath/dict.c   | 29 ++++++++++++++++++++++-------
  libmultipath/parser.c | 13 +++++++++++++
@@ -26,7 +22,7 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com>
  3 files changed, 36 insertions(+), 7 deletions(-)
 
 diff --git a/libmultipath/dict.c b/libmultipath/dict.c
-index eaad4f1..fb30577 100644
+index c6eba0f..05ed3d8 100644
 --- a/libmultipath/dict.c
 +++ b/libmultipath/dict.c
 @@ -59,6 +59,21 @@ set_str(vector strvec, void *ptr)
@@ -51,7 +47,7 @@ index eaad4f1..fb30577 100644
  set_yes_no(vector strvec, void *ptr)
  {
  	char * buff;
-@@ -1373,8 +1388,8 @@ ble_ ## option ## _handler (struct config *conf, vector strvec)		\
+@@ -1415,8 +1430,8 @@ ble_ ## option ## _handler (struct config *conf, vector strvec)		\
  									\
  	if (!conf->option)						\
  		return 1;						\
@@ -62,7 +58,7 @@ index eaad4f1..fb30577 100644
  	if (!buff)							\
  		return 1;						\
  									\
-@@ -1390,7 +1405,7 @@ ble_ ## option ## _ ## name ## _handler (struct config *conf, vector strvec) \
+@@ -1432,7 +1447,7 @@ ble_ ## option ## _ ## name ## _handler (struct config *conf, vector strvec) \
  	if (!conf->option)						\
  		return 1;						\
  									\
@@ -71,7 +67,7 @@ index eaad4f1..fb30577 100644
  	if (!buff)							\
  		return 1;						\
  									\
-@@ -1493,16 +1508,16 @@ device_handler(struct config *conf, vector strvec)
+@@ -1535,16 +1550,16 @@ device_handler(struct config *conf, vector strvec)
  	return 0;
  }
  
@@ -93,11 +89,11 @@ index eaad4f1..fb30577 100644
  
  declare_hw_handler(hwhandler, set_str)
 diff --git a/libmultipath/parser.c b/libmultipath/parser.c
-index 92ef7cf..0e2cf49 100644
+index e00c5ff..6ca5842 100644
 --- a/libmultipath/parser.c
 +++ b/libmultipath/parser.c
-@@ -384,6 +384,19 @@ set_value(vector strvec)
- 	return alloc;
+@@ -382,6 +382,19 @@ oom:
+ 	return NULL;
  }
  
 +void *
@@ -128,3 +124,6 @@ index 62906e9..b791705 100644
  extern int process_file(struct config *conf, char *conf_file);
  extern struct keyword * find_keyword(vector keywords, vector v, char * name);
  int snprint_keyword(char *buff, int len, char *fmt, struct keyword *kw,
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.1.bb b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.2.bb
similarity index 98%
rename from meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.1.bb
rename to meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.2.bb
index 8d86e60..06e78c7 100644
--- a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.1.bb
+++ b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.2.bb
@@ -47,7 +47,7 @@ SRC_URI = "git://git.opensvc.com/multipath-tools/.git;protocol=http \
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
 
-SRCREV = "e23b5d7cf67a9c543e118f2f6b902594a02a804a"
+SRCREV = "8a7e9b6648898f2c2d2bbd2d22871f79612e716e"
 
 S = "${WORKDIR}/git"
 
-- 
2.7.4


