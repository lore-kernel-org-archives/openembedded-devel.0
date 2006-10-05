Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GVaVb-0006U0-2d for openembedded-devel@lists.openembedded.org;
	Thu, 05 Oct 2006 23:11:59 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id D6E4E401C8B; Thu,  5 Oct 2006 13:40:37 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20061005204037.D6E4E401C8B@tinman.treke.net>
Date: Thu,  5 Oct 2006 13:40:37 -0700 (PDT)
Subject: [Bug 1456] New: fbvncserver crashes, java client connects but also crashes frequently
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
X-List-Received-Date: Thu, 05 Oct 2006 21:11:59 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1456

           Summary: fbvncserver crashes, java client connects but also
                    crashes frequently
           Product: Openembedded
           Version: OpenZaurus 3.5.4.x
          Platform: Other
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P2
         Component: Distributions
        AssignedTo: openembedded-devel@lists.openembedded.org
        ReportedBy: bugs.openembedded.org@rolf.leggewie.biz
         QAContact: tinderbox-oe@gmx.net


Hi,

fbvncserver crashes as soon as I try to connect to it via a vnc client.  I use
the latest version from the official feeds on my collie running the latest
Openzaurus.

client side:

$ xvnc4viewer zaurus

VNC Viewer Free Edition 4.1.1 for X - built Sep  8 2006 06:59:21
Copyright (C) 2002-2005 RealVNC Ltd.
See http://www.realvnc.com for information on VNC.

Thu Oct  5 23:02:09 2006
 CConn:       connected to host zaurus port 5900
 CConnection: Server supports RFB protocol version 3.3
 CConnection: Using RFB protocol version 3.3
 TXImage:     Using default colormap and visual, TrueColor, depth 16.
 CConn:       Using pixel format depth 6 (8bpp) rgb222
 CConn:       Using ZRLE encoding

Thu Oct  5 23:02:10 2006
 main:        End of stream

Zaurus side:
root@collie:~# fbvncserver 
FBVNCserver Version: 0.9.4
05/10/2006 21:02:07 Listening for VNC connections on TCP port 5900
05/10/2006 21:02:07 Listening for HTTP connections on TCP port 5800
05/10/2006 21:02:07   URL http://collie:5800
05/10/2006 21:02:11 Got connection from client 192.168.129.1
05/10/2006 21:02:11   other clients:
05/10/2006 21:02:11 Protocol version 3.3
05/10/2006 21:02:11 Pixel format for client 192.168.129.1:
05/10/2006 21:02:11   8 bpp, depth 6
05/10/2006 21:02:11   true colour: max r 3 g 3 b 3, shift r 4 g 2 b 0
05/10/2006 21:02:11 Enabling full-color cursor updates for client 192.168.129.1
05/10/2006 21:02:11 Enabling NewFBSize protocol extension for client
192.168.129.1
05/10/2006 21:02:11 Using ZRLE encoding for client 192.168.129.1
Illegal instruction

In between I get a VNC window for a very brief time.  Next is the output when I
access the VNC server via http method at http://zaurus:5800.  This gives me
display of the Z, but I cannot send input to the Zaurus.  When I change
options, the VNC server will often crash.  For example switching to zlib
compression will crash it every time.

Regards

Rolf


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


