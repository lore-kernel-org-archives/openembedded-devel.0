Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1ORAKj-00016V-Ep
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Jun 2010 22:44:38 +0200
Received: by bwz14 with SMTP id 14so1842064bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Jun 2010 13:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:date:from:to:cc
	:subject:message-id:references:mime-version:content-type
	:content-disposition:in-reply-to:user-agent;
	bh=PZZOgF6M3NvslS7CpbTxEJSRzpLvqv3M/OtiIJCdoDM=;
	b=we4Q7vCQN5ddCQWm21sSabR9WWgcjvcgz9TzL019EXHg1qsV3p2Yw0b9oL53xpbCNA
	5SGIitilxgNsP5UedArZbyKtdNOfOmax3AucGZ2Bz+5MpsreuUxyMlltFJIZPuzWzWeS
	8bezPvsuuEK5ZqkUKrNBcstwhasaWpNSKt0fs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=ukXvSn6Gt7fqhr4zHXr/+kkQvWIiGM+wHfMAb75IjPGPF4w3lLjOVwpo64LG9zaXlY
	wIBI8btbNK4FpmUThEvCNwIvrxYkUs9DoVTIt0DH/ko+YTZtmLeWuQinpJU5nVxLbZMg
	thmHkMkWLgnib7rgz5VpCap3Clq2T4E9LWa6s=
Received: by 10.204.151.78 with SMTP id b14mr4697287bkw.200.1277239203843;
	Tue, 22 Jun 2010 13:40:03 -0700 (PDT)
Received: from s42.loc ([84.119.101.18])
	by mx.google.com with ESMTPS id jt1sm10895332bkb.19.2010.06.22.13.40.01
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 22 Jun 2010 13:40:02 -0700 (PDT)
Received: from cow by s42.loc with local (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1ORAG9-0007wH-Ah; Tue, 22 Jun 2010 22:39:53 +0200
Date: Tue, 22 Jun 2010 22:39:53 +0200
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: Phil Blundell <philb@gnu.org>
Message-ID: <20100622203953.GB1184@mx.loc>
References: <1276114963.4424.42.camel@lenovo.internal.reciva.com>
	<1276199208-31929-2-git-send-email-rep.dot.nop@gmail.com>
	<AANLkTin367SqiCodgs_CxGiwAihL-SI0nlCJKUWqUZjq@mail.gmail.com>
	<1276201371.13179.20.camel@lenovo.internal.reciva.com>
	<AANLkTinAFdiBJ6jN3WwY75KsNwTPmkyoOL0iTgJ8UPFC@mail.gmail.com>
	<20100610205040.GW14941@mx.loc>
	<1276203991.13179.33.camel@lenovo.internal.reciva.com>
	<20100610212029.GX14941@mx.loc>
	<1276261152.31317.193.camel@mill.internal.reciva.com>
MIME-Version: 1.0
In-Reply-To: <1276261152.31317.193.camel@mill.internal.reciva.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 2/2] busybox: configure according to {MACHINE, DISTRO}_FEATURES
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
X-List-Received-Date: Tue, 22 Jun 2010 20:44:38 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 11, 2010 at 01:59:12PM +0100, Phil Blundell wrote:
>On Thu, 2010-06-10 at 23:20 +0200, Bernhard Reutner-Fischer wrote:
>> If the machine does not provide a choice to use or not use the MMU then
>> it makes no sense to take that into account for the package arch (think
>> bfin or i586 or certain coldfires/m68k), yes. If, OTOH, a machine
>> supports it (let's say ppc) then there must at least be a nice way to
>> distinguish ppc<endian><mmu><floatingpoint> i would have hoped.
>
>Endianness and FPU are clearly both part of the general ABI: virtually
>every package which contains compiled code is going to have a dependency
>on those two settings.  So, for DISTROs which support multiple values
>for either of those options, I would expect them to simply be encoded
>into the default PACKAGE_ARCH (either directly or via TARGET_ARCH); this
>is indeed what's already done with bi-endian ARM for example.  For
>DISTROs which only support one or the other, there's no need to draw the
>distinction.

ok, i see.
>
>MMU is perhaps a little more complicated since, at least in theory, one
>could imagine a DISTRO which supported both MMU-equipped and non-MMU
>hardware and where the majority of binaries were capable of running on
>both targets.  So in that case there might be a legitimate argument for
>making it be a per-package setting in order to get parallel builds of
>those packages that do actually care.  But I think the time to worry
>about that would be when the situation does actually arise in practice.

fair enough

I hereby mass-ping the patches in this thread:
[PATCH 1/3] uClibc: redo configuration
{1/2 was already applied by khem, thanks!}
[PATCH 3/3] busybox: picking IPv6 per default is not up to the package
[PATCH 1/2] uclibc: handle DISTRO_FEATURE="largefile"
[PATCH 2/2] busybox: configure according to {MACHINE,DISTRO}_FEATURES



