Received: from qmta07.westchester.pa.mail.comcast.net ([76.96.62.64])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pspreadborough@comcast.net>) id 1Nck4Q-0004iJ-Sf
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Feb 2010 19:35:26 +0100
Received: from omta16.westchester.pa.mail.comcast.net ([76.96.62.88])
	by qmta07.westchester.pa.mail.comcast.net with comcast
	id dRk51d00A1uE5Es57WYvHA; Wed, 03 Feb 2010 18:32:55 +0000
Received: from sz0154.wc.mail.comcast.net ([76.96.58.220])
	by omta16.westchester.pa.mail.comcast.net with comcast
	id dWa91d00L4l5d103cWa93X; Wed, 03 Feb 2010 18:34:09 +0000
Date: Wed, 3 Feb 2010 18:32:54 +0000 (UTC)
From: pspreadborough@comcast.net
To: openembedded-devel@lists.openembedded.org
Message-ID: <1545347019.3660521265221974750.JavaMail.root@sz0154a.westchester.pa.mail.comcast.net>
In-Reply-To: <1525882292.3655251265221536810.JavaMail.root@sz0154a.westchester.pa.mail.comcast.net>
MIME-Version: 1.0
X-Originating-IP: [76.24.64.15]
X-Mailer: Zimbra 5.0.19_GA_3172.RHEL5_64 (ZimbraWebClient - FF3.0
	(Linux)/5.0.19_GA_3177.RHEL5_64)
X-SA-Exim-Connect-IP: 76.96.62.64
X-SA-Exim-Mail-From: pspreadborough@comcast.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: EABI pain and frustration!
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
X-List-Received-Date: Wed, 03 Feb 2010 18:35:26 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit


I'm working from the Angstrom distribution. 

I'm using the arm-2009q3-67-arm-none-linux-gnueabi compiler because that's 
the EABI compiler I had to hand. I started out with the intention of moving to 
an EABI environment (no OABI_COMPAT), however when my EABI ramfs did 
not work (kernel booted but barfed when executing init or sh) I decided to try 
and EABI executable in the OABI environment.

When compiling the "HelloWorld" I used the "-mabi=aapcs-linux" compiler option 
because that's what the kernel uses. 


Thanks,

Pete

----- Original Message ----- 
From: "Khem Raj" <raj.khem@gmail.com> 
To: openembedded-devel@lists.openembedded.org 
Sent: Wednesday, February 3, 2010 10:59:42 AM GMT -05:00 US/Canada Eastern 
Subject: Re: [oe] EABI pain and frustration! 

On (03/02/10 15:43), Koen Kooi wrote: 
> -----BEGIN PGP SIGNED MESSAGE----- 
> Hash: SHA1 
> 
> On 03-02-10 15:03, pspreadborough@comcast.net wrote: 
> > 
> > My 2.6.29 kernel is built with the CodeSourcery arm-2009q3-67-arm-none-linux-gnueabi 
> > compiler and has the EABI and OABI_COMPAT config options enabled. Using this kernel 
> > I can boot my SA1110 iPaq into a OABI ramfs with no problems, however if I build a 
> > "HelloWorld" executable with the same compiler and try and run it I get an "Illegal Instruction" 
> > error. I build the test program using static linking, select the correct machine type and tune 
> > options but to no avail, I always get the illegal instruction. 

hmm just tune and machine opts wont be enough you have to chose right abi 
options too. because your userland is OABI thats what you should chose for 
helloworld too. 

> 
> Which MACHINE and DISTRO are you using in OE? And also: why CSL? 
> -----BEGIN PGP SIGNATURE----- 
> Version: GnuPG v1.4.5 (Darwin) 
> 
> iD8DBQFLaYuoMkyGM64RGpERAiBXAJ9EKxw1hWGKcmJGo5LlEsDmHYJ/wACfZ1Id 
> 3Jz3mIP5xiMAez+V8l63TQ0= 
> =aaua 
> -----END PGP SIGNATURE----- 
> 
> 
> _______________________________________________ 
> Openembedded-devel mailing list 
> Openembedded-devel@lists.openembedded.org 
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel 

_______________________________________________ 
Openembedded-devel mailing list 
Openembedded-devel@lists.openembedded.org 
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel 


