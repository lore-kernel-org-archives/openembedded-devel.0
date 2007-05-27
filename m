Received: from [68.230.241.42] (helo=fed1rmmtao104.cox.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <eric.nelson@boundarydevices.com>) id 1HsJKS-0006iC-Et
	for openembedded-devel@lists.openembedded.org;
	Sun, 27 May 2007 16:02:43 +0200
Received: from fed1rmimpo02.cox.net ([70.169.32.72]) by fed1rmmtao104.cox.net
	(InterMail vM.7.05.02.00 201-2174-114-20060621) with ESMTP id
	<20070527140113.IIWM15717.fed1rmmtao104.cox.net@fed1rmimpo02.cox.net>
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 May 2007 10:01:13 -0400
Received: from [192.168.0.142] ([68.2.22.95])
	by fed1rmimpo02.cox.net with bizsmtp
	id 4E1E1X001235Yks0000000; Sun, 27 May 2007 10:01:14 -0400
Message-ID: <46598F2C.5010707@boundarydevices.com>
Date: Sun, 27 May 2007 07:01:16 -0700
From: Eric Nelson <eric.nelson@boundarydevices.com>
User-Agent: Thunderbird 1.5.0.10 (X11/20070306)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: preferred-xorg-versions-X11R7.1.inc broken?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 27 May 2007 14:03:13 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Trying to build gpe-image using distro/generic.conf, I'm
getting an error configuring xinerama.

 From the log file
    tmp/work/armv5te-linux/libxinerama-1_1.0.2-r0/temp/log.do_configure.9791

I'm seeing an error of:
    configure.ac:32: error: must install xorg-macros 1.1 or later
    configure.ac:32: the top level

It appears that preferred-xorg-versions-X11R7.1.inc doesn't
specify a xinerama version so it uses the newer one but does
specify a version of util-macros (1.0.2).



