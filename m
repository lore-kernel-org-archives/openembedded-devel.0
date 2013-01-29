Received: from mail-pa0-f53.google.com ([209.85.220.53])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U0AZn-000631-Uk
	for openembedded-devel@lists.openembedded.org;
	Tue, 29 Jan 2013 13:46:22 +0100
Received: by mail-pa0-f53.google.com with SMTP id bg4so369070pad.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Jan 2013 04:30:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=tr5geLY64ELPzndf795Mm1lv2wCqoA8Gih7zNLOAhZg=;
	b=czW4JXzYCuXsc0ShqRPg8rw7pW0gPbWTdYdFh5U72mhwBZf8Oem5++EFZeikm5KAt1
	233gle96Xee+ackjSvWPNZnW0N/gB423lVZ1kEDSqMwKyaHLCatYwW87lo/L73ntJdN3
	rw5G/KX+ptB+e1jQ1A6pYk9xA8L/zeKTGRYy1DhYlvp6CD1CK62HtZMlk/pemI92KMJX
	M5cCRdMFXta+x0kHoi1+gqVEJw58/UYpAA00fh9bNLN6b7LdaT6oHKzAOFtuc/sMDQ49
	t8MyUh83RWWo2euKug2CJyIy90zPXerpfWyFhHXl1dxKRke/77AF+n0cy1HTQQJ9Oqn1
	OUrw==
X-Received: by 10.68.245.167 with SMTP id xp7mr1990789pbc.75.1359462631424;
	Tue, 29 Jan 2013 04:30:31 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id qb3sm8334236pbb.35.2013.01.29.04.30.29
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 29 Jan 2013 04:30:30 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 29 Jan 2013 13:29:52 +0100
Message-Id: <c693696c02e012de92fd19dddeee0d85ab0e687e.1359462547.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1359462547.git.Martin.Jansa@gmail.com>
References: <cover.1359462547.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1359462547.git.Martin.Jansa@gmail.com>
References: <cover.1359462547.git.Martin.Jansa@gmail.com>
Subject: [PATCH 3/5] move broken recipes to nonworking directories
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
X-List-Received-Date: Tue, 29 Jan 2013 12:46:23 -0000
X-List-Received-Date: Tue, 29 Jan 2013 12:46:23 -0000

* this set does not build with distroless qemuarm as reported in
  'State of bitbake world' thread, nobody volunteered to fix them

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../gnome/gnome-terminal/30f29e7d8e1b67c40cd18a7155ba30c4382692d5.patch   | 0
 meta-gnome/recipes-gnome/{ => nonworking}/gnome/gnome-terminal_2.26.3.bb  | 0
 .../system-tools/system-tools-backends-2.10.2/add-angstrom-distro.patch   | 0
 .../system-tools/system-tools-backends-2.10.2/system-tools-backends       | 0
 .../{ => nonworking}/system-tools/system-tools-backends_2.10.2.bb         | 0
 .../0001-ide-use-node-as-interpreter-for-sketches-instead-of-.patch       | 0
 .../recipes-devtools/{ => nonworking}/cloud9/cloud9/cloud9-avahi.service  | 0
 meta-oe/recipes-devtools/{ => nonworking}/cloud9/cloud9/index.js          | 0
 meta-oe/recipes-devtools/{ => nonworking}/cloud9/cloud9_0.6.bb            | 0
 .../{ => nonworking}/nodejs/nodejs/fix-hardfloat-detection.patch          | 0
 meta-oe/recipes-devtools/{ => nonworking}/nodejs/nodejs_0.6.20.bb         | 0
 meta-oe/recipes-graphics/{ => nonworking}/fbida/fbida_2.08.bb             | 0
 .../slim/slim/0002-Fix-image-handling-integer-overflows.patch             | 0
 .../slim/slim/0003-Fix-build-failure-with-ld-as-needed.patch              | 0
 .../{ => nonworking}/slim/slim/0004-Add-support-libpng15.patch            | 0
 .../slim/slim/0005-Remove-path-of-gcc-amd-g-and-version-of-g.patch        | 0
 .../slim/slim/0006-Remove-localhost-from-Authenticator-of-pam.patch       | 0
 .../{ => nonworking}/slim/slim/0007-Fix-tty-slowness.patch                | 0
 .../{ => nonworking}/slim/slim/0008-restart-Xserver-if-killed.patch       | 0
 meta-oe/recipes-graphics/{ => nonworking}/slim/slim/Makefile.oe           | 0
 meta-oe/recipes-graphics/{ => nonworking}/slim/slim/slim-dynwm            | 0
 meta-oe/recipes-graphics/{ => nonworking}/slim/slim/slim.pamd             | 0
 meta-oe/recipes-graphics/{ => nonworking}/slim/slim/slim.service          | 0
 meta-oe/recipes-graphics/{ => nonworking}/slim/slim/update_slim_wmlist    | 0
 meta-oe/recipes-graphics/{ => nonworking}/slim/slim_1.3.2.bb              | 0
 meta-oe/recipes-support/{ => nonworking}/fftw/benchfft_3.1.bb             | 0
 meta-oe/recipes-support/{ => nonworking}/syslog-ng/files/initscript       | 0
 meta-oe/recipes-support/{ => nonworking}/syslog-ng/files/syslog-ng.conf   | 0
 meta-oe/recipes-support/{ => nonworking}/syslog-ng/syslog-ng.inc          | 0
 meta-oe/recipes-support/{ => nonworking}/syslog-ng/syslog-ng_3.2.5.bb     | 0
 .../recipes-devtools/{ => nonworking}/cloud9/cloud9/cloud9.service        | 0
 .../meta-oe/recipes-devtools/{ => nonworking}/cloud9/cloud9_0.6.bbappend  | 0
 .../recipes-support/{ => nonworking}/syslog-ng/syslog-ng_3.2.5.bbappend   | 0
 33 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-gnome/recipes-gnome/{ => nonworking}/gnome/gnome-terminal/30f29e7d8e1b67c40cd18a7155ba30c4382692d5.patch (100%)
 rename meta-gnome/recipes-gnome/{ => nonworking}/gnome/gnome-terminal_2.26.3.bb (100%)
 rename meta-gnome/recipes-gnome/{ => nonworking}/system-tools/system-tools-backends-2.10.2/add-angstrom-distro.patch (100%)
 rename meta-gnome/recipes-gnome/{ => nonworking}/system-tools/system-tools-backends-2.10.2/system-tools-backends (100%)
 rename meta-gnome/recipes-gnome/{ => nonworking}/system-tools/system-tools-backends_2.10.2.bb (100%)
 rename meta-oe/recipes-devtools/{ => nonworking}/cloud9/cloud9/0001-ide-use-node-as-interpreter-for-sketches-instead-of-.patch (100%)
 rename meta-oe/recipes-devtools/{ => nonworking}/cloud9/cloud9/cloud9-avahi.service (100%)
 rename meta-oe/recipes-devtools/{ => nonworking}/cloud9/cloud9/index.js (100%)
 rename meta-oe/recipes-devtools/{ => nonworking}/cloud9/cloud9_0.6.bb (100%)
 rename meta-oe/recipes-devtools/{ => nonworking}/nodejs/nodejs/fix-hardfloat-detection.patch (100%)
 rename meta-oe/recipes-devtools/{ => nonworking}/nodejs/nodejs_0.6.20.bb (100%)
 rename meta-oe/recipes-graphics/{ => nonworking}/fbida/fbida_2.08.bb (100%)
 rename meta-oe/recipes-graphics/{ => nonworking}/slim/slim/0002-Fix-image-handling-integer-overflows.patch (100%)
 rename meta-oe/recipes-graphics/{ => nonworking}/slim/slim/0003-Fix-build-failure-with-ld-as-needed.patch (100%)
 rename meta-oe/recipes-graphics/{ => nonworking}/slim/slim/0004-Add-support-libpng15.patch (100%)
 rename meta-oe/recipes-graphics/{ => nonworking}/slim/slim/0005-Remove-path-of-gcc-amd-g-and-version-of-g.patch (100%)
 rename meta-oe/recipes-graphics/{ => nonworking}/slim/slim/0006-Remove-localhost-from-Authenticator-of-pam.patch (100%)
 rename meta-oe/recipes-graphics/{ => nonworking}/slim/slim/0007-Fix-tty-slowness.patch (100%)
 rename meta-oe/recipes-graphics/{ => nonworking}/slim/slim/0008-restart-Xserver-if-killed.patch (100%)
 rename meta-oe/recipes-graphics/{ => nonworking}/slim/slim/Makefile.oe (100%)
 rename meta-oe/recipes-graphics/{ => nonworking}/slim/slim/slim-dynwm (100%)
 rename meta-oe/recipes-graphics/{ => nonworking}/slim/slim/slim.pamd (100%)
 rename meta-oe/recipes-graphics/{ => nonworking}/slim/slim/slim.service (100%)
 rename meta-oe/recipes-graphics/{ => nonworking}/slim/slim/update_slim_wmlist (100%)
 rename meta-oe/recipes-graphics/{ => nonworking}/slim/slim_1.3.2.bb (100%)
 rename meta-oe/recipes-support/{ => nonworking}/fftw/benchfft_3.1.bb (100%)
 rename meta-oe/recipes-support/{ => nonworking}/syslog-ng/files/initscript (100%)
 rename meta-oe/recipes-support/{ => nonworking}/syslog-ng/files/syslog-ng.conf (100%)
 rename meta-oe/recipes-support/{ => nonworking}/syslog-ng/syslog-ng.inc (100%)
 rename meta-oe/recipes-support/{ => nonworking}/syslog-ng/syslog-ng_3.2.5.bb (100%)
 rename meta-systemd/meta-oe/recipes-devtools/{ => nonworking}/cloud9/cloud9/cloud9.service (100%)
 rename meta-systemd/meta-oe/recipes-devtools/{ => nonworking}/cloud9/cloud9_0.6.bbappend (100%)
 rename meta-systemd/meta-oe/recipes-support/{ => nonworking}/syslog-ng/syslog-ng_3.2.5.bbappend (100%)

diff --git a/meta-gnome/recipes-gnome/gnome/gnome-terminal/30f29e7d8e1b67c40cd18a7155ba30c4382692d5.patch b/meta-gnome/recipes-gnome/nonworking/gnome/gnome-terminal/30f29e7d8e1b67c40cd18a7155ba30c4382692d5.patch
similarity index 100%
rename from meta-gnome/recipes-gnome/gnome/gnome-terminal/30f29e7d8e1b67c40cd18a7155ba30c4382692d5.patch
rename to meta-gnome/recipes-gnome/nonworking/gnome/gnome-terminal/30f29e7d8e1b67c40cd18a7155ba30c4382692d5.patch
diff --git a/meta-gnome/recipes-gnome/gnome/gnome-terminal_2.26.3.bb b/meta-gnome/recipes-gnome/nonworking/gnome/gnome-terminal_2.26.3.bb
similarity index 100%
rename from meta-gnome/recipes-gnome/gnome/gnome-terminal_2.26.3.bb
rename to meta-gnome/recipes-gnome/nonworking/gnome/gnome-terminal_2.26.3.bb
diff --git a/meta-gnome/recipes-gnome/system-tools/system-tools-backends-2.10.2/add-angstrom-distro.patch b/meta-gnome/recipes-gnome/nonworking/system-tools/system-tools-backends-2.10.2/add-angstrom-distro.patch
similarity index 100%
rename from meta-gnome/recipes-gnome/system-tools/system-tools-backends-2.10.2/add-angstrom-distro.patch
rename to meta-gnome/recipes-gnome/nonworking/system-tools/system-tools-backends-2.10.2/add-angstrom-distro.patch
diff --git a/meta-gnome/recipes-gnome/system-tools/system-tools-backends-2.10.2/system-tools-backends b/meta-gnome/recipes-gnome/nonworking/system-tools/system-tools-backends-2.10.2/system-tools-backends
similarity index 100%
rename from meta-gnome/recipes-gnome/system-tools/system-tools-backends-2.10.2/system-tools-backends
rename to meta-gnome/recipes-gnome/nonworking/system-tools/system-tools-backends-2.10.2/system-tools-backends
diff --git a/meta-gnome/recipes-gnome/system-tools/system-tools-backends_2.10.2.bb b/meta-gnome/recipes-gnome/nonworking/system-tools/system-tools-backends_2.10.2.bb
similarity index 100%
rename from meta-gnome/recipes-gnome/system-tools/system-tools-backends_2.10.2.bb
rename to meta-gnome/recipes-gnome/nonworking/system-tools/system-tools-backends_2.10.2.bb
diff --git a/meta-oe/recipes-devtools/cloud9/cloud9/0001-ide-use-node-as-interpreter-for-sketches-instead-of-.patch b/meta-oe/recipes-devtools/nonworking/cloud9/cloud9/0001-ide-use-node-as-interpreter-for-sketches-instead-of-.patch
similarity index 100%
rename from meta-oe/recipes-devtools/cloud9/cloud9/0001-ide-use-node-as-interpreter-for-sketches-instead-of-.patch
rename to meta-oe/recipes-devtools/nonworking/cloud9/cloud9/0001-ide-use-node-as-interpreter-for-sketches-instead-of-.patch
diff --git a/meta-oe/recipes-devtools/cloud9/cloud9/cloud9-avahi.service b/meta-oe/recipes-devtools/nonworking/cloud9/cloud9/cloud9-avahi.service
similarity index 100%
rename from meta-oe/recipes-devtools/cloud9/cloud9/cloud9-avahi.service
rename to meta-oe/recipes-devtools/nonworking/cloud9/cloud9/cloud9-avahi.service
diff --git a/meta-oe/recipes-devtools/cloud9/cloud9/index.js b/meta-oe/recipes-devtools/nonworking/cloud9/cloud9/index.js
similarity index 100%
rename from meta-oe/recipes-devtools/cloud9/cloud9/index.js
rename to meta-oe/recipes-devtools/nonworking/cloud9/cloud9/index.js
diff --git a/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb b/meta-oe/recipes-devtools/nonworking/cloud9/cloud9_0.6.bb
similarity index 100%
rename from meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb
rename to meta-oe/recipes-devtools/nonworking/cloud9/cloud9_0.6.bb
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/fix-hardfloat-detection.patch b/meta-oe/recipes-devtools/nonworking/nodejs/nodejs/fix-hardfloat-detection.patch
similarity index 100%
rename from meta-oe/recipes-devtools/nodejs/nodejs/fix-hardfloat-detection.patch
rename to meta-oe/recipes-devtools/nonworking/nodejs/nodejs/fix-hardfloat-detection.patch
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_0.6.20.bb b/meta-oe/recipes-devtools/nonworking/nodejs/nodejs_0.6.20.bb
similarity index 100%
rename from meta-oe/recipes-devtools/nodejs/nodejs_0.6.20.bb
rename to meta-oe/recipes-devtools/nonworking/nodejs/nodejs_0.6.20.bb
diff --git a/meta-oe/recipes-graphics/fbida/fbida_2.08.bb b/meta-oe/recipes-graphics/nonworking/fbida/fbida_2.08.bb
similarity index 100%
rename from meta-oe/recipes-graphics/fbida/fbida_2.08.bb
rename to meta-oe/recipes-graphics/nonworking/fbida/fbida_2.08.bb
diff --git a/meta-oe/recipes-graphics/slim/slim/0002-Fix-image-handling-integer-overflows.patch b/meta-oe/recipes-graphics/nonworking/slim/slim/0002-Fix-image-handling-integer-overflows.patch
similarity index 100%
rename from meta-oe/recipes-graphics/slim/slim/0002-Fix-image-handling-integer-overflows.patch
rename to meta-oe/recipes-graphics/nonworking/slim/slim/0002-Fix-image-handling-integer-overflows.patch
diff --git a/meta-oe/recipes-graphics/slim/slim/0003-Fix-build-failure-with-ld-as-needed.patch b/meta-oe/recipes-graphics/nonworking/slim/slim/0003-Fix-build-failure-with-ld-as-needed.patch
similarity index 100%
rename from meta-oe/recipes-graphics/slim/slim/0003-Fix-build-failure-with-ld-as-needed.patch
rename to meta-oe/recipes-graphics/nonworking/slim/slim/0003-Fix-build-failure-with-ld-as-needed.patch
diff --git a/meta-oe/recipes-graphics/slim/slim/0004-Add-support-libpng15.patch b/meta-oe/recipes-graphics/nonworking/slim/slim/0004-Add-support-libpng15.patch
similarity index 100%
rename from meta-oe/recipes-graphics/slim/slim/0004-Add-support-libpng15.patch
rename to meta-oe/recipes-graphics/nonworking/slim/slim/0004-Add-support-libpng15.patch
diff --git a/meta-oe/recipes-graphics/slim/slim/0005-Remove-path-of-gcc-amd-g-and-version-of-g.patch b/meta-oe/recipes-graphics/nonworking/slim/slim/0005-Remove-path-of-gcc-amd-g-and-version-of-g.patch
similarity index 100%
rename from meta-oe/recipes-graphics/slim/slim/0005-Remove-path-of-gcc-amd-g-and-version-of-g.patch
rename to meta-oe/recipes-graphics/nonworking/slim/slim/0005-Remove-path-of-gcc-amd-g-and-version-of-g.patch
diff --git a/meta-oe/recipes-graphics/slim/slim/0006-Remove-localhost-from-Authenticator-of-pam.patch b/meta-oe/recipes-graphics/nonworking/slim/slim/0006-Remove-localhost-from-Authenticator-of-pam.patch
similarity index 100%
rename from meta-oe/recipes-graphics/slim/slim/0006-Remove-localhost-from-Authenticator-of-pam.patch
rename to meta-oe/recipes-graphics/nonworking/slim/slim/0006-Remove-localhost-from-Authenticator-of-pam.patch
diff --git a/meta-oe/recipes-graphics/slim/slim/0007-Fix-tty-slowness.patch b/meta-oe/recipes-graphics/nonworking/slim/slim/0007-Fix-tty-slowness.patch
similarity index 100%
rename from meta-oe/recipes-graphics/slim/slim/0007-Fix-tty-slowness.patch
rename to meta-oe/recipes-graphics/nonworking/slim/slim/0007-Fix-tty-slowness.patch
diff --git a/meta-oe/recipes-graphics/slim/slim/0008-restart-Xserver-if-killed.patch b/meta-oe/recipes-graphics/nonworking/slim/slim/0008-restart-Xserver-if-killed.patch
similarity index 100%
rename from meta-oe/recipes-graphics/slim/slim/0008-restart-Xserver-if-killed.patch
rename to meta-oe/recipes-graphics/nonworking/slim/slim/0008-restart-Xserver-if-killed.patch
diff --git a/meta-oe/recipes-graphics/slim/slim/Makefile.oe b/meta-oe/recipes-graphics/nonworking/slim/slim/Makefile.oe
similarity index 100%
rename from meta-oe/recipes-graphics/slim/slim/Makefile.oe
rename to meta-oe/recipes-graphics/nonworking/slim/slim/Makefile.oe
diff --git a/meta-oe/recipes-graphics/slim/slim/slim-dynwm b/meta-oe/recipes-graphics/nonworking/slim/slim/slim-dynwm
similarity index 100%
rename from meta-oe/recipes-graphics/slim/slim/slim-dynwm
rename to meta-oe/recipes-graphics/nonworking/slim/slim/slim-dynwm
diff --git a/meta-oe/recipes-graphics/slim/slim/slim.pamd b/meta-oe/recipes-graphics/nonworking/slim/slim/slim.pamd
similarity index 100%
rename from meta-oe/recipes-graphics/slim/slim/slim.pamd
rename to meta-oe/recipes-graphics/nonworking/slim/slim/slim.pamd
diff --git a/meta-oe/recipes-graphics/slim/slim/slim.service b/meta-oe/recipes-graphics/nonworking/slim/slim/slim.service
similarity index 100%
rename from meta-oe/recipes-graphics/slim/slim/slim.service
rename to meta-oe/recipes-graphics/nonworking/slim/slim/slim.service
diff --git a/meta-oe/recipes-graphics/slim/slim/update_slim_wmlist b/meta-oe/recipes-graphics/nonworking/slim/slim/update_slim_wmlist
similarity index 100%
rename from meta-oe/recipes-graphics/slim/slim/update_slim_wmlist
rename to meta-oe/recipes-graphics/nonworking/slim/slim/update_slim_wmlist
diff --git a/meta-oe/recipes-graphics/slim/slim_1.3.2.bb b/meta-oe/recipes-graphics/nonworking/slim/slim_1.3.2.bb
similarity index 100%
rename from meta-oe/recipes-graphics/slim/slim_1.3.2.bb
rename to meta-oe/recipes-graphics/nonworking/slim/slim_1.3.2.bb
diff --git a/meta-oe/recipes-support/fftw/benchfft_3.1.bb b/meta-oe/recipes-support/nonworking/fftw/benchfft_3.1.bb
similarity index 100%
rename from meta-oe/recipes-support/fftw/benchfft_3.1.bb
rename to meta-oe/recipes-support/nonworking/fftw/benchfft_3.1.bb
diff --git a/meta-oe/recipes-support/syslog-ng/files/initscript b/meta-oe/recipes-support/nonworking/syslog-ng/files/initscript
similarity index 100%
rename from meta-oe/recipes-support/syslog-ng/files/initscript
rename to meta-oe/recipes-support/nonworking/syslog-ng/files/initscript
diff --git a/meta-oe/recipes-support/syslog-ng/files/syslog-ng.conf b/meta-oe/recipes-support/nonworking/syslog-ng/files/syslog-ng.conf
similarity index 100%
rename from meta-oe/recipes-support/syslog-ng/files/syslog-ng.conf
rename to meta-oe/recipes-support/nonworking/syslog-ng/files/syslog-ng.conf
diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc b/meta-oe/recipes-support/nonworking/syslog-ng/syslog-ng.inc
similarity index 100%
rename from meta-oe/recipes-support/syslog-ng/syslog-ng.inc
rename to meta-oe/recipes-support/nonworking/syslog-ng/syslog-ng.inc
diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng_3.2.5.bb b/meta-oe/recipes-support/nonworking/syslog-ng/syslog-ng_3.2.5.bb
similarity index 100%
rename from meta-oe/recipes-support/syslog-ng/syslog-ng_3.2.5.bb
rename to meta-oe/recipes-support/nonworking/syslog-ng/syslog-ng_3.2.5.bb
diff --git a/meta-systemd/meta-oe/recipes-devtools/cloud9/cloud9/cloud9.service b/meta-systemd/meta-oe/recipes-devtools/nonworking/cloud9/cloud9/cloud9.service
similarity index 100%
rename from meta-systemd/meta-oe/recipes-devtools/cloud9/cloud9/cloud9.service
rename to meta-systemd/meta-oe/recipes-devtools/nonworking/cloud9/cloud9/cloud9.service
diff --git a/meta-systemd/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bbappend b/meta-systemd/meta-oe/recipes-devtools/nonworking/cloud9/cloud9_0.6.bbappend
similarity index 100%
rename from meta-systemd/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bbappend
rename to meta-systemd/meta-oe/recipes-devtools/nonworking/cloud9/cloud9_0.6.bbappend
diff --git a/meta-systemd/meta-oe/recipes-support/syslog-ng/syslog-ng_3.2.5.bbappend b/meta-systemd/meta-oe/recipes-support/nonworking/syslog-ng/syslog-ng_3.2.5.bbappend
similarity index 100%
rename from meta-systemd/meta-oe/recipes-support/syslog-ng/syslog-ng_3.2.5.bbappend
rename to meta-systemd/meta-oe/recipes-support/nonworking/syslog-ng/syslog-ng_3.2.5.bbappend
-- 
1.8.1.2



