Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id B8E4E7821C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Jun 2017 08:05:22 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id j186so19908845pge.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Jun 2017 01:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=4fzTU4y7oLEdVZLxWXUYo8LEk8cZ3jIufcpAW0k/4JQ=;
	b=DsJNfF4NKD7Pl7PUFMXn7RF3Sc6fOb6Xypz3ubHIq8L9jieP4ZB5bcBKJq+iEGCcGv
	EdxN6ZFGa6ra9hAM+Whj+ZSpyamKOB5qxseA/aIBgiL57bk6JbYHEWW7ACaX20ljSTwd
	hCKUvOHkJZr7ED/2dRtTRg+cJqT9eNKTlqZtKtwyPDTIbsF2LLd86nXtJv4PudsSknfO
	WpyK/swMFmecyogdwF3ryL4EK061b8h+FJC2EIZWgJhk1DT/opnx/XI9Em4IkpAQ4vZZ
	+b7zd01Sc8BgUMw2g/H5djakD+jaKDlNyuS784iJYthAYtXk7bluFiObYs0XnMqJ3Z9G
	b6eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=4fzTU4y7oLEdVZLxWXUYo8LEk8cZ3jIufcpAW0k/4JQ=;
	b=au2bj4od2uqqC9Lok6URyx4QKj89/oABXnlTYuwyUIqjZB9Q5+iQdpD+hTsHAmgQWz
	UH/VvwHzpYDjUWFaNuuSSzolFoLKx58HYApT0CwSA9v1mD2kreMjw/VQLRNc6LC+iYHz
	+LvCa1QOmoKzFPDiRRFNdwFMb8dOJuVLXyWLNUUMVWQaA4xsjiOQ+ETmirvSZDVe6d/0
	rPRJ3skkuUQPvojJYdzQraTFkU6C46k3ZBfU98w+G6tyFL4TU5ylrA8QkDoTXQ/ptHh4
	V3F/6kXAeLsP6woMybPX97YnGjW81crgwPiE1RtsJPztcBxJIRuL23UetSNfzLal6X8H
	pgrQ==
X-Gm-Message-State: AKS2vOwsRLijs8fINvAu7TtSsEsfmc884KKAMLpxKY+XMq2/pY6o24Em
	t06pxBbGIrqVJx4k
X-Received: by 10.98.155.218 with SMTP id e87mr29636182pfk.24.1497945923191;
	Tue, 20 Jun 2017 01:05:23 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::36d3])
	by smtp.gmail.com with ESMTPSA id 18sm1919695pfh.65.2017.06.20.01.05.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 20 Jun 2017 01:05:22 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 20 Jun 2017 01:05:12 -0700
Message-Id: <20170620080512.23657-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.1
Subject: [meta-oe][PATCH] scsirastools: Upgrade to 1.6.6
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
X-List-Received-Date: Tue, 20 Jun 2017 08:05:23 -0000

Fix build with hardening flags

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../scsirastools/scsirastools/mdadm.patch          |  13 ++
 .../scsirastools/scsirastools/print-format.patch   | 218 +++++++++++++++++++++
 ...scsirastools_1.6.4.bb => scsirastools_1.6.6.bb} |  14 +-
 3 files changed, 242 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-extended/scsirastools/scsirastools/mdadm.patch
 create mode 100644 meta-oe/recipes-extended/scsirastools/scsirastools/print-format.patch
 rename meta-oe/recipes-extended/scsirastools/{scsirastools_1.6.4.bb => scsirastools_1.6.6.bb} (81%)

diff --git a/meta-oe/recipes-extended/scsirastools/scsirastools/mdadm.patch b/meta-oe/recipes-extended/scsirastools/scsirastools/mdadm.patch
new file mode 100644
index 000000000..6edda08cd
--- /dev/null
+++ b/meta-oe/recipes-extended/scsirastools/scsirastools/mdadm.patch
@@ -0,0 +1,13 @@
+--- mdadm.d/mdadm-1.3.0/mdadm.h.org	2017-06-20 00:35:55.366978372 -0700
++++ mdadm.d/mdadm-1.3.0/mdadm.h	2017-06-20 00:36:41.244363348 -0700
+@@ -29,8 +29,9 @@
+ 
+ #define	__USE_LARGEFILE64
+ #include	<unistd.h>
+-extern __off64_t lseek64 __P ((int __fd, __off64_t __offset, int __whence));
++//extern __off64_t lseek64 __P ((int __fd, __off64_t __offset, int __whence));
+ 
++#include	<sys/sysmacros.h>
+ #include	<sys/types.h>
+ #include	<sys/stat.h>
+ #include	<stdlib.h>
diff --git a/meta-oe/recipes-extended/scsirastools/scsirastools/print-format.patch b/meta-oe/recipes-extended/scsirastools/scsirastools/print-format.patch
new file mode 100644
index 000000000..ac8178058
--- /dev/null
+++ b/meta-oe/recipes-extended/scsirastools/scsirastools/print-format.patch
@@ -0,0 +1,218 @@
+Index: scsirastools-1.6.6/src/sgcommon.c
+===================================================================
+--- scsirastools-1.6.6.orig/src/sgcommon.c
++++ scsirastools-1.6.6/src/sgcommon.c
+@@ -304,8 +304,8 @@ void showit(char *buf)
+ 	    fdlog = stderr;
+ 	}
+     }
+-    if (flogopen) fprintf(fdlog, buf);	/*write to log */
+-    fprintf(fdmsg, buf);	/*defaults to stdout */
++    if (flogopen) fprintf(fdlog, "%s", buf);	/*write to log */
++    fprintf(fdmsg, "%s", buf);	/*defaults to stdout */
+ }
+ 
+ void showlog(const char * format, ...) 
+Index: scsirastools-1.6.6/src/sgdefects.c
+===================================================================
+--- scsirastools-1.6.6.orig/src/sgdefects.c
++++ scsirastools-1.6.6/src/sgdefects.c
+@@ -226,7 +226,7 @@ int main(int argc, char **argv)
+ 	    ("              ******************************************\n");
+ 	if (flogopen)
+ 	    printf("Log file %s is open\n", logfile);
+-	printf(HeaderStr);
++	printf("%s", HeaderStr);
+ 	/* get SCSI Device Info */
+ 	idev = 0;
+ 	flags = O_RDWR;		/* could use OPEN_FLAG if read-only. */
+Index: scsirastools-1.6.6/src/sgdiag.c
+===================================================================
+--- scsirastools-1.6.6.orig/src/sgdiag.c
++++ scsirastools-1.6.6/src/sgdiag.c
+@@ -250,7 +250,7 @@ int main(int argc, char **argv)
+ 	   printf("              ******************************************\n");
+ 	   if (flogopen)
+ 	       printf("Log file %s is open, debug=%d\n", logfile,fdebug);
+-	   printf(HeaderStr);
++	   printf("%s", HeaderStr);
+ 	}
+ 	/* get SCSI Device Info */
+ 	idev = 0;
+@@ -356,12 +356,12 @@ int main(int argc, char **argv)
+ 	case 'F':
+ 	case 'f':
+ 	    func = 'f';
+-	    printf(erase_msg);
++	    printf("%s", erase_msg);
+ 	    break;
+ 	case 'W':
+ 	case 'w':
+ 	    func = 'w';
+-	    printf(erase_msg);
++	    printf("%s", erase_msg);
+ 	    break;
+ 	case 'S':
+ 	case 's':
+Index: scsirastools-1.6.6/src/sgdiskmon.c
+===================================================================
+--- scsirastools-1.6.6.orig/src/sgdiskmon.c
++++ scsirastools-1.6.6/src/sgdiskmon.c
+@@ -197,9 +197,9 @@ void showit(char *buf)
+         }
+     }
+     if (flogopen)
+-        fprintf(fdlog, buf);    /*write to log */
++        fprintf(fdlog, "%s", buf);    /*write to log */
+     if (!background)
+-        fprintf(fdmsg, buf);    /*message display defaults to stdout */
++        fprintf(fdmsg, "%s",  buf);    /*message display defaults to stdout */
+ }
+ 
+ /*
+@@ -235,7 +235,7 @@ rem_scsi_dev(int bus, int ch, int id, in
+ 	fp = fopen("/proc/scsi/scsi","r+");
+ 	if (fp == NULL) return(errno); 
+ 	sprintf(cmd,"remove-single-device %d %d %d %d",bus,ch,id,lun);
+-	n = fprintf(fp,cmd);
++	n = fprintf(fp,"%s", cmd);
+ 	fclose(fp);
+ 	strcat(cmd,"\n");
+ 	showit(cmd);
+@@ -256,7 +256,7 @@ add_scsi_dev(int bus, int ch, int id, in
+ 	fp = fopen("/proc/scsi/scsi","r+");
+ 	if (fp == NULL) return(errno); 
+ 	sprintf(cmd,"add-single-device %d %d %d %d",bus,ch,id,lun);
+-	n = fprintf(fp,cmd);
++	n = fprintf(fp, "%s", cmd);
+ 	fclose(fp);
+ 	strcat(cmd,"\n");
+ 	showit(cmd);
+@@ -1233,7 +1233,7 @@ main(int argc, char **argv)
+             interval = atoi(optarg);
+             break;
+ 	default:
+-            printf(output2);    /*prog header*/
++            printf("%s", output2);    /*prog header*/
+             printf("Usage: %s [-bemnrx -t time]\n",progname);
+ 	    printf(" -b  Run in Background as a daemon\n");
+ 	    printf(" -e  Do not write to any files.\n");
+@@ -1246,7 +1246,7 @@ main(int argc, char **argv)
+             exit(1); 
+ 	}
+    }
+-   if (!background) printf(output2);  /*prog header*/
++   if (!background) printf("%s", output2);  /*prog header*/
+ 
+    /* only run this as superuser */
+    i = geteuid();
+Index: scsirastools-1.6.6/src/sgmode.c
+===================================================================
+--- scsirastools-1.6.6.orig/src/sgmode.c
++++ scsirastools-1.6.6/src/sgmode.c
+@@ -303,7 +303,7 @@ int main(int argc, char **argv)
+ 	    ("              ******************************************\n");
+ 	if (flogopen)
+ 	    printf("Log file %s is open\n", logfile);
+-	printf(HeaderStr);
++	printf("%s", HeaderStr);
+ 	/* get SCSI Device Info */
+ 	idev = 0;
+ 	flags = O_RDWR;		/* could use OPEN_FLAG if read-only. */
+@@ -585,8 +585,8 @@ int do_modeselect(int idx)
+ 	    if (!foverwrite) {
+ 		/* use existing capacity from mode sense */
+ 		memcpy(sel_buffer + 4, out_buffer + 4, 8);
+-		sprintf(scratch, "Using existing capacity instead\n");
+-		printf(scratch);
++		sprintf(scratch, "%s", "Using existing capacity instead\n");
++		printf("%s",scratch);
+ 		showlog( scratch);
+ 	    } else {  /* foverwrite==1, changing something */
+ 		/* usually only change num blks, if change blk size, flag it. */
+Index: scsirastools-1.6.6/src/sgraidmon.c
+===================================================================
+--- scsirastools-1.6.6.orig/src/sgraidmon.c
++++ scsirastools-1.6.6/src/sgraidmon.c
+@@ -269,9 +269,9 @@ void showit(char *buf)
+         }
+     }
+     if (flogopen)
+-        fprintf(fdlog, buf);    /*write to log */
++        fprintf(fdlog, "%s", buf);    /*write to log */
+     if (!background)
+-        fprintf(fdmsg, buf);    /*message display defaults to stdout */
++        fprintf(fdmsg, "%s", buf);    /*message display defaults to stdout */
+ }
+ 
+ /*
+@@ -563,7 +563,7 @@ add_scsi_dev(int bus, int ch, int id, in
+ 	fp = fopen("/proc/scsi/scsi","r+");
+ 	if (fp == NULL) return(errno); 
+ 	sprintf(cmd,"add-single-device %d %d %d %d",bus,ch,id,lun);
+-	fprintf(fp,cmd);
++	fprintf(fp, "%s", cmd);
+ 	fclose(fp);
+ 	strcat(cmd,"\n");
+ 	showit(cmd);
+@@ -1585,7 +1585,7 @@ main(int argc, char **argv)
+             interval = atoi(optarg);
+             break;
+ 	default:
+-            printf(output2);    /*prog header*/
++            printf("%s", output2);    /*prog header*/
+             printf("Usage: %s [-bemnrx -t time]\n",progname);
+ 	    printf(" -b  Run in Background as a daemon\n");
+ 	    printf(" -e  Do not write to any files.\n");
+@@ -1598,7 +1598,7 @@ main(int argc, char **argv)
+             exit(1); 
+ 	}
+    }
+-   if (!background) printf(output2);  /*prog header*/
++   if (!background) printf("%s", output2);  /*prog header*/
+ 
+    /* only run this as superuser */
+    i = geteuid();
+Index: scsirastools-1.6.6/src/sgsafte.c
+===================================================================
+--- scsirastools-1.6.6.orig/src/sgsafte.c
++++ scsirastools-1.6.6/src/sgsafte.c
+@@ -174,9 +174,9 @@ void showit(char *buf)
+         }
+     }
+     if (flogopen)
+-        fprintf(fdlog, buf);    /*write to log */
++        fprintf(fdlog, "%s", buf);    /*write to log */
+     if (!background)
+-        fprintf(fdmsg, buf);    /*message display defaults to stdout */
++        fprintf(fdmsg, "%s", buf);    /*message display defaults to stdout */
+ }
+  
+ /*
+@@ -384,7 +384,7 @@ add_scsi_dev(int bus, int ch, int id, in
+ 	fp = fopen("/proc/scsi/scsi","r+");
+ 	if (fp == NULL) return(errno); 
+ 	sprintf(cmd,"add-single-device %d %d %d %d",bus,ch,id,lun);
+-	fprintf(fp,cmd);
++	fprintf(fp, "%s", cmd);
+ 	fclose(fp);
+ 	strcat(cmd,"\n");
+ 	showit(cmd);
+@@ -1261,7 +1261,7 @@ main(int argc, char **argv)
+             do_numeric = 0;
+             break; 
+ 	default:
+-            printf(output2);    /*prog header*/
++            printf("%s", output2);    /*prog header*/
+             printf("Usage: %s [-d num -rf -emnx]\n",progname);
+ 	    printf(" -d  drive number to set (0, 1, ...)\n");
+ 	    printf(" -r  set SAF-TE status to ready\n");
+@@ -1273,7 +1273,7 @@ main(int argc, char **argv)
+             exit(1); 
+ 	}
+    }
+-   if (!background) printf(output2);  /*prog header*/
++   if (!background) printf("%s", output2);  /*prog header*/
+ 
+    if (setval != 0 && drivenum == -1) drivenum = 0;  /*default to first drive*/
+ 
diff --git a/meta-oe/recipes-extended/scsirastools/scsirastools_1.6.4.bb b/meta-oe/recipes-extended/scsirastools/scsirastools_1.6.6.bb
similarity index 81%
rename from meta-oe/recipes-extended/scsirastools/scsirastools_1.6.4.bb
rename to meta-oe/recipes-extended/scsirastools/scsirastools_1.6.6.bb
index d0c36e472..e202d16eb 100644
--- a/meta-oe/recipes-extended/scsirastools/scsirastools_1.6.4.bb
+++ b/meta-oe/recipes-extended/scsirastools/scsirastools_1.6.6.bb
@@ -10,15 +10,23 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=687ea108478d26152ae46eb29d9d1545"
 
 DEPENDS += "groff-native"
 
-SRC_URI = "http://prdownloads.sourceforge.net/scsirastools/scsirastools-${PV}.tar.gz"
-SRC_URI[md5sum] = "2d775111b62e2dfc1960a722f5fda211"
-SRC_URI[sha256sum] = "38d2c6c9b04a2c594e528927b950754f94c0522718d17c78e6589ba778339bf8"
+SRC_URI = "http://prdownloads.sourceforge.net/scsirastools/scsirastools-${PV}.tar.gz \
+           file://mdadm.patch;apply=no \
+           file://print-format.patch \
+"
+SRC_URI[md5sum] = "6271a61b2ce40aaf33ef61775148cda1"
+SRC_URI[sha256sum] = "e7b997e75decb06a650c42c35cd63d0c94c34e39cf133c723337b0eeabbfdf6a"
 
 inherit autotools update-rc.d
 
 # mdadm Makefile has CC set to gcc, hence override CC to ${CC}
 EXTRA_OEMAKE += "CC='${CC}'"
 
+
+do_configure_append() {
+	oe_runmake -C mdadm.d mdadm-1.3.0
+	patch -p0 < ${WORKDIR}/mdadm.patch
+}
 INITSCRIPT_PACKAGES = "${PN}-diskmon ${PN}-raidmon"
 INITSCRIPT_NAME_${PN}-diskmon = "sgdisk"
 INITSCRIPT_PARAMS_${PN}-diskmon = "defaults 80 20"
-- 
2.13.1


