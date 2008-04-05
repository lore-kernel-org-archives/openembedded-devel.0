Received: from [128.131.95.14] (helo=belief.htu.tuwien.ac.at)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jin@mediatomb.cc>) id 1JiBHi-0005WO-R6
	for openembedded-devel@lists.openembedded.org;
	Sat, 05 Apr 2008 18:30:30 +0200
Received: by belief.htu.tuwien.ac.at (Postfix, from userid 10004)
	id 3847E838FA; Sat,  5 Apr 2008 18:30:28 +0200 (CEST)
Date: Sat, 5 Apr 2008 18:30:26 +0200
From: Sergey 'Jin' Bostandzhyan <jin@mediatomb.cc>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20080405163026.GA22334@deadlock.dhs.org>
References: <4327AE2D-6FA1-4BFE-BA07-059B0FC09BBE@student.utwente.nl>
MIME-Version: 1.0
In-Reply-To: <4327AE2D-6FA1-4BFE-BA07-059B0FC09BBE@student.utwente.nl>
User-Agent: Mutt/1.5.15 (2007-04-06)
Subject: Re: Adjusting staging for gcc >= 4.3.0
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
X-List-Received-Date: Sat, 05 Apr 2008 16:30:31 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


Hi Koen,
   
On Sat, Apr 05, 2008 at 05:22:50PM +0200, Koen Kooi wrote:
> In order to build glibc with gcc 4.3.0 I needed to do:
> 
> ln -sf /OE/angstrom-tmp/cross/lib/gcc/arm-angstrom-linux-gnueabi/4.3.0/ 
> include-fixed/* /OE/angstrom-tmp/cross/lib/gcc/arm-angstrom-linux- 
> gnueabi/4.3.0/include/
> 
> The question I have is:
> 
> Should be do this symlinking in the recipe or find a way to add  
> include-fixed to the includepath?

I do not know what the correct way is, but the uclinux people do it via the
includes, that's from the Rules.mak of their uClibc:

C_SYSTEM_INCLUDE :=$(shell $(CC) -print-file-name=include || echo)
CFLAGS+= -isystem $(C_SYSTEM_INCLUDE) -isystem $(C_SYSTEM_INCLUDE)-fixed

I hope that info helps.

Kind regards,
Jin



