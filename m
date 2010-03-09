Received: from mail-fx0-f227.google.com ([209.85.220.227])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1Noy7Z-0005sv-LU
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Mar 2010 13:01:09 +0100
Received: by fxm27 with SMTP id 27so2653044fxm.28
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Mar 2010 03:58:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=70uN6P86ZbqLjKVPDTDqzKTZ8lQWhfEGXOQHO5KZA6w=;
	b=lohQbbVvhfQreg+K9pZ5IVLR1kvkHpXofsS0CGliMrrH6ixmWGivduqhdTiTHwclTq
	z8abHa1DRMzMIfd9kngI7JKnfUg2ASuEIpfLndejoDu0RGOfIVJhKmqsfz1wCAdnoFXa
	EZuqdq/x1fya0oCl9ZJAPg1Nt/lqqO8f44RiU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=oXhW0TxnoHdQt8RBBs1BGhEwFKeMcZyMN5zTVIKEf9VJClOuo55klirrpvBtyy4DnJ
	/ddg0D/+pzMPsYzzsaw16EIZ46cIIfUNOJPGMEEVQgp1c037Qads8GII2nTk2GJBna8c
	pzXsBYRNZIjkmDeLByQWmcWfcyPlmlPCJwJR4=
Received: by 10.223.5.156 with SMTP id 28mr7500625fav.74.1268135884387;
	Tue, 09 Mar 2010 03:58:04 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 14sm3621227fxm.5.2010.03.09.03.58.03
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 09 Mar 2010 03:58:03 -0800 (PST)
Date: Tue, 9 Mar 2010 12:59:05 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100309115905.GM31945@jama>
References: <20100309075331.GL31945@jama>
	<1268130988.14566.922.camel@mill.internal.reciva.com>
MIME-Version: 1.0
In-Reply-To: <1268130988.14566.922.camel@mill.internal.reciva.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.220.227
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] Make some big but only formal change before next stable - SRCPV
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
X-List-Received-Date: Tue, 09 Mar 2010 12:01:10 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 09, 2010 at 10:36:28AM +0000, Phil Blundell wrote:
> On Tue, 2010-03-09 at 08:53 +0100, Martin Jansa wrote:
> > My SRCPV migration branch is quickly rotting.. but I'm willing to
> > check/do it again, because resolving conflicts with every small change
> > in git recipe takes me more time than merging SRCPV to oe.dev would
> > take.
> 
> At the risk of sounding like a terrible dimwit, I am still not entirely
> clear on why you can't just do something like

Feeling the same here now..

> PKGV = "0.0+git${@bb.fetch.get_srcrev(d)}.${PV}"

How this should work?

is PV at the end typo from PR or do you really mean that srcrev has higher
priority than PV?

> which seems like it would make this whole problem go away without
> needing any further changes to bitbake.

All changes are already there. What's new in master is optional support
for forcing that incrementing part to same value across builders, without
local cache synchronization.

And also caching for revs returned when using BB_GIT_CLONE_FOR_SRCREV,
which can improve performance instead of running "git rev-list | wc -l"
with every get_srcrev(d).

Regards,

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


