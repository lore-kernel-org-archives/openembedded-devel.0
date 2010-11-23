Received: from smtp4.mundo-r.com ([212.51.32.151])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vjaquez@igalia.com>) id 1PKrCU-0006YT-HJ
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Nov 2010 12:38:20 +0100
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AqYEAGc260xbdWOb/2dsb2JhbACUYY50vS+FSwQ
X-IronPort-AV: E=Sophos;i="4.59,241,1288566000"; d="scan'208";a="782240453"
Received: from 155.99.117.91.static.mundo-r.com (HELO fanzine.igalia.com)
	([91.117.99.155])
	by smtp4.mundo-r.com with ESMTP; 23 Nov 2010 12:37:07 +0100
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
	by fanzine.igalia.com with esmtps 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim) id 1PKrBL-0002Fc-A1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Nov 2010 12:37:07 +0100
Received: from ip148.dynamic.igalia.com ([192.168.10.148]
	helo=lit.local.igalia.com) by mail.igalia.com with esmtps 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim) id 1PKrBL-00060Q-4f
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Nov 2010 12:37:07 +0100
Received: from vjaquez by lit.local.igalia.com with local (Exim 4.72)
	(envelope-from <vjaquez@igalia.com>) id 1PKrBK-0005nq-RZ
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Nov 2010 12:37:06 +0100
Date: Tue, 23 Nov 2010 12:37:06 +0100
From: =?iso-8859-1?Q?V=EDctor_M=2E_J=E1quez_L=2E?= <vjaquez@igalia.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101123113706.GA3533@lit.local.igalia.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 212.51.32.151
X-SA-Exim-Mail-From: vjaquez@igalia.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_NEUTRAL autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: external-toolchain-csl-1.0-r6 fails
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
X-List-Received-Date: Tue, 23 Nov 2010 11:38:20 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I'm trying to build minimal-image with CSL toolchain, but I got this error:

NOTE: package external-toolchain-csl-1.0-r6: task do_install: Started
ERROR: TaskFailed event exception, aborting
ERROR: Build of /media/DISK/vjaquez-angstrom-setup-scripts/sources/openembedded/recipes/meta/external-toolchain-csl.bb do_install failed
ERROR: Task 187 (/media/DISK/vjaquez-angstrom-setup-scripts/sources/openembedded/recipes/meta/external-toolchain-csl.bb, do_install) failed with 256
ERROR: '/media/DISK/vjaquez-angstrom-setup-scripts/sources/openembedded/recipes/meta/external-toolchain-csl.bb' failed
ERROR: Function do_install failed
NOTE: Task failed: ('function do_install failed', '/media/DISK/vjaquez-angstrom-setup-scripts/build/tmp-angstrom_2008_1/work/armv7a-angstrom-linux-gnueabi/external-toolchain-csl-1.0-r6/temp/log.do_install.22227')
ERROR: Logfile of failure stored in: /media/DISK/vjaquez-angstrom-setup-scripts/build/tmp-angstrom_2008_1/work/armv7a-angstrom-linux-gnueabi/external-toolchain-csl-1.0-r6/temp/log.do_install.22227
Log data follows:
| cp: cannot stat `/media/DISK/sgpp/arm-2010q1/arm-angstrom-linux-gnueabi/libc/lib/*': No such file or directory
| ERROR: Function do_install failed
NOTE: package external-toolchain-csl-1.0-r6: task do_install: Failed
ERROR: TaskFailed event exception, aborting

For some reason the variable ${TARGET_SYS} is evaluated as
arm-angstrom-linux-gnueabi instead of arm-none-linux-gnueabi which is the
correct value.

I could hack it with a symlink but I don't know if that's the correct
approach.

Any advise?

vmjl


