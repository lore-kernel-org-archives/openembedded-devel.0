Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stefan@datenfreihafen.org>) id 1Q77kf-0003Um-Oc
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Apr 2011 17:01:05 +0200
Received: from w1076.wlan.rz.tu-bs.de ([134.169.204.60] helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.69 #1)
	id 1Q77iW-0000Lx-Kq by authid <stefan@sostec.de> with cram_md5;
	Tue, 05 Apr 2011 16:59:00 +0200
Received: from stefan by excalibur.local with local (Exim 4.75)
	(envelope-from <stefan@excalibur.local>)
	id 1Q77iV-0001jn-TJ; Tue, 05 Apr 2011 16:58:52 +0200
Date: Tue, 5 Apr 2011 16:58:51 +0200
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
Message-ID: <20110405145851.GA4381@excalibur.local>
References: <1301609579-27642-1-git-send-email-GNUtoo@no-log.org>
MIME-Version: 1.0
In-Reply-To: <1301609579-27642-1-git-send-email-GNUtoo@no-log.org>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-946.8 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.5
Cc: BUG-dev <bug-dev@lists.buglabs.net>,
	openembedded-devel@lists.openembedded.org,
	Stefan Schmidt <stefan@buglabs.net>
Subject: Re: [PATCH] fix com.buglabs.bug.jni.* 'could not read symbols: Bad value' error
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
X-List-Received-Date: Tue, 05 Apr 2011 15:01:05 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Fri, 2011-04-01 at 00:12, Denis 'GNUtoo' Carikli wrote:
> Without that fix we have :
>   | .../sysroots/x86_64-linux/usr/armv7a/lib/gcc/arm-angstrom-linux-gnueabi/4.5.3/../../../../arm-angstrom-linux-gnueabi/bin/ld: CharDevice.o: relocation R_ARM_MOVW_ABS_NC against `a local symbol' can not be used when making a shared object; recompile with -fPIC
>   | CharDevice.o: could not read symbols: Bad value
>   | collect2: ld returned 1 exit status
>   | make: *** [libCommon.so] Error 1
> For the following recipes:
>   com.buglabs.bug.jni.common
>   com.buglabs.bug.jni.input
>   com.buglabs.bug.jni.lcd
>   com.buglabs.bug.jni.accelerometer
>   com.buglabs.bug.jni.libmatthew
>   com.buglabs.bug.jni.vonhippel
>   com.buglabs.bug.jni.camera
>   com.buglabs.bug.jni.rxtx
>   com.buglabs.bug.jni.gps
> 
> The solution was to pass -fPIC to the Makefile:
> For instance in com.buglabs.bug.jni.common/src/c the Makefile contained:
>   ALL_CXXFLAGS += $(INCLUDE) $(CXXFLAGS)
>   [...]
>   %.o: %.cpp
>           $(CXX) $(ALL_CXXFLAGS) -c -v $^ -o $@
> So passing -fPIC to CXXFLAGS solved all of the compilation failures but com.buglabs.bug.jni.camera
> com.buglabs.bug.jni.camera which failed that way:
>   | .../sysroots/x86_64-linux/usr/armv7a/lib/gcc/arm-angstrom-linux-gnueabi/4.5.3/../../../../arm-angstrom-linux-gnueabi/bin/ld: Camera.o: relocation R_ARM_MOVW_ABS_NC against `a local symbol' can not be used when making a shared object; recompile with -fPIC
>   | Camera.o: could not read symbols: Bad value
>   | collect2: ld returned 1 exit status
>   | make: *** [libCamera.so] Error 1
> Had that in its Makefile:
>   ALL_CCFLAGS += $(INCLUDE) $(CCFLAGS)
>   [...]
>   %.o: %.c
>           $(CC) $(ALL_CCFLAGS) -c $^ -o $@
> which corresponded to the compilation of bug_v4l.c
> Altough just setting CCFLAGS += "-fPIC" wasn't sufficent since CFLAGS was not exported
> (see run.do_jni_install script)
> So I had to export it.
> 
> Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>

Acked-by: Stefan Schmidt <stefan@buglabs.net>

I also tested this against angstrom-2008 in the 2011.03-maintenance
branch without problems. Thanks for traacking this down Denis.

regards
Stefan Schmidt

> ---
>  recipes/buglabs-osgi/bug-osgi.inc                  |    4 +++-
>  recipes/buglabs-osgi/com.buglabs.bug.jni.camera.bb |    3 +++
>  2 files changed, 6 insertions(+), 1 deletions(-)
> 
> diff --git a/recipes/buglabs-osgi/bug-osgi.inc b/recipes/buglabs-osgi/bug-osgi.inc
> index b5b6e9f..75908bb 100644
> --- a/recipes/buglabs-osgi/bug-osgi.inc
> +++ b/recipes/buglabs-osgi/bug-osgi.inc
> @@ -8,7 +8,7 @@ inherit bug-java-library
>  JARFILENAME = "${BPN}.jar"
>  ALTJARFILENAMES = ""
>  
> -INC_PR = "r0"
> +INC_PR = "r1"
>  
>  SRCREV = "12839"
>  
> @@ -28,6 +28,8 @@ EXTRA_OEMAKE+="CLASSPATH_INCDIR=${STAGING_INCDIR}/classpath"
>  
>  JAVAC_OPTIONS="-source 1.6"
>  
> +CXXFLAGS += "-fPIC"
> +
>  do_compile() {
>    mkdir -p build
>    oe_makeclasspath cp -s ${DEPENDS} ${EXTRA_CP}
> diff --git a/recipes/buglabs-osgi/com.buglabs.bug.jni.camera.bb b/recipes/buglabs-osgi/com.buglabs.bug.jni.camera.bb
> index dced292..28a22e1 100644
> --- a/recipes/buglabs-osgi/com.buglabs.bug.jni.camera.bb
> +++ b/recipes/buglabs-osgi/com.buglabs.bug.jni.camera.bb
> @@ -2,6 +2,9 @@ require bug-osgi.inc
>  inherit jni-library
>  
>  PR = "${INC_PR}.7+svnr${SRCREV}"
> +
> +export CCFLAGS  += "-fPIC"
> +
>  FILES_${PN} += "${JNI_LIB_DIR}/libCamera.so"
>  
>  DEPENDS += "com.buglabs.common com.buglabs.bug.jni.common classpath jpeg virtual/kernel jpeg"
> -- 
> 1.7.0.4
> 


