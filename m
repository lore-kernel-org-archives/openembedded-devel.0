Received: from mx194.callplus.net.nz ([202.180.66.194]
	helo=mxi2.callplus.net.nz) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <roystonvasey@slingshot.co.nz>) id 1SAT18-000284-1X
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Mar 2012 22:24:26 +0100
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: Ap4EAIxEak/LYgoS/2dsb2JhbABEgka1TIIQCAIeBVkFBmI/AQQeBYd5l3OGQZluE41MgyIEpgaCfQ
X-IronPort-AV: E=Sophos;i="4.73,626,1325415600"; 
	d="scan'208,217";a="252166662"
Received: from smtp.connexionz.co.nz (HELO mikepad) ([203.98.10.18])
	by ismtp2.tranzpeer.net with ESMTP; 22 Mar 2012 10:15:30 +1300
From: "R U Local" <roystonvasey@slingshot.co.nz>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 22 Mar 2012 10:15:26 +1300
Message-ID: <003901cd07a7$bc69de00$353d9a00$@slingshot.co.nz>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 14.0
Thread-Index: Ac0Hpu+Vn/JkFbkGQ7Orqoii6jlUfQ==
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: ti-eula-unpack problem
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
X-List-Received-Date: Wed, 21 Mar 2012 21:24:26 -0000
Content-Language: en-nz
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Dear List,

A resent change to ti-eula-unpack.inc to test for 32 bit compatability on 64
bit systems has broken the build on Ubuntu x64 11.10.

Ubuntu created multi-arch functionality between 11.4 and 11.10. There is are
now  /lib /lib64 and /lib32 directories and no symlinks.

The following patch corrects this on my system but I have no idea of its
effect on others.

 

diff --git a/recipes-ti/includes/ti-eula-unpack.inc
b/recipes-ti/includes/ti-eula-unpack.inc

index dcabe9d..f37f026 100644

--- a/recipes-ti/includes/ti-eula-unpack.inc

+++ b/recipes-ti/includes/ti-eula-unpack.inc

@@ -21,7 +21,7 @@ python ti_bin_do_unpack() {

     # InstallJammer requires 32bit version of glibc

     lib32path = '/lib'

-    if os.path.exists('/lib64') and ( os.path.islink('/lib64') or
os.path.islink('/lib') ):

+    if os.path.exists('/lib64') and ( os.path.islink('/lib64') or
os.path.islink('/lib') or os.path.exists('/lib32')):

        lib32path = '/lib32'

     if not os.path.exists('%s/libc.so.6' % lib32path):

        raise bb.build.FuncFailed, \

 

Cheers Mike.

 

 


