Received: from [66.111.4.25] (helo=out1.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <rod@whitby.id.au>) id 1IyloO-00064N-3w
	for openembedded-devel@openembedded.org; Sun, 02 Dec 2007 11:12:32 +0100
Received: from compute2.internal (compute2.internal [10.202.2.42])
	by out1.messagingengine.com (Postfix) with ESMTP id 12E0A58D37;
	Sun,  2 Dec 2007 05:09:13 -0500 (EST)
Received: from heartbeat1.messagingengine.com ([10.202.2.160])
	by compute2.internal (MEProxy); Sun, 02 Dec 2007 05:09:13 -0500
X-Sasl-enc: NGj9yD1c1Q9KM1k08F0G5c7wnTNmE6COCyaQlSc0rnAH 1196590152
Received: from [192.168.18.13] (CPE-121-209-18-182.sa.bigpond.net.au
	[121.209.18.182])
	by mail.messagingengine.com (Postfix) with ESMTP id DE3F162CB;
	Sun,  2 Dec 2007 05:09:11 -0500 (EST)
Message-ID: <47528426.1040502@whitby.id.au>
Date: Sun, 02 Dec 2007 20:38:38 +1030
From: Rod Whitby <rod@whitby.id.au>
User-Agent: Thunderbird 2.0.0.9 (Windows/20071031)
MIME-Version: 1.0
To: angstrom-distro-devel@linuxtogo.org
References: <475207FB.8020405@whitby.id.au> <47522D46.1050309@whitby.id.au>
	<475269FD.60409@student.utwente.nl>
In-Reply-To: <475269FD.60409@student.utwente.nl>
Cc: openembedded-devel <openembedded-devel@openembedded.org>
Subject: Re: [Angstrom-devel] RFC: Add ipkg to minimal image
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 02 Dec 2007 10:12:32 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Koen Kooi wrote:
> Rod Whitby schreef:
>> OK, of course the choice of ipkg as the package manager is
>> distro-specific, and depends on the distro including feed configuration
>> (although just having a package manager on hand even without a feed
>> configuration would be a useful addition to a minimal image).
> 
>> So my revised RFC #2 is to add a DISTRO_PACKAGE_MANAGER variable, which
>> DISTROs define 
> 
> DISTRO_PACKAGE_MANAGER is in package-space, so it should only show up in
> R*, right? Sounds like a pretty good idea. As a side note, distros will
> need to do more than that to switch packageformat or packagemanager, but
> that's outside the scope of this discussion.

My proposed patch follows.  Any objections?

============================================================
--- conf/distro/angstrom-2007.1.conf    c6bbfa10816eda24513e92b21827c75003bb4daa
+++ conf/distro/angstrom-2007.1.conf    508cc6d61d863e169c13b5ff0295b66f3608f6de
@@ -224,7 +224,6 @@ EXTRA_STUFF ?= ""


 # Angstrom want to ship some extra stuff. This should be moved into task-base eventually
-# contains ipkg specific stuff as well :(

 #work around a bitbake bug where mtd-utils-native isn't created so do_rootfs fails
 DISTRO_EXTRA_DEPENDS += " \
@@ -235,7 +234,6 @@ DISTRO_EXTRA_RDEPENDS += "\
     update-modules \
     ${@base_contains("MACHINE_FEATURES", "screen", "psplash", "",d)} \
     angstrom-version \
-    ipkg ipkg-collateral \
     util-linux-mount util-linux-umount \
     ${EXTRA_STUFF} \
     ${DEBUG_APPS} \
============================================================
--- packages/images/minimal-image.bb    c74056146aaed6f3e2cd64879f504ea6920efb59
+++ packages/images/minimal-image.bb    dc0caa8692fe8e856f0e752e6d88fe50851fe435
@@ -1,12 +1,14 @@ DISTRO_SSH_DAEMON ?= "dropbear"
 #Angstrom minimalist image
 #gives you a small images with ssh access

 ANGSTROM_EXTRA_INSTALL ?= ""
 DISTRO_SSH_DAEMON ?= "dropbear"
+DISTRO_PACKAGE_MANAGER ?= "ipkg ipkg-collateral"

 IMAGE_INSTALL = "task-boot \
             util-linux-mount util-linux-umount \
             ${DISTRO_SSH_DAEMON} \
+            ${DISTRO_PACKAGE_MANAGER} \
             angstrom-version \
           "

============================================================
--- packages/tasks/task-base.bb 6f33e4ea8083953d24993dca089ae71114f8a639
+++ packages/tasks/task-base.bb 22635c1ee42f15cae81e8d4a5b07e8dea4b07f49
@@ -64,6 +64,11 @@ DISTRO_SSH_DAEMON ?= "dropbear"
 DISTRO_SSH_DAEMON ?= "dropbear"

 #
+# ipkg, or something else
+#
+DISTRO_PACKAGE_MANAGER ?= "ipkg ipkg-collateral"
+
+#
 # pcmciautils for >= 2.6.13-rc1, pcmcia-cs for others
 #
 PCMCIA_MANAGER ?= "${@base_contains('MACHINE_FEATURES', 'kernel26','pcmciautils','pcmcia-cs',d)} "
@@ -82,6 +87,7 @@ RDEPENDS_task-base = "\
     task-distro-base \
     task-machine-base \
     ${DISTRO_SSH_DAEMON} \
+    ${DISTRO_PACKAGE_MANAGER} \
     ${HOTPLUG} \
     \
     ${@base_contains('MACHINE_FEATURES', 'kernel26','task-base-kernel26','task-base-kernel24',d)} \

-- Rod


