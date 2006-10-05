Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GVaby-0006ac-Mj for openembedded-devel@lists.openembedded.org;
	Thu, 05 Oct 2006 23:18:34 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id C2DAB401C8B; Thu,  5 Oct 2006 13:47:12 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20061005204712.C2DAB401C8B@tinman.treke.net>
Date: Thu,  5 Oct 2006 13:47:12 -0700 (PDT)
Subject: [Bug 1456] fbvncserver crashes, java client connects but also crashes frequently
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
X-List-Received-Date: Thu, 05 Oct 2006 21:18:34 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1456





------- Comment #2 from bugs.openembedded.org@rolf.leggewie.biz  2006-10-05 13:47 -------
Here is the output for accessing via http method which I forgot.  Problem is a)
screen is view-only, no input accepted and b) frequent crashes when changing
options.  A sure way to crash is by going to zlib encoding.

root@collie:~# fbvncserver 
FBVNCserver Version: 0.9.4
05/10/2006 21:10:34 Listening for VNC connections on TCP port 5900
05/10/2006 21:10:34 Listening for HTTP connections on TCP port 5800
05/10/2006 21:10:34   URL http://collie:5800
05/10/2006 21:10:42 httpd: get '' for 192.168.129.1
05/10/2006 21:10:42 httpd: defaulting to 'index.vnc'
05/10/2006 21:10:46 Got connection from client 192.168.129.1
05/10/2006 21:10:46   other clients:
05/10/2006 21:10:46 Protocol version 3.3
05/10/2006 21:10:46 Using tight encoding for client 192.168.129.1
05/10/2006 21:10:46 Using image quality level 6 for client 192.168.129.1
05/10/2006 21:10:46 Enabling X-style cursor updates for client 192.168.129.1
05/10/2006 21:10:46 Enabling full-color cursor updates for client 192.168.129.1
05/10/2006 21:10:46 Enabling LastRect protocol extension for client
192.168.129.1
05/10/2006 21:10:46 Enabling NewFBSize protocol extension for client
192.168.129.1
05/10/2006 21:10:46 Pixel format for client 192.168.129.1:
05/10/2006 21:10:46   32 bpp, depth 24, little endian
05/10/2006 21:10:46   true colour: max r 255 g 255 b 255, shift r 16 g 8 b 0
05/10/2006 21:11:06 Using zlib encoding for client 192.168.129.1
05/10/2006 21:11:06 Enabling X-style cursor updates for client 192.168.129.1
05/10/2006 21:11:06 Enabling full-color cursor updates for client 192.168.129.1
05/10/2006 21:11:06 Enabling LastRect protocol extension for client
192.168.129.1
05/10/2006 21:11:06 Enabling NewFBSize protocol extension for client
192.168.129.1
Illegal instruction


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


