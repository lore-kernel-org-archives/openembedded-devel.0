Received: from fg-out-1718.google.com ([72.14.220.156])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1NnEmB-0001mK-OJ
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Mar 2010 18:23:56 +0100
Received: by fg-out-1718.google.com with SMTP id 22so671121fge.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Mar 2010 09:21:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=X26nnt1/SblSAhF7JVhN9yId8JWDPSSqsJdwOEs/ao8=;
	b=TsIsBNT+jV3swimBAKPo/gmTJAu1atqR0PImB90pXeuAWXj+y7PDIaFOgxxYUYVCEM
	J22HZyc26DiUsBhRVR+yINwWQbn8CqODiULKc2pKHRQ/JHbmuJ7PRtCZcseQfd7yltxo
	4az6z7O3qoeOcoomSFAtHXnxPvP6B4MT0l7Iw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=HylxN8tlrzFmIiCGAvekWdaEwVPD0KY0W1QZ7U79e2ZVnuVuLeTnfvyN0oRQxijG/F
	AJeAQw9nVSmqoSQTKerP+KKqRMrG9qVhUS3aG6NnnMSLF6lNiGSUVU5DtrmQB5DXmB5W
	UWd9weMRFWEURJzt/gkyOjy7ThegVjNkV/lAI=
Received: by 10.87.74.8 with SMTP id b8mr771113fgl.31.1267723265382;
	Thu, 04 Mar 2010 09:21:05 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 15sm541106fxm.0.2010.03.04.09.21.00
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 04 Mar 2010 09:21:01 -0800 (PST)
Date: Thu, 4 Mar 2010 18:21:37 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100304172137.GE31945@jama>
References: <1267218939-6086-1-git-send-email-Martin.Jansa@gmail.com>
	<141020e31003030454i59ed2d9fpcc32ac4ec1b65c0c@mail.gmail.com>
	<1267621631.2259.19.camel@rex> <20100303191937.GQ3206@jama>
MIME-Version: 1.0
In-Reply-To: <20100303191937.GQ3206@jama>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 72.14.220.156
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] package_ipk.bbclass DON'T PUSH THIS, but PLEASE read it
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
X-List-Received-Date: Thu, 04 Mar 2010 17:23:56 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 03, 2010 at 08:19:37PM +0100, Martin Jansa wrote:
> On Wed, Mar 03, 2010 at 01:07:11PM +0000, Richard Purdie wrote:
> > Its a serious bug I agree but a very hard one to fix. The correct fix is
> > to have staging under full control of a packaging system, then when you
> > clean packages, all the right bits are actually removed.
> > 
> > In that sense this is no better or worse than the other 101 ways you can
> > break staging.
> 
> Fair enough, thanks for reply.
> 
> > So in summary, no easy fix, we need to fix the big general problem -
> > packaged staging needs to be on by default and used by everything. Only
> > then will we nail all these problems.
> 
> So I'll continue to use 
> find tmp/pkgdata -name ${PN}\* -exec rm -rf {} \;
> when I see non-existent lockfile path.
> 
> Or maybe try this little patch and watch what will break:
> diff --git a/classes/packagedata.bbclass b/classes/packagedata.bbclass
> index 86f18a9..e38ff3c 100644
> --- a/classes/packagedata.bbclass
> +++ b/classes/packagedata.bbclass
> @@ -56,7 +56,8 @@ python read_subpackage_metadata () {
>         for pkg in bb.data.getVar('PACKAGES', d, 1).split():
>                 sdata = read_subpkgdata(pkg, d)
>                 for key in sdata.keys():
> -                       bb.data.setVar(key, sdata[key], d)
> +                       if bb.data.getVar(key, d, None) == None:
> +                               bb.data.setVar(key, sdata[key], d)
>  }

First thing broken is 
inherit update-alternatives in sysvinit
which didn't set init link in postinst and my image didn't boot, so now
I agree that it's harder than it seems and that "patch" was really bad
idea.

Regards,

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


