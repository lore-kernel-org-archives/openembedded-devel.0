Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <rpurdie@rpsys.net>) id 1J9UVC-0001ni-Od
	for openembedded-devel@openembedded.org; Tue, 01 Jan 2008 00:57:02 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id lBVNonl3004896
	for <openembedded-devel@openembedded.org>; Mon, 31 Dec 2007 23:50:49 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 16476-02 for <openembedded-devel@openembedded.org>;
	Mon, 31 Dec 2007 23:50:45 +0000 (GMT)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id lBVNJ0KI020509
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>; Mon, 31 Dec 2007 23:19:40 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <1653907704.20071231211045@vanille-media.de>
References: <4774C182.20501@gmail.com>
	<200712281208.44069.openembedded@haerwu.biz>
	<1653907704.20071231211045@vanille-media.de>
Date: Mon, 31 Dec 2007 23:18:59 +0000
Message-Id: <1199143139.4664.23.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Tosa kernel bloat
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
X-List-Received-Date: Mon, 31 Dec 2007 23:57:03 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2007-12-31 at 21:10 +0100, Michael 'Mickey' Lauer wrote:
> >> Tosa kernel is bloated with the recent patch and change to
> >> defconfig-tosa
> >>
> >> |`/home/gordon/oe/build/tmp/work/tosa-angstrom-linux-gnueabi/linux-rp-2
> >> |.6.23-r14/linux-2.6.23' Size is 1296464
> >> | FATAL: This kernel is too big for your PXA Zaurus and will destroy
> >>
> >> data if you flash it. Please reduce the size of the kernel by making
> >> more of it modular.
> 
> > Same on Poodle:
> > | make[1]: Leaving directory
> > `/home/hrw/devel/build/angstrom/tmp/work/poodle-angstrom-linux-gnueabi/linux-rp-2.6.23-r14/linux-2.6.23'
> > | Size is 1306384
> > | FATAL: This kernel is too big for your PXA Zaurus and will destroy data
> > if you flash it. Please reduce the size of the kernel by making more of
> > it modular.
> 
> I vaguely remember that the host toolset has an influence on that. Do
> you remember where the same kernel compiled ok for Richard but other
> guys got the too-big error? Did we ever found the actual cause of
> that?

I don't think we did ever get to the bottom of that. It was a 64 bit
machine compiling for 32 bit that showed the problem.

I have to admit I haven't tested the size of the kernels, I have that
check disabled locally as I've been pushing kexec and relying on that. I
pushed a load of defconfig fixes for poodle and its size should be under
control now, I'm not sure about tosa.

We do have a problem with kernel sizes in recent kernels, one we can't
really afford to ignore any longer. I made a post to LKML about some
size tests I made. My conclusion is that the networking stack is the
point of bloat in the zaurus kernels now and its the area we need to
address. It seems its impossible to compile half the networking stack as
a module and I'd like to see that changed. Any ideas or help here
welcome!

Cheers,

Richard




