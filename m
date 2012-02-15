Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <holger+oe@freyther.de>) id 1RxjMl-0000eg-1k
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Feb 2012 19:14:07 +0100
Received: from [192.168.1.250] (91-64-82-148-dynip.superkabel.de
	[91.64.82.148])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 529751B10C05
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Feb 2012 18:03:51 +0000 (UTC)
Message-ID: <4F3BF21A.30505@freyther.de>
Date: Wed, 15 Feb 2012 18:57:46 +0100
From: Holger Freyther <holger+oe@freyther.de>
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:8.0) Gecko/20120104 Icedove/8.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: checkroot.sh and fsck the root partition
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
X-List-Received-Date: Wed, 15 Feb 2012 18:14:07 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi,

I know most of use ubifs/jffs2 but I have one device with a ext3/ext4
partition and would like to run fsck as part of the boot (with auto fix up).
Besides installing the e2fs fsck, fixing the fstab fsck will not be executed.

E.g. if I take a look at this script:
http://git.openembedded.org/openembedded-core/tree/meta/recipes-core/initscripts/initscripts-1.0/checkroot.sh

it is not clear how 'rootcheck' could ever be 'yes'.

Any comments?

holger


