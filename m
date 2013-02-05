Received: from mail-ea0-f171.google.com ([209.85.215.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1U2r7t-0002BL-Pv
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Feb 2013 23:36:31 +0100
Received: by mail-ea0-f171.google.com with SMTP id c13so314221eaa.16
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Feb 2013 14:20:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=WowsMWCM8F1TTsm8OwDPalMBhHa1jIIQ80w+vfF4+Ic=;
	b=ia2Hdx2bCnIRagdwErX3zsN6/eka/amvqyYJX5vhu0264dDalo5St2PTtPWFOhXkty
	wug4+/Wd1VDWOp+qxXBw0lWFp27e8OvvAeolNlww9gQjPmLE1db5R6sw6TEEI/BN7Skm
	TfzFKlJ6vUSDLglhMaB5uCRkSxqCmzg873DEyWVd9ZkXJ3iFU4gYZaBw4/mQKZXekZ9/
	PNI6DvwsDZchuTcOQ4e/G49QY/fT4QCQSAgZxAWt0HowrIOTjB+YucdrRQQRveQCGUXm
	Xc23mnVAkH8VJKXLqY4BtZD8WahuJMr48Uwz9YqfVjQd3yvf2X0fZbJGUu6q1gvOI1xX
	AKKg==
X-Received: by 10.14.178.196 with SMTP id f44mr89305424eem.14.1360102839817;
	Tue, 05 Feb 2013 14:20:39 -0800 (PST)
Received: from localhost.localdomain (ip-95-223-251-141.unitymediagroup.de.
	[95.223.251.141])
	by mx.google.com with ESMTPS id q5sm33901931eep.11.2013.02.05.14.20.38
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Tue, 05 Feb 2013 14:20:39 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 Feb 2013 23:18:40 +0100
Message-Id: <1360102723-27891-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1360102723-27891-1-git-send-email-schnitzeltony@googlemail.com>
References: <1360102723-27891-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe-meta-systemd 2/5] xinput-calibrator: Add --output-filename to store calibration to file
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
X-List-Received-Date: Tue, 05 Feb 2013 22:36:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...er-output-filename-and-store-in-output_fi.patch |  248 ++++++++++++++++++++
 ...vdev-do-write-calibration-results-if-outp.patch |  164 +++++++++++++
 ...orgPrint-do-write-calibration-results-if-.patch |  156 ++++++++++++
 ...sbtouchscreen-overridde-default-file-name.patch |   50 ++++
 ...librator-destructors-virtual-to-fix-warni.patch |   64 +++++
 ...er-size-for-max-line-length-only-once-in-.patch |   77 ++++++
 .../xinput-calibrator/xinput-calibrator_git.bb     |    8 +-
 7 files changed, 766 insertions(+), 1 deletions(-)
 create mode 100644 meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator/0001-Add-parameter-output-filename-and-store-in-output_fi.patch
 create mode 100644 meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator/0002-CalibratorEvdev-do-write-calibration-results-if-outp.patch
 create mode 100644 meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator/0003-CalibratorXorgPrint-do-write-calibration-results-if-.patch
 create mode 100644 meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator/0004-CalibratorUsbtouchscreen-overridde-default-file-name.patch
 create mode 100644 meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator/0005-Make-all-Calibrator-destructors-virtual-to-fix-warni.patch
 create mode 100644 meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator/0006-Set-up-buffer-size-for-max-line-length-only-once-in-.patch

diff --git a/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator/0001-Add-parameter-output-filename-and-store-in-output_fi.patch b/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator/0001-Add-parameter-output-filename-and-store-in-output_fi.patch
new file mode 100644
index 0000000..319a504
--- /dev/null
+++ b/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator/0001-Add-parameter-output-filename-and-store-in-output_fi.patch
@@ -0,0 +1,248 @@
+From 6d79af03c09ba84ed718da5a3bb76f0bd5d13600 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Mon, 21 Jan 2013 12:31:12 +0100
+Subject: [PATCH 1/6] Add parameter --output-filename and store in
+ output_filename
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Submitted [https://github.com/tias/xinput_calibrator/pull/47]
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ src/calibrator.cpp                |    5 +++--
+ src/calibrator.hh                 |   10 +++++++++-
+ src/calibrator/Evdev.cpp          |   10 ++++++----
+ src/calibrator/Evdev.hpp          |    6 ++++--
+ src/calibrator/Usbtouchscreen.cpp |    4 ++--
+ src/calibrator/Usbtouchscreen.hpp |    2 +-
+ src/calibrator/XorgPrint.cpp      |    4 ++--
+ src/calibrator/XorgPrint.hpp      |    2 +-
+ src/main_common.cpp               |   16 +++++++++++++---
+ 9 files changed, 41 insertions(+), 18 deletions(-)
+
+diff --git a/src/calibrator.cpp b/src/calibrator.cpp
+index 403ae8e..ae5ea86 100644
+--- a/src/calibrator.cpp
++++ b/src/calibrator.cpp
+@@ -37,10 +37,11 @@ bool Calibrator::verbose = false;
+ Calibrator::Calibrator(const char* const device_name0, const XYinfo& axys0,
+     const int thr_misclick, const int thr_doubleclick,
+     const OutputType output_type0, const char* geometry0,
+-    const bool use_timeout0)
++    const bool use_timeout0, const char* output_filename0)
+ : device_name(device_name0),
+     threshold_doubleclick(thr_doubleclick), threshold_misclick(thr_misclick),
+-    output_type(output_type0), geometry(geometry0), use_timeout(use_timeout0)
++    output_type(output_type0), geometry(geometry0), use_timeout(use_timeout0),
++    output_filename(output_filename0)
+ {
+     old_axys = axys0;
+ 
+diff --git a/src/calibrator.hh b/src/calibrator.hh
+index 96cff2b..7d406b4 100644
+--- a/src/calibrator.hh
++++ b/src/calibrator.hh
+@@ -145,7 +145,8 @@ public:
+                const int thr_doubleclick=0,
+                const OutputType output_type=OUTYPE_AUTO,
+                const char* geometry=0,
+-               const bool use_timeout=1);
++               const bool use_timeout=1,
++               const char* output_filename = 0);
+ 
+     ~Calibrator() {}
+ 
+@@ -180,6 +181,10 @@ public:
+     const bool get_use_timeout() const
+     { return use_timeout; }
+ 
++    /// get output filename set at cmdline or NULL
++    const char* get_output_filename() const
++    { return output_filename; }
++
+ protected:
+     /// check whether the coordinates are along the respective axis
+     bool along_axis(int xy, int x0, int y0);
+@@ -230,6 +235,9 @@ protected:
+     const char* geometry;
+ 
+     const bool use_timeout;
++
++    // manually specified output filename
++    const char* output_filename;
+ };
+ 
+ // Interfance for a CalibratorTester
+diff --git a/src/calibrator/Evdev.cpp b/src/calibrator/Evdev.cpp
+index a370689..413e314 100644
+--- a/src/calibrator/Evdev.cpp
++++ b/src/calibrator/Evdev.cpp
+@@ -47,8 +47,9 @@ CalibratorEvdev::CalibratorEvdev(const char* const device_name0,
+                                  const int thr_doubleclick,
+                                  const OutputType output_type,
+                                  const char* geometry,
+-                                 const bool use_timeout)
+-  : Calibrator(device_name0, axys0, thr_misclick, thr_doubleclick, output_type, geometry, use_timeout)
++                                 const bool use_timeout,
++                                 const char* output_filename)
++  : Calibrator(device_name0, axys0, thr_misclick, thr_doubleclick, output_type, geometry, use_timeout, output_filename)
+ {
+     // init
+     display = XOpenDisplay(NULL);
+@@ -166,8 +167,9 @@ CalibratorEvdev::CalibratorEvdev(const char* const device_name0,
+                                  const int thr_doubleclick,
+                                  const OutputType output_type,
+                                  const char* geometry,
+-                                 const bool use_timeout)
+-  : Calibrator(device_name0, axys0, thr_misclick, thr_doubleclick, output_type, geometry) { }
++                                 const bool use_timeout,
++                                 const char* output_filename)
++  : Calibrator(device_name0, axys0, thr_misclick, thr_doubleclick, output_type, geometry, output_filename) { }
+ 
+ // Destructor
+ CalibratorEvdev::~CalibratorEvdev () {
+diff --git a/src/calibrator/Evdev.hpp b/src/calibrator/Evdev.hpp
+index c586ba2..53e7277 100644
+--- a/src/calibrator/Evdev.hpp
++++ b/src/calibrator/Evdev.hpp
+@@ -47,7 +47,8 @@ protected:
+                     const int thr_doubleclick=0,
+                     const OutputType output_type=OUTYPE_AUTO,
+                     const char* geometry=0,
+-                    const bool use_timeout=false);
++                    const bool use_timeout=false,
++                    const char* output_filename = 0);
+ 
+ public:
+     CalibratorEvdev(const char* const device_name,
+@@ -57,7 +58,8 @@ public:
+                     const int thr_doubleclick=0,
+                     const OutputType output_type=OUTYPE_AUTO,
+                     const char* geometry=0,
+-                    const bool use_timeout=false);
++                    const bool use_timeout=false,
++                    const char* output_filename = 0);
+     ~CalibratorEvdev();
+ 
+     /// calculate and apply the calibration
+diff --git a/src/calibrator/Usbtouchscreen.cpp b/src/calibrator/Usbtouchscreen.cpp
+index c9fc20a..6ec71fd 100644
+--- a/src/calibrator/Usbtouchscreen.cpp
++++ b/src/calibrator/Usbtouchscreen.cpp
+@@ -48,8 +48,8 @@ static const char *p_flip_x = "flip_x";
+ static const char *p_flip_y = "flip_y";
+ static const char *p_swap_xy = "swap_xy";
+ 
+-CalibratorUsbtouchscreen::CalibratorUsbtouchscreen(const char* const device_name0, const XYinfo& axys0, const int thr_misclick, const int thr_doubleclick, const OutputType output_type, const char* geometry, const bool use_timeout)
+-  : Calibrator(device_name0, axys0, thr_misclick, thr_doubleclick, output_type, geometry, use_timeout)
++CalibratorUsbtouchscreen::CalibratorUsbtouchscreen(const char* const device_name0, const XYinfo& axys0, const int thr_misclick, const int thr_doubleclick, const OutputType output_type, const char* geometry, const bool use_timeout, const char* output_filename)
++  : Calibrator(device_name0, axys0, thr_misclick, thr_doubleclick, output_type, geometry, use_timeout, output_filename)
+ {
+     if (strcmp(device_name, "Usbtouchscreen") != 0)
+         throw WrongCalibratorException("Not a usbtouchscreen device");
+diff --git a/src/calibrator/Usbtouchscreen.hpp b/src/calibrator/Usbtouchscreen.hpp
+index 94473a3..4d84962 100644
+--- a/src/calibrator/Usbtouchscreen.hpp
++++ b/src/calibrator/Usbtouchscreen.hpp
+@@ -35,7 +35,7 @@ public:
+     CalibratorUsbtouchscreen(const char* const device_name, const XYinfo& axys,
+          const int thr_misclick=0, const int thr_doubleclick=0,
+         const OutputType output_type=OUTYPE_AUTO, const char* geometry=0,
+-        const bool use_timeout=false);
++        const bool use_timeout=false, const char* output_filename = 0);
+     ~CalibratorUsbtouchscreen();
+ 
+     virtual bool finish_data(const XYinfo new_axys);
+diff --git a/src/calibrator/XorgPrint.cpp b/src/calibrator/XorgPrint.cpp
+index 8e3a1b3..3dcb7ae 100644
+--- a/src/calibrator/XorgPrint.cpp
++++ b/src/calibrator/XorgPrint.cpp
+@@ -24,8 +24,8 @@
+ 
+ #include <cstdio>
+ 
+-CalibratorXorgPrint::CalibratorXorgPrint(const char* const device_name0, const XYinfo& axys0, const int thr_misclick, const int thr_doubleclick, const OutputType output_type, const char* geometry, const bool use_timeout)
+-  : Calibrator(device_name0, axys0, thr_misclick, thr_doubleclick, output_type, geometry, use_timeout)
++CalibratorXorgPrint::CalibratorXorgPrint(const char* const device_name0, const XYinfo& axys0, const int thr_misclick, const int thr_doubleclick, const OutputType output_type, const char* geometry, const bool use_timeout, const char* output_filename)
++  : Calibrator(device_name0, axys0, thr_misclick, thr_doubleclick, output_type, geometry, use_timeout, output_filename)
+ {
+     printf("Calibrating standard Xorg driver \"%s\"\n", device_name);
+     printf("\tcurrent calibration values: min_x=%d, max_x=%d and min_y=%d, max_y=%d\n",
+diff --git a/src/calibrator/XorgPrint.hpp b/src/calibrator/XorgPrint.hpp
+index 7afbd9f..0d7e4cf 100644
+--- a/src/calibrator/XorgPrint.hpp
++++ b/src/calibrator/XorgPrint.hpp
+@@ -35,7 +35,7 @@ public:
+     CalibratorXorgPrint(const char* const device_name, const XYinfo& axys,
+         const int thr_misclick=0, const int thr_doubleclick=0,
+         const OutputType output_type=OUTYPE_AUTO, const char* geometry=0,
+-        const bool use_timeout=false);
++        const bool use_timeout=false, const char* output_filename = 0);
+ 
+     virtual bool finish_data(const XYinfo new_axys);
+ 
+diff --git a/src/main_common.cpp b/src/main_common.cpp
+index f840e3d..efaa718 100644
+--- a/src/main_common.cpp
++++ b/src/main_common.cpp
+@@ -180,6 +180,7 @@ static void usage(char* cmd, unsigned thr_misclick)
+     fprintf(stderr, "\t--fake: emulate a fake device (for testing purposes)\n");
+     fprintf(stderr, "\t--geometry: manually provide the geometry (width and height) for the calibration window\n");
+     fprintf(stderr, "\t--no-timeout: turns off the timeout\n");
++    fprintf(stderr, "\t--output-filename: write calibration data to file (USB: override default /etc/modprobe.conf.local\n");
+ }
+ 
+ Calibrator* Calibrator::make_calibrator(int argc, char** argv)
+@@ -191,6 +192,7 @@ Calibrator* Calibrator::make_calibrator(int argc, char** argv)
+     XYinfo pre_axys;
+     const char* pre_device = NULL;
+     const char* geometry = NULL;
++    const char* output_filename = NULL;
+     unsigned thr_misclick = 15;
+     unsigned thr_doubleclick = 7;
+     OutputType output_type = OUTYPE_AUTO;
+@@ -289,6 +291,11 @@ Calibrator* Calibrator::make_calibrator(int argc, char** argv)
+             // Disable timeout
+ 			if (strcmp("--no-timeout", argv[i]) == 0) {
+ 				use_timeout = false;
++			} else
++
++			// Output file
++			if (strcmp("--output-filename", argv[i]) == 0) {
++				output_filename = argv[++i];
+ 			}
+ 
+             // unknown option
+@@ -363,7 +370,8 @@ Calibrator* Calibrator::make_calibrator(int argc, char** argv)
+     try {
+         // try Usbtouchscreen driver
+         return new CalibratorUsbtouchscreen(device_name, device_axys,
+-            thr_misclick, thr_doubleclick, output_type, geometry, use_timeout);
++            thr_misclick, thr_doubleclick, output_type, geometry,
++            use_timeout, output_filename);
+ 
+     } catch(WrongCalibratorException& x) {
+         if (verbose)
+@@ -373,7 +381,8 @@ Calibrator* Calibrator::make_calibrator(int argc, char** argv)
+     try {
+         // next, try Evdev driver (with XID)
+         return new CalibratorEvdev(device_name, device_axys, device_id,
+-            thr_misclick, thr_doubleclick, output_type, geometry, use_timeout);
++            thr_misclick, thr_doubleclick, output_type, geometry,
++            use_timeout, output_filename);
+ 
+     } catch(WrongCalibratorException& x) {
+         if (verbose)
+@@ -382,5 +391,6 @@ Calibrator* Calibrator::make_calibrator(int argc, char** argv)
+ 
+     // lastly, presume a standard Xorg driver (evtouch, mutouch, ...)
+     return new CalibratorXorgPrint(device_name, device_axys,
+-            thr_misclick, thr_doubleclick, output_type, geometry, use_timeout);
++            thr_misclick, thr_doubleclick, output_type, geometry,
++            use_timeout, output_filename);
+ }
+-- 
+1.7.6.5
+
diff --git a/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator/0002-CalibratorEvdev-do-write-calibration-results-if-outp.patch b/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator/0002-CalibratorEvdev-do-write-calibration-results-if-outp.patch
new file mode 100644
index 0000000..0e30631
--- /dev/null
+++ b/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator/0002-CalibratorEvdev-do-write-calibration-results-if-outp.patch
@@ -0,0 +1,164 @@
+From 0428975e1c9152891aa4269afdc02cea8d916247 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Mon, 21 Jan 2013 16:11:16 +0100
+Subject: [PATCH 2/6] CalibratorEvdev: do write calibration results if
+ --output-filename was set
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Submitted [https://github.com/tias/xinput_calibrator/pull/47]
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ src/calibrator/Evdev.cpp |  105 ++++++++++++++++++++++++++++++++++++++-------
+ 1 files changed, 88 insertions(+), 17 deletions(-)
+
+diff --git a/src/calibrator/Evdev.cpp b/src/calibrator/Evdev.cpp
+index 413e314..651cab9 100644
+--- a/src/calibrator/Evdev.cpp
++++ b/src/calibrator/Evdev.cpp
+@@ -39,6 +39,9 @@
+ #define EXIT_FAILURE 0
+ #endif
+ 
++// XXX: we currently don't handle lines that are longer than this
++#define MAX_LINE_LEN 1024
++
+ // Constructor
+ CalibratorEvdev::CalibratorEvdev(const char* const device_name0,
+                                  const XYinfo& axys0,
+@@ -517,18 +520,41 @@ bool CalibratorEvdev::output_xorgconfd(const XYinfo new_axys)
+     if (not_sysfs_name)
+         sysfs_name = "!!Name_Of_TouchScreen!!";
+ 
++    if(output_filename == NULL || not_sysfs_name)
++        printf("  copy the snippet below into '/etc/X11/xorg.conf.d/99-calibration.conf' (/usr/share/X11/xorg.conf.d/ in some distro's)\n");
++    else
++        printf("  writing xorg.conf calibration data to '%s'\n", output_filename);
++
+     // xorg.conf.d snippet
+-    printf("  copy the snippet below into '/etc/X11/xorg.conf.d/99-calibration.conf' (/usr/share/X11/xorg.conf.d/ in some distro's)\n");
+-    printf("Section \"InputClass\"\n");
+-    printf("	Identifier	\"calibration\"\n");
+-    printf("	MatchProduct	\"%s\"\n", sysfs_name);
+-    printf("	Option	\"Calibration\"	\"%d %d %d %d\"\n",
++    char line[MAX_LINE_LEN];
++    std::string outstr;
++
++    outstr += "Section \"InputClass\"\n";
++    outstr += "	Identifier	\"calibration\"\n";
++    sprintf(line, "	MatchProduct	\"%s\"\n", sysfs_name);
++    outstr += line;
++    sprintf(line, "	Option	\"Calibration\"	\"%d %d %d %d\"\n",
+                 new_axys.x.min, new_axys.x.max, new_axys.y.min, new_axys.y.max);
+-    printf("	Option	\"SwapAxes\"	\"%d\"\n", new_axys.swap_xy);
+-    printf("EndSection\n");
++    outstr += line;
++    sprintf(line, "	Option	\"SwapAxes\"	\"%d\"\n", new_axys.swap_xy);
++    outstr += line;
++    outstr += "EndSection\n";
+ 
++    // console out
++    printf("%s", outstr.c_str());
+     if (not_sysfs_name)
+         printf("\nChange '%s' to your device's name in the snippet above.\n", sysfs_name);
++    // file out
++    else if(output_filename != NULL) {
++        FILE* fid = fopen(output_filename, "w");
++        if (fid == NULL) {
++            fprintf(stderr, "Error: Can't open '%s' for writing. Make sure you have the necessary rights\n", output_filename);
++            fprintf(stderr, "New calibration data NOT saved\n");
++            return false;
++        }
++        fprintf(fid, "%s", outstr.c_str());
++        fclose(fid);
++    }
+ 
+     return true;
+ }
+@@ -540,26 +566,71 @@ bool CalibratorEvdev::output_hal(const XYinfo new_axys)
+     if (not_sysfs_name)
+         sysfs_name = "!!Name_Of_TouchScreen!!";
+ 
+-    // HAL policy output
+-    printf("  copy the policy below into '/etc/hal/fdi/policy/touchscreen.fdi'\n\
+-<match key=\"info.product\" contains=\"%s\">\n\
+-  <merge key=\"input.x11_options.calibration\" type=\"string\">%d %d %d %d</merge>\n"
+-     , sysfs_name, new_axys.x.min, new_axys.x.max, new_axys.y.min, new_axys.y.max);
+-    printf("  <merge key=\"input.x11_options.swapaxes\" type=\"string\">%d</merge>\n", new_axys.swap_xy);
+-    printf("</match>\n");
++    if(output_filename == NULL || not_sysfs_name)
++        printf("  copy the policy below into '/etc/hal/fdi/policy/touchscreen.fdi'\n");
++    else
++        printf("  writing HAL calibration data to '%s'\n", output_filename);
+ 
++    // HAL policy output
++    char line[MAX_LINE_LEN];
++    std::string outstr;
++
++    sprintf(line, "<match key=\"info.product\" contains=\"%s\">\n", sysfs_name);
++    outstr += line;
++    sprintf(line, "  <merge key=\"input.x11_options.calibration\" type=\"string\">%d %d %d %d</merge>\n",
++        new_axys.x.min, new_axys.x.max, new_axys.y.min, new_axys.y.max);
++    outstr += line;
++    sprintf(line, "  <merge key=\"input.x11_options.swapaxes\" type=\"string\">%d</merge>\n",
++        new_axys.swap_xy);
++    outstr += "</match>\n";
++    // console out
++    printf("%s", outstr.c_str());
+     if (not_sysfs_name)
+         printf("\nChange '%s' to your device's name in the config above.\n", sysfs_name);
++    // file out
++    else if(output_filename != NULL) {
++        FILE* fid = fopen(output_filename, "w");
++        if (fid == NULL) {
++            fprintf(stderr, "Error: Can't open '%s' for writing. Make sure you have the necessary rights\n", output_filename);
++            fprintf(stderr, "New calibration data NOT saved\n");
++            return false;
++        }
++        fprintf(fid, "%s", outstr.c_str());
++        fclose(fid);
++    }
+ 
+     return true;
+ }
+ 
+ bool CalibratorEvdev::output_xinput(const XYinfo new_axys)
+ {
++    if(output_filename == NULL)
++        printf("  Install the 'xinput' tool and copy the command(s) below in a script that starts with your X session\n");
++    else
++        printf("  writing calibration script to '%s'\n", output_filename);
++
+     // create startup script
+-    printf("  Install the 'xinput' tool and copy the command(s) below in a script that starts with your X session\n");
+-    printf("    xinput set-int-prop \"%s\" \"Evdev Axis Calibration\" 32 %d %d %d %d\n", device_name, new_axys.x.min, new_axys.x.max, new_axys.y.min, new_axys.y.max);
+-    printf("    xinput set-int-prop \"%s\" \"Evdev Axes Swap\" 8 %d\n", device_name, new_axys.swap_xy);
++    char line[MAX_LINE_LEN];
++    std::string outstr;
++
++    sprintf(line, "    xinput set-int-prop \"%s\" \"Evdev Axis Calibration\" 32 %d %d %d %d\n", device_name, new_axys.x.min, new_axys.x.max, new_axys.y.min, new_axys.y.max);
++    outstr += line;
++    sprintf(line, "    xinput set-int-prop \"%s\" \"Evdev Axes Swap\" 8 %d\n", device_name, new_axys.swap_xy);
++    outstr += line;
++
++    // console out
++    printf("%s", outstr.c_str());
++    // file out
++    if(output_filename != NULL) {
++		FILE* fid = fopen(output_filename, "w");
++		if (fid == NULL) {
++			fprintf(stderr, "Error: Can't open '%s' for writing. Make sure you have the necessary rights\n", output_filename);
++			fprintf(stderr, "New calibration data NOT saved\n");
++			return false;
++		}
++		fprintf(fid, "%s", outstr.c_str());
++		fclose(fid);
++    }
+ 
+     return true;
+ }
+-- 
+1.7.6.5
+
diff --git a/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator/0003-CalibratorXorgPrint-do-write-calibration-results-if-.patch b/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator/0003-CalibratorXorgPrint-do-write-calibration-results-if-.patch
new file mode 100644
index 0000000..91447dc
--- /dev/null
+++ b/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator/0003-CalibratorXorgPrint-do-write-calibration-results-if-.patch
@@ -0,0 +1,156 @@
+From d275793fe68067e6fd625f028ae09bcb10aac899 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Mon, 21 Jan 2013 17:14:01 +0100
+Subject: [PATCH 3/6] CalibratorXorgPrint: do write calibration results if
+ --output-filename was set
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Submitted [https://github.com/tias/xinput_calibrator/pull/47]
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ src/calibrator/XorgPrint.cpp |  104 ++++++++++++++++++++++++++++++++---------
+ 1 files changed, 81 insertions(+), 23 deletions(-)
+
+diff --git a/src/calibrator/XorgPrint.cpp b/src/calibrator/XorgPrint.cpp
+index 3dcb7ae..c9c5c9f 100644
+--- a/src/calibrator/XorgPrint.cpp
++++ b/src/calibrator/XorgPrint.cpp
+@@ -24,6 +24,9 @@
+ 
+ #include <cstdio>
+ 
++// XXX: we currently don't handle lines that are longer than this
++#define MAX_LINE_LEN 1024
++
+ CalibratorXorgPrint::CalibratorXorgPrint(const char* const device_name0, const XYinfo& axys0, const int thr_misclick, const int thr_doubleclick, const OutputType output_type, const char* geometry, const bool use_timeout, const char* output_filename)
+   : Calibrator(device_name0, axys0, thr_misclick, thr_doubleclick, output_type, geometry, use_timeout, output_filename)
+ {
+@@ -69,22 +72,50 @@ bool CalibratorXorgPrint::output_xorgconfd(const XYinfo new_axys)
+     if (not_sysfs_name)
+         sysfs_name = "!!Name_Of_TouchScreen!!";
+ 
++    if(output_filename == NULL || not_sysfs_name)
++        printf("  copy the snippet below into '/etc/X11/xorg.conf.d/99-calibration.conf' (/usr/share/X11/xorg.conf.d/ in some distro's)\n");
++    else
++        printf("  writing calibration script to '%s'\n", output_filename);
++
+     // xorg.conf.d snippet
+-    printf("  copy the snippet below into '/etc/X11/xorg.conf.d/99-calibration.conf' (/usr/share/X11/xorg.conf.d/ in some distro's)\n");
+-    printf("Section \"InputClass\"\n");
+-    printf("	Identifier	\"calibration\"\n");
+-    printf("	MatchProduct	\"%s\"\n", sysfs_name);
+-    printf("	Option	\"MinX\"	\"%d\"\n", new_axys.x.min);
+-    printf("	Option	\"MaxX\"	\"%d\"\n", new_axys.x.max);
+-    printf("	Option	\"MinY\"	\"%d\"\n", new_axys.y.min);
+-    printf("	Option	\"MaxY\"	\"%d\"\n", new_axys.y.max);
+-    printf("	Option	\"SwapXY\"	\"%d\" # unless it was already set to 1\n", new_axys.swap_xy);
+-    printf("	Option	\"InvertX\"	\"%d\"  # unless it was already set\n", new_axys.x.invert);
+-    printf("	Option	\"InvertY\"	\"%d\"  # unless it was already set\n", new_axys.y.invert);
+-    printf("EndSection\n");
++    char line[MAX_LINE_LEN];
++    std::string outstr;
+ 
++    outstr += "Section \"InputClass\"\n";
++    outstr += "	Identifier	\"calibration\"\n";
++    sprintf(line, "	MatchProduct	\"%s\"\n", sysfs_name);
++    outstr += line;
++    sprintf(line, "	Option	\"MinX\"	\"%d\"\n", new_axys.x.min);
++    outstr += line;
++    sprintf(line, "	Option	\"MaxX\"	\"%d\"\n", new_axys.x.max);
++    outstr += line;
++    sprintf(line, "	Option	\"MinY\"	\"%d\"\n", new_axys.y.min);
++    outstr += line;
++    sprintf(line, "	Option	\"MaxY\"	\"%d\"\n", new_axys.y.max);
++    outstr += line;
++    sprintf(line, "	Option	\"SwapXY\"	\"%d\" # unless it was already set to 1\n", new_axys.swap_xy);
++    outstr += line;
++    sprintf(line, "	Option	\"InvertX\"	\"%d\"  # unless it was already set\n", new_axys.x.invert);
++    outstr += line;
++    sprintf(line, "	Option	\"InvertY\"	\"%d\"  # unless it was already set\n", new_axys.y.invert);
++    outstr += line;
++    outstr += "EndSection\n";
++
++    // console out
++    printf("%s", outstr.c_str());
+     if (not_sysfs_name)
+         printf("\nChange '%s' to your device's name in the config above.\n", sysfs_name);
++    // file out
++    else if(output_filename != NULL) {
++        FILE* fid = fopen(output_filename, "w");
++        if (fid == NULL) {
++            fprintf(stderr, "Error: Can't open '%s' for writing. Make sure you have the necessary rights\n", output_filename);
++            fprintf(stderr, "New calibration data NOT saved\n");
++            return false;
++        }
++        fprintf(fid, "%s", outstr.c_str());
++        fclose(fid);
++    }
+ 
+     return true;
+ }
+@@ -96,21 +127,48 @@ bool CalibratorXorgPrint::output_hal(const XYinfo new_axys)
+     if (not_sysfs_name)
+         sysfs_name = "!!Name_Of_TouchScreen!!";
+ 
++    if(output_filename == NULL || not_sysfs_name)
++        printf("  copy the policy below into '/etc/hal/fdi/policy/touchscreen.fdi'\n");
++    else
++        printf("  writing HAL calibration data to '%s'\n", output_filename);
++
+     // HAL policy output
+-    printf("  copy the policy below into '/etc/hal/fdi/policy/touchscreen.fdi'\n\
+-<match key=\"info.product\" contains=\"%s\">\n\
+-  <merge key=\"input.x11_options.minx\" type=\"string\">%d</merge>\n\
+-  <merge key=\"input.x11_options.maxx\" type=\"string\">%d</merge>\n\
+-  <merge key=\"input.x11_options.miny\" type=\"string\">%d</merge>\n\
+-  <merge key=\"input.x11_options.maxy\" type=\"string\">%d</merge>\n"
+-     , sysfs_name, new_axys.x.min, new_axys.x.max, new_axys.y.min, new_axys.y.max);
+-    printf("  <merge key=\"input.x11_options.swapxy\" type=\"string\">%d</merge>\n", new_axys.swap_xy);
+-    printf("  <merge key=\"input.x11_options.invertx\" type=\"string\">%d</merge>\n", new_axys.x.invert);
+-    printf("  <merge key=\"input.x11_options.inverty\" type=\"string\">%d</merge>\n", new_axys.y.invert);
+-    printf("</match>\n");
++    char line[MAX_LINE_LEN];
++    std::string outstr;
++
++    sprintf(line, "<match key=\"info.product\" contains=\"%s\">\n", sysfs_name);
++    outstr += line;
++    sprintf(line, "  <merge key=\"input.x11_options.minx\" type=\"string\">%d</merge>\n", new_axys.x.min);
++    outstr += line;
++    sprintf(line, "  <merge key=\"input.x11_options.maxx\" type=\"string\">%d</merge>\n", new_axys.x.max);
++    outstr += line;
++    sprintf(line, "  <merge key=\"input.x11_options.miny\" type=\"string\">%d</merge>\n", new_axys.y.min);
++    outstr += line;
++    sprintf(line, "  <merge key=\"input.x11_options.maxy\" type=\"string\">%d</merge>\n", new_axys.y.max);
++    outstr += line;
++    sprintf(line, "  <merge key=\"input.x11_options.swapxy\" type=\"string\">%d</merge>\n", new_axys.swap_xy);
++    outstr += line;
++    sprintf(line, "  <merge key=\"input.x11_options.invertx\" type=\"string\">%d</merge>\n", new_axys.x.invert);
++    outstr += line;
++    sprintf(line, "  <merge key=\"input.x11_options.inverty\" type=\"string\">%d</merge>\n", new_axys.y.invert);
++    outstr += line;
++    outstr += "</match>\n";
+ 
++    // console out
++    printf("%s", outstr.c_str());
+     if (not_sysfs_name)
+         printf("\nChange '%s' to your device's name in the config above.\n", sysfs_name);
++    // file out
++    else if(output_filename != NULL) {
++        FILE* fid = fopen(output_filename, "w");
++        if (fid == NULL) {
++            fprintf(stderr, "Error: Can't open '%s' for writing. Make sure you have the necessary rights\n", output_filename);
++            fprintf(stderr, "New calibration data NOT saved\n");
++            return false;
++        }
++        fprintf(fid, "%s", outstr.c_str());
++        fclose(fid);
++    }
+ 
+     return true;
+ }
+-- 
+1.7.6.5
+
diff --git a/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator/0004-CalibratorUsbtouchscreen-overridde-default-file-name.patch b/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator/0004-CalibratorUsbtouchscreen-overridde-default-file-name.patch
new file mode 100644
index 0000000..2dd2064
--- /dev/null
+++ b/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator/0004-CalibratorUsbtouchscreen-overridde-default-file-name.patch
@@ -0,0 +1,50 @@
+From fa47700129680bbd4fbb324dc1999b664dd4419a Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Mon, 21 Jan 2013 16:37:35 +0100
+Subject: [PATCH 4/6] CalibratorUsbtouchscreen: overridde default file name
+ when setting --output-filename
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Submitted [https://github.com/tias/xinput_calibrator/pull/47]
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ src/calibrator/Usbtouchscreen.cpp |   11 ++++++-----
+ 1 files changed, 6 insertions(+), 5 deletions(-)
+
+diff --git a/src/calibrator/Usbtouchscreen.cpp b/src/calibrator/Usbtouchscreen.cpp
+index 6ec71fd..2a1f09e 100644
+--- a/src/calibrator/Usbtouchscreen.cpp
++++ b/src/calibrator/Usbtouchscreen.cpp
+@@ -104,10 +104,11 @@ bool CalibratorUsbtouchscreen::finish_data(const XYinfo new_axys)
+     write_bool_parameter(p_swap_xy, new_axys.swap_xy);
+ 
+     // Read, then write calibration parameters to modprobe_conf_local,
+-    // to keep the for the next boot
+-    FILE *fid = fopen(modprobe_conf_local, "r");
++    // or the file set by --output-filename to keep the for the next boot
++    const char* filename = output_filename == NULL ? modprobe_conf_local : output_filename;
++    FILE *fid = fopen(filename, "r");
+     if (fid == NULL) {
+-        fprintf(stderr, "Error: Can't open '%s' for reading. Make sure you have the necessary rights\n", modprobe_conf_local);
++        fprintf(stderr, "Error: Can't open '%s' for reading. Make sure you have the necessary rights\n", filename);
+         fprintf(stderr, "New calibration data NOT saved\n");
+         return false;
+     }
+@@ -135,9 +136,9 @@ bool CalibratorUsbtouchscreen::finish_data(const XYinfo new_axys)
+          p_flip_y, yesno(flip_y), p_swap_xy, yesno(new_axys.swap_xy));
+     new_contents += new_opt;
+ 
+-    fid = fopen(modprobe_conf_local, "w");
++    fid = fopen(filename, "w");
+     if (fid == NULL) {
+-        fprintf(stderr, "Error: Can't open '%s' for writing. Make sure you have the necessary rights\n", modprobe_conf_local);
++        fprintf(stderr, "Error: Can't open '%s' for writing. Make sure you have the necessary rights\n", filename);
+         fprintf(stderr, "New calibration data NOT saved\n");
+         return false;
+     }
+-- 
+1.7.6.5
+
diff --git a/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator/0005-Make-all-Calibrator-destructors-virtual-to-fix-warni.patch b/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator/0005-Make-all-Calibrator-destructors-virtual-to-fix-warni.patch
new file mode 100644
index 0000000..2aa161d
--- /dev/null
+++ b/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator/0005-Make-all-Calibrator-destructors-virtual-to-fix-warni.patch
@@ -0,0 +1,64 @@
+From 2846eade2601e92d34d40c603988a14dcb7634ac Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Mon, 21 Jan 2013 17:32:11 +0100
+Subject: [PATCH 5/6] Make all Calibrator* destructors virtual to fix warning
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+warning was:
+
+main_x11.cpp: In function 'int main(int, char**)':
+main_x11.cpp:42:12: warning: deleting object of abstract class type 'Calibrator' which has non-virtual destructor will cause undefined behaviour [-Wdelete-non-virtual-dtor]calibrator/Usbtouchscreen.cpp: In member function 'void CalibratorUsbtouchscreen::read_int_parameter(const char*, int&)':
+
+Upstream-Status: Submitted [https://github.com/tias/xinput_calibrator/pull/47]
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ src/calibrator.hh                 |    2 +-
+ src/calibrator/Evdev.hpp          |    2 +-
+ src/calibrator/Usbtouchscreen.hpp |    2 +-
+ 3 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/calibrator.hh b/src/calibrator.hh
+index 7d406b4..3446b34 100644
+--- a/src/calibrator.hh
++++ b/src/calibrator.hh
+@@ -148,7 +148,7 @@ public:
+                const bool use_timeout=1,
+                const char* output_filename = 0);
+ 
+-    ~Calibrator() {}
++    virtual ~Calibrator() {}
+ 
+     /// set the doubleclick treshold
+     void set_threshold_doubleclick(int t)
+diff --git a/src/calibrator/Evdev.hpp b/src/calibrator/Evdev.hpp
+index 53e7277..b243090 100644
+--- a/src/calibrator/Evdev.hpp
++++ b/src/calibrator/Evdev.hpp
+@@ -60,7 +60,7 @@ public:
+                     const char* geometry=0,
+                     const bool use_timeout=false,
+                     const char* output_filename = 0);
+-    ~CalibratorEvdev();
++    virtual ~CalibratorEvdev();
+ 
+     /// calculate and apply the calibration
+     virtual bool finish(int width, int height);
+diff --git a/src/calibrator/Usbtouchscreen.hpp b/src/calibrator/Usbtouchscreen.hpp
+index 4d84962..287e5dd 100644
+--- a/src/calibrator/Usbtouchscreen.hpp
++++ b/src/calibrator/Usbtouchscreen.hpp
+@@ -36,7 +36,7 @@ public:
+          const int thr_misclick=0, const int thr_doubleclick=0,
+         const OutputType output_type=OUTYPE_AUTO, const char* geometry=0,
+         const bool use_timeout=false, const char* output_filename = 0);
+-    ~CalibratorUsbtouchscreen();
++    virtual ~CalibratorUsbtouchscreen();
+ 
+     virtual bool finish_data(const XYinfo new_axys);
+ 
+-- 
+1.7.6.5
+
diff --git a/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator/0006-Set-up-buffer-size-for-max-line-length-only-once-in-.patch b/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator/0006-Set-up-buffer-size-for-max-line-length-only-once-in-.patch
new file mode 100644
index 0000000..5d014cf
--- /dev/null
+++ b/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator/0006-Set-up-buffer-size-for-max-line-length-only-once-in-.patch
@@ -0,0 +1,77 @@
+From dd263d405a8ae109e1439c52dbabb55352d95bd0 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Tue, 22 Jan 2013 08:35:20 +0100
+Subject: [PATCH 6/6] Set up buffer size for max line length only once in
+ calibrator.hh
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Submitted [https://github.com/tias/xinput_calibrator/pull/47]
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ src/calibrator.hh                 |    3 +++
+ src/calibrator/Evdev.cpp          |    3 ---
+ src/calibrator/Usbtouchscreen.cpp |    2 +-
+ src/calibrator/XorgPrint.cpp      |    3 ---
+ 4 files changed, 4 insertions(+), 7 deletions(-)
+
+diff --git a/src/calibrator.hh b/src/calibrator.hh
+index 3446b34..e497bb6 100644
+--- a/src/calibrator.hh
++++ b/src/calibrator.hh
+@@ -30,6 +30,9 @@
+ #include <stdio.h>
+ #include <vector>
+ 
++// XXX: we currently don't handle lines that are longer than this
++#define MAX_LINE_LEN 1024
++
+ int xf86ScaleAxis(int Cx, int to_max, int to_min, int from_max, int from_min);
+ float scaleAxis(float Cx, int to_max, int to_min, int from_max, int from_min);
+ 
+diff --git a/src/calibrator/Evdev.cpp b/src/calibrator/Evdev.cpp
+index 651cab9..9a56475 100644
+--- a/src/calibrator/Evdev.cpp
++++ b/src/calibrator/Evdev.cpp
+@@ -39,9 +39,6 @@
+ #define EXIT_FAILURE 0
+ #endif
+ 
+-// XXX: we currently don't handle lines that are longer than this
+-#define MAX_LINE_LEN 1024
+-
+ // Constructor
+ CalibratorEvdev::CalibratorEvdev(const char* const device_name0,
+                                  const XYinfo& axys0,
+diff --git a/src/calibrator/Usbtouchscreen.cpp b/src/calibrator/Usbtouchscreen.cpp
+index 2a1f09e..713b815 100644
+--- a/src/calibrator/Usbtouchscreen.cpp
++++ b/src/calibrator/Usbtouchscreen.cpp
+@@ -114,7 +114,7 @@ bool CalibratorUsbtouchscreen::finish_data(const XYinfo new_axys)
+     }
+ 
+     std::string new_contents;
+-    const int len = 1024; // XXX: we currently don't handle lines that are longer than this
++    const int len = MAX_LINE_LEN;
+     char line[len];
+     const char *opt = "options usbtouchscreen";
+     const int opt_len = strlen(opt);
+diff --git a/src/calibrator/XorgPrint.cpp b/src/calibrator/XorgPrint.cpp
+index c9c5c9f..582fa78 100644
+--- a/src/calibrator/XorgPrint.cpp
++++ b/src/calibrator/XorgPrint.cpp
+@@ -24,9 +24,6 @@
+ 
+ #include <cstdio>
+ 
+-// XXX: we currently don't handle lines that are longer than this
+-#define MAX_LINE_LEN 1024
+-
+ CalibratorXorgPrint::CalibratorXorgPrint(const char* const device_name0, const XYinfo& axys0, const int thr_misclick, const int thr_doubleclick, const OutputType output_type, const char* geometry, const bool use_timeout, const char* output_filename)
+   : Calibrator(device_name0, axys0, thr_misclick, thr_doubleclick, output_type, geometry, use_timeout, output_filename)
+ {
+-- 
+1.7.6.5
+
diff --git a/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb b/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
index b71daeb..6781e86 100644
--- a/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
+++ b/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://src/calibrator.cpp;endline=22;md5=1bcba08f67cdb56f340
 DEPENDS = "virtual/libx11 libxi"
 
 PV = "0.7.5+git${SRCPV}"
-PR = "r1"
+PR = "r2"
 
 inherit autotools
 
@@ -13,6 +13,12 @@ SRCREV = "e02de96acbe2fa5a57b0bda6821a053b1b123fd2"
 SRC_URI = " \
     git://github.com/tias/xinput_calibrator.git;protocol=git \
     file://0001-Prevent-timeout-exit-when-no-timeout-is-used.patch \
+    file://0001-Add-parameter-output-filename-and-store-in-output_fi.patch \
+    file://0002-CalibratorEvdev-do-write-calibration-results-if-outp.patch \
+    file://0003-CalibratorXorgPrint-do-write-calibration-results-if-.patch \
+    file://0004-CalibratorUsbtouchscreen-overridde-default-file-name.patch \
+    file://0005-Make-all-Calibrator-destructors-virtual-to-fix-warni.patch \
+    file://0006-Set-up-buffer-size-for-max-line-length-only-once-in-.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
1.7.6.5



