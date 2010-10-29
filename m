Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PBuWu-0002Nk-Fk
	for openembedded-devel@lists.openembedded.org;
	Fri, 29 Oct 2010 21:22:25 +0200
Received: by pxi2 with SMTP id 2so155688pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Oct 2010 12:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=XL7kIThKKXuF6OeaueBEy+ZRm7p3OzFPjs5tJgBtq00=;
	b=DoJ5dzWyND4T6WY1zbPTmWQsQYJmhoJ9gVWsOTHZfTv95/qUuWrvZSsfmYVk0LzjBM
	9d1xu+rVqYcYJbZzVi/sE1NifhJB0uf8huNHXj92yWV51tMBClbiisurpKI37rEbP3PW
	BpXykqi0O8DwuR8nFuko2+C3LanvpNn2yPEdQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=rYBglK+1VMp7uqFHgVKG6CqSOs/Dc8mW+4vHXR8HOJR30XavwD+Y1VTJB7mfZP9/QZ
	n981EPtoPaa4zUC5imSAK7ZyJnwiWBJyAEJDHhmKyrSA2Tc0sbSn2RFizy7UwzfOHX0F
	xozV2A8SAeRo06qY4gjl7nSmSx8tHCRWX4lDc=
Received: by 10.142.204.4 with SMTP id b4mr1033223wfg.308.1288380095836;
	Fri, 29 Oct 2010 12:21:35 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id w42sm2347833wfh.15.2010.10.29.12.21.33
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 29 Oct 2010 12:21:34 -0700 (PDT)
Date: Fri, 29 Oct 2010 12:21:45 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101029192145.GB27520@gmail.com>
References: <20100927121005.26700@gmx.net>
MIME-Version: 1.0
In-Reply-To: <20100927121005.26700@gmx.net>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: package/build problems with dropped packages
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
X-List-Received-Date: Fri, 29 Oct 2010 19:22:25 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On (27/09/10 14:10), Alexander Stohr wrote:
> i've sent these lines to bitbake developer mailing list
> a few days ago - they responded that its probably not
> a problem of bitbake but rather a problem induced by
> what represents the build system, e.g. that of open embedded.
> over there is just silently agreed. now i am asking here again...
> 
> here's my previous posting to those list:
> 
> 
> Subject: package/build problems in old bitbake versions - resolved in current version?
> Date: Mon, 20 Sep 2010 18:01:06 +0200
> Von: Alexander Stohr <Alexander.Stohr@gmx.de>
> An: <bitbake-dev@lists.berlios.de>
> 
> Hello,
> 
> i was working with bitbake for cross building file system images
> for an embedded project. in this setup i was updating a bigger
> package to a more recent version. for some reasons it created
> noticeable fewer packages for me leading to the state that
> bitbake simply kept the corresponding result packages from an older
> not-really-matching version from a prior build attempt in place.
> 
> for the reason of using a probably working pair of tools and recipes
> i was doing my tasks using an older version of bitbake (1.8.12).
> (surely there is 1.8.18 and 1.10.0 available to me
> but i just did not check that versions sufficiently for now.)
> 
> 
> my short term work-around was this:
> i was manually sending the old packages to the morgue
> and then started researching reasons for the changed
> package build results. later packages should now be
> in state to fault when something is missing instead
> of being inadequately served by something older.
> the first case is desirable, the later feels buggy.
> 
> 
> does someone know how bitbake should behave in cases
> where a newer recipe version does no longer produce a
> certain package since no files were installed by the build?

Well if there is a difference in packaging then there should be an upgrade
path designed so the newer packages upgrade the older packages correctly.
This is something the package manager has to take care of it is not
somethig that bitbake can control. Bitbake picks the recipes and builds
them and emits the packages thats it
> 
> does that further mean an ever added results package
> must stay in the recipe for an indefinitely long period
> even if it will be empty just for forced removal?
> 
> if that scenario is already addressed by some patch
> then please drop me a note on the current state.
> 
> regards, Alex.
> 
> -- 
> GMX DSL SOMMER-SPECIAL: Surf & Phone Flat 16.000 für nur 19,99 Euro/mtl.!*
> http://portal.gmx.net/de/go/dsl
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


