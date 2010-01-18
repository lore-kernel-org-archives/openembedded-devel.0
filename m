Received: from [213.79.90.228] (helo=buildserver.ru.mvista.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <amakarov@dev.rtsoft.ru>) id 1NWzKD-0005Dx-1O
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Jan 2010 22:39:56 +0100
Received: from [192.168.5.14] (unknown [10.150.0.9])
	by buildserver.ru.mvista.com (Postfix) with ESMTP id A66E58817
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jan 2010 01:06:31 +0400 (SAMT)
Message-ID: <4B54CD4F.8080401@dev.rtsoft.ru>
Date: Tue, 19 Jan 2010 03:06:23 +0600
From: Aleksey Makarov <amakarov@dev.rtsoft.ru>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.5) Gecko/20100104 Thunderbird/3.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 213.79.90.228
X-SA-Exim-Mail-From: amakarov@dev.rtsoft.ru
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] Fix kernel build, version >= 2.6.33-rc1, arch x86
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
X-List-Received-Date: Mon, 18 Jan 2010 21:39:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

A check was missed in the x86 path of the stage method.  Compare it to the common path.

---
 classes/kernel.bbclass |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/classes/kernel.bbclass b/classes/kernel.bbclass
index 83530b5..53ea252 100644
--- a/classes/kernel.bbclass
+++ b/classes/kernel.bbclass
@@ -112,7 +112,9 @@ kernel_do_stage() {
 
 	# Check for arch/x86 on i386
 	elif [ -d arch/x86/include/asm/ ]; then
-		cp -fR arch/x86/include/asm/* ${STAGING_KERNEL_DIR}/include/asm-x86/
+		if [ -e include/asm ] ; then
+			cp -fR arch/x86/include/asm/* ${STAGING_KERNEL_DIR}/include/asm-x86/
+		fi
 		install -d ${STAGING_KERNEL_DIR}/arch/x86/include
 		cp -fR arch/x86/* ${STAGING_KERNEL_DIR}/arch/x86/
 	fi
-- 
1.6.4.4



