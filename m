Received: from [212.227.126.171] (helo=moutng.kundenserver.de)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <fischer@4g-systems.com>) id 1HYefA-0005vy-2C
	for openembedded-devel@lists.openembedded.org;
	Tue, 03 Apr 2007 10:46:48 +0200
Received: from [213.238.49.68] (helo=dehamox1a.intra.4g-systems.com)
	by mrelayeu.kundenserver.de (node=mrelayeu6) with ESMTP (Nemesis),
	id 0ML29c-1HYef82QWp-0003PJ; Tue, 03 Apr 2007 10:46:47 +0200
Received: from [172.31.20.70] (deham-pc1070.intra.4g-systems.com
	[172.31.20.70])
	by dehamox1a.intra.4g-systems.com (Postfix) with ESMTP id 139CA61247A
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Apr 2007 10:46:46 +0200 (CEST)
Message-ID: <46121476.1030609@4g-systems.com>
Date: Tue, 03 Apr 2007 10:46:46 +0200
From: Patrick Fischer <fischer@4g-systems.com>
User-Agent: Icedove 1.5.0.9 (X11/20061220)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Provags-ID: V01U2FsdGVkX1+xakxOUgRXWAK2mndu/P+hya1mKaVPCfOyp9/
	uzaw67BFRpbgNuFS1635ev9excOR/wFgVkS31oHX7KDBeAkka6
	We37RloQYTS2qZ9RmrMzA==
X-Content-Filtered-By: Mailman/MimeDel 2.1.9
Subject: Re: DosFStools mirror missing
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
X-List-Received-Date: Tue, 03 Apr 2007 08:46:48 -0000
Content-Type: multipart/mixed; boundary="------------040709050102080001070304"

--------------040709050102080001070304
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Andre Renaud wrote:
> The mirror for DosFSTools,
> ftp://ftp.uni-erlangen.de/pub/Linux/LOCAL/dosfstools/dosfstools-${PV}.src.tar.gz
>
> appears to be down at the moment. Using the Debian mirror however works
> fine. Attached is an alternative bitbake package which uses the debian
> mirror system to do the download, which should be much more robust.
>
> Andre
The Debian Mirror provide only a newer version of the dosfstools, isn't it?
I got the same problem while inherit the bootimg.bbclass.

here comes my dosfstools-nativ_2.11.bb

The Problem is that the bootimg.bbclass contains mkdosfs -F 12 ..... 
*-d* ${BDIR} .....
The parameter -d was not found in mkdosfs 2.11. This is provided by the 
patch (mkdosfs-dif.patch).
Maybe somebody can fix that.

Best Regards
Patrick
# dosfstools-native OE build file
# Copyright (C) 2004-2006, Advanced Micro Devices, Inc.  All Rights Reserved
# Released under the MIT license (see packages/COPYING)

require dosfstools_${PV}.bb
FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/dosfstools-${PV}"

S="${WORKDIR}/dosfstools-${PV}"


SRC_URI = "http://ftp.debian.org/debian/pool/main/d/dosfstools/dosfstools_2.11.orig.tar.gz \
	file://mkdosfs-bootcode.patch;patch=1 \
	file://mkdosfs-dir.patch;patch=1 \
	file://alignment_hack.patch;patch=1 \
	file://dosfstools-2.10-kernel-2.6.patch;patch=1 \
	file://msdos_fat12_undefined.patch;patch=1 \
	file://dosfstools-msdos_fs-types.patch;patch=1 \
	file://include-linux-types.patch;patch=1"

inherit native

do_stage() {
	install -m 755 ${S}/mkdosfs/mkdosfs ${STAGING_BINDIR}/mkdosfs
	install -m 755 ${S}/dosfsck/dosfsck ${STAGING_BINDIR}/dosfsck
}

--------------040709050102080001070304--
