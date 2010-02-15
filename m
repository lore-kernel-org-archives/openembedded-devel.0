Received: from mail-fx0-f210.google.com ([209.85.220.210])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1Nh5TV-0004xy-LC
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Feb 2010 19:15:16 +0100
Received: by fxm2 with SMTP id 2so2175297fxm.27
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Feb 2010 10:12:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=8iulYVBL9trRwpzaJzrpAhjHAhSydNe+EDVszyQSK6k=;
	b=IyyC5yh/8VOEzyHbfeDmSPDWvOlgN1JXMjwHf9ZLsPZAbBimVkQVZbXeTUbTqtm+cp
	VpjhdDjSUYAvvAYZqjQw4TumA8H4b0bKLONQ103v5VuA545vZt+reyywi1MzULnE36cB
	EZRIbWeMRBdcJrVJQq0FLFikpyvzf9VPlxzRQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=pEYfRHr3BTaN9IO4IktuRnT/G6X7gO4B87ELqRu5qKdX/NsjTbN1JRJ7+4N7OuLTSa
	jUS4pKzQabLTX9+K4r20NHLU2TY6sA/fDYzUCIMG+xkwiP5gGVs18MkT8oG5Uct77zJ5
	rFZMMmJe9LTdmAWSvBBi75si46VcBspI/BUh4=
Received: by 10.223.143.70 with SMTP id t6mr6312125fau.101.1266257555694;
	Mon, 15 Feb 2010 10:12:35 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 14sm3128606fxm.7.2010.02.15.10.12.34
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 15 Feb 2010 10:12:34 -0800 (PST)
Date: Mon, 15 Feb 2010 19:12:32 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100215181232.GB3233@jama>
References: <20100214135613.GF5364@jama> <4B79673B.50108@balister.org>
	<ac9c93b11002150859i4aa5ee7eid6a648d95fa25d6c@mail.gmail.com>
	<20100215171952.GA3233@jama>
	<ac9c93b11002150957r4e9bc0e6tbeb56e62c94e89b0@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <ac9c93b11002150957r4e9bc0e6tbeb56e62c94e89b0@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.220.210
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Using bitbake in minimal chroot environment
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
X-List-Received-Date: Mon, 15 Feb 2010 18:15:16 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 15, 2010 at 06:57:22PM +0100, Frans Meulenbroeks wrote:
> Someone else told me the same today.
> What exactly causes this? I would expect I/O to be the differentiating
> factor as memory access and executing instructions should take the
> same time, shouldn't it?

AFAIK virtualized I/O is slowest part of virtualized world and building
with bitbake is IMHO mostly about I/O.

I'm running my gentoo system upgrades as well as all bitbake builds
(workdirs) on raid0 - strip over 3 SATA2 disks (before that I was using
huge tmpfs in RAM for workdirs - but that's not usable ie for OO.org
build :))

And with chroot I can use it without any problem (just updated path in
already used mount --bind).

Also for running it from VM I would need to update host kernel from time
to time, on the other side sharing kernel with my running system didn't
create any OE related issue (except that sanity check for mmap with 
2.6.33+ - which is already fixed)

Regards,

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


