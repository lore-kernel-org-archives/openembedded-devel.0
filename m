Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1P8odz-0007IQ-SN
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Oct 2010 08:28:58 +0200
Received: by bwz15 with SMTP id 15so15937bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Oct 2010 23:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:cc:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=gWv3DZ289fCFYIUzcbNT2eljXFOlVWC36OeA8fSHbKQ=;
	b=wD9z3qjTrs/rrRSzbjGVnjOglwyHmufurwQrHn6kAXdPekjFn+Kl5sVj0H0HCcTWCe
	VKgtIIUy8/D2aWCcNAXMyRWpNGOVG93P7Z2S5tN/JJYfTE2/oQy9PNX2kSv/uJmHvStb
	krH9zZZnjkVUUHZGBhshY5aHGKElg9l3S80dY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=D9wk4F21TltFxCxfgh3wgaW+o5MDyNALsgXBzGOTg7cPYF4BMnDQaov875CUgSwKuq
	qZNyDESPIlOIgbTW69wtDnGcrqjALnZChi5ypGG0JII7XJXM7ty3rSWRKwaJaXC/AXpv
	9/IDfJ3wDUcfhjq9nOfEgGqy/63urxa3LZHYA=
Received: by 10.204.73.13 with SMTP id o13mr263378bkj.173.1287642497774;
	Wed, 20 Oct 2010 23:28:17 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id d27sm867291bkw.2.2010.10.20.23.28.15
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 20 Oct 2010 23:28:16 -0700 (PDT)
Date: Thu, 21 Oct 2010 08:27:55 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Message-ID: <20101021062755.GB13082@jama>
References: <AANLkTikrgw76+iAr8n3a3Kv+1joHN0ZAKTMcmOvNXrbU@mail.gmail.com>
	<1287257081-25608-1-git-send-email-Martin.Jansa@gmail.com>
	<131E5DFBE7373E4C8D813795A6AA7F0803110B3131@dlee06.ent.ti.com>
	<AANLkTimWmTWAkCPAabOagq2S5gtfMztov8xiBcK7q_Vh@mail.gmail.com>
	<131E5DFBE7373E4C8D813795A6AA7F0803110B3140@dlee06.ent.ti.com>
	<20101019192458.GB6202@denix.org>
	<20101020232906.GY11514@denix.org>
MIME-Version: 1.0
In-Reply-To: <20101020232906.GY11514@denix.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: clarson@kergoth.com, openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] bitbake.conf: don't append MACHINE_OVERRIDES to OVERRIDES when it's empty
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
X-List-Received-Date: Thu, 21 Oct 2010 06:28:58 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 20, 2010 at 07:29:06PM -0400, Denys Dmytriyenko wrote:
> On Tue, Oct 19, 2010 at 03:24:58PM -0400, Denys Dmytriyenko wrote:
> > On Tue, Oct 19, 2010 at 02:18:25PM -0500, Maupin, Chase wrote:
> > > > > I saw this issue in my overlay of having a "::" in my OVERRIDES which
> > > > > caused my parsing to fail in angstrom.inc.  Applying this fix from
> > > > Martin
> > > > > resolves the parsing issue.  My OVERRIDES appear to be in the correct
> > > > order
> > > > > with this change:
> > > > 
> > > > Can you explain this?  "caused my parsing to fail" is not very useful
> > > > information.  What exactly failed?
> > > 
> > > Chris,
> > > 
> > > Sorry, I thought this was an understood issue.  I have put the error output 
> > > I got below.  Basically, when I got to line 509 of data.py the variables had 
> > > the following values:
> > > 
> > > vars = set(['__functions_', '_', '__functions__'])
> > > 
> > > var = '__functions__'
> > > 
> > > overrides = ['pn-angstrom', 'fail-fast', 'build-linux', 'arm', 'INVALID', 'angstrom-2008.1', '', 'am37x-evm', 'local']
> > >  
> > > o = ''
> > > 
> > > OVERRIDES = 'pn-angstrom:fail-fast:build-linux:arm:INVALID:angstrom-2008.1::am37x-evm:local'
> > > 
> > > The current override being evaluated was the '' one.
> > > 
> > > The line being evaluated in my overlay was USERDISTRO := "${DISTRO}" in my 
> > > copy of angstrom.inc
> > 
> > Chris,
> > 
> > FYI, the below "RuntimeError: Set changed size during iteration" exception 
> > happens in bitbake 1.8.18 but not the 1.10/mainline.
> 
> Chris, Martin,
> 
> After more debugging, it seems the problem is caused by using bitbake 1.8.18 
> and conf/collections.inc at the same time, as that version of bitbake chokes 
> on empty override "::", when it gets re-spawned from collections.inc. If I 
> replace the use of COLLECTIONS with direct BBFILES/BBFILE_* assignments, bitbake 
> parses everything just fine. It is reproducible right now on the latest OE 
> mainline with bitbake 1.8.18 by just adding "require conf/collections.inc" in 
> local.conf or bitbake.conf.
> 
> I see that Martin's patch was marked as "Superseded" and archived - is there a 
> new patch coming? Or are there any side-effects of this patch? I would 
> definitely like to push this patch ASAP to address our immediate problem. 

I've marked it as "Superseded" when Chris pushed that filtering and I've checked 
that it fixes my case.

Maybe we can resolve it by using limited OVERRIDES in FILESPATH as
suggested in "[RFC] do we really need all OVERRIDES in FILESPATH?".
Instead of creating more complicated constructs to be able to push more
stuff to FILESPATH (without '::') and then never use it.

Regards,

-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


