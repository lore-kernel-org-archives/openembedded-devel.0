Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <rpurdie@rpsys.net>) id 1GNW8V-0006TD-TK
	for openembedded-devel@openembedded.org; Wed, 13 Sep 2006 16:54:48 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.6) with ESMTP id k8DEpG9w007720
	for <openembedded-devel@openembedded.org>;
	Wed, 13 Sep 2006 15:51:16 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 07664-02 for <openembedded-devel@openembedded.org>;
	Wed, 13 Sep 2006 15:51:14 +0100 (BST)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.6) with ESMTP id k8DEpDca007714
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Wed, 13 Sep 2006 15:51:13 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@openembedded.org>
In-Reply-To: <74d0deb30609130352p4c1c38cdk5415c04d1e0d3035@mail.gmail.com>
References: <74d0deb30609122310t64dc8b51wecfa7749806be097@mail.gmail.com>
	<1158139503.5540.10.camel@localhost.localdomain>
	<74d0deb30609130352p4c1c38cdk5415c04d1e0d3035@mail.gmail.com>
Date: Wed, 13 Sep 2006 15:51:13 +0100
Message-Id: <1158159074.5540.51.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: machine-specific udev packages
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 13 Sep 2006 14:54:48 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2006-09-13 at 12:52 +0200, pHilipp Zabel wrote:
> > We also
> > need to be more intelligent about automounting eg, not mounting /dev/hda
> > when its partitioned and hda1, hda2 are present etc.
> 
> Definitely. As mount.sh grows in size and functionality, aren't we
> starting to duplicate pmount?

Yes. I looked at pmount and its remarkably stupid though and designed
for desktops. The problems that come back to mind are:

1. Incompatible with busybox
2. Only works for removable media devices. Note that MMC/SD cards are
not removable media devices in the kernel sense. CF cards no longer are
either since I had that fixed in mainline. (removable media is where the
controller stays present but the media doesn't - a CF/MMC/SD card
contains the controller.)
3. Partly related to 1), it doesn't use mount but uses syscalls
directly. This means it has its own parsing of fstab implementation and
mounted systems don't show in mtab.

I tried to explain 2) to the author/maintainer but they basically didn't
want to know. Since pmount relies on the removable flag "not
mounting /dev/hda when its partitioned" logic is not present in pmount.

In summary, we might be better off writing something ourselves :-(. At
the very least, we'd have to heavily patch it.

Richard



