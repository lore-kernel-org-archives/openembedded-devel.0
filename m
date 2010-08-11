Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1Oj4fb-0008TX-Fg
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Aug 2010 08:20:16 +0200
Received: by fxm6 with SMTP id 6so1211838fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Aug 2010 23:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=yeVL/9O2WUFtz/2MDJd8MdDC48gto874scPa+1e0UrI=;
	b=sqK6e/mq17FfEKfcrnRLQrvrzVOTMnPdFH8vdC1gyB+wwP3YmJ6JBaokkJs3wtb7bK
	Djvb06VYKIproHZc4FYJL4j+aJhMQV/7uJ8kIAvkdb6SZA10m9E5czNVOv42wsqw1sX2
	Gx6lFOqZkexpwgOQl69xJtpmB7hdLbDhQGoHQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=ETjfb7akCM8EA5ximZ3QUs8FEzNu2jw8kCCzu0Mz68v+MNvf/NzGEG47QjEu+cZiL2
	mpCKqLPEvc8/7dC2mg7VA/e/W46dOm7AnEhbfR5NTiXLqadbAneDDM41T3hFvOONuLOy
	0YnI9WO1MTBBMVM1iyXmAx1e/qqE6ADwTyrzA=
Received: by 10.223.119.210 with SMTP id a18mr19296166far.52.1281507600163;
	Tue, 10 Aug 2010 23:20:00 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id b9sm2689422faq.31.2010.08.10.23.19.59
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 10 Aug 2010 23:19:59 -0700 (PDT)
Date: Wed, 11 Aug 2010 08:20:10 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100811062010.GB32300@jama>
References: <0B51A1E7C61D114DAE6FC10B0FD0ABA5018B5E82@deimsg40.de.net.world>
	<AANLkTinK5O3F25QJ40B8+rt5M57BKwWVOYytUEZqvP-D@mail.gmail.com>
	<AANLkTikjcrh78MDsSbdALEWbZGHU7nwrk14FQFiU=ynA@mail.gmail.com>
	<AANLkTimbjUYY22nf59gPAw-Xm05mMLNdDA61Ydc63DFs@mail.gmail.com>
	<i3se2n$gj7$1@dough.gmane.org>
	<AANLkTikUdG4hRo1wJmObU1g5fomeuViCirSBsVFCEYYZ@mail.gmail.com>
	<AANLkTimVFCKL+M_c0rb=Zu0cktc0_QZQzZikR_T63Wj2@mail.gmail.com>
	<AANLkTim2yjjPSC6=KfCgqWQteTqSFFga39gNyg7SoB3+@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTim2yjjPSC6=KfCgqWQteTqSFFga39gNyg7SoB3+@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Why PREFERRED_VERSION setting of <distro>.conf overrules local.conf setting ?
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
X-List-Received-Date: Wed, 11 Aug 2010 06:20:18 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 11, 2010 at 08:08:20AM +0200, Frans Meulenbroeks wrote:
> Without quoting tons of text and without going into each individual
> argument given there are a few remarks I want to give.
> 
> Things should be consistent and intuitive.
> local.conf is for local configuration. as such it suggests that
> whatever is in there is leading.
> Having to append _local to an override to me is counter-intuitive.
> (and *if* that is really desired or needed to have a _local suffix, it
> should be documented clearly in the manual. Also an example should be
> give in the local.conf.sample file. Afaik neither is the case as of
> today). Even for a

Somethimes I had to use normal assignment in distro config just to override
some previous weak assignment from .inc file included and parsed before in 
the same distro config.

So I would much more appreciate commit updating manual/local.conf.sample
than just replacing all distro config with weak-assignments and
expecting that nothing changed.

Regards,

-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


