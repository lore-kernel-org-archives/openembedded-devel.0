Received: from [212.227.126.171] (helo=moutng.kundenserver.de)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <fischer@4g-systems.com>) id 1HYlUK-000457-U4
	for openembedded-devel@lists.openembedded.org;
	Tue, 03 Apr 2007 18:04:05 +0200
Received: from [213.238.49.68] (helo=dehamox1a.intra.4g-systems.com)
	by mrelayeu.kundenserver.de (node=mrelayeu4) with ESMTP (Nemesis),
	id 0ML21M-1HYlUI2o4o-0000eT; Tue, 03 Apr 2007 18:04:03 +0200
Received: from [172.31.20.70] (deham-pc1070.intra.4g-systems.com
	[172.31.20.70])
	by dehamox1a.intra.4g-systems.com (Postfix) with ESMTP id 297E3610AE8
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Apr 2007 18:04:02 +0200 (CEST)
Message-ID: <46127AF2.9060302@4g-systems.com>
Date: Tue, 03 Apr 2007 18:04:02 +0200
From: Patrick Fischer <fischer@4g-systems.com>
User-Agent: Icedove 1.5.0.9 (X11/20061220)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Provags-ID: V01U2FsdGVkX1/h+PoB6+diodcEpT5ML2fUhfa5FB7Zd0Bi9vT
	Muzs6vuYY5kSitPAUEmcJCcfHW5cBuwL95xUEnyc7Lwzv0QcQ9
	GabYg8QoDQk3MeoPTiBuw==
Subject: bootimg.bbclass not works
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
X-List-Received-Date: Tue, 03 Apr 2007 16:04:06 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On dependence on the dosfstools problem I will ask if anybody use the 
bootimg.bbclass

First there was/is a problem with the dosfstool, but that will be 
discussed in an other post.

my problem is now that i want to create a boot iso from my oe system.
So i will inherit from the bootimg.bbclass

In my opinion there is the following line missing in the bootimg.bbclass

IMAGE_POSTPROCESS_COMMAND += "build_boot_bin"
But this can be done in my image.bb

The build_boot_bin need so extern variables like:
${INITRD} - indicates a filesystem image to use as an initrd (optional)
${AUTO_SYSLINUXCFG} - set this to 1 to enable creating an automatic config
${LABELS} - a list of targets for the automatic config
${APPEND} - an override list of append strings for each label
${SYSLINUX_OPTS} - additional options to add to the syslinux file ';' 
delimited


The initrd is not realy optional if you look into the source.
But how to create an initrd with oe? Is there an class for?


Best regard
Patrick


