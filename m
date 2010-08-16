Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1Ol61Z-0001LZ-QO
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Aug 2010 22:11:15 +0200
Received: by fxm6 with SMTP id 6so3261417fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Aug 2010 13:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=Uhog3bPAgHTa5NRds+bd02rWj5w1hdBx0yshqdWzYtY=;
	b=U0zkzTmtpXTFdF6K+2Hg6YCmZYYX272Qf6kdKHzkFkamF5dH2c1LTWry0IcsUjWTtJ
	dMsQ52lYg5RGQ/xlKPjfrki8PXsOpDxB2mQluaFIWum6GcKQ/kNWGQQTTm9r+ZgjxXU+
	EriOhjnwybOt39hipaAv4SwSNkyVMzgNncmrU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=idNTjeMs5AjriiHa4BHGqpC7X6RBgTNPtbS01+QqcFre31HMOUh5Lw03ejWwPeMmUW
	kTt1MfpauLlSptwWodlbtqWUDCuYIFqQUvtQ65+lQDFpItqbPY1bSshZGv0LivcOWbh5
	FCCsov7AEyijYyzCU38bzZ+rjl/HU+CRBtTtk=
Received: by 10.223.114.69 with SMTP id d5mr5612723faq.43.1281989456555;
	Mon, 16 Aug 2010 13:10:56 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id s20sm2635860faa.4.2010.08.16.13.10.55
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 16 Aug 2010 13:10:56 -0700 (PDT)
Date: Mon, 16 Aug 2010 22:11:08 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100816201108.GI10076@jama>
References: <AANLkTi=XK3Le8ERWqmMt2DEVX3K4n=ua0Zdyu6qEOUcw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTi=XK3Le8ERWqmMt2DEVX3K4n=ua0Zdyu6qEOUcw@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: rename files dirs
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
X-List-Received-Date: Mon, 16 Aug 2010 20:11:15 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 16, 2010 at 10:00:42PM +0200, Frans Meulenbroeks wrote:
> Currently lots of our patches reside in a directory called files.
> Somewhere in the past koen explained me that that is not really proper
> (and I agree with them).
> files should only be used in case a dir has multiple recipes (say X.bb
> and Y.bb) which both use the same patch
> If there is only a single recipe with multiple versions (e.g.X_0.bb
> and X_1.bb) then common patches should go into a dir X.
> And if the patches are for a specific version they should go in X-0, X-1 etc.
> 
> When I'm bored again on a rainy sunday afternoon or so, I can spent
> some time on moving things.
> Are people comfortable with that?
> Also what would be the preferred way to store the patches for a recipe
> with only one version (Z_3.bb)
> Should this preferably be in Z or in Z-3 ?

If it's something where you expect the need to update the patch for Z_4
then I would say Z-3, but if it's some tweak (ie to allow crossbuilding)
and the same patch applied to Z_[12345] then Z is right dir (if Z_6
needs updated patch it will be named the same but in Z-6).
> 
> Your opinion is apprecated

I did exactly the same while cleaning xorg-* dirs. So I agree.

Regards,

-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


