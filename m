Received: from 10.mo3.mail-out.ovh.net ([87.98.165.232]
	helo=mo3.mail-out.ovh.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1Tmn4M-0000b7-Kx
	for openembedded-devel@lists.openembedded.org;
	Sun, 23 Dec 2012 16:02:26 +0100
Received: from mail176.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo3.mail-out.ovh.net (Postfix) with SMTP id A58FCFF91F1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Dec 2012 16:00:06 +0100 (CET)
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 23 Dec 2012 16:47:39 +0200
Received: from cug31-2-82-228-86-110.fbx.proxad.net (HELO eb-e6520)
	(eric%eukrea.com@82.228.86.110)
	by ns0.ovh.net with SMTP; 23 Dec 2012 16:47:37 +0200
Date: Sun, 23 Dec 2012 15:47:36 +0100
From: Eric =?ISO-8859-1?B?QuluYXJk?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
X-Ovh-Mailout: 178.32.228.3 (mo3.mail-out.ovh.net)
Message-ID: <20121223154736.3c151ef8@eb-e6520>
In-Reply-To: <20121222120551.6916471a@eb-e6520>
References: <CAMBWrQnMQtEs78=OtkSR1mjctfet8ArQ_XE43wDB6-6NKiDShA@mail.gmail.com>
	<CAMBWrQm6UbF9t5sAn=oudmhQ2MJdDNMb3ki6o7_sdjErun4SWw@mail.gmail.com>
	<CA+chaQcvSts25RvERVyOxOcsqaLRfADf8zTq_YpqAB8Bp_O+fg@mail.gmail.com>
	<CAMBWrQ=J8n9tm99UT0QvcU1oB4kUtpH+kguDUYfxWP7_u_TPYQ@mail.gmail.com>
	<20121222100318.14a48e10@eb-e6520> <kb40tq$84p$1@ger.gmane.org>
	<20121222120551.6916471a@eb-e6520>
Organization: =?ISO-8859-1?B?RXVrculh?= Electromatique
X-Mailer: Claws Mail 3.9.0 (GTK+ 2.24.8; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
X-Ovh-Tracer-Id: 1840001923099241801
X-Ovh-Remote: 82.228.86.110 (cug31-2-82-228-86-110.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-OVH-SPAMSTATE: OK
X-OVH-SPAMSCORE: 0
X-OVH-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeehledrudduucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecunecuhfhrohhmpefgrhhitgcuueornhgrrhguuceovghrihgtsegvuhhkrhgvrgdrtghomheqnecujfgurhepfffhvffukfgjfhhoofggtgesmhdtreerredtvd
X-Spam-Check: DONE|U 0.5/N
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeehledrudduucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecunecuhfhrohhmpefgrhhitgcuueornhgrrhguuceovghrihgtsegvuhhkrhgvrgdrtghomheqnecujfgurhepfffhvffukfgjfhhoofggtgesmhdtreerredtvd
Cc: koen@dominion.thruhere.net
Subject: Re: Multiple .bb files are due to be built which each provide udev
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
X-List-Received-Date: Sun, 23 Dec 2012 15:02:26 -0000
X-Groupsio-MsgNum: 42374
Content-Type: multipart/mixed; boundary="MP_/rm==wTSOn2GfUK//j/9L1ip"

--MP_/rm==wTSOn2GfUK//j/9L1ip
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Koen,

I need your help concerning denzil if you need to keep systemd 189
there :

with PREFERRED_PROVIDER_udev = "udev"
systemd fails to package here
(extract of systemd-git-r6/temp/log.do_package_write_ipk.20773
attached : there are references to udev-182 in this log !).

reverting 6e0ddd4526f3e0005babe9381c17c06c22a9eda3
fix this problem.

OE Build Configuration:
BB_VERSION        = "1.15.2"
TARGET_ARCH       = "arm"
TARGET_OS         = "linux-gnueabi"
MACHINE           = "mx35"
DISTRO            = "defaultsetup"
DISTRO_VERSION    = "oe-core.0"
TUNE_FEATURES     = "armv6 vfp arm1136jfs"
TARGET_FPU        = "vfp"
meta-oe           
toolchain-layer   
meta-efl          
meta-gpe          
meta-gnome        
meta-xfce         
meta-initramfs    = "denzil:a6f56d7eabe50dc55198aa8b8b349dbbb40757b1"
meta-fsl-arm      = "denzil:debea1a3c80227b33a3bbaa21c51435db1b3f5d7"
meta-eukrea       =
"denzil-yocto1.2:71ac1e8bfd09e726ed813b62aa5288a21873108a"
meta              = "denzil:d35560f33f257bd12a07c7c0be770319086d6ad9"

Do you have any idea on how to fix that ?

Thanks,
Eric

--MP_/rm==wTSOn2GfUK//j/9L1ip
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=udev_error.txt

Packaged contents of udev-systemd into /scratch/eb/kr/setup-scripts/build/tmp-defaultsetup-eglibc-eglibc/work/arm
v6-vfp-oe-linux-gnueabi/udev-182-r0/deploy-ipks/armv6-vfp/udev-systemd_182-r0_armv6-vfp.ipk
ERROR: Error executing a python function in /scratch/eb/kr/setup-scripts/sources/meta-openembedded/meta-oe/recipe
s-core/systemd/systemd_git.bb:
OSError: [Errno 2] No such file or directory: '/scratch/eb/kr/setup-scripts/build/tmp-defaultsetup-eglibc-eglibc/
work/armv6-vfp-oe-linux-gnueabi/udev-182-r0/packages-split/systemd-gui'

ERROR: The stack trace of python calls that resulted in this exception/failure was:
ERROR:   File "do_package_ipk", line 173, in <module>
ERROR: 
ERROR:   File "do_package_ipk", line 44, in do_package_ipk
ERROR: 
ERROR: The code that was being executed was:
ERROR:      0169:               bb.utils.unlockfile(lf)
ERROR:      0170:
ERROR:      0171:
ERROR:      0172:
ERROR:  *** 0173:do_package_ipk(d)
ERROR:      0174:
ERROR: (file: 'do_package_ipk', lineno: 173, function: <module>)
ERROR:      0040:               basedir = os.path.join(os.path.dirname(root))
ERROR:      0041:               arch = localdata.getVar('PACKAGE_ARCH', True)
ERROR:      0042:               pkgoutdir = "%s/%s" % (outdir, arch)
ERROR:      0043:               bb.mkdirhier(pkgoutdir)
ERROR:  *** 0044:               os.chdir(root)
ERROR:      0045:               from glob import glob
ERROR:      0046:               g = glob('*')
ERROR:      0047:               try:
ERROR:      0048:                       del g[g.index('CONTROL')]
ERROR: (file: 'do_package_ipk', lineno: 44, function: do_package_ipk)
ERROR: Function failed: do_package_ipk

--MP_/rm==wTSOn2GfUK//j/9L1ip--
