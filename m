Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GV70n-0000J5-RS for openembedded-devel@lists.openembedded.org;
	Wed, 04 Oct 2006 15:42:14 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id B9763401B46; Wed,  4 Oct 2006 06:11:02 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20061004131102.B9763401B46@tinman.treke.net>
Date: Wed,  4 Oct 2006 06:11:02 -0700 (PDT)
Subject: [Bug 1450] How to make a Angstrom-bootsrap-image for HTC Universal.
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
X-List-Received-Date: Wed, 04 Oct 2006 13:42:14 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1450





------- Comment #1 from koen@dominion.kabel.utwente.nl  2006-10-04 06:11 -------

> --- conf/distro/angstrom-2007.1.conf   
> +PREFERRED_VERSION_handhelds-pxa-2.6 = "2.6.17-hh1+cvs${SRCDATE}"

added

>  # We want images supporting the following features (for task-base)
> +DISTRO_FEATURES = "nfs smbfs wifi ppp alsa bluetooth ext2 irda usbgadget
> usbhost"
> -DISTRO_FEATURES = "nfs smbfs wifi ppp alsa bluetooth ext2 irda pcmcia
> usbgadget usbhost"

I fixed that in htc-universal.conf by ommitting 'pcmcia' from MACHINE_FEATURES


> +++ packages/angstrom/task-angstrom.bb 
> -    ${PCMCIA_MANAGER} \

did that as well

Could you try building an angstrom-bootstrap-image from a clean checkout to see
if it works now?


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


