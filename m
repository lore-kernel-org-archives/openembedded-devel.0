Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OgzAR-0003tj-N0
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Aug 2010 14:03:27 +0200
Received: by fxm12 with SMTP id 12so2911871fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Aug 2010 05:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=+xQR3NmLa7G6mWfpImPSi1zkARNSdO9+M1j4YWoejuQ=;
	b=n7pg9gJa5rI4PLfwv0gmyYtrzjG1ofvqtg4vmq210vq2yF/QFBYOs+kSrw6mVbmGha
	lKqt9ODAn8xfKNONmqfl+6LsA+c3eNEX4Jk/PG4KICFal0IMKVWvfWKF17U69/PSfcMP
	X5Vxk5DwwBgd0StzT3mU7velfEiIek8htxLnY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=k6X9wrO4A2XLkojudD1WWUzo/gXJZ1De7zHQS0nBOzinVfT7i62OY/hVXVaPH8eTZx
	RF4uzJBwlwdMwPjvCvMvuRm+rR4wJalyoP0rLh2tMUoGYkNDXzSD7Dc1A5DE3omXM8F0
	hI6IDDyzTgwoC9a4f+/lwUm3u4Y5LRQfIJTJE=
Received: by 10.223.118.211 with SMTP id w19mr3859628faq.19.1281009797959;
	Thu, 05 Aug 2010 05:03:17 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id m3sm41763fai.41.2010.08.05.05.03.16
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 05 Aug 2010 05:03:17 -0700 (PDT)
Date: Thu, 5 Aug 2010 14:03:38 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100805120338.GG29578@jama>
References: <1280948285-3458-1-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1280948285-3458-1-git-send-email-raj.khem@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 0/7] recipes: Dont inherit autotools_stage (revised)
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
X-List-Received-Date: Thu, 05 Aug 2010 12:03:30 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 04, 2010 at 11:57:58AM -0700, Khem Raj wrote:
> Hi
> 
> Following series of patches are for getting rid of
> autotools_staging class and its usage. Its replaced with
> autotools and staging functions are replaced
> 
> Please test these patches and if seem ok provide some ACKS/NACKS

Rebuilt from scratch:
spitz/minimal-x11-gpe-image (finishing x11-gpe-image now)
om-gta02/shr-image
nokia900/shr-image

both images + my favourite feeds seems fine, so for whole serie:
Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

Thanks!

Regards,

-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


