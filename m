Received: from [209.85.218.219] (helo=mail-bw0-f219.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <piero.pezzin@gmail.com>) id 1LsCyn-0004F5-UJ
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Apr 2009 11:25:08 +0200
Received: by bwz19 with SMTP id 19so966618bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Apr 2009 02:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=Cc+Pgus7/cB2dxv6B/ifCV7fd91Z/QGboM+fWTBAz4o=;
	b=d/mKP4taGR6JkobG105Mt0T7EI1hxVjEcri4g4q1jd+lkB5TQuW1Lddjo+/yZjZmPh
	ZwJnaVaaw3Te+Z4yw1+WBvicF95NAWlSO2wcVgEFYQMmq75P2IgcRB/04qoxAscZzKBL
	/9rX3V8f1tKKHpDBEYQJkWwS6C9gReWLxOq0o=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=fJC3oYmMEnveqY6TFCGJ40FlyBttWulrAAtFZdkUxxDTsyRPajv/i5tJAQreoDoE1B
	MlWRLTOQlPn6AnixzWv9OlqRStcriC2UdInVJjT3obrScyWleVbkCYW53zCLmEqydbft
	sVhLVuIBEL7M+/NpUsHD0Rb/7ZLjY/2pB5V+g=
MIME-Version: 1.0
Received: by 10.204.71.15 with SMTP id f15mr3096073bkj.113.1239355301380; Fri, 
	10 Apr 2009 02:21:41 -0700 (PDT)
Date: Fri, 10 Apr 2009 11:21:41 +0200
Message-ID: <49bdfd00904100221j30d41162u6fb0dc9c5f4a9a9b@mail.gmail.com>
From: Piero Pezzin <piero.pezzin@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 209.85.218.219
X-SA-Exim-Mail-From: piero.pezzin@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	RDNS_NONE,SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Problems with xfbdev building Angstrom for mx31
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
X-List-Received-Date: Fri, 10 Apr 2009 09:25:10 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi all,

I've a problem with Xfbdev I built using the Angstrom distribution
(bitbaking the gpe-image recipe).

The host machine is running Ubuntu 8.04 and the following is openembedded
configuration:

BB_VERSION        = "1.8.12"
METADATA_BRANCH   = "org.openembedded.dev"
METADATA_REVISION = "3c732c38d8edfc888faf83165b53470da5e96d5d"
TARGET_ARCH       = "arm"
TARGET_OS         = "linux-gnueabi"
MACHINE           = "qong"
DISTRO            = "angstrom"
DISTRO_VERSION    = "2009.X-test-20090410"
TARGET_FPU        = "hard"

Qong is a machine config I'm creating, but at the moment is the same as the
mx31ads except for the kernel (which is 2.6.22.6).

The build process completes successfully, the root file system si correctly
mounted but when Xfbdev starts the system hangs. Running strace, I see that
it crashes on ioctl(6, FBIOPUT_VSCREENINFO:

rt_sigaction(SIGHUP, {0xd83fc, [HUP], 0x4000000 /* SA_??? */}, {SIG_DFL}, 8)
= 0
rt_sigaction(SIGINT, {0xd83b0, [INT], 0x4000000 /* SA_??? */}, {SIG_DFL}, 8)
= 0
rt_sigaction(SIGTERM, {0xd83b0, [TERM], 0x4000000 /* SA_??? */}, {SIG_DFL},
8) = 0
open("/etc/X0.hosts", O_RDONLY)         = -1 ENOENT (No such file or
directory)
rt_sigaction(SIGUSR1, {SIG_IGN}, {SIG_DFL}, 8) = 0
rt_sigaction(SIGUSR1, {SIG_DFL}, {SIG_IGN}, 8) = 0
getppid()                               = 1512
gettimeofday({1237298779, 423458}, NULL) = 0
open("/dev/fb0", O_RDWR)                = 6
ioctl(6, FBIOGET_FSCREENINFO, 0x123790) = 0
ioctl(6, FBIOGET_VSCREENINFO, 0x1236f0) = 0
mmap2(NULL, 307200, PROT_READ|PROT_WRITE, MAP_SHARED, 6, 0) = 0x40360000
ioctl(6, FBIOGET_VSCREENINFO, 0xbebdea90) = 0
ioctl(6, FBIOPUT_VSCREENINFO


The strange thing is that, Xfbdev included in poky (pinky 3.1.1) runs
perfectly (using the same kernel).

Could someone help me to solve this issue? Any suggestion will be greatly
appreciated.


Regards,

Piero

