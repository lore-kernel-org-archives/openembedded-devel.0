Return-Path: <openembedded@emagii.com>
X-Greylist: delayed 362 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 20 Jun 2016 12:14:30 UTC
Received: from v-smtpout3.han.skanova.net (v-smtpout3.han.skanova.net
	[81.236.60.156])
	by mail.openembedded.org (Postfix) with ESMTP id 9A3C760110
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Jun 2016 12:14:30 +0000 (UTC)
Received: from [10.175.196.110] ([155.4.129.69]) by cmsmtp with SMTP
	id Ey0BbCL3ubd4bEy0BbBpV9; Mon, 20 Jun 2016 14:08:27 +0200
To: openembedded-devel@lists.openembedded.org
From: Ulf Samuelsson <openembedded@emagii.com>
Message-ID: <7fb5e28e-d153-a396-58ae-c4d656835524@emagii.com>
Date: Mon, 20 Jun 2016 14:08:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfCpUWQKBbevhFdbDXZ/RBnv3ydD0ua/JxPEGmhvibeyI4CgRKTHXwR03LuNdfjO3aAurCsKJH3LarpS7p3PvXGPlABTJkotryp549gdLpesM2pVtsJaQ
	N3Nf2BZcQQ4RxkOWiouu8S23ijiUMkBoTb9BPGQTyvKX9Obtg+rukq9+dKhBh/fY4r5099KeQXFkeVourVvwuGGvqvdYtz+gCbE=
Subject: Using EXTERNALSRC in practice
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 20 Jun 2016 12:14:31 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

We have a meta-layer which builds the kernel.

This contains among other things:

FILESEXTRAPATHS_prepend_<machine> = "${THIS_DIR}/<machine>"

SRC_URI = "git://<server>/<repo.git>;protocol=ssh;branch=<branch>"
SRC_URI += "file://defconfig"

PV = "...+git${SRCPV}"
SRCREV = "<shaid>"
...

Would like to have an option to build the kernel with external source.
That option should be easy to enable/disable

The idea is to add another layer containing a bbappend.
The build is done outside the Yocto tree using a Makefile.
The make generates the bblayer.conf file, and the layer may or may not 
be added.


The kernel is located inside the Yocto tree, and the build is outside 
the Yocto tree.

The first problem I have is to locate the kernel source.
Is there a way to find out the path to a kernel bbappend inside the 
bbappend?
 From there, I can use relative addressing.

Right now, I am setting a variable in the local.conf file from the Makefile,
but would like to avoid that.

Second problem:

What are the contents of the bbappend?
I find no examples.

It does not make sense to have a SRC_URI for the kernel source, if the 
source is already present.

What about the defconfig?
The same kernel source will be useful for several machines, so it would 
be good to
have the source there and then add configuration.

Are there any examples at all somewhere?

BR
Ulf Samuelsson



