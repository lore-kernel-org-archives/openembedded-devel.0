Received: from 8.27.mail-out.ovh.net ([188.165.39.131]
	helo=27.mail-out.ovh.net) by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1QL0ne-0001OA-D7
	for openembedded-devel@lists.openembedded.org;
	Sat, 14 May 2011 00:25:34 +0200
Received: (qmail 24435 invoked by uid 503); 13 May 2011 20:31:52 -0000
Received: from b9.ovh.net (HELO mail194.ha.ovh.net) (213.186.33.59)
	by 27.mail-out.ovh.net with SMTP; 13 May 2011 20:31:44 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 13 May 2011 21:35:58 +0200
Received: from tal33-3-82-233-81-124.fbx.proxad.net (HELO ?192.168.2.15?)
	(ebenard%eukrea.com@82.233.81.124)
	by ns0.ovh.net with SMTP; 13 May 2011 21:35:57 +0200
Message-ID: <4DCD881C.3080103@eukrea.com>
Date: Fri, 13 May 2011 21:35:56 +0200
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc14
	Lightning/1.0b3pre Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <201105131210.17952.sgh@sgh.dk>	<f8a3ce78c529edc295cc9d15986d55bd.squirrel@webmail.infeline.org>
	<4DCD526E.2080706@eukrea.com>
In-Reply-To: <4DCD526E.2080706@eukrea.com>
X-Ovh-Tracer-Id: 9807995565344468297
X-Ovh-Remote: 82.233.81.124 (tal33-3-82-233-81-124.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
Subject: Re: qt-x11-free_7.7.2 fail configure missing qmake
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
X-List-Received-Date: Fri, 13 May 2011 22:25:34 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

> On 13/05/2011 16:28, Eivind Kvedalen wrote:
>> I get the same problem here when trying to compile qt4-embedded_4.7.2.bb.
>>
>> Build Configuration:
>> BB_VERSION = "1.10.2"
>> METADATA_BRANCH = "master"
>> METADATA_REVISION = "54ab33e"
>> TARGET_ARCH = "arm"
>> TARGET_OS = "linux-gnueabi"
>> MACHINE = "beagleboard"
>> DISTRO = "angstrom"
>> DISTRO_VERSION = "v2011.05"
>> TARGET_FPU = "hard"
>>
problem reproduced with a clean tmp.
this patch restore a part that 5a6efd58cdc85d08ab9e106c84bbac5110b5aecd 
removed in do_install which seems to be the root of the problem.

I'm testing and will send a clean patch if that works.

Eric

diff --git a/recipes/qt4/qt4-native.inc b/recipes/qt4/qt4-native.inc
index d99d9de..495a928 100644
--- a/recipes/qt4/qt4-native.inc
+++ b/recipes/qt4/qt4-native.inc
@@ -63,6 +63,18 @@ do_compile() {
  NATIVE_INSTALL_WORKS = "1"

  do_install() {
+    install -d ${D}${bindir}/
+    install -m 0755 bin/qmake ${D}${bindir}/qmake2
+    for i in moc uic uic3 rcc lrelease lupdate qdbuscpp2xml qdbusxml2cpp; do
+        install -m 0755 bin/${i} ${D}${bindir}/${i}4
+    done
+
+    install -d ${D}${datadir}/qt4/
+    cp -PfR mkspecs ${D}${datadir}/qt4/
+    ln -sf linux-g++ ${D}${datadir}/qt4/mkspecs/${BUILD_OS}-oe-g++
+    cp -f ${WORKDIR}/g++.conf ${WORKDIR}/linux.conf 
${D}${datadir}/qt4/mkspecs/common/
+    install -m 0644 tools/porting/src/q3porting.xml ${D}${datadir}/qt4/
+
      for i in ${TOBUILD}; do
          cd ${S}/$i && oe_runmake install INSTALL_ROOT=${D}
      done


