Received: from mail-fx0-f210.google.com ([209.85.220.210])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1NhgM5-0004vq-4r
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Feb 2010 10:38:04 +0100
Received: by fxm2 with SMTP id 2so949611fxm.27
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Feb 2010 01:35:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=0mapeyLrCFg7xUEpcEpUs3gnSAdzG88oXelVO5B6AZ0=;
	b=BVm7wH4evm4QY9El6cXM5GMnvPgFqZ2PpjK4rLqevq1g2LNnZl1KhkZIwG7eGBdRhg
	hO8Y3vr+uTzVxLeCWUvGobn+iAibofgFMdx7SykIYyeh/laZwKV6Ed1+KCG4ATvqn86S
	T/KrJFUPO4C2VZLLF6DVtlusUgt2RPbFAMqa8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=eFAO0t0FGvgKTXLIVQBMCn+7WnOollfhyZjYjsHMyZgR1yUPlBU6D+rcSVaWsHmrW/
	w5OEl7MAEVnRiSGa1zXyDdguuJjNrwLxz1CAPTw3RQIS9XKbFdkUmyyhAUUluCi8Efym
	5wmvhjrezbiZZPr2iSpkrm59FsSSSqA+eNXiQ=
Received: by 10.223.144.85 with SMTP id y21mr4523628fau.71.1266399321880;
	Wed, 17 Feb 2010 01:35:21 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 16sm3971110fxm.4.2010.02.17.01.35.19
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 17 Feb 2010 01:35:20 -0800 (PST)
Date: Wed, 17 Feb 2010 10:35:04 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100217093504.GI3233@jama>
References: <20100214135613.GF5364@jama>
	<be7a9f3d1002160552gcd17ab4ye92dc6a824c30917@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <be7a9f3d1002160552gcd17ab4ye92dc6a824c30917@mail.gmail.com>
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
X-List-Received-Date: Wed, 17 Feb 2010 09:38:04 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 16, 2010 at 11:52:09AM -0200, Otavio Salvador wrote:
> Hello,
> 
> On Sun, Feb 14, 2010 at 11:56 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> > If nobody points some big disadvantage I didn't think about, I'll give
> > it a try (with precompilled gentoo stage tarball it's task for half an
> > hour using cp :)).
> >
> > Using some sofisticated sandbox setting (as gentoo ebuilds do) would be
> > also good alternative, is someone trying that?
> 
> Take a look in cowbuilder, from Debian. It uses copy-on-write to
> create chroots for building packages in a clean chroot; it might be
> used to prepare a clean chroot to a full build of OE from time to OE
> and catch bugs on it.

Thanks, I'll check that later, now I'm quite happy with chroot I have
now.

Only problem I had was with cvs for autopoint. It clearly has problem
when used on chroot/mount --bind and also with newer glibc.

So finally I found working combination in gentoo.
Reported with patch here:
http://bugs.gentoo.org/show_bug.cgi?id=289022

Regards,

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


