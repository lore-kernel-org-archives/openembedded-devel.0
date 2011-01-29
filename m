Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1Pj1SE-0008DJ-0H
	for openembedded-devel@lists.openembedded.org;
	Sat, 29 Jan 2011 04:26:26 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id 1904D314D513
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Jan 2011 04:25:34 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id HMyiF6TI6QQ9
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Jan 2011 04:25:28 +0100 (CET)
Received: from [172.22.22.61] (ip-94-79-168-47.unitymediagroup.de
	[94.79.168.47])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.multimedia-labs.de (Postfix) with ESMTPSA id 97AEA314D363
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Jan 2011 04:25:28 +0100 (CET)
Message-ID: <4D4388AA.40208@opendreambox.org>
Date: Sat, 29 Jan 2011 04:25:30 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.13) Gecko/20101210 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH/RFC] kernel module dependencies / my recent commits
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
X-List-Received-Date: Sat, 29 Jan 2011 03:26:26 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi all,

it seems that my last commits broke the build of external kernel modules
at least on clean builds, but maybe also for incremental builds.

To quote from my commit message:

* As a special case, kernel modules must depend on
kernel-${KERNEL_VERSION}, which gets runtime provided by the kernel
package. The reason is, that the package version can be different from
${KERNEL_VERSION}, because the latter depends on the kernel
configuration, e.g. CONFIG_LOCALVERSION.

This is also what kernel.bbclass does when calling do_split_packages().

Now it seems like there's a problem with using the variable
KERNEL_VERSION as part of a recipe's RDEPENDS, when used in a package's
name, because it can be empty before the kernel is built (and apparently
it may also become empty when loaded from BitBake's cache).

I've included a patch to kernel.bbclass to workaround or solve this
problem below, but I'm not sure whether it's the right thing.

If it's not and if there's no better solution, then please revert my
commits using

git revert 254193c8f65511a8f344559f7714b50d35afb22b...
2dac84b9a7b820466ed626420fec120093b56e16

I am sorry for the inconvenience I've caused.

Regards,
Andreas

---
kernel.bbclass: Add kernel-* to PACKAGES_DYNAMIC

* Use it as a hint for BitBake to know that packages inheriting
kernel.bbclass do provide kernel-x.y.z-localversion.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>

diff --git a/classes/kernel.bbclass b/classes/kernel.bbclass
index ea1daf6..0d1b4ad 100644
--- a/classes/kernel.bbclass
+++ b/classes/kernel.bbclass
@@ -32,6 +32,7 @@ INITRAMFS_TASK ?= ""

 inherit kernel-arch

+PACKAGES_DYNAMIC += "kernel-*"
 PACKAGES_DYNAMIC += "kernel-module-*"
 PACKAGES_DYNAMIC += "kernel-image-*"
 PACKAGES_DYNAMIC += "kernel-firmware-*"



