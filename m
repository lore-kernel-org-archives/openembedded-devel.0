Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Ogfkq-0004tV-CQ
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Aug 2010 17:19:41 +0200
Received: by pzk2 with SMTP id 2so2068200pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Aug 2010 08:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=vnh4Z9SzWyYV38CxjTLOUHEUBsfMkhImrd3POOXWJ28=;
	b=eaTt6Alg7kwjE7nWPak2K0ugNtyFc4Zq350PfsQ3aBSaj1vWtA/sXd9XEJFPkN6OLB
	QuZ773/VCI7U4GnjBgzE8wGk6NtvQ91lJ4W8TmQP0tmC1PuHVZ0tA2frHw8ArkZz8/AC
	KYQQ4PpcEvHEOisX7xlpiLMRUhSWPTogUZJEQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=Sb1ds/Zfx80hZWAkHAl5Rf6XeBP0/oY5m0O6gaToyWnTdDzl/60pxF/uSbRfB0/6JM
	WBXYH2n6KfN/Yy5QKj+oW7gXvJP1ksW3YC4F2aabjYe7AIcZHQsUa/QI4d5YX0ppg/hq
	/kFICHJiZUyLx8qnZhnajL3geVYQnvBCjyHtw=
Received: by 10.114.95.12 with SMTP id s12mr10765327wab.226.1280935175309;
	Wed, 04 Aug 2010 08:19:35 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id c24sm16042502wam.19.2010.08.04.08.19.33
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 04 Aug 2010 08:19:33 -0700 (PDT)
Date: Wed, 4 Aug 2010 08:19:27 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100804151927.GB8728@gmail.com>
References: <1280892816-18835-1-git-send-email-raj.khem@gmail.com>
	<i3bata$8c4$1@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <i3bata$8c4$1@dough.gmane.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.210.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH v2] recipes: Dont inherit autotools_stage.
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
X-List-Received-Date: Wed, 04 Aug 2010 15:19:41 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (04/08/10 11:12), Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> On 04-08-10 05:33, Khem Raj wrote:
> > Some recipes had do_stage_append|prepend stuff. Fixed that too in this verison
> 
> I see a lot of:
> 
> > -inherit autotools_stage
> > +
> 

Do you mean empty line replacement? Not ideal but harmless should have used a different
regexpt. I will see if I can change


> are those correct?
> 
> regards,
> 
> Koen
> 
> 
> 


