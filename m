Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OK2DM-0003WC-Sg
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Jun 2010 06:39:34 +0200
Received: by fxm9 with SMTP id 9so1536607fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Jun 2010 21:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=lJy+/28aMiUzQSqCPZwPV0GpZzOqaJsdspmRPm1jtYE=;
	b=DR8gE+Fmy+jkvzYp+MUl6fyf8FaBCfgcczOX3wHoJleLsd379qa6eO+9Al9GBJaydX
	TfTyQn7bQ+YO+JFZMc3bNt+0JFKVTMmf2dgXDo61wHrmA7h8X8+iBw3Zs/ud91GG4lsB
	AuGPJf38fk2CGEioAZZzx3ZBlccLZajq8FFdA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=vUsZvAY2SOYCjVpf6O14Lxx+ZuxjbpxciZjMEJtLzAvUVTVl9LZ8qaxZq/hyZX8wFg
	Lrn0bQ0WEuUb04NCJvP2HBEQuiIZfk4tXZSvvDYDgw0Fi3xo6TZDVXVAp6whgoOJ8tzV
	kokCFHIDSjfFGtLc69Cb0G2iyndJYkfGhkdB4=
Received: by 10.223.64.205 with SMTP id f13mr9552160fai.98.1275539717134;
	Wed, 02 Jun 2010 21:35:17 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id r25sm55558272fai.11.2010.06.02.21.35.15
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 02 Jun 2010 21:35:15 -0700 (PDT)
Date: Thu, 3 Jun 2010 06:35:05 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100603043505.GJ16035@jama>
References: <201006022351.38129.pieterg@gmx.com>
MIME-Version: 1.0
In-Reply-To: <201006022351.38129.pieterg@gmx.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: AUTOREV and SRCPV
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
X-List-Received-Date: Thu, 03 Jun 2010 04:39:34 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 02, 2010 at 11:51:37PM +0200, pieterg wrote:
> I have only a handful of (git) packages for which I need to use AUTOREV, but 
> when I define
> 
> BB_GIT_CLONE_FOR_SRCREV = "1"
> BB_LOCALCOUNT_OVERRIDE = ""
> 
> the sideeffect is that hundreds of other packages (which I don't need) are 
> suddenly having their repositories cloned as well, when their bb files are 
> parsed. Even though these packages are not using AUTOREV, they have fixed 
> SRCREV's (either in their bb files, or in my distro).
> 
> This is obviously taking a long time, consuming a lot of diskspace, 
> generating error messages for invalid git urls, and eventually bitbake will 
> fail because it encountered 'parsing errors' because of those invalid git 
> urls.

If you use bitbake-1.10 it will do it just once for git revision (it
will cache the result of "git list-rev | wc -l" which is used by
BB_GIT_CLONE_FOR_SRCREV.

> I guess this is because all of these packages are using ${SRCPV} in their 
> PV, instead of ${SRCREV} (probably in order to find the correct LOCALCOUNT 
> for the gitrev).
> 
> But argueing that people who don't use BB_GIT_CLONE_FOR_SRCREV will not get 
> these LOCALCOUNT's in their PV anyway, and people that do use 
> BB_GIT_CLONE_FOR_SRCREV will use SRCREV = ${AUTOREV} for the packages which 
> they want to be automatically updated, so SRCREV would equal SRCPV, 
> wouldn't it make sense to just use ${SRCREV} instead of ${SRCPV} in PV?

No they won't be the same. They will have the same format
git${LOCALCOUNT}+${HASH} as when AUTOREV+SRCREV is used.

Check "[oe] SRCPV migration - How SRCPV works!" thread for more info
http://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg01607.html

in short: why do you insist on BB_GIT_CLONE_FOR_SRCREV? autoincremented
LOCALCOUNT works good in most cases (as long as you keep cache dir), only 
case for which we introduced BB_LOCALCOUNT_OVERRIDE is for multiple builders 
sharing feed, but not cache directory.

Regards,

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


