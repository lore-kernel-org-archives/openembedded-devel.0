Received: from fg-out-1718.google.com ([72.14.220.153])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1Nzl3T-00049p-HH
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Apr 2010 08:17:31 +0200
Received: by fg-out-1718.google.com with SMTP id e12so1682886fga.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Apr 2010 23:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=vrzDTHzU7FdpSDAn0fsrStehpXM0I2PzyoHjsZNFZcI=;
	b=gqH7sYC+VrFyIOwcqZ/6mPSpZMsRJ8+Bc5Usyj/98JBbdQCWig8UGvpPp0nP7gKHcy
	fX2AXIIUjucHkvlqUZZURywsoUTBKFF47qogc4PNaXf1oymQDfOdKNGg18HeCVlflKeu
	/ONAInf8O2ijPtEUX8vcqRAt3qPgJI6lzWrug=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=jktdOvjd87uc+rN63czEJhve0ky4ZP/Xh5SsaxgHQEMcQghVc88k/r+1GPHzh/YElP
	FXui/mHhU5/XFC0U2UcWqunXonMMTY4tPZ6n961FKoLEWB2Z/7H0q8mXRyCaTLh8/9ri
	ATAL+VUSb8Auc+xVIJQXsGuuNv4hYeaEaJm6k=
Received: by 10.87.42.2 with SMTP id u2mr15215467fgj.79.1270707250943;
	Wed, 07 Apr 2010 23:14:10 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 15sm1096466fxm.15.2010.04.07.23.14.10
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 07 Apr 2010 23:14:10 -0700 (PDT)
Date: Thu, 8 Apr 2010 08:14:13 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100408061413.GC3269@jama>
References: <4BBB3C39.5070002@mwester.net>
	<q2mb6ebd0a51004060826wb048ffa2ge1fbcfb1892a9bac@mail.gmail.com>
	<4BBD4860.8070306@mwester.net> <20100408041801.GA3269@jama>
	<4BBD6763.9060409@mwester.net> <20100408060727.GB3269@jama>
MIME-Version: 1.0
In-Reply-To: <20100408060727.GB3269@jama>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 72.14.220.153
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: SRCREV defined too late -how to fix?
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
X-List-Received-Date: Thu, 08 Apr 2010 06:17:32 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 08, 2010 at 08:07:27AM +0200, Martin Jansa wrote:
> To be honest SRCREV in linux-ixp4xx.inc is really strange, I put it
> there as it's as close to previous state as possible (same SRCREV is
> share between all versions of linux-ixp4xx recipe). I would expect
> different SRCREV of patchset for different module=${KERNEL_RELEASE} (I
> think it's harder to test all KERNEL_RELEASEs when you need to bump
> patchset SRCREV for latest RELEASE or unnecesarry kernel upgrades for
> users of older KERNEL_RELEASE when someone bumped patches only to get
> more patches for latest RELEASE without any change in their old version.

To finish my thought.. 

With this new layout (SRCREV in recipe) it will be much easier to bump
SRCREV ie only for linux-ixp4xx_2.6.29.bb (overwritting shared SRCREV
from linux-ixp4xx.inc after its include), but be aware that if you put
SRCREV_pn-linux-ixp4xx in distro config you will also overwrite this
locally bumped SRCREV which can be confusing a bit.

Regards,
-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


