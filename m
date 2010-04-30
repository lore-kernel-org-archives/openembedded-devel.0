Received: from fg-out-1718.google.com ([72.14.220.155])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1O7qyy-00024l-9S
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Apr 2010 16:14:20 +0200
Received: by fg-out-1718.google.com with SMTP id 19so89859fgg.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Apr 2010 07:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=sIJpfpDhtM0ifcuXNKUe2PIBk3Ai1A4poQrVrQVu4y8=;
	b=jUaLEjhGeOgWPhOKbiRcyDgbYRdG+nh4O90N/nav+vDd7g3X4KdJYsu3rs2Te8w7/7
	GLucG9hI83uQtPSTVPrQW/Thylu/KZcEgFrQRiGOgB2Ew8kcNyQ3cS9hXgKMxq6OpRqQ
	UYqihGCDI/XT8sJJF+Jn9dcPN1qNA5AxlxjCw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=sA1y/zMtM5hG7vzvCcDP72IBavVQNzjIqa9jW1wCP1Y6OXLrzgg8j7Apa9TYw4u1Hl
	KBQrKievAg2JD/fU151dT7AL9c22cA73z4F52X9gtH4AsiDm996HUtohkBTv2vAs9/s3
	7pAffZXmoUI7f0RPNIIE0uhKofHqSnA9amo+I=
Received: by 10.87.68.26 with SMTP id v26mr4060215fgk.40.1272636639375;
	Fri, 30 Apr 2010 07:10:39 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 28sm3020780fkx.6.2010.04.30.07.10.38
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 30 Apr 2010 07:10:38 -0700 (PDT)
Date: Fri, 30 Apr 2010 16:10:44 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100430141044.GC3376@jama>
References: <hrbmd4$mng$1@dough.gmane.org>
	<1272552574.3865.814.camel@trini-m4400>
	<20100430140422.GA3403@excalibur.local>
MIME-Version: 1.0
In-Reply-To: <20100430140422.GA3403@excalibur.local>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 72.14.220.155
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Merging RPs branch, help needed for dealing with possible fall-out
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
X-List-Received-Date: Fri, 30 Apr 2010 14:14:21 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 30, 2010 at 04:04:22PM +0200, Stefan Schmidt wrote:
> Hello.
> 
> On Thu, 2010-04-29 at 07:49, Tom Rini wrote:
> > On Thu, 2010-04-29 at 12:18 +0200, Koen Kooi wrote:
> > > 
> > > I've been talking to RP and we both like to merge his branch as soon as
> > > the last problem (the cross lamanger) has been addressed. RP estimates
> > > that will happen early next week.
> > > But after it has been merged there might be some fallout, which we would
> > > like to have some help with. If you don't want to help out and and don't
> > > want the possible breakage: don't git pull for the time being.
> > 
> > Related, do we have people signing up for building ___ targets?  I'll
> > assume angstrom + beagleboard + beagleboard-demo will be covered :)
> 
> I can take care of imote2, the ezx devices and sgh-i900. All armv5.
> 
> I bet the SHR guys are taking care about om-gta02 and om-gta01. Which would be
> armv4.

Sure I can cover 
  SHR + om-gta0* + shr-images
and try
  Angstrom + spitz + x11-gpe-image

Regards,

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


