Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web12.5320.1591150853779158405
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Jun 2020 19:20:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.65, mailfrom: naveen.kumar.saini@intel.com)
IronPort-SDR: /SYh8RHG1r3J+50Vz7WRR//siCYjlHHcasDvFu3QVGAK7fRgEuYfemEArBakWi/p+GFm1twUI3
 UFyWnE8JTldw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2020 19:20:53 -0700
IronPort-SDR: qDK9qAbKrmWVv6VEEiOwHZa9o2TYc0kYRpeORcv9h86jtjYGn5ixXxXKhoEQlAQN0bJePW3HFX
 57j/VCRgutdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,466,1583222400"; 
   d="scan'208";a="304446208"
Received: from saininav-desk1.png.intel.com ([172.30.199.23])
  by orsmga008.jf.intel.com with ESMTP; 02 Jun 2020 19:20:52 -0700
From: "Naveen Saini" <naveen.kumar.saini@intel.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] ace: add new recipe
Date: Wed,  3 Jun 2020 10:27:39 +0800
Message-Id: <20200603022739.504-1-naveen.kumar.saini@intel.com>
X-Mailer: git-send-email 2.17.1

The ADAPTIVE Communication Environment library.
Sources: http://download.dre.vanderbilt.edu/
Homepage: http://www.dre.vanderbilt.edu/~schmidt/ACE-overview.html

Object-oriented (OO) framework that implements many core patterns
for concurrent communication software.

Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
---
 meta-oe/licenses/ACE-TAO-CIAO                 | 111 ++++++++++++++++++
 meta-oe/recipes-connectivity/ace/ace_6.5.8.bb |  40 +++++++
 .../ace/files/ace_config.patch                |  12 ++
 3 files changed, 163 insertions(+)
 create mode 100644 meta-oe/licenses/ACE-TAO-CIAO
 create mode 100644 meta-oe/recipes-connectivity/ace/ace_6.5.8.bb
 create mode 100644 meta-oe/recipes-connectivity/ace/files/ace_config.patch

diff --git a/meta-oe/licenses/ACE-TAO-CIAO b/meta-oe/licenses/ACE-TAO-CIAO
new file mode 100644
index 000000000..67fc56322
--- /dev/null
+++ b/meta-oe/licenses/ACE-TAO-CIAO
@@ -0,0 +1,111 @@
+
+     _________________________________________________________________
+
+  Copyright and Licensing Information for ACE(TM), TAO(TM), CIAO(TM),
+  DAnCE(TM), and CoSMIC(TM)
+
+   [1]ACE(TM), [2]TAO(TM), [3]CIAO(TM), DAnCE(TM), and [4]CoSMIC(TM)
+   (henceforth referred to as "DOC software") are copyrighted by
+   [5]Douglas C. Schmidt and his [6]research group at [7]Washington
+   University, [8]University of California, Irvine, and [9]Vanderbilt
+   University, Copyright (c) 1993-2018, all rights reserved. Since DOC
+   software is open-source, freely available software, you are free to
+   use, modify, copy, and distribute--perpetually and irrevocably--the
+   DOC software source code and object code produced from the source, as
+   well as copy and distribute modified versions of this software. You
+   must, however, include this copyright statement along with any code
+   built using DOC software that you release. No copyright statement
+   needs to be provided if you just ship binary executables of your
+   software products.
+
+   You can use DOC software in commercial and/or binary software releases
+   and are under no obligation to redistribute any of your source code
+   that is built using DOC software. Note, however, that you may not
+   misappropriate the DOC software code, such as copyrighting it yourself
+   or claiming authorship of the DOC software code, in a way that will
+   prevent DOC software from being distributed freely using an
+   open-source development model. You needn't inform anyone that you're
+   using DOC software in your software, though we encourage you to let
+   [10]us know so we can promote your project in the [11]DOC software
+   success stories.
+
+   The [12]ACE, [13]TAO, [14]CIAO, [15]DAnCE, and [16]CoSMIC web sites
+   are maintained by the [17]DOC Group at the [18]Institute for Software
+   Integrated Systems (ISIS) and the [19]Center for Distributed Object
+   Computing of Washington University, St. Louis for the development of
+   open-source software as part of the open-source software community.
+   Submissions are provided by the submitter ``as is'' with no warranties
+   whatsoever, including any warranty of merchantability, noninfringement
+   of third party intellectual property, or fitness for any particular
+   purpose. In no event shall the submitter be liable for any direct,
+   indirect, special, exemplary, punitive, or consequential damages,
+   including without limitation, lost profits, even if advised of the
+   possibility of such damages. Likewise, DOC software is provided as is
+   with no warranties of any kind, including the warranties of design,
+   merchantability, and fitness for a particular purpose,
+   noninfringement, or arising from a course of dealing, usage or trade
+   practice. Washington University, UC Irvine, Vanderbilt University,
+   their employees, and students shall have no liability with respect to
+   the infringement of copyrights, trade secrets or any patents by DOC
+   software or any part thereof. Moreover, in no event will Washington
+   University, UC Irvine, or Vanderbilt University, their employees, or
+   students be liable for any lost revenue or profits or other special,
+   indirect and consequential damages.
+
+   DOC software is provided with no support and without any obligation on
+   the part of Washington University, UC Irvine, Vanderbilt University,
+   their employees, or students to assist in its use, correction,
+   modification, or enhancement. A [20]number of companies around the
+   world provide commercial support for DOC software, however. DOC
+   software is Y2K-compliant, as long as the underlying OS platform is
+   Y2K-compliant. Likewise, DOC software is compliant with the new US
+   daylight savings rule passed by Congress as "The Energy Policy Act of
+   2005," which established new daylight savings times (DST) rules for
+   the United States that expand DST as of March 2007. Since DOC software
+   obtains time/date and calendaring information from operating systems
+   users will not be affected by the new DST rules as long as they
+   upgrade their operating systems accordingly.
+
+   The names ACE(TM), TAO(TM), CIAO(TM), DAnCE(TM), CoSMIC(TM),
+   Washington University, UC Irvine, and Vanderbilt University, may not
+   be used to endorse or promote products or services derived from this
+   source without express written permission from Washington University,
+   UC Irvine, or Vanderbilt University. This license grants no permission
+   to call products or services derived from this source ACE(TM),
+   TAO(TM), CIAO(TM), DAnCE(TM), or CoSMIC(TM), nor does it grant
+   permission for the name Washington University, UC Irvine, or
+   Vanderbilt University to appear in their names.
+
+   If you have any suggestions, additions, comments, or questions, please
+   let [21]me know.
+
+   [22]Douglas C. Schmidt
+     _________________________________________________________________
+
+   Back to the [23]ACE home page.
+
+References
+
+   1. http://www.dre.vanderbilt.edu/~schmidt/ACE.html
+   2. http://www.dre.vanderbilt.edu/~schmidt/TAO.html
+   3. http://www.dre.vanderbilt.edu/CIAO/
+   4. http://www.dre.vanderbilt.edu/cosmic/
+   5. http://www.dre.vanderbilt.edu/~schmidt/
+   6. http://www.dre.vanderbilt.edu/~schmidt/ACE-members.html
+   7. http://www.wustl.edu/
+   8. http://www.uci.edu/
+   9. http://www.vanderbilt.edu/
+  10. mailto:doc_group@cs.wustl.edu
+  11. http://www.dre.vanderbilt.edu/~schmidt/ACE-users.html
+  12. http://www.dre.vanderbilt.edu/~schmidt/ACE.html
+  13. http://www.dre.vanderbilt.edu/~schmidt/TAO.html
+  14. http://www.dre.vanderbilt.edu/CIAO/
+  15. http://www.dre.vanderbilt.edu/~schmidt/DOC_ROOT/DAnCE/
+  16. http://www.dre.vanderbilt.edu/cosmic/
+  17. http://www.dre.vanderbilt.edu/
+  18. http://www.isis.vanderbilt.edu/
+  19. http://www.cs.wustl.edu/~schmidt/doc-center.html
+  20. http://www.dre.vanderbilt.edu/~schmidt/commercial-support.html
+  21. mailto:d.schmidt@vanderbilt.edu
+  22. http://www.dre.vanderbilt.edu/~schmidt/
+  23. http://www.dre.vanderbilt.edu/~schmidt/ACE.html
diff --git a/meta-oe/recipes-connectivity/ace/ace_6.5.8.bb b/meta-oe/recipes-connectivity/ace/ace_6.5.8.bb
new file mode 100644
index 000000000..24315320e
--- /dev/null
+++ b/meta-oe/recipes-connectivity/ace/ace_6.5.8.bb
@@ -0,0 +1,40 @@
+SUMMARY = "C++ framework for implementing distributed and networked applications"
+DESCRIPTION = "C++ network programming framework that implements many core \
+patterns for concurrent communication software"
+LICENSE = "ACE-TAO-CIAO"
+HOMEPAGE = "http://www.dre.vanderbilt.edu/~schmidt/ACE.html"
+LIC_FILES_CHKSUM = "file://COPYING;md5=96ef88a5529594698e8ceabdd47df92c"
+
+DEPENDS += "openssl gperf-native"
+
+SRC_URI = "https://github.com/DOCGroup/ACE_TAO/releases/download/ACE%2BTAO-6_5_8/ACE-${PV}.tar.bz2 \
+           file://ace_config.patch \
+          "
+
+SRC_URI[md5sum] = "a6ba6a944612fe0696c90cbb5c3078ee"
+SRC_URI[sha256sum] = "cda2a960dbb9970a907663627711b2e2b14b3484a2859ae936370bcad0b16923"
+
+COMPATIBLE_HOST_libc-musl = "null"
+
+S = "${WORKDIR}/ACE_wrappers"
+B = "${WORKDIR}/ACE_wrappers/ace"
+export ACE_ROOT="${WORKDIR}/ACE_wrappers"
+
+inherit pkgconfig
+
+CXXFLAGS_append = " -fpermissive -Wnodeprecated-declarations"
+
+do_install() {
+    export D="${D}"
+    oe_runmake install
+
+    for i in $(find ${D} -name "*.pc") ; do
+        sed -i -e s:${D}::g \
+               -e s:/${TARGET_SYS}::g \
+                  $i
+    done
+
+    rm -r ${D}/usr/share
+}
+
+UPSTREAM_CHECK_URI = "https://github.com/DOCGroup/ACE_TAO/releases"
diff --git a/meta-oe/recipes-connectivity/ace/files/ace_config.patch b/meta-oe/recipes-connectivity/ace/files/ace_config.patch
new file mode 100644
index 000000000..207b85ab9
--- /dev/null
+++ b/meta-oe/recipes-connectivity/ace/files/ace_config.patch
@@ -0,0 +1,12 @@
+diff -ruN ACE_wrappers1/ace/config.h ACE_wrappers/ace/config.h
+--- ACE_wrappers1/ace/config.h	1970-01-01 02:00:00.000000000 +0200
++++ ACE_wrappers/ace/config.h	2019-01-10 13:36:52.698012477 +0200
+@@ -0,0 +1,1 @@
++#include "ace/config-linux.h"
+diff -ruN ACE_wrappers1/include/makeinclude/platform_macros.GNU ACE_wrappers/include/makeinclude/platform_macros.GNU
+--- ACE_wrappers1/include/makeinclude/platform_macros.GNU	1970-01-01 02:00:00.000000000 +0200
++++ ACE_wrappers/include/makeinclude/platform_macros.GNU	2018-10-31 15:11:18.265392460 +0200
+@@ -0,0 +1,3 @@
++INSTALL_PREFIX = $(D)$(exec_prefix)
++INSTALL_LIB = $(base_libdir)
++include $(ACE_ROOT)/include/makeinclude/platform_linux.GNU
-- 
2.17.1

