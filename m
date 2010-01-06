Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1NSNQa-0006gZ-0d
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Jan 2010 05:23:27 +0100
Received: (qmail 12113 invoked by uid 1003); 6 Jan 2010 04:21:18 -0000
Received: from localhost (HELO ?192.168.1.167?) (philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 6 Jan 2010 04:21:18 -0000
Message-ID: <4B440FBA.8060103@balister.org>
Date: Tue, 05 Jan 2010 23:21:14 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.5) Gecko/20091209 Fedora/3.0-3.fc11 Thunderbird/3.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Add libtool related stuff to task-native-sdk
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
X-List-Received-Date: Wed, 06 Jan 2010 04:23:27 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Does anyone object if I push these changes to task-native-sdk? I've been 
talking with some people doing builds on omap3 hardware and it looks 
like this change will make things easier for them.

Philip

diff --git a/recipes/tasks/task-sdk-native.bb 
b/recipes/tasks/task-sdk-native.bb
index 35ddf78..e21384b 100644
--- a/recipes/tasks/task-sdk-native.bb
+++ b/recipes/tasks/task-sdk-native.bb
@@ -1,15 +1,16 @@
  DESCRIPTION = "Packages required for native (on-device) SDK"
  LICENSE = "MIT"
-DEPENDS = "virtual/libc gcc binutils make patch patchutils diffstat 
diffutils automake flex bison gawk sed grep"
+DEPENDS = "virtual/libc gcc binutils make patch patchutils diffstat 
diffutils automake flex bison gawk sed grep libtool pkgconfig"
  RDEPENDS = "gcc-symlinks g++-symlinks cpp cpp-symlinks binutils-symlinks \
             make virtual-libc-dev \
             task-proper-tools perl-modules flex flex-dev bison gawk sed 
grep autoconf automake make \
-           patch patchutils diffstat diffutils libstdc++-dev"
+           patch patchutils diffstat diffutils libstdc++-dev \
+            libtool libtool-dev libltdl-dev pkgconfig"

  RECOMMENDS = " g77-symlinks gfortran-symlinks "
  RPROVIDES_${PN} = "task-native-sdk"

-PR = "r7"
+PR = "r8"

  ALLOW_EMPTY = "1"
  PACKAGES = "${PN}"



