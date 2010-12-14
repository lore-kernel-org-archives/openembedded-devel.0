Received: from mail-fx0-f42.google.com ([209.85.161.42])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1PScm7-0007mR-KQ
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Dec 2010 22:51:12 +0100
Received: by fxm11 with SMTP id 11so1195425fxm.29
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Dec 2010 13:49:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=KR7rUYrebV6LIaOM9XMYoeVGFiuPnlvkD8SdNYNOtgg=;
	b=Vm92ZefXKmzRZuu2rS+3Ht8dA4Q5n3PJSUW9hrmnPIRP9Sen15LPNsXjMKLqEWFfnP
	Bw7NLrxf0WbI7V6h1x0LOyYCMTgtKaaTn4S0rz/e7WrkQYlnMuHjfHHs2ogs2byWV5VU
	8fpPKncZ0ve+ZHZnRpvXEWTl3iAogH5Qzc2Y0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=UhTJ7dVFkaOaH626yRp8b87ZuhJZGhSpmrZ3OIM0VvV3Do/2cjpc9v82S+odMN41wZ
	JbzrIKoLMeyjY/4aFs05+yDk47thawmyK8z27awQ29kKdaiVC6tqL68EFYrjaFLPzaxO
	bkgFnjzyt/mvFbmU3YSl0+Sargiv9b7vxSsE0=
Received: by 10.223.79.71 with SMTP id o7mr6285035fak.116.1292363374927;
	Tue, 14 Dec 2010 13:49:34 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id n3sm192082faa.29.2010.12.14.13.49.31
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 14 Dec 2010 13:49:32 -0800 (PST)
Date: Tue, 14 Dec 2010 22:50:11 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101214215011.GG6662@jama>
References: <E1PSZng-0001y3-K3@melo.openembedded.org>
	<20101214205943.GF6662@jama> <4D07DF4B.7000800@balister.org>
MIME-Version: 1.0
In-Reply-To: <4D07DF4B.7000800@balister.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-SA-Exim-Connect-IP: 209.85.161.42
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [oe-commits] Steve Sakoman : coreutils: experimental coreutils fix
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
X-List-Received-Date: Tue, 14 Dec 2010 21:51:12 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 14, 2010 at 04:19:07PM -0500, Philip Balister wrote:
> On 12/14/2010 03:59 PM, Martin Jansa wrote:
> > On Tue, Dec 14, 2010 at 06:40:36PM +0000, git version control wrote:
> >> Module: openembedded.git
> >> Branch: org.openembedded.dev
> >> Commit: 6f0ed3e2cebc76cc992ddc102ade8bfa13e17acb
> >> URL:    http://gitweb.openembedded.net/?p=openembedded.git&a=commit;h=6f0ed3e2cebc76cc992ddc102ade8bfa13e17acb
> >>
> >> Author: Steve Sakoman<steve@sakoman.com>
> >> Date:   Sat Dec 11 07:16:26 2010 -0800
> >>
> >> coreutils: experimental coreutils fix
> >
> > what was wrong?
> >
> 
> Sorry, I committed a fix I pulled from Steve's repo an dhe had a quick 
> message on the commit.

OK, no problem

> Basically, the coreutils post install script that linked the coreutils 
> version to the correct did not work. We can't figure out why, but 
> removing the test solved the problem.

Ah :/ never noticed it here.

> As a side note, Poky also dropped the test.

cannot find coreutils-target.inc or cherry-pick of 
http://git.openembedded.org/cgit.cgi/openembedded/commit/?id=05794e79b4af2d2f3ded69a02c0275335b75a47c
in poky.. :)

> Since this changes creates output that is more correct than the old 
> behavior, I pushed it.

Then please remove all older coreutils versions which doesn't provide
complete set of bindir_progs, base_bindir_progs, sbindir_progs, because
ie coreutils-6.0 now breaks ie timeout:

SHR root@gjama ~ $ ll /usr/bin/timeout
lrwxrwxrwx    1 root     root            17 Dec 14 22:34 /usr/bin/timeout -> ../../bin/busybox

SHR root@gjama ~ $ opkg install coreutils
Installing coreutils (6.0-r6.0.6) to root...
update-alternatives: Linking //usr/bin/basename to basename.coreutils
...
update-alternatives: Linking //usr/bin/timeout to timeout.coreutils
...
update-alternatives: Linking //usr/bin/[ to lbracket.coreutils

SHR root@gjama ~ $ timeout
-bash: timeout: command not found
SHR root@gjama ~ $ which timeout
SHR root@gjama ~ $ ls -lah /usr/bin/timeout*
lrwxrwxrwx 1 root root 17 Dec 14 22:41 /usr/bin/timeout -> timeout.coreutils

Regards,

-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


