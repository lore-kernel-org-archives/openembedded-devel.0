Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <bgamari.foss@gmail.com>) id 1PKhUq-00029I-JO
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Nov 2010 02:16:37 +0100
Received: by qwf7 with SMTP id 7so152766qwf.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Nov 2010 17:15:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:user-agent
	:date:message-id:mime-version:content-type:content-transfer-encoding;
	bh=bbLaMRQpBROna6Nd+pD1tuv0NvdEe/Phq83lVZLohsk=;
	b=PN8s9u+VU2bVAPIsptffo/fGsysLHOWPCaeX5DIBYwsiey+Rkcum3BtjKg99sS43Nx
	fCwv0cY6lfZ4NRaQuBc7mReJa5ekETiEohxouV+FAvQ7hZXOIwxg9gHwc7l6mmeRs4ap
	E5kQZFpznYP678mrSXBfIWfxuK13M64EDU21k=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:user-agent:date:message-id:mime-version
	:content-type:content-transfer-encoding;
	b=nRu3WI07vq1qk5uUUwYKKMpwOs4GgYZ6FWRHftejkUE7lrTJ4GKzyi6kruyug+UQPm
	c/+nElC8qxgtjrDN+Jkewlj14gZJ6zdUiwIBr5pFYmCImV3glc2Qq82kzqyLVeqmTPpm
	8fXakvPSllmqIlgAGGLJ8MSlZjzIwu/TUj/Po=
Received: by 10.224.54.143 with SMTP id q15mr565183qag.330.1290474922524;
	Mon, 22 Nov 2010 17:15:22 -0800 (PST)
Received: from localhost (gamari.physics.umass.edu [128.119.56.223])
	by mx.google.com with ESMTPS id nb14sm3260068qcb.36.2010.11.22.17.15.21
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 22 Nov 2010 17:15:21 -0800 (PST)
From: Ben Gamari <bgamari.foss@gmail.com>
To: openembedded-devel@lists.openembedded.org
User-Agent: Notmuch/0.5-3-g22aadfc (http://notmuchmail.org) Emacs/23.1.1
	(x86_64-pc-linux-gnu)
Date: Mon, 22 Nov 2010 20:15:20 -0500
Message-ID: <87y68kx2l3.fsf@gmail.com>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 209.85.216.47
X-SA-Exim-Mail-From: bgamari.foss@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: =?utf-8?Q?Am=C3=A9rico?= Wang <xiyou.wangcong@gmail.com>,
	Egger <siccegge@cs.fau.de>, Sam Ravnborg <sam@ravnborg.org>,
	linux-kbuild <linux-kbuild@vger.kernel.org>, Christoph
Subject: Kernel build under meta-toolchain SDK fails
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
X-List-Received-Date: Tue, 23 Nov 2010 01:16:37 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hey all,

Recently I tried updating our openembedded environment for an embedded
application built around the BeagleBoard. Unfortunately, the build
failed while configuring the kernel with an inexplicable bus error. To
trace down the issue I installed the latest meta-toolchain sdk and tried
building a kernel. This resulted in an identical failure,

$ make
  HOSTCC  scripts/basic/fixdep
In file included from /usr/local/angstrom/arm/arm-angstrom-linux-gnueabi/us=
r/include/stdlib.h:903,
                 from scripts/basic/fixdep.c:112:
/usr/local/angstrom/arm/arm-angstrom-linux-gnueabi/usr/include/bits/stdlib.=
h:65: warning: no previous prototype for =E2=80=98ptsname_r=E2=80=99
/bin/sh: line 1:  4192 Bus error               scripts/basic/fixdep scripts=
/basic/.fixdep.d scripts/basic/fixdep 'gcc -Wp,-MD,scripts/basic/.fixdep.d =
-Wall -Wmissing-prototypes -Wstrict-prototypes -O2 -fomit-frame-pointer    =
 -o scripts/basic/fixdep scripts/basic/fixdep.c  ' > scripts/basic/.fixdep.=
tmp
make[2]: *** [scripts/basic/fixdep] Error 135
make[1]: *** [scripts_basic] Error 2
make: *** No rule to make target `include/config/auto.conf', needed by `inc=
lude/config/kernel.release'.  Stop.

The problem is quite early in the build since even make oldconfig fails
in this way. I tried tracking down the bug on the LKML[1] but after some
discussion it seems very likely the problem is a toolchain issue. At
least part of the problem seems to be in fixdep, which fails very
strangely in fstat[2]. I've done quite a bit of debugging[2], but it
seems to be a bit of a heisenbug.

Interestingly enough, I can reproduce the issue both on my personal
laptop (running Ubuntu 10.10, gcc 4.4.5) and our build server (running
Ubuntu 10.04, gcc 4.4.3). It would be great if someone could try
building a kernel from master using openembedded master. Otherwise, any
ideas would be greatly appreciated.

Cheers,

- Ben


[1] http://lkml.org/lkml/2010/11/6/90
[2] http://lkml.org/lkml/2010/11/7/78


