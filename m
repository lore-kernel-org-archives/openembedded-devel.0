Received: from mail-pz0-f193.google.com ([209.85.222.193])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OKKrD-0000q1-14
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Jun 2010 02:33:56 +0200
Received: by pzk31 with SMTP id 31so365279pzk.16
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Jun 2010 17:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=XZsCOX09n/jHGvnE91N8nWddBGzBDJWjbiPCmL1KoJI=;
	b=r+3S7R45ues6WYtiq890x0BLSS0qqDMMKNGf9RX8erJyhiSzcu8K/ZH+R42arxmy3Q
	R/l1aNHzsVaY3oO5jAudu115Z/unTJwoGo5FE6q9w1ehxEghou918Grl+4rve0JFAhSo
	geeBeE2F/sqONx9sc9io0UWivr8jAz8Wo6LqI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=hQtthY8iYdBxiR3TspW3eC0IpIaLrITHFu+Ub4hjgxCAd5x+RpTN/JDnOb2nj40ivH
	2XlQMXW9tBt0YwkQdy+4TJea2wLoK1URtZ42BoH0D3goECZg8SnD1fDL0mInlMkizklF
	G2I6FOfxkSKhJZ2Zr4Kyt7ZBLeSRS+0dmOcII=
Received: by 10.141.89.13 with SMTP id r13mr8274842rvl.236.1275611374694;
	Thu, 03 Jun 2010 17:29:34 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id 22sm380817pzk.1.2010.06.03.17.29.32
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 03 Jun 2010 17:29:33 -0700 (PDT)
Date: Thu, 3 Jun 2010 17:29:02 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100604002902.GA24343@gmail.com>
References: <1275510896-30845-1-git-send-email-raj.khem@gmail.com>
	<1275510896-30845-7-git-send-email-raj.khem@gmail.com>
	<hu6fm8$gg4$2@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <hu6fm8$gg4$2@dough.gmane.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.222.193
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 06/16] db_5.0.21: Add recipes for target and native packages.
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
X-List-Received-Date: Fri, 04 Jun 2010 00:33:56 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (02/06/10 22:41), Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> On 02-06-10 22:34, Khem Raj wrote:
> > * Get rid of old style staging.
> > 
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  recipes/db/db-native_4.2.52.bb             |    1 -
> >  recipes/db/db-native_5.0.21.bb             |    2 +
> 
> Can these get converted to BBCLASSEXTEND?

Yes. I have intended to do that afterwards 

> 
> regards,
> 
> Koen
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
> 
> iD8DBQFMBsIIMkyGM64RGpERAqLBAJ9T1EGUDygy/NfaND/5EO0hSebLqgCfUPHo
> 7eD81HjkwQFLTl3APVx7mFg=
> =mMkU
> -----END PGP SIGNATURE-----
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


