Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OGm20-00038I-2M
	for openembedded-devel@lists.openembedded.org;
	Tue, 25 May 2010 06:46:20 +0200
Received: by pxi14 with SMTP id 14so1609221pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 May 2010 21:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:cc:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=mRlTli74LIumV/EIriuKWjK9KhF5GzlLujkKmGm30jg=;
	b=ibFK0UeK79urD2GkiePbxTLYbxSfKxnPpxxGoVcq9a3ZqNlzSHpKqbuBAjjFTyQ48Q
	IiYskjbxR36XHtwTvAH4plXE8KpePkEtJ4dlSr6IdAxTxowPswPxJwgpbtRzZomgetBv
	9OV2rq3zTFY9dYganX2S7rXT7TKC3LGy/Vp/o=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=Ial+v0DDo+5GYq0bE6q4vjGN+MWw3AX21H3og4roSc9iHEplgdTRGkNwuF7rutZlpw
	/JCBrmYBvQBASymRgiK6DbQtdGY6S6Vs7OgnxA9CkqI7NpBNh2qrHOtLAyWG/nEp7lUS
	tWCY9hmQs4rCZIEclgvo8JudVn2Mp+H5slBqk=
Received: by 10.142.152.39 with SMTP id z39mr462651wfd.336.1274762532612;
	Mon, 24 May 2010 21:42:12 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id 20sm4091825pzk.7.2010.05.24.21.42.11
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 24 May 2010 21:42:11 -0700 (PDT)
Date: Mon, 24 May 2010 21:42:02 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100525044202.GA25134@gmail.com>
References: <1274733028-13432-1-git-send-email-clarson@kergoth.com>
	<20100524233325.GJ25484@denix.org>
MIME-Version: 1.0
In-Reply-To: <20100524233325.GJ25484@denix.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Chris Larson <chris_larson@mentor.com>
Subject: Re: [PATCH 1/2] Rename url params patch=<ignored>/pnum=<n> to apply={yes, no}/striplevel=<n>
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
X-List-Received-Date: Tue, 25 May 2010 04:46:20 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (24/05/10 19:33), Denys Dmytriyenko wrote:
> On Mon, May 24, 2010 at 01:30:27PM -0700, Chris Larson wrote:
> > From: Chris Larson <chris_larson@mentor.com>
> > 
> > I think this makes the behavior rather more clear.
> 
> Ironically, just earlier today I was trying to explain to somebody, that 
> patch=3 does not mean or do anything...
> 
> It maybe more clear for new users, but once you use it couple times, it 
> doesn't matter if it's patch/pnum or apply/striplevel. But I see where you 
> going with the second patch.
> 
> > Signed-off-by: Chris Larson <chris_larson@mentor.com>
> 
> Acked-by: Denys Dmytriyenko <denis@denix.org>

Acked-by: Khem Raj <raj.khem@gmail.com>

> 
> > diff --git a/classes/patch.bbclass b/classes/patch.bbclass
> > index a739b20..6ef408f 100644
> > --- a/classes/patch.bbclass
> > +++ b/classes/patch.bbclass
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


