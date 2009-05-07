Received: from [160.45.40.10] (helo=mail.math.fu-berlin.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <heinold@mi.fu-berlin.de>) id 1M22wx-0002Vp-2o
	for openembedded-devel@openembedded.org; Thu, 07 May 2009 14:43:43 +0200
Received: (qmail 17029 invoked from network); 7 May 2009 14:37:37 +0200
Received: from luzin.mi.fu-berlin.de (HELO mi.fu-berlin.de) (160.45.117.148)
	by leibniz.math.fu-berlin.de with SMTP; 7 May 2009 14:37:37 +0200
Received: (qmail 1983 invoked by uid 9804); 7 May 2009 14:37:37 +0200
Received: from localhost (HELO mi.fu-berlin.de) (127.0.0.1)
	by localhost with SMTP; 7 May 2009 14:37:31 +0200
Received: (qmail 1975 invoked by uid 9804); 7 May 2009 14:37:30 +0200
Received: from leibniz.math.fu-berlin.de (HELO math.fu-berlin.de)
	(160.45.40.10)
	by luzin.mi.fu-berlin.de with SMTP; 7 May 2009 14:37:30 +0200
Received: (qmail 17019 invoked from network); 7 May 2009 14:37:30 +0200
Received: from leningrad.mi.fu-berlin.de (160.45.45.206)
	by leibniz.math.fu-berlin.de with (AES256-SHA encrypted) SMTP;
	7 May 2009 12:37:30 -0000
Received: from heinold by leningrad.mi.fu-berlin.de with local (Exim 4.69 #1
	(Debian)) id 1M22qw-0005ep-D0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 May 2009 14:37:30 +0200
Date: Thu, 7 May 2009 14:37:30 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090507123730.GA21520@mi.fu-berlin.de>
References: <2e69630d0905060801w29e0719fqc4f3904e784fa7b8@mail.gmail.com>
	<2e69630d0905070510x3c161a2atbbb7b9a0edf7578e@mail.gmail.com>
X-Envelope-Sender: heinold@mi.fu-berlin.de
X-Virus-Scanned: by AMaViS
	0.3.12pre7-L41+ClamAV[1978](NAI-uvscan@mi.fu-berlin.de)
X-Remote-IP: 160.45.45.206
MIME-Version: 1.0
In-Reply-To: <2e69630d0905070510x3c161a2atbbb7b9a0edf7578e@mail.gmail.com>
User-Agent: Mutt/1.5.18 (2008-05-17)
Sender: Henning Heinold <heinold@mi.fu-berlin.de>
Subject: Re: problem with opie for qemuarm
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
X-List-Received-Date: Thu, 07 May 2009 12:43:43 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 07, 2009 at 02:10:06PM +0200, sledge wrote:
> Hello all,
> 
> I have bitbaked opie-image for qemuarm. Resized the resulted
> opie-image.rootfs.ext2 partition, launched qemu with these parameters:
> http://linuxtogo.org/gowiki/Angstrom/qemu-system-arm
> 
> I have also tried extracting modules*.tgz into that ext2 rootfs. Same result:
> 
> It has configured and launched the init.d processes, stopping any
> output after the bluetooth. Apparently opie did not start, nor any
> other rc processes; hence no graphical interface nor command-line
> login prompt
> 
> Where should I start with? I tried to mv etc/init.d/bluetooth
> etc/init.d, but it still starts (thought it was a blocker). I suppose
> it is because the modules are being loaded.
> 
> 
> 
> Thanks!
> 
> --
> sledge

Try start qemu with serielle card support and get you login shell via this.

Bye Henning


