Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rpurdie@rpsys.net>) id 1HJfWW-00087t-Tc
	for openembedded-devel@openembedded.org; Wed, 21 Feb 2007 01:39:57 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l1L0duto012566
	for <openembedded-devel@openembedded.org>; Wed, 21 Feb 2007 00:39:56 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 12075-04 for <openembedded-devel@openembedded.org>;
	Wed, 21 Feb 2007 00:39:54 +0000 (GMT)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l1L0dq5t012555
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>; Wed, 21 Feb 2007 00:39:52 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <432beae0702201436v78aa4959q59cdad54da6a2627@mail.gmail.com>
References: <1172010661.5884.113.camel@localhost.localdomain>
	<432beae0702201436v78aa4959q59cdad54da6a2627@mail.gmail.com>
Date: Wed, 21 Feb 2007 00:39:53 +0000
Message-Id: <1172018393.5884.122.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Impending Kexec interface change
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
X-List-Received-Date: Wed, 21 Feb 2007 00:39:57 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2007-02-20 at 14:36 -0800, Justin Patrin wrote:
> On 2/20/07, Richard Purdie <rpurdie@rpsys.net> wrote:
> > Anyone watching mainline kernels will note that ARM kexec support got
> > merged and will be in 2.6.21 which is good. The issue is that the
> > syscall number had to change since the one its using at the moment is a
> > big hack.
> >
> > This means we will have to change kexec-tools and at that point it
> > becomes incompatible with older kernels.
> >
> > We can wait a bit and change when 2.6.21 is released, or update all our
> > patches now to use the new proper syscall number and update OE now.
> >
> > I know the NSLU2 people are users of this and would value their input.
> >
> 
> I use kexec on my Zaurus to test new kernels (and run multiple "ROM"s)
> so I'd be ineterested in the fix as well. I don't particularly care
> how it's done, though. Please let the list know again once something
> is decided and done. :-)

After discussion with the NSLU2 people, it was agreed we should just get
on with it. I've updated the zaurus kernels (linux-rp) and kexec-tools
itself. The NSLU2 kernels will follow. Anyone else using ARM kexec needs
to ensure their kernel uses the new syscall number 347.

OE users should ensure their kernels and kexec-tools versions match.

Regards,

Richard



