Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Pu56D-0003qd-OF
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Feb 2011 16:33:25 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1Pu54q-0003Ys-Dg from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Feb 2011 07:32:00 -0800
Received: from SVR-ORW-FEM-05.mgc.mentorg.com ([147.34.97.43]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Mon, 28 Feb 2011 07:31:59 -0800
Received: from [172.30.80.189] (147.34.91.1) by svr-orw-fem-05 (147.34.97.43)
	with Microsoft SMTP Server id 14.1.270.1;
	Mon, 28 Feb 2011 07:31:59 -0800
Message-ID: <4D6BBFDE.2090406@mentor.com>
Date: Mon, 28 Feb 2011 08:31:42 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
X-OriginalArrivalTime: 28 Feb 2011 15:31:59.0710 (UTC)
	FILETIME=[A3E8D7E0:01CBD75C]
Subject: Release-2011.03 status
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
X-List-Received-Date: Mon, 28 Feb 2011 15:33:26 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Hey all,

Over at http://dl.dropbox.com/u/3284539/ac9745f0fe_results.pdf you can 
see the results of my build over the weekend.  It's a bit scary but...

Fixed:
- minimal-uclibc/*/* was broken due to needing xattr in DISTRO_FEATURES
- ucslug/sheevaplug/* was broken due to TARGET_ARCH in distro.conf

Not fixed:
antgw100: Needs the linux/socket.h > sys/socket.h thing someone else 
mentioned.
various/angstrom*/angstrom-gnome-image: evince needs various docbook 
things installed that we don't build, don't force the host to have and 
isn't 100% trivial to switch to building (I've started on this path but 
haven't gotten it quite right).
- various/shr/shr-image: The libvpx work-around 
(http://patches.openembedded.org/patch/256/) to link.
- qemux86/minimal*/*: A hard RPATH issue where we're getting away, 
usually, with libXrandr from the host, but this build host is really 
stripped down.  I bisected this down to when we fixed RPATH stuff in 
9432df5a1c96f7b2e625abba0e011ad45d5aef92 and it's a bug in some recipe.
- various/shr/shr-image: A problem with python-elementary/elementary 
disagreeing on version stuff, will post later.

So, my current plan of attack is to do what I've said before and merge 
the libvpx work-around, tag, revert the libvpx work-around (per Khem's 
request).  And I plan to do this tomorrow unless people shout about 
wanting to fix something they know is broken and need a little more time.

-- 
Tom Rini
Mentor Graphics Corporation


