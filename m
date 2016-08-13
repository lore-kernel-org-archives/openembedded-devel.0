Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 0988777268
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Aug 2016 03:04:40 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id i6so271170pfe.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Aug 2016 20:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=LxSKqtt2HY6xiigTf91vawsLhj8lp1KthiyTBfRO3So=;
	b=uq8B+z8v35s9YlSXjMaIxhfUpHDEdRORGPkfySoANy3shq+Cn6ktNf4DVwg1y29Orh
	0TAy/QcyGIQewtxP16doo4ID0CgPV58l1njy+2LsAChJSgAoHnvUX/B+XySqqQWfgqSG
	QXepgFYux56ym9/gU1ekFRbayaJR31koLK251OqTILtKJAkTcJJwMvxPvA8s8nHsyh9a
	4Z9hxlqeniHKocV88y5bxknAHKMPyZJR5FHU7iz7tEHcrQCqkpzDk6WE7DfHItNeexo9
	ECUE/ogwU4zArn0U9ZSNXN/+y149lCASZ5g8vxGpC7DAh9rU4D7U4EzoWF8oSqXORHQh
	Nf3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=LxSKqtt2HY6xiigTf91vawsLhj8lp1KthiyTBfRO3So=;
	b=LPJE4H5kXgi6OA2EOrrDCJzsM6t7luDe3n8As+ChOonj0cSTrc95LHdGJX6e6M1epl
	oIYKB6cwJbnnd6Z7h1577Sxh5iGMNuetB/Riya1Rc86d7aw4MLAfLtYFiH2u0rY7rfDr
	NzROCCVGcyE9oZ0VnWBxtV47B42r4eRkUPcp82zh0bGuQCXum1Yr1KA5zJ5X4cMsm48/
	CPl5vlSFltnSZiSWf1A96GK6iJoyLt3+K3oExy24n6HniMHlskNE/+xV89H0SJJP8muY
	0+EkvBIWJwk5uMX/wW2LnEAFOK0GPIsXWUGL8Dd4p6TLnqJLT1Hr1F5GRZdiMeVg+jem
	xVRw==
X-Gm-Message-State: AEkoouudW8u/yQGcmftueFhTVagyJ+ZFgnQL40Y5RlZLnMk0Ce5qH1hPQ9XCfbYw0WIBHg==
X-Received: by 10.98.105.135 with SMTP id e129mr32768228pfc.59.1471057480866; 
	Fri, 12 Aug 2016 20:04:40 -0700 (PDT)
Received: from haswell (c-76-102-32-192.hsd1.ca.comcast.net. [76.102.32.192])
	by smtp.gmail.com with ESMTPSA id
	xv9sm16139207pab.36.2016.08.12.20.04.40
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 12 Aug 2016 20:04:40 -0700 (PDT)
Date: Fri, 12 Aug 2016 20:04:38 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160813030438.GB23947@haswell>
References: <1470989266-6267-1-git-send-email-richard.leitner@skidata.com>
	<20160812130632.GA28597@mbabyjoh-desk.ger.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <20160812130632.GA28597@mbabyjoh-desk.ger.corp.intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-java][PATCH] README: fix branches of openembedded layers we depend on
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 13 Aug 2016 03:04:42 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On 16-08-12 16:06:33, Maxin B. John wrote:
> Hi,
> 
> On Fri, Aug 12, 2016 at 10:07:46AM +0200, Richard Leitner wrote:
> > Since 33fbcd43 (rxtx: Add remove-libtool class to remove all .la files)
> > rxtx requires the remove-libtool class. This class was introduced
> > in the krogoth branch of openembedded-core and not backported.
> > 
> > Therefore update the branch names in the README to "krogoth".
> > 
> > Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
> > ---
> >  README | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/README b/README
> > index 259fa75..f766869 100644
> > --- a/README
> > +++ b/README
> > @@ -7,11 +7,11 @@ Yocto Project build systems.
> >  This layer depends on:
> >  
> >  URI: git://git.openembedded.org/openembedded-core
> > -branch: daisy
> > +branch: krogoth
> >  revision: HEAD
> >  
> >  URI: git://git.openembedded.org/meta-openembedded
> > -branch: daisy
> > +branch: krogoth
> >  revision: HEAD
> >  
> >  Contributing
> > -- 
> > 2.1.4
> 
> README was a bit outdated. Thanks for updating it.
> 
> Pushed to master.

This should also reflect the fact that it also works
with master branches of respective layers

> 
> Best Regards,
> Maxin
> -- 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

