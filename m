Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 333407562E
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Jun 2015 17:08:27 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1YzTCK-0001bQ-Ro for openembedded-devel@lists.openembedded.org;
	Mon, 01 Jun 2015 19:08:24 +0200
Received: from 80-218-32-173.dclient.hispeed.ch ([80.218.32.173])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Jun 2015 19:08:24 +0200
Received: from auslands-kv by 80-218-32-173.dclient.hispeed.ch with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Jun 2015 19:08:24 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Neuer User <auslands-kv@gmx.de>
Date: Mon, 01 Jun 2015 19:08:12 +0200
Message-ID: <mki3hs$fmp$1@ger.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: 80-218-32-173.dclient.hispeed.ch
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
Subject: no package provides python3-gdbm ???
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 01 Jun 2015 17:08:28 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Got a new error during do_rootfs on fido:

ERROR: Unable to install packages. Command
'/home/ubuntu/yocto1.8/build/tmp/sysroots/i686-linux/usr/bin/smart
--quiet
--data-dir=/home/ubuntu/yocto1.8/build/tmp/work/cubox_i-poky-linux-gnueabi/image-omnisonix/1.0-r0/rootfs/var/lib/smart
install -y packagegroup-omnisonix-graphics@all
psplash@cortexa9hf_vfp_neon run-postinsts@all
packagegroup-omnisonix-core@all packagegroup-core-ssh-openssh@all
packagegroup-omnisonix-apps@all packagegroup-omnisonix-audio@all
packagegroup-base-extended@cubox_i packagegroup-core-boot@cubox_i
locale-base-en-us@cortexa9hf_vfp_neon
locale-base-en-gb@cortexa9hf_vfp_neon' returned 1:
error: Can't install python3-modules-3.3.3-r1.0@cortexa9hf_vfp_neon: no
package provides python3-gdbm


ERROR: Function failed: do_rootfs


Haven't had that on daisy. Has anything changed? A new dependency of
python3 (python3-gdbm)? Or a missing package?

Thanks for any ideas.

Michael


