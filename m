Received: from mail-fx0-f225.google.com ([209.85.220.225])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NuB6p-0005YV-Ar
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Mar 2010 21:53:57 +0100
Received: by fxm25 with SMTP id 25so31507fxm.26
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Mar 2010 13:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=EGAG5q4syxI5BlOmtUajo/GSD849oDdgVAs8RsVZWbI=;
	b=b3/vMDVTfmnHM6FWfMBrvJIAx1Bkn415BHehlCK8E0cf/DczopVEla+mVvcRCKMgGp
	E39rd8Cl0pPyIZwYduqfnixOqEoAdbvAObTnICDQTdA39LGqWddjI17Ta6V/i3gSyvhh
	oTJi+fmSy1UBNwY/CBQYCtD3P4dlmwsTJX1Vs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=utGBWrWD1CWHYJwl94+GNWEpA7aRWjDAv+QseyUJNYZRrHrP1thmCAaa2xM3MN2xzi
	3topa1APzmBRCIVSH9wBoA/UkTLs3UZCb2KgygyTQJAzrcdBEhDQ6MC5M2bLIOBXQ9/A
	L0txnSqdhtq7B/Uj68vqtfMPgy91zV2Ecf1KU=
Received: by 10.103.37.12 with SMTP id p12mr8853226muj.94.1269377446246;
	Tue, 23 Mar 2010 13:50:46 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id j9sm3487445mue.17.2010.03.23.13.50.44
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 23 Mar 2010 13:50:45 -0700 (PDT)
Date: Tue, 23 Mar 2010 13:50:54 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100323205054.GB12446@gmail.com>
References: <f275a9df1003230238ye20d27fm32a88ad21e6518ab@mail.gmail.com>
	<f275a9df1003230243h6942495bya29166db2fda49a@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <f275a9df1003230243h6942495bya29166db2fda49a@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.220.225
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: How to rebuild images with updated PREFERRED_PROVIDER_xxx in machine conf?
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
X-List-Received-Date: Tue, 23 Mar 2010 20:53:57 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (23/03/10 17:43), Jiason Li wrote:
> Sorry all,
> 
> My step was:
> 1. bitbake some-image, oe/openembedded/recipes/some-pkg.bb was bitbaked.
> 2. bitbake -c clean some-pkg
> 3. update machine conf with PREFERRED_PROVIDER_some-pkg = "some-pkg-mine"
> 4. bitbake some-pkg, according to the log,
> oe/overlay/recipes/some-pkg-mine/some-pkg-mine.bb was bitbaked
> correctly.
> 5. bitbake some-image, but some-pkg was still bitbaked and was in
> some-image, not some-pkg-mine!
> 6. rm -rf oe/overlay/tmp
> 7. bitbake some-image, this time some-pkg-mine is in some-image, finally.
> 
> Any info are very appreciated. :)

may be try 
bitbake -c package_update_index some-image

> 
> Thank you!
> jiason
> 20100323
> 
> 
> > My steps:
> > 3. bitbake some-pkg, according to the log,
> > oe/overlay/recipes/some-pkg-mine/some-pkg-mine.bb was bitbaked
> > correctly.
> > 4. update machine conf with PREFERRED_PROVIDER_some-pkg = "some-pkg-mine"
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


