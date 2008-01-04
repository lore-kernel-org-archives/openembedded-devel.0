Received: from [72.14.220.155] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1JAcjO-0001NE-Lm
	for openembedded-devel@openembedded.org; Fri, 04 Jan 2008 03:56:22 +0100
Received: by fg-out-1718.google.com with SMTP id e12so3134828fga.0
	for <openembedded-devel@openembedded.org>;
	Thu, 03 Jan 2008 18:49:50 -0800 (PST)
Received: by 10.86.74.15 with SMTP id w15mr15263232fga.43.1199409186324;
	Thu, 03 Jan 2008 17:13:06 -0800 (PST)
Received: from paul.bn.lan ( [194.79.8.34])
	by mx.google.com with ESMTPS id d13sm22814727fka.16.2008.01.03.17.13.05
	(version=SSLv3 cipher=OTHER); Thu, 03 Jan 2008 17:13:05 -0800 (PST)
Date: Fri, 4 Jan 2008 03:17:51 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Mailer: The Bat! (v3.64.01 Christmas Edition) Professional
X-Priority: 3 (Normal)
Message-ID: <1068494393.20080104031751@gmail.com>
To: openembedded-devel@openembedded.org
MIME-Version: 1.0
Subject: Another weird case of PACKAGES_DYNAMIC and task deps, it seems
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
X-List-Received-Date: Fri, 04 Jan 2008 02:56:23 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello openembedded-devel,

  Situation (as reported by Thomas Kunze on IRC):
1. Build from scratch
2. Kernel has been built.
3. Bitbake of initramfs-image.
4. Failure with:

| ERROR: Cannot satisfy the following dependencies for initramfs-module-loop:
|        update-modules update-modules update-modules
| ERROR: Cannot satisfy the following dependencies for initramfs-module-nfs:
|        update-modules

initramfs-module-* doesn't Depends: on update-modules directly, but
they Suggest: some kernel-module-* which in turn Depends: on
update-modules.

5. Manual explicit build of update-modules clears those errors.

   My analysis:

kernel.bbclass has:

DEPENDS += "virtual/${TARGET_PREFIX}depmod-${@get_kernelmajorversion('${PV}')} virtual/${TARGET_PREFIX}gcc${KERNEL_CCSUFFIX} update-modules"

But as we now know, that doesn't mean there will be package written
for update-modules, only that it will be "built".

Then, do_spli_package() kinda should set RDEPENDS for each module, but
I remember we already discussed issue that this doesn't really work
for PACKAGES_DYNAMIC ;-(.

So, any ideas how to at least work this around? I recently hit similar
issue when package_ipk.bbclass tried to execute ipkg-build before it
was staged, and that was fixed in natural way:

do_package_write_ipk[depends] = "ipkg-utils-native:do_populate_staging"

Maybe we could use that as a workaround for kernel.bbclass, so we
don't go packing modules, until update-modules' package is written.
The issue, kernel.bbclass doesn't even define proper task for that,
only a prepender, so I have no idea what to put dependency on.


     Richard, any comments?


-- 
Best regards,
 Paul                          mailto:pmiscml@gmail.com



