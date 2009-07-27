Received: from [64.18.0.20] (helo=exprod5og110.obsmtp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martyn.welch@gefanuc.com>) id 1MVNvR-00007d-0M
	for openembedded-devel@lists.openembedded.org;
	Mon, 27 Jul 2009 12:59:25 +0200
Received: from source ([12.71.149.1]) (using TLSv1) by
	exprod5ob110.postini.com ([64.18.4.12]) with SMTP
	ID DSNKSm2FG2qZOKqHelJGsyGloN8DS7yKXdFd@postini.com;
	Mon, 27 Jul 2009 03:44:45 PDT
Received: from unknown (HELO alpmlip01.e2k.ad.ge.com) ([3.159.17.48])
	by Cinmlip09.e2k.ad.ge.com with ESMTP; 27 Jul 2009 06:44:42 -0400
Received: from es-j7s4d2j.amer.consind.ge.com (HELO [3.138.54.92])
	([3.138.54.92])
	by alpmlip01.e2k.ad.ge.com with ESMTP; 27 Jul 2009 06:44:41 -0400
Message-ID: <4A6D853E.3020008@gefanuc.com>
Date: Mon, 27 Jul 2009 11:45:18 +0100
From: Martyn Welch <martyn.welch@gefanuc.com>
User-Agent: Thunderbird 2.0.0.22 (X11/20090608)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4A6D5C5A.2010003@gmail.com>
In-Reply-To: <4A6D5C5A.2010003@gmail.com>
Subject: Re: linux recipe selected despite ASSUME_PROVIDED +=	"virtual/kernel"
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
X-List-Received-Date: Mon, 27 Jul 2009 10:59:25 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Graham Gower wrote:
> Hi,
> I wish to build an Angstrom based console-image for mipsel from the
> org.openembedded.dev branch. I maintain a kernel for the device but am
> not yet ready to integrate this into an OE recipe. The default 
> linux_2.6.30.bb
> fails to build for me, thus I wish to not build the kernel at this point
> in time.
>
> My local.conf contains the following lines,
> STAGING_KERNEL_DIR = "/home/grg/jz/linux"
> ASSUME_PROVIDED += "virtual/kernel"
>
> However, when i run 'bitbake console-image the default linux_2.6.30.bb 
> recipe
> is still selected and the build procedes to fail.
>
> Is this the correct procedure to avoid building a kernel? If so, what 
> else
> could I be doing wrongly?

I tend to create a bitbake recipe to build my kernel and put it in an 
overlay, otherwise known as a collection[1] and setting the 
"DEFAULT_PREFERENCE"[2] to a large positive number to cause the build to 
prefer that kernel. That way it's building your kernel, but it's not yet 
in the org.openembedded.dev branch.

Martyn

[1] 
http://docs.openembedded.org/usermanual/usermanual.html#special_bitbake_collections
[2] 
http://docs.openembedded.org/usermanual/usermanual.html#recipes_defaultpreference

-- 
Martyn Welch MEng MPhil MIET (Principal Software Engineer)   T:+44(0)1327322748
GE Fanuc Intelligent Platforms Ltd,        |Registered in England and Wales
Tove Valley Business Park, Towcester,      |(3828642) at 100 Barbirolli Square,
Northants, NN12 6PF, UK T:+44(0)1327359444 |Manchester,M2 3AB  VAT:GB 927559189


