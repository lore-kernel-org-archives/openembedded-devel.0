Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1ObUIW-00018l-KF
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Jul 2010 10:05:01 +0200
Received: by fxm12 with SMTP id 12so3347124fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Jul 2010 01:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=bQPdc9/yZpUO8hHffzmg+ViHvEELh/MFIjmg8XpnIxA=;
	b=GA7dimnOmRFGR5ThMr7W3JMxz6TLEms5NrdqGpFAJ/aMaJnWv4kjzcAtr8M/ELXsw/
	jjZYNNBBueRzNpc9Uva5gZ3Ji2mERtGRLCXHI8laKPc2NrErKvrRMO4m04T1N79/HHJF
	7ncqI7ult7q8JHK1+8xvUeNGtT9PJB/H9EvW4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=kPPGB3NWBdu87Z65dJLUDhPrQI8VglN6ZKepFseZlSQNGs1sjr/i5teQz1xsMLqudU
	LxQt/RjJBhwo9H+zOS7vJdxpa+QjZboHFpxJZmqKNP330tKosHEgJiNRzMCeYpDcLsQX
	CuNEKFbijK76Y3i9hDAducZXdW38evx45fut8=
Received: by 10.223.108.137 with SMTP id f9mr6432097fap.3.1279699490152;
	Wed, 21 Jul 2010 01:04:50 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id l19sm2788987fap.33.2010.07.21.01.04.48
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 21 Jul 2010 01:04:48 -0700 (PDT)
Date: Wed, 21 Jul 2010 10:05:35 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100721080535.GL16225@jama>
References: <1279527535-11994-1-git-send-email-raj.khem@gmail.com>
	<AANLkTikmxYTbW7ZT5HoA8yyXfvaWbqu7ydQemXP8e4mm@mail.gmail.com>
	<AANLkTimsDyM8w3UWdaalbgKIRp9cmE5iI29fVJPbNefB@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTimsDyM8w3UWdaalbgKIRp9cmE5iI29fVJPbNefB@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC][PATCH] distro: Move thumb into distro features
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
X-List-Received-Date: Wed, 21 Jul 2010 08:05:01 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon, Jul 19, 2010 at 10:08:02PM -0700, Khem Raj wrote:
> On Mon, Jul 19, 2010 at 3:46 PM, Khem Raj <raj.khem@gmail.com> wrote:
> > On Mon, Jul 19, 2010 at 1:18 AM, Khem Raj <raj.khem@gmail.com> wrote:
> >> * Currenlty we define the thumb specific overrides in machine tune files
> >>  and as machine conf files are included before the distro conf files
> >>  the overrides dont get right values and set incorrectly.
> >>
> >> * This patch moves the tune-thumb.inc from machine/include into
> >>  distro/include and lets distro decide on thumb and thumb-interworking
> >>  features based on the machine selected. If a machine which does not
> >>  support thumb like all armv4 based machines is selected then distro
> >>  makes correct decision now to disable thumb and thumb-interworking
> >>  based upon the machine seletected.
> >
> > I accidentally hit push button in wrong branch and this commit got pushed
> > I will revert it once I get home later today if someone gets bitten before
> > feel free to revert it.
> 
> Done. Meanwhile, Does this patch look ok for .dev ? I would like some ACKs

Looks fine for SHR
Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


