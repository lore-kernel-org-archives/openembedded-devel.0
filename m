Received: from mail-fx0-f212.google.com ([209.85.220.212])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1NRKTr-0004rl-Te
	for openembedded-devel@lists.openembedded.org;
	Sun, 03 Jan 2010 08:02:30 +0100
Received: by fxm4 with SMTP id 4so11865692fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 02 Jan 2010 23:00:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=yiIdfjd0fD2UHLgGtcQeP71J/4JrgnhVoZW88BO60xI=;
	b=ueQLa4gS7cIUZJCQT+EgwtrbzMk/FZCFuCOMOsVKDbailMgZPt11fyfR6QOeDRdaqK
	FJgp3MTha97YbrsTV3C6KqepA3/euLrXjBig8vrFey/7S9mzf8kdAD+nA/j+DO/LUSrl
	R+DDOvq5GZvhdLv38a6JNhubT4cXo7cEIakyw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=KJEJADnUIgbUUM0QGRzxWK6aq4b7xu7FaNwTWAwW7dJiaoewlrQO40mb+9HKL4sqt4
	K90QeauzTQ8lsGtJfEVwrEQyMAUi7BCS2cB5m7Fma5Lc4UzCmUj/QeMCMwzEh5olagyR
	x7Rg42sF+CmqV1Xpj5a7Xv2sjD++sk/h0/+/s=
Received: by 10.223.127.200 with SMTP id h8mr21329949fas.56.1262502026293;
	Sat, 02 Jan 2010 23:00:26 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 13sm5639197fxm.13.2010.01.02.23.00.25
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 02 Jan 2010 23:00:25 -0800 (PST)
Date: Sun, 3 Jan 2010 08:00:30 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100103070030.GA3202@jama>
References: <1262452243-8187-1-git-send-email-Martin.Jansa@gmail.com>
	<1262455806.2553.90.camel@lenovo.internal.reciva.com>
MIME-Version: 1.0
In-Reply-To: <1262455806.2553.90.camel@lenovo.internal.reciva.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.220.212
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] sanity.bbclass: Reading /proc/sys/vm/mmap_min_addr is not permitted with 2.6.33+ on host
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
X-List-Received-Date: Sun, 03 Jan 2010 07:02:31 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Jan 02, 2010 at 06:10:05PM +0000, Phil Blundell wrote:
> On Sat, 2010-01-02 at 18:10 +0100, Martin Jansa wrote:
> > * With 2.6.33-rc2-00252-ge9e5521 on my host I noticed that
> >   "cat /proc/sys/vm/mmap_min_addr" returns now
> >   "cat: /proc/sys/vm/mmap_min_addr: Operation not permitted"
> >   Its probably becuse of
> >   http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=commit;h=0e1a6ef2dea88101b056b6d9984f3325c5efced3
> >   But I'm not sure if checking CAP_SYS_RAWIO even for reading this value
> >   is intentional or just bug which should be fixed in kernel.
> > 
> > * This patch prints notice about need to check that value yourself (as
> >   root) instead of failing with "ERROR: IO Error: [Errno 1] Operation
> >   not permitted"
> > 
> > * Its not optimal, because this notice is shown every time you run
> >   bitbake (even after checking/setting 0 to mmap_min_addr if you have
> >   kernel not allowing to read it
> > 
> 
> That does sound fairly unsatisfactory.  Printing a diagnostic on every
> build, with no way for the user to suppress it, surely can't be the way
> of the future.

Yes, agreed. I consider this only as temporary solution, because 
without this change I cannot use bitbake at all and of course I can
remove that message if this behavior stay the same in 2.6.33 release or
someone check qemu mmap failure.

That's why I didn't push it and just sent it here as heads up for
builders with 2.6.33-rc* to save tham few mins checking what happen to
bitbake.

> If you can't tell whether mmap_min_addr is set correctly or not then it
> would probably be better to not show the diagnostic at all.  Perhaps you
> could investigate patching qemu to print a more meaningful message if it
> actually encounters a mmap() failure of this kind.

Cheers,

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


