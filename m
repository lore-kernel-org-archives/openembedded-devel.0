Received: from 68.mail-out.ovh.net ([91.121.185.69])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1OCwhc-0008Kk-6E
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 May 2010 17:21:31 +0200
Received: (qmail 8659 invoked by uid 503); 14 May 2010 15:15:44 -0000
Received: from 63.mail-out.ovh.net (91.121.185.56)
	by 68.mail-out.ovh.net with SMTP; 14 May 2010 15:15:44 -0000
Received: (qmail 28757 invoked by uid 503); 14 May 2010 15:18:53 -0000
Received: from b6.ovh.net (HELO mail186.ha.ovh.net) (213.186.33.56)
	by 63.mail-out.ovh.net with SMTP; 14 May 2010 15:18:53 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 14 May 2010 15:10:53 -0000
Received: from cug31-2-82-228-86-110.fbx.proxad.net (HELO ?192.168.0.7?)
	(ebenard%eukrea.com@82.228.86.110)
	by ns0.ovh.net with SMTP; 14 May 2010 15:10:51 -0000
Message-ID: <4BED67FB.1060900@eukrea.com>
Date: Fri, 14 May 2010 17:10:51 +0200
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; fr;
	rv:1.9.1.9) Gecko/20100317 Thunderbird/3.0.4
MIME-Version: 1.0
To: k.kooi@student.utwente.nl
References: <1272921691-6963-1-git-send-email-eric@eukrea.com>
In-Reply-To: <1272921691-6963-1-git-send-email-eric@eukrea.com>
X-Ovh-Tracer-Id: 7492582406815133141
X-Ovh-Remote: 82.228.86.110 (cug31-2-82-228-86-110.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Ovh-Tracer-Id: 7575054573804105033
X-SA-Exim-Connect-IP: 91.121.185.69
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: [RFC][PATCH] module-base.bbclass: keep PR if MACHINE_KERNEL_PR is not set
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
X-List-Received-Date: Fri, 14 May 2010 15:21:32 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi Koen,

I was told you are the person to contact about MACHINE_KERNEL_PR so may 
you please have a look to the patch below - also available here : 
http://patchwork.openembedded.org/patch/2012/

Actually, when compiling modules (out of tree), we loose PR if 
MACHINE_KERNEL_PR is not set.

Is this patch fine to solve this problem or is there another prefered way ?

The same problem was already solved in kernel.bbclass by the following 
comit
http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=35e7b34d3b5b96ed11bc7ed6b2a5d08e6183d8a3

Thanks,
Eric

Signed-off-by: Eric Benard<eric@eukrea.com>
---
   classes/module-base.bbclass |    7 ++++++-
   1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/classes/module-base.bbclass b/classes/module-base.bbclass
index bc53e1b..9aaaa4e 100644
--- a/classes/module-base.bbclass
+++ b/classes/module-base.bbclass
@@ -7,7 +7,12 @@ export CROSS_COMPILE = "${TARGET_PREFIX}"

   # A machine.conf or local.conf can increase MACHINE_KERNEL_PR to force
   # rebuilds for kernel and external modules
-PR = "${MACHINE_KERNEL_PR}"
+python __anonymous () {
+    machine_kernel_pr = bb.data.getVar('MACHINE_KERNEL_PR', d, True)
+
+    if machine_kernel_pr:
+       bb.data.setVar('PR', machine_kernel_pr, d)
+}

   export KERNEL_VERSION = 
"${@base_read_file('${STAGING_KERNEL_DIR}/kernel-abiversion')}"
   export KERNEL_SOURCE = 
"${@base_read_file('${STAGING_KERNEL_DIR}/kernel-source')}"


