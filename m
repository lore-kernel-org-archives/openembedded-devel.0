Received: from mail-bw0-f226.google.com ([209.85.218.226])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Nchgv-0003cK-Qa
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Feb 2010 17:03:01 +0100
Received: by bwz26 with SMTP id 26so1166284bwz.27
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Feb 2010 08:00:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=X/OivWl2Okcw+1YDl0MVIqDfaYgLMrqQhDUut3r2Kzo=;
	b=O1/J3zHaQKeUkS0+59VjvxsEV8+2xAE5OM8nXQufOOzF/tY1p4jGZGYYTZhBC5OifU
	yWcm6Qs1cxdtj9vCe/BHwuz/CPejCbsyn9CFVaQDLjVaR+/fK/O9NaGe6yers9KoU4Pq
	5+BlbAEI0UqDF1/r4BF/vzXP9XWKzu3DN0Y+0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=pL3XJnD4bGCFpQbdCPpStKXjpp0P9T58VDlo6Eo3Z4SZt9BqZ2b/g3vyoIXMk+1W0Z
	purlbyK5pISvHfu4fk8mGA7UQDzBACESpys0XkT/HlNOGkXhCROIbVMCM3sjcXFfBDP5
	0GdoXp74cT4P6lnhRhhHvQN9XqWBHHKwOwATA=
Received: by 10.204.33.137 with SMTP id h9mr1195999bkd.134.1265212829738;
	Wed, 03 Feb 2010 08:00:29 -0800 (PST)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id 16sm3366762bwz.7.2010.02.03.08.00.27
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 03 Feb 2010 08:00:28 -0800 (PST)
Date: Wed, 3 Feb 2010 07:59:42 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100203155942.GA22415@gmail.com>
References: <1497161523.3479291265205781088.JavaMail.root@sz0154a.westchester.pa.mail.comcast.net>
	<hkc237$4de$1@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <hkc237$4de$1@ger.gmane.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.218.226
X-SA-Exim-Mail-From: raj.khem@gmail.com
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
X-List-Received-Date: Wed, 03 Feb 2010 16:03:01 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

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


