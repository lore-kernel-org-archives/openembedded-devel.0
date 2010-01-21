Received: from fg-out-1718.google.com ([72.14.220.158])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NY6NS-0006Gu-1n
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Jan 2010 00:23:53 +0100
Received: by fg-out-1718.google.com with SMTP id 19so259827fgg.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jan 2010 15:21:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=Bndk6NLZSgPjfCBeEb3zs4WQtrNqcOPfFrse9VH32LA=;
	b=khnbNFb2HCHt9a9TuEy+yTw4aHJk8Vu4LTo0mq4PFO/eV2u/hIDVR/8ZY+jtFXyrRw
	8lAiyDKB5+lq7+t5O7v/zZtXZqJly0UJfs9JkxX3WpJ8PpH8lA9m54pUkLBLQ2GMdGHc
	NF8zxwvvwd6pHvy+LDa3ZVKmNDAwB5YuFzOOw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=f/k5oUXgQyZ5dWzEKtl3tY99pQweWSPcbGz5y8bP1iruJhx6AM0FFiorSPRVvBQKWk
	rIfxVEXZ3pM2mqTuPEf7KQsmqyArk03pCO3fxt37MhDNVMEcQQ5omyTZIbvt500Jbi0y
	xzhs9thf6B74MT7QTUy6vzQsBKCvWHpvF/JA8=
Received: by 10.87.76.30 with SMTP id d30mr3587122fgl.6.1264116094737;
	Thu, 21 Jan 2010 15:21:34 -0800 (PST)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id 12sm25421684fgg.22.2010.01.21.15.21.31
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 21 Jan 2010 15:21:33 -0800 (PST)
Date: Thu, 21 Jan 2010 15:22:10 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100121232210.GB11015@gmail.com>
References: <op.u6vw72i1mn1qzu@guohr-laptop-ubuntu>
	<19c1b8a91001211410y19908564h7fe9aca3f81317ab@mail.gmail.com>
	<4B58D410.2020100@techsol.ca>
MIME-Version: 1.0
In-Reply-To: <4B58D410.2020100@techsol.ca>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 72.14.220.158
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: I realy think we should upgrade PREFERRED_VERSION_glibc to 2.9 in conf/distro/include/sane-toolchain.inc
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
X-List-Received-Date: Thu, 21 Jan 2010 23:23:53 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (21/01/10 14:24), Dallas Foley wrote:
> Khem Raj wrote:
> >On Thu, Jan 21, 2010 at 5:32 AM, Guo Hongruan <camelguo@gmail.com> wrote:
> >>Hi guys,
> >> I think we should upgrade PREFERRED_VERSION_glibc from 2.6 to 2.9 in
> >>conf/distro/include/sane-toolchain.inc. The reasons are:
> 
> Although I haven't tried a build from scratch in a few weeks or so,
> I have one known problem with glibc 2.9. I wonder if it's just me or
> not. glibc 2.6.1 always works. On my armv4t board gpe-mini-browser2
> always seg faults. I've tried different gcc and binutils
> combinations. However, glibc 2.9 on armv5te (imx) or armv7a (omap)
> work fine for me.

You could try to backport armv4t-interworking.patch from eglibc/files
that should help you will getting 2.9 up on armv4t. This patch is
applied to 2.10.1 may be moving to 2.10.1 would be better than 2.9
IMO

-Khem


