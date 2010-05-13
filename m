Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OCU7f-0003W0-UJ
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 May 2010 10:50:33 +0200
Received: by fxm11 with SMTP id 11so959906fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 May 2010 01:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=G7TnruIY7S/JlMHyzGiXXTms/iIizghCqCQtU1ENqSM=;
	b=HTdD7uAN3+Ri+pfh+9NUfesozQi8zbJ5gnhUJWGkwhTIAoexZe0wpPL2EPUqLmdI0b
	AevOgP3soGWUEACXYu4H8aVHDvXKCQjffsnXHh3EOpzBQF/v/oGIes3OJU9Usm/umJvR
	cXsCJbhhW7KQhD7XN2oANeCQwdUseA0szxIP0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=QCNMJNSJIjdDwI4u249IXmZXHXL4M55tdMcr5Peiay7km3IVBy8J7wDWHRuZqSogJq
	R6T7hmDvjQLg7jJFbPZqmiWgZgW3QkDqL6GzeQxmJ4efz3GUQe/cdp0/VovxRsM91+bK
	JOp5YMSkvRx3+/2BDA2GitcyhJ9nkkY0fDBFg=
Received: by 10.223.99.212 with SMTP id v20mr9706130fan.44.1273740392310;
	Thu, 13 May 2010 01:46:32 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id u12sm4843296fah.16.2010.05.13.01.46.31
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 13 May 2010 01:46:31 -0700 (PDT)
Date: Thu, 13 May 2010 10:46:33 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100513084633.GC3370@jama>
References: <alpine.DEB.2.00.1005121722300.14972@lynx>
	<201005130953.59314.roman@khimov.ru> <20100513064037.GB3370@jama>
	<201005131223.22252.khimov@altell.ru>
MIME-Version: 1.0
In-Reply-To: <201005131223.22252.khimov@altell.ru>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: some possible fixes in the OE web pages
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
X-List-Received-Date: Thu, 13 May 2010 08:50:38 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, May 13, 2010 at 12:23:22PM +0400, Roman I Khimov wrote:
> В сообщении от Четверг 13 мая 2010 10:40:37 автор Martin Jansa написал:
> > On Thu, May 13, 2010 at 09:53:54AM +0400, Roman I Khimov wrote:
> > > В сообщении от Четверг 13 мая 2010 01:30:53 автор Robert P. J. Day 
> написал:
> > > > * on http://wiki.openembedded.net/index.php/OEandYourDistro#Ubuntu,
> > > > there's a reference to configuring for qemu-arm:
> > > >
> > > >   echo 128 > /proc/sys/vm/mmap_min_addr
> > > >
> > > > from memory, i always simply set that to zero on fedora.  is there
> > > > something magic about the value 128?  at the moment, it's at the
> > > > default value of 65536 on this ubuntu system.
> > >
> > > With current qemu in OE mmap_min_addr tricks are not needed at all.
> > 
> > On some systems (I have report from fedora and kubuntu) it still needs 0
> > in mmap_min_addr :/.
> > 
> > Investigating why, but it's slow because it doesn't fail on my box.
> > 
> > My guess is that this chunk from
> > http://git.qemu.org/qemu.git/tree/linux-user/main.c
> > cannot work on systems where normal user is not allowed to read
> > /proc/sys/vm/mmap_min_addr and mmap_min_addr is not initialized with
> > sane value.
> 
> Just checked with Ubuntu and Fedora, it really isn't possible to read 
> /proc/sys/vm/mmap_min_addr as regular user, although it has 644 permissions on 
> it. "Security"? Damn.
> 
> [after 15 minutes]
> 
> OK, actually there is a useful entry on Launchpad:
> https://bugs.launchpad.net/ubuntu/+source/linux/+bug/568844
> 
> The real solution is in the kernel, it should be fixed for latest Ubuntu and 
> hopefully Fedora will catch up on this issue too.
> 
> http://git.kernel.org/?p=linux/kernel/git/jmorris/security-
> testing-2.6.git;a=commitdiff;h=822cceec7248013821d655545ea45d1c6a9d15b3
> 
> Interesting that openSUSE with 2.6.31 kernel doesn't have such problems... And 
> our main build machine with Debian stable + 2.6.30 kernel works fine too. 
> Probably this check got introduced in 2.6.32.

Hi,

tt was introduced somewhere in 2.6.33-rc[12]
http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=commit;h=0e1a6ef2dea88101b056b6d9984f3325c5efced3
see my commit:
http://git.openembedded.org/cgit.cgi/openembedded/commit/?id=1b426b8382d2a7864b63051b0707e577f2c0ce69

but really strange thing is:
bitbake@jama ~/build.dev.shr.gta $ cat /proc/sys/vm/mmap_min_addr
cat: /proc/sys/vm/mmap_min_addr: Operation not permitted
root@jama series # cat /proc/sys/vm/mmap_min_addr
4096
Linux jama 2.6.34-rc7-JaMa-00056-gcea0d76 #7 SMP PREEMPT

and qemu-native/kqemu still works (probably simple cat is not good
test, maybe qemu-arm gets higher capabilities before trying to read it
and it's enough on my box and not enough somewhere else).

> Well, as the problem is in the kernel really, I think everyone having this 
> problem should push distro maintainers to update kernels with the tiny fix 
> mentioned above. But as a workaround, yep, "0" setting might work (beware that 
> it might also not work as in here:
> https://bugs.launchpad.net/ubuntu/+source/linux/+bug/423513
> ).

Another not tested workaround:

as qemu can work with (hopefully any) non-zero mmap_min_addr, maybe add
patch to linux-user/main.c that if it cannot read
/proc/sys/vm/mmap_min_addr then assume 65536 (ubuntu default)?

Regards,

> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


