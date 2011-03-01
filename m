Received: from smtp201.alice.it ([82.57.200.97])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <GNUtoo@no-log.org>) id 1PuThq-0004AJ-VJ
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Mar 2011 18:49:55 +0100
Received: from localhost.localdomain (80.116.58.157) by smtp201.alice.it
	(8.5.124.08) (authenticated as editempo@alice.it)
	id 4CC05A4C05723F02 for openembedded-devel@lists.openembedded.org;
	Tue, 1 Mar 2011 18:45:45 +0100
From: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 Mar 2011 18:45:31 +0100
Message-Id: <1299001532-3260-1-git-send-email-GNUtoo@no-log.org>
X-Mailer: git-send-email 1.7.0.4
Subject: (No subject)
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
X-List-Received-Date: Tue, 01 Mar 2011 17:49:55 -0000

Hi,

Is it possible to move /etc/rcS.d/S98configure before S40networking, 
so usb0 comes up at first boot, or is there some problems that would 
be introduced from such move?

Here's my problem:
on the bug machine,with Angstrom, at first boot usb0 doesn't come up 
in a console-image.
It is very annoying because the only way to get control of the machine 
is trough ssh on usbnet.

At second boot it works fine.

If I move /etc/rcS.d/S98configure before S40networking it 
works fine at first boot.

I will send a patch that changes the order of S40networking  
and S98configure to S40configure and S41networking.

Denis.


