Received: from relay.ihostexchange.net ([66.46.182.57])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kwong@wurldtech.com>) id 1P0EuA-0005Kj-F0
	for openembedded-devel@lists.openembedded.org;
	Mon, 27 Sep 2010 16:43:07 +0200
Received: from kwong-desktop.localnet (209.52.149.70) by
	smtp.ihostexchange.net (66.46.182.50) with Microsoft SMTP Server (TLS)
	id 8.3.106.1; Mon, 27 Sep 2010 10:40:41 -0400
From: Kelvie Wong <kwong@wurldtech.com>
Organization: Wurldtech Security Technologies Inc.
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Mon, 27 Sep 2010 07:39:39 -0700
User-Agent: KMail/1.13.5 (Linux/2.6.32-24-generic-pae; KDE/4.5.1; i686; ; )
References: <1285434426-17736-1-git-send-email-kwong@wurldtech.com>
	<1285434426-17736-2-git-send-email-kwong@wurldtech.com>
	<AANLkTikE+Kqa4OqE50p+_2W1548a1ko40Gb9h8s-NASB@mail.gmail.com>
In-Reply-To: <AANLkTikE+Kqa4OqE50p+_2W1548a1ko40Gb9h8s-NASB@mail.gmail.com>
MIME-Version: 1.0
Message-ID: <201009270739.40204.kwong@wurldtech.com>
X-SA-Exim-Connect-IP: 66.46.182.57
X-SA-Exim-Mail-From: kwong@wurldtech.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 2/3] initramfs-module-udev: New module
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
X-List-Received-Date: Mon, 27 Sep 2010 14:43:09 -0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On September 25, 2010 03:29:15 pm Otavio Salvador wrote:
> Hello,
> 
> On Sat, Sep 25, 2010 at 2:07 PM, Kelvie Wong <kwong@wurldtech.com> wrote:
> > This launches (and kills) udev during the initramfs procedure to populate
> > the /dev tree as udev would.
> 
> I didn't get /why/ do you kill it after starting.
> 
> Personally I think this could be supported by not enabled by default.
> This might be an option that could be set by image.

This was to let the rest of the boot process start udev, if it wants to.

All I need udev for is to populate /dev (specifically, the nodes in /dev/disk 
to set the root partition by label, e.g. for USB disk partitions); I don't 
want to leave processes running when doing the chroot, either.

-- 
Kelvie Wong
Software Developer

Wurldtech Security Technologies Inc.
Suite 1680 - 401 West Georgia St.
Vancouver, B.C.  V6B 5A1
Canada

Phone:       + 1.604.669.6674
Toll Free:   + 1.877.369.6674
Fax:           + 1.604.669.2902
Website:    http://www.wurldtech.com/

"ARE YOU ACHILLES CERTIFIED?"

This message is intended only for the named recipients. This message
may contain information that is privileged, confidential or exempt
from disclosure under applicable law. Any dissemination or copying
of this message by anyone other than a named recipient is strictly
prohibited. If you are not a named recipient or an employee or agent
responsible for delivering this message to a named recipient, please
notify us immediately by telephone at 604-669-6674, and permanently
destroy this message and any copies you may have. Email may not be
secure unless properly encrypted.


