Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by mail.openembedded.org (Postfix) with ESMTP id 6E2E46FA23
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Mar 2014 13:50:53 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s2LDor48020730;
	Fri, 21 Mar 2014 08:50:53 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s2LDorsV009677;
	Fri, 21 Mar 2014 08:50:53 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0174.001; Fri, 21 Mar 2014 08:50:53 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Fathi Boudra <fathi.boudra@linaro.org>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [PATCH] pm-qa-utils: Add power management test utils
Thread-Index: AQHPRFu6bFD53IzT8kiCJ/XxPOyzM5rrkDNA
Date: Fri, 21 Mar 2014 13:50:52 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015CF493E6@DLEE11.ent.ti.com>
References: <1395326848-4434-1-git-send-email-Chase.Maupin@ti.com>
	<CAGNsrLA0Y_MK7hT5_NLzkBz0vvq4cy7cGJq=59X8SnO99bV6SQ@mail.gmail.com>
In-Reply-To: <CAGNsrLA0Y_MK7hT5_NLzkBz0vvq4cy7cGJq=59X8SnO99bV6SQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [PATCH] pm-qa-utils: Add power management test utils
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 21 Mar 2014 13:50:54 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable


From: Fathi Boudra [mailto:fathi.boudra@linaro.org]
Sent: Thursday, March 20, 2014 11:45 AM
To: openembedded-devel@lists.openembedded.org
Cc: Maupin, Chase
Subject: Re: [oe] [PATCH] pm-qa-utils: Add power management test utils


On 20 March 2014 16:47, Chase Maupin <Chase.Maupin@ti.com<mailto:Chase.Maup=
in@ti.com>> wrote:
* The power management test utilities from Linaro can be used
  to test multiple PM features such as cpufreq, cpuidle, thermal
  control and suspend operations.
* These utilities are not platform specific and can be used by
  a broader base of users.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com<mailto:Chase.Maupin@ti.com=
>>
---
 .../pm-qa-utils/pm-qa-utils_git.bb<http://pm-qa-utils_git.bb>             =
    |   63 ++++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/pm-qa-utils/pm-qa-utils_git.bb=
<http://pm-qa-utils_git.bb>

diff --git a/meta-oe/recipes-devtools/pm-qa-utils/pm-qa-utils_git.bb<http:/=
/pm-qa-utils_git.bb> b/meta-oe/recipes-devtools/pm-qa-utils/pm-qa-utils_git=
.bb<http://pm-qa-utils_git.bb>
new file mode 100644
index 0000000..610f3a7
--- /dev/null
+++ b/meta-oe/recipes-devtools/pm-qa-utils/pm-qa-utils_git.bb<http://pm-qa-=
utils_git.bb>
@@ -0,0 +1,63 @@
+DESCRIPTION =3D "Utilities from Linaro for testing Power Management"

nitpick, I'll remove "from Linaro" :)

[CEM] I have another version I need to send so I=92ll take care of this.


+HOMEPAGE =3D "https://wiki.linaro.org/WorkingGroups/PowerManagement/Resour=
ces/TestSuite/PmQa"
+
+LICENSE =3D "GPLv2"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a426=
3<file:///\\COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263>"
+
+PV =3D "0.4.4"

we released 0.4.8 today.

[CEM] I=92ll go ahead and bump this


+BRANCH ?=3D "master"
+SRCREV =3D "fbc2762359b863dfbf4fd0bab1e8abd2a6125ed4"
+
+SRC_URI =3D "git://git.linaro.org/tools/pm-qa.git;protocol=3Dgit;branch=3D=
${BRANCH}<http://git.linaro.org/tools/pm-qa.git;protocol=3Dgit;branch=3D$%7=
BBRANCH%7D>"
+
+S =3D "${WORKDIR}/git"
+
+CFLAGS +=3D "-pthread"
+
+do_compile () {
+    # Find all the .c files in this project and build them.
+    for x in `find . -name "*.c"`
+    do
+        util=3D`echo ${x} | sed s/.c$//`
+        oe_runmake ${util}
+    done
+}
+
+do_install () {
+    install -d ${D}${bindir}
+    install -d ${D}${bindir}/linaro-pm-qa-include
+
+    # Install the compiled binaries the were built in the previous step
+    for x in `find . -name "*.c"`
+    do
+        util=3D`echo ${x} | sed s/.c$//`
+        util_basename=3D`basename ${util}`
+        install -m 0755 ${util} ${D}${bindir}/${util_basename}
+    done
+
+    # Install the helper scripts in the include directory
+    for script in `find . -name "*.sh" | grep include`
+    do
+        # Remove hardcoded relative paths
+        sed -i -e 's#..\/utils\/##' ${script}
+
+        script_basename=3D`basename ${script}`
+        install -m 0755 $script ${D}${bindir}/linaro-pm-qa-include/${scrip=
t_basename}
+    done
+
+    # Install the shell scripts NOT in the include directory since those
+    # will be installed elsewhere
+    for script in `find . -name "*.sh" | grep -v include`
+    do
+        # if the script includes any helper scripts from the include
+        # directory then change the include path to the absolute path
+        # to reflect the install location of the helper scripts.
+        sed -i -e "s#source ../include#source ${bindir}/linaro-pm-qa-inclu=
de#g" ${script}
+        # Remove hardcoded relative paths
+        sed -i -e 's#..\/utils\/##' ${script}
+
+        script_basename=3D`basename ${script}`
+        install -m 0755 $script ${D}${bindir}/${script_basename}
+    done

we probably need to fix that properly and avoid the LTP style mess (softwar=
e not meant to be installable).

+}
--
1.7.9.5

--
_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org<mailto:Openembedded-devel@lists.o=
penembedded.org>
http://lists.openembedded.org/mailman/listinfo/openembedded-devel

FWIW, my comments aren't a blocker/nack. That's something we can address la=
ter on.

Cheers,
Fathi


