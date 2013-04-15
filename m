Received: from smtpdg7.aruba.it ([62.149.158.237] helo=smtpdg12.aruba.it)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paolo.verzola@laurasapiens.com>) id 1URjv0-00065K-LC
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Apr 2013 15:58:05 +0200
Received: from [127.0.0.1] ([77.241.2.28])
	by smtpcmd04.ad.aruba.it with bizsmtp
	id QDfU1l00f0cFj1Z01DfXU9; Mon, 15 Apr 2013 15:39:32 +0200
Message-ID: <516C030E.3030606@laurasapiens.com>
Date: Mon, 15 Apr 2013 15:39:26 +0200
From: Paolo Verzola <paolo.verzola@laurasapiens.com>
User-Agent: Mozilla/5.0 (Windows NT 6.2; WOW64;
	rv:17.0) Gecko/20130328 Thunderbird/17.0.5
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: ulf@emagii.com
Subject: udev problem during boot - Angstrom - Atmel SAM9
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
X-List-Received-Date: Mon, 15 Apr 2013 13:58:07 -0000
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit

Hello guys. I'm working on a custom board based on Atmel SAM9 processor 
with Angstrom Linux distribution. The actual kernel is 2.6.39 (with 
atmel overlayer).

Since a few days I'm trying to solve a problem that I have on startup.
In practice, about 3 times out of 10 I get the following message during 
startup:
/
udevadm settle - timeout of 8 seconds Reached, the event queue contains: //
//   / sys/devices/platform/atmel_mci.0/mmc_host/mmc0/mmc0: 
0002/block/mmcblk0/mmcblk0p1 (503) //
/
At this point there are three cases:
- The boot of the system continues;
- The boot hangs and I have to give a ctrl-C to continue booting;
- The boot hangs and only a reset can reboot the system;

In the firs two cases, if I try to mount a sd card with the following 
command:

mount-t vfat /dev/mmcblk0p1 /media/card

the system hangs and I can only reset.

Any idea?

