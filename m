Received: from newsmtp5.atmel.com ([204.2.163.5] helo=sjogate2.atmel.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <nicolas.ferre@atmel.com>) id 1PLXe2-00066h-8V
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Nov 2010 09:57:35 +0100
Received: from meyreuil.atmel.fr (meyreuil [10.159.254.132])
	by sjogate2.atmel.com (8.13.6/8.13.6) with ESMTP id oAP8riq1020432
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Nov 2010 00:53:51 -0800 (PST)
Received: from [127.0.0.1] ([10.159.245.112])
	by meyreuil.atmel.fr (8.11.7p1+Sun/8.11.7) with ESMTP id oAP8u9h24739
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Nov 2010 09:56:09 +0100 (MET)
Message-ID: <4CEE24A8.2090007@atmel.com>
Date: Thu, 25 Nov 2010 09:56:08 +0100
From: Nicolas Ferre <nicolas.ferre@atmel.com>
Organization: atmel
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; fr;
	rv:1.9.2.12) Gecko/20101027 Lightning/1.0b2 Thunderbird/3.1.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 204.2.163.5
X-SA-Exim-Mail-From: nicolas.ferre@atmel.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: libXext-native fail to compile (x86_64)
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
X-List-Received-Date: Thu, 25 Nov 2010 08:57:36 -0000
X-Groupsio-MsgNum: 26549
Content-Type: multipart/mixed; boundary="------------070608000006040007090603"

--------------070608000006040007090603
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi all,

While trying to build from scratch the latest .dev branch with:
- angstrom-2010.x distribution

Build Configuration:
BB_VERSION        = "1.10.0"
METADATA_BRANCH   = "dev_for2010.12"
METADATA_REVISION = "a1bba89"
TARGET_ARCH       = "arm"
TARGET_OS         = "linux-gnueabi"
MACHINE           = "at91sam9m10g45ek"
DISTRO            = "angstrom"
DISTRO_VERSION    = "next"
TARGET_FPU        = "soft"


I have the following error with libxext:
NOTE: package libxext-native-1_1.2.0-r9.0: task do_compile: Failed

After this:
| make[2]: Entering directory `/local/users/nferre/workspace/oe/tmp/work/x86_64-linux/libxext-native-1_1.2.0-r9.0/libXext-1.2.0/src'
|   CCLD   libXext.la
| /usr/bin/ld: .libs/extutil.o: relocation R_X86_64_PC32 against `xgeExtRegister' can not be used when making a shared object; recompile with -fPIC
| /usr/bin/ld: final link failed: Bad value
| collect2: ld returned 1 exit status
| make[2]: *** [libXext.la] Error 1

I attach the error message to let you know...

Here is my cpuinfo just for the record:
processor       : 0
vendor_id       : AuthenticAMD
cpu family      : 15
model           : 67
model name      : Dual-Core AMD Opteron(tm) Processor 1222
stepping        : 3
cpu MHz         : 3015.536
cache size      : 1024 KB
physical id     : 0
siblings        : 2
core id         : 0
cpu cores       : 2
fpu             : yes
fpu_exception   : yes
cpuid level     : 1
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ht syscall nx mmxext fxsr_opt rdtscp lm 3dnowext 3dnow pni cx16 lahf_lm cmp_legacy svm extapic cr8_legacy
bogomips        : 6033.55
TLB size        : 1024 4K pages
clflush size    : 64
cache_alignment : 64
address sizes   : 40 bits physical, 48 bits virtual
power management: ts fid vid ttp tm stc

processor       : 1
vendor_id       : AuthenticAMD
cpu family      : 15
model           : 67
model name      : Dual-Core AMD Opteron(tm) Processor 1222
stepping        : 3
cpu MHz         : 3015.536
cache size      : 1024 KB
physical id     : 0
siblings        : 2
core id         : 1
cpu cores       : 2
fpu             : yes
fpu_exception   : yes
cpuid level     : 1
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ht syscall nx mmxext fxsr_opt rdtscp lm 3dnowext 3dnow pni cx16 lahf_lm cmp_legacy svm extapic cr8_legacy
bogomips        : 6027.07
TLB size        : 1024 4K pages
clflush size    : 64
cache_alignment : 64
address sizes   : 40 bits physical, 48 bits virtual
power management: ts fid vid ttp tm stc

Best regards,
-- 
Nicolas Ferre

--------------070608000006040007090603
Content-Type: text/plain;
 name="log.do_compile.30763"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="log.do_compile.30763"

NOTE: make -j 4
make  all-recursive
make[1]: Entering directory `/local/users/nferre/workspace/oe/tmp/work/x86_64-linux/libxext-native-1_1.2.0-r9.0/libXext-1.2.0'
Making all in man
make[2]: Entering directory `/local/users/nferre/workspace/oe/tmp/work/x86_64-linux/libxext-native-1_1.2.0-r9.0/libXext-1.2.0/man'
  GEN    XShapeQueryExtension.3
  GEN    XShapeQueryVersion.3
  GEN    XShapeCombineRegion.3
  GEN    XShapeCombineRectangles.3
  GEN    XShapeCombineMask.3
  GEN    XShapeCombineShape.3
  GEN    XShapeOffsetShape.3
  GEN    XShapeQueryExtents.3
  GEN    XShapeSelectInput.3
  GEN    XShapeInputSelected.3
  GEN    XShapeGetRectangles.3
  GEN    XShmQueryExtension.3
  GEN    XShmQueryVersion.3
  GEN    XShmPixmapFormat.3
  GEN    XShmAttach.3
  GEN    XShmDetach.3
  GEN    XShmCreateImage.3
  GEN    XShmPutImage.3
  GEN    XShmGetImage.3
  GEN    XShmCreatePixmap.3
  GEN    XShmGetEventBase.3
  GEN    XmbufQueryExtension.3
  GEN    XmbufGetVersion.3
  GEN    XmbufCreateBuffers.3
  GEN    XmbufDestroyBuffers.3
  GEN    XmbufDisplayBuffers.3
  GEN    XmbufGetWindowAttributes.3
  GEN    XmbufChangeWindowAttributes.3
  GEN    XmbufGetBufferAttributes.3
  GEN    XmbufChangeBufferAttributes.3
  GEN    XmbufGetScreenInfo.3
  GEN    XmbufCreateStereoWindow.3
  GEN    XeviQueryVersion.3
  GEN    XeviGetVisualInfo.3
  GEN    XeviQueryExtension.3
  GEN    DBE.3
  GEN    DPMSCapable.3
  GEN    DPMSDisable.3
  GEN    DPMSEnable.3
  GEN    DPMSForceLevel.3
  GEN    DPMSGetTimeouts.3
  GEN    DPMSGetVersion.3
  GEN    DPMSInfo.3
  GEN    DPMSQueryExtension.3
  GEN    DPMSSetTimeouts.3
  GEN    XShape.3
  GEN    XShm.3
  GEN    XcupGetReservedColormapEntries.3
  GEN    XcupQueryVersion.3
  GEN    XcupStoreColors.3
  GEN    XdbeAllocateBackBufferName.3
  GEN    XdbeBeginIdiom.3
  GEN    XdbeDeallocateBackBufferName.3
  GEN    XdbeEndIdiom.3
  GEN    XdbeFreeVisualInfo.3
  GEN    XdbeGetBackBufferAttributes.3
  GEN    XdbeGetVisualInfo.3
  GEN    XdbeQueryExtension.3
  GEN    XdbeSwapBuffers.3
  GEN    Xmbuf.3
  GEN    Xevi.3
make[2]: Leaving directory `/local/users/nferre/workspace/oe/tmp/work/x86_64-linux/libxext-native-1_1.2.0-r9.0/libXext-1.2.0/man'
Making all in src
make[2]: Entering directory `/local/users/nferre/workspace/oe/tmp/work/x86_64-linux/libxext-native-1_1.2.0-r9.0/libXext-1.2.0/src'
  CC     DPMS.lo
  CC     MITMisc.lo
  CC     XAppgroup.lo
  CC     XEVI.lo
  CC     XLbx.lo
  CC     XMultibuf.lo
  CC     XSecurity.lo
  CC     XShape.lo
  CC     XShm.lo
  CC     XSync.lo
  CC     XTestExt1.lo
  CC     Xcup.lo
  CC     Xdbe.lo
XTestExt1.c:150: warning: no previous prototype for 'XTestFakeInput'
XTestExt1.c:235: warning: no previous prototype for 'XTestGetInput'
XTestExt1.c:293: warning: no previous prototype for 'XTestStopInput'
XTestExt1.c:347: warning: no previous prototype for 'XTestReset'
XTestExt1.c:405: warning: no previous prototype for 'XTestQueryInputSize'
XTestExt1.c:640: warning: no previous prototype for 'XTestPressKey'
XTestExt1.c:672: warning: no previous prototype for 'XTestPressButton'
XTestExt1.c:886: warning: no previous prototype for 'XTestMovePointer'
XTestExt1.c:1291: warning: no previous prototype for 'XTestFlush'
  CC     Xge.lo
  CC     extutil.lo
  CC     globals.lo
Xge.c:296: warning: no previous prototype for 'xgeExtRegister'
  CCLD   libXext.la
/usr/bin/ld: .libs/extutil.o: relocation R_X86_64_PC32 against `xgeExtRegister' can not be used when making a shared object; recompile with -fPIC
/usr/bin/ld: final link failed: Bad value
collect2: ld returned 1 exit status
make[2]: *** [libXext.la] Error 1
make[2]: Leaving directory `/local/users/nferre/workspace/oe/tmp/work/x86_64-linux/libxext-native-1_1.2.0-r9.0/libXext-1.2.0/src'
make[1]: *** [all-recursive] Error 1
make[1]: Leaving directory `/local/users/nferre/workspace/oe/tmp/work/x86_64-linux/libxext-native-1_1.2.0-r9.0/libXext-1.2.0'
make: *** [all] Error 2
FATAL: oe_runmake failed
ERROR: Function do_compile failed

--------------070608000006040007090603--
