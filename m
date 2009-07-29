Received: from [160.45.40.10] (helo=mail.math.fu-berlin.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <heinold@mi.fu-berlin.de>) id 1MW4gc-0007R5-FD
	for openembedded-devel@openembedded.org; Wed, 29 Jul 2009 10:38:58 +0200
Received: (qmail 26329 invoked from network); 29 Jul 2009 10:23:46 +0200
Received: from luzin.mi.fu-berlin.de (HELO mi.fu-berlin.de) (160.45.117.148)
	by leibniz.math.fu-berlin.de with SMTP; 29 Jul 2009 10:23:46 +0200
Received: (qmail 11215 invoked by uid 9804); 29 Jul 2009 10:23:45 +0200
Received: from localhost (HELO mi.fu-berlin.de) (127.0.0.1)
	by localhost with SMTP; 29 Jul 2009 10:23:39 +0200
Received: (qmail 11207 invoked by uid 9804); 29 Jul 2009 10:23:39 +0200
Received: from leibniz.math.fu-berlin.de (HELO math.fu-berlin.de)
	(160.45.40.10)
	by luzin.mi.fu-berlin.de with SMTP; 29 Jul 2009 10:23:39 +0200
Received: (qmail 26318 invoked from network); 29 Jul 2009 10:23:39 +0200
Received: from leningrad.mi.fu-berlin.de (160.45.45.206)
	by leibniz.math.fu-berlin.de with (AES256-SHA encrypted) SMTP;
	29 Jul 2009 08:23:39 -0000
Received: from heinold by leningrad.mi.fu-berlin.de with local (Exim 4.69 #1
	(Debian)) id 1MW4Rn-0007tk-1c
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Jul 2009 10:23:39 +0200
Date: Wed, 29 Jul 2009 10:23:39 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090729082338.GA30288@mi.fu-berlin.de>
References: <200907271203.05641.holger+oe@freyther.de>
X-Envelope-Sender: heinold@mi.fu-berlin.de
X-Virus-Scanned: by AMaViS
	0.3.12pre7-L41+ClamAV[11210](NAI-uvscan@mi.fu-berlin.de)
X-Remote-IP: 160.45.45.206
MIME-Version: 1.0
In-Reply-To: <200907271203.05641.holger+oe@freyther.de>
User-Agent: Mutt/1.5.18 (2008-05-17)
Sender: Henning Heinold <heinold@mi.fu-berlin.de>
Subject: Re: [PATCH] gcc: Pass --enable-tls=no on uclibc builds
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
X-List-Received-Date: Wed, 29 Jul 2009 08:38:58 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hm.

might we easier we relay on the tls.m4 marco as before which finds out if the libc is tls-aware. It was broken for cross-compiling and shared library,
but there are fixes now available according to this thread:
http://www.nabble.com/Improve-TLS-link-test-for-cross-compiling-td24312975.html

I have adopted this patch to fix the tls.m4 macro for pulseaudio which now works nice.

Bye Henning


