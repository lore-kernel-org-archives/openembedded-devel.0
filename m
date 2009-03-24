Received: from [85.214.48.103] (helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1Lm33x-0000vL-E1
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Mar 2009 10:36:49 +0100
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 29190DB15C0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Mar 2009 10:35:22 +0100 (CET)
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id CDC83DB1236
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Mar 2009 10:35:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.5
Received: from rhein.familie-heinold.de (e178092154.adsl.alicedsl.de
	[85.178.92.154]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Mar 2009 10:35:20 +0100 (CET)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 3B2303C206; Tue, 24 Mar 2009 10:35:20 +0100 (CET)
Date: Tue, 24 Mar 2009 10:35:20 +0100
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090324093519.GA6521@rhein.zuhause.netz>
MIME-Version: 1.0
User-Agent: Mutt/1.5.18 (2008-05-17)
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Bug in kernel-arch.bbclass
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
X-List-Received-Date: Tue, 24 Mar 2009 09:36:49 -0000
X-Groupsio-MsgNum: 8647
Content-Type: multipart/mixed; boundary="AhhlLboLdkugWU4S"
Content-Disposition: inline

--AhhlLboLdkugWU4S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

while compiling 2.6.28 for wrap board(geodegx) I noticed that the asm-headers didnt install into staging.
After examine kernel-arch.bbclass and kernel.bblcass I found the following lines 

kernel-arch.bbclass

def map_kernel_arch(a, d):
        import bb, re

        valid_archs = bb.data.getVar('valid_archs', d, 1).split()

        if   re.match('(i.86|athlon)$', a):     return '386'
        elif re.match('arm26$', a):             return 'arm26'
        elif re.match('armeb$', a):             return 'arm'
        elif re.match('mipsel$', a):            return 'mips'
        elif re.match('sh(3|4)$', a):           return 'sh'
        elif re.match('bfin', a):               return 'blackfin'
        elif a in valid_archs:                  return a
        else:
                bb.error("cannot map '%s' to a linux kernel architecture" % a)

export ARCH = "${@map_kernel_arch(bb.data.getVar('TARGET_ARCH', d, 1), d)}"


kernel.bbclass

kernel_do_stage() {
        ASMDIR=`readlink include/asm`

        mkdir -p ${STAGING_KERNEL_DIR}/include/$ASMDIR
        cp -fR include/$ASMDIR/* ${STAGING_KERNEL_DIR}/include/$ASMDIR/
        # Kernel 2.6.27 moved headers from includes/asm-${ARCH} to arch/${ARCH}/include/asm
        if [ -e arch/${ARCH}/include/asm/ ] ; then
                cp -fR arch/${ARCH}/include/asm/* ${STAGING_KERNEL_DIR}/include/$ASMDIR/
                install -d ${STAGING_KERNEL_DIR}/arch/${ARCH}/include
                cp -fR arch/${ARCH}/* ${STAGING_KERNEL_DIR}/arch/${ARCH}/

As you can see this can not work because the ARCH-variable is set to 386 and so the "-e arch/${ARCH}/include/asm/"
is not true. For backward compatiblity I attached a patch, which covers this problem.

Is this okay for checkin?


Bye Henning

--AhhlLboLdkugWU4S
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="kernel_bbclass.patch"

diff --git a/classes/kernel.bbclass b/classes/kernel.bbclass
index 4c1dbda..91bd640 100644
--- a/classes/kernel.bbclass
+++ b/classes/kernel.bbclass
@@ -98,6 +98,10 @@ kernel_do_stage() {
 		cp -fR arch/${ARCH}/include/asm/* ${STAGING_KERNEL_DIR}/include/$ASMDIR/
 		install -d ${STAGING_KERNEL_DIR}/arch/${ARCH}/include
 		cp -fR arch/${ARCH}/* ${STAGING_KERNEL_DIR}/arch/${ARCH}/	
+	elif [ -e arch/x86/include/asm/ ] ; then
+		cp -fR arch/x86/include/asm/* ${STAGING_KERNEL_DIR}/include/$ASMDIR/
+                install -d ${STAGING_KERNEL_DIR}/arch/x86/include
+                cp -fR arch/x86/* ${STAGING_KERNEL_DIR}/arch/x86/
 	fi
 	rm -f $ASMDIR ${STAGING_KERNEL_DIR}/include/asm
 	ln -sf $ASMDIR ${STAGING_KERNEL_DIR}/include/asm

--AhhlLboLdkugWU4S--
