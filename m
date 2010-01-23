Received: from mail-fx0-f215.google.com ([209.85.220.215])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1NYczX-0000wB-UT
	for openembedded-devel@lists.openembedded.org;
	Sat, 23 Jan 2010 11:13:22 +0100
Received: by fxm7 with SMTP id 7so217909fxm.28
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Jan 2010 02:11:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=KUkx9miyTyrsvkccGKk5839awqkR4mm88PtmM7pXqVM=;
	b=mOIJaEtXh5If/zxSAnJAiPru5YSyhicAjD/gJ8DggCFTVcnT3pLh9MXFuEcGESkLvJ
	M4MUcCg4vgaKr5ViqWkJA5YCu7rrt+aBBk5lSHMWsfyXAGUIWAZqVrvZlgMiAj8Ochum
	oW/gA+MeovTNONQOWmB+jwu2/BezvvphTyndA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=N0w813Esv6gA8+dHE+H91bJPVJZy08v31x98Qgy4Y+3uOcgdVHEPWt//KjHqNvy4yq
	BLlWYQq6Gr3lrxjZdj80qowPfuTGmXTHYDjTY1SZ/QdX+o5cK5hPkJIMUIs1t30q0QJQ
	hhnivJfJ3Sb1eWFONAMcPc5jCOPQ4BbppLDiQ=
Received: by 10.87.24.4 with SMTP id b4mr6503415fgj.51.1264241460180;
	Sat, 23 Jan 2010 02:11:00 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 16sm1750337fxm.0.2010.01.23.02.10.58
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 23 Jan 2010 02:10:59 -0800 (PST)
Date: Sat, 23 Jan 2010 11:10:47 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100123101047.GE15943@jama>
References: <> <1264239367-26057-1-git-send-email-camelguo@gmail.com>
	<201001231051.06864.holger+oe@freyther.de>
	<op.u6zcjg0gmn1qzu@guohr-laptop-ubuntu>
MIME-Version: 1.0
In-Reply-To: <op.u6zcjg0gmn1qzu@guohr-laptop-ubuntu>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.220.215
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] linux-storcenter: fix circular dependency between do_package and do_deploy
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
X-List-Received-Date: Sat, 23 Jan 2010 10:13:23 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Jan 23, 2010 at 05:55:54PM +0800, Guo Hongruan wrote:
> Yes, I did.
> 
> the same question exists in
> recipes/linux/gumstix-linux.inc|72| addtask deploy before do_package
> after do_install
> which may cause circular dependency too.

But if you just remove that line, the custom do_deploy task won't be
used at all IIRC.. so proper fix would be to adjust after and before
like in a55e9a527a8c9823044196d031f2da2783ff8f35 and then
bc2bddb71d8c5db25b80aa6435392ec1c8df39f9

Probably:
addtask deploy before do_build after do_package

but please check
before do_build was needed to force it run at all (for -c build)
after do_package was used, because we're packing already stripped
modules to modules.tgz and we needed to have packages-split already
populated.

Regards,

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


