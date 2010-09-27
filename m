Received: from relay.ihostexchange.net ([66.46.182.57])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kwong@wurldtech.com>) id 1P0Fsi-0006P7-TT
	for openembedded-devel@lists.openembedded.org;
	Mon, 27 Sep 2010 17:44:46 +0200
Received: from kwong-desktop.localnet (209.52.149.70) by
	smtp.ihostexchange.net (66.46.182.50) with Microsoft SMTP Server (TLS)
	id 8.3.106.1; Mon, 27 Sep 2010 11:43:12 -0400
From: Kelvie Wong <kwong@wurldtech.com>
Organization: Wurldtech Security Technologies Inc.
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Mon, 27 Sep 2010 08:42:08 -0700
User-Agent: KMail/1.13.5 (Linux/2.6.32-24-generic-pae; KDE/4.5.1; i686; ; )
References: <1285434426-17736-1-git-send-email-kwong@wurldtech.com>
	<201009270739.40204.kwong@wurldtech.com>
	<AANLkTim-horV=L7_EgWHOvXhM0K0bsYKA-wyqrv7rkd2@mail.gmail.com>
In-Reply-To: <AANLkTim-horV=L7_EgWHOvXhM0K0bsYKA-wyqrv7rkd2@mail.gmail.com>
MIME-Version: 1.0
Message-ID: <201009270842.09397.kwong@wurldtech.com>
X-SA-Exim-Connect-IP: 66.46.182.57
X-SA-Exim-Mail-From: kwong@wurldtech.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
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
X-List-Received-Date: Mon, 27 Sep 2010 15:44:46 -0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On September 27, 2010 07:51:43 am Otavio Salvador wrote:
> Hello,
> 
> On Mon, Sep 27, 2010 at 11:39 AM, Kelvie Wong <kwong@wurldtech.com> wrote:
> > This was to let the rest of the boot process start udev, if it wants to.
> 
> Right.
> 
> > All I need udev for is to populate /dev (specifically, the nodes in
> > /dev/disk to set the root partition by label, e.g. for USB disk
> > partitions); I don't want to leave processes running when doing the
> > chroot, either.
> 
> For systems that are going to _use_ udev this looks like wasting CPU
> time and IO.
> 
> I see your point but I believe it might be an optional behaviour.

I am unfamiliar with how udev works in this case -- if I leave it running, and 
another tmpfs is mounted on the new /dev (outside of the initrd), does it get 
populated unless udev is restarted?

(Sorry for the double send, didn't mean to take it off list)
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


