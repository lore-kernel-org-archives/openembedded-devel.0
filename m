Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1Oz3CX-0008KC-VN
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Sep 2010 10:00:14 +0200
Received: by bwz2 with SMTP id 2so1869000bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Sep 2010 01:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=oklLa7CHhtVDJ6mi1qGvKv6fR+XMM+e3sXHzHNPa5oU=;
	b=vYmHpvyj4bO6DAm6sWjPE06miwP5DqmFsafyqMj4nGJ/fc2+zi+uqPAmiKrZVEc9V8
	k6KxZ15lLxsKwQM8hWCmNDCpvC/xa4lPZeCQW8l3CgEt0rVN3hI98B7yuB03Qf46rRok
	Loe3DSGR4gDT+X/xJCGhynXXI/FCE/C25JV3M=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=nQ4n4ihz6Nin5F9Dh0SdC9TuhDpbVmvO/wuDHjQyU9v4cazeC8AhQ1CafHdoh0Z5kx
	3VlxFRfj6SFgN3I5W3uNlmWsiliY3H/QkHkurhUYaph91C4PDd4EV8Peh0SCx4cv9XJK
	zAPjvBQRS7GoDtNRbm6moFLsbGfACM8Q6di1Q=
Received: by 10.204.84.92 with SMTP id i28mr1895233bkl.57.1285315208909;
	Fri, 24 Sep 2010 01:00:08 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id d27sm1360273bku.22.2010.09.24.01.00.07
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 24 Sep 2010 01:00:07 -0700 (PDT)
Date: Fri, 24 Sep 2010 10:00:06 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100924080006.GB3312@jama>
References: <AANLkTinzRQGe9CLG_n5g0sFG0NDdZBdU2RSL9KjgzokP@mail.gmail.com>
	<1285314751.3715.5.camel@mattotaupa>
MIME-Version: 1.0
In-Reply-To: <1285314751.3715.5.camel@mattotaupa>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: git error ?
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
X-List-Received-Date: Fri, 24 Sep 2010 08:00:14 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 24, 2010 at 09:52:30AM +0200, Paul Menzel wrote:
> Am Donnerstag, den 23.09.2010, 22:11 +0200 schrieb Frans Meulenbroeks:
> > Hm,
> > 
> > On my latest git push I got:
> > 
> > frans@linux-suse:~/oe/openembedded> git push
> > Counting objects: 13, done.
> > Delta compression using up to 2 threads.
> > Compressing objects: 100% (7/7), done.
> > Writing objects: 100% (8/8), 649 bytes, done.
> > Total 8 (delta 6), reused 0 (delta 0)
> > error: unable to create temporary sha1 filename : Read-only file system
> > 
> > fatal: failed to write object
> > error: unpack failed: unpack-objects abnormal exit
> > To git@git.openembedded.org:openembedded
> >  ! [remote rejected] org.openembedded.dev -> org.openembedded.dev (n/a
> > (unpacker error))
> > error: failed to push some refs to 'git@git.openembedded.org:openembedded'
> > 
> > 
> > No idea what is going on here, guess it is at the git side. My fs is not r/o
> 
> I just wanted confirm, that you are not alone with this Git server
> problem. I am getting the same error as some weeks ago [1].
> 
>         $ git remote update
>         Fetching origin
>         git.openembedded.org[0: 140.211.169.165]: errno=Connection refused
>         fatal: unable to connect a socket (Connection refused)
>         error: Could not fetch origin

I can confirm
git+ssh:// works
but other protocols doesn't seem to work this morning

Regards,
-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


