Received: from mail-fx0-f220.google.com ([209.85.220.220])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1NmpEA-0005mw-Be
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Mar 2010 15:07:06 +0100
Received: by fxm20 with SMTP id 20so1443504fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Mar 2010 06:04:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=LEEWcJ1hV5DxOJ5YZvjGDiQClAMRaQMSwy+UVSiXDcc=;
	b=QBfJWb0j9yISTnMso0McwRo4MvNn/CbjqCrAHMxDoeHGuJXi81WWvPjUxdW3/+C5oE
	4u+7uJrybjYSCTRWQK3ot3i7X8+bxEuNrV9dzGRM3dw3QAGk/P7icXTxD9uh97Wo3KxE
	ipSFoZhPq/ZGSYKmJflQRX7Km60pDkGGiDcco=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=mPdkstFubZfVgpEVnQAForVJ1VnrXP2a31k70IQe8+RLFezen/K7hXyBfPU5YCb7YX
	zTi0MAtBIZL2fCmQC1eeZCSY9+bR3RPtJxv9hoBtVodDvI2razy15wQ+VhpIUxHQjvtq
	Rvs4RVXg3fA0u32BxH+g3WQBjh/bnP3bJN3Xk=
Received: by 10.87.20.13 with SMTP id x13mr110686fgi.67.1267625053977;
	Wed, 03 Mar 2010 06:04:13 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 13sm3638097fxm.10.2010.03.03.06.04.13
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 03 Mar 2010 06:04:13 -0800 (PST)
Date: Wed, 3 Mar 2010 15:04:44 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100303140444.GP3206@jama>
References: <1267616149.2259.4.camel@rex>
	<ac9c93b11003030459h499fa3ban6f6884910ef785a@mail.gmail.com>
	<1267624062.2259.58.camel@rex>
MIME-Version: 1.0
In-Reply-To: <1267624062.2259.58.camel@rex>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.220.220
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: TSC Meeting 2010/03/02
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
X-List-Received-Date: Wed, 03 Mar 2010 14:07:06 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 03, 2010 at 01:47:42PM +0000, Richard Purdie wrote:
> > I have considered converting some of the others to new staging.
> > Actually I even started it, but soon stopped with it for the following
> > reasons:
> > - the actual verification process is fairly cumbersome. (5) diff the 2
> > packaged-staging recipes (which I read as packaged-staging packages as
> > there are no packaged-staging recipes) is imho a pita)
> 
> It would be better to have some kind of automated way of doing this I
> agree. Its technically possible, just nobody has found the time needed
> to implement it. We're all volunteers as you point out.

Today while checking diff of pango and libxml I noticed that bumping
PR/INC_PR to target value before building it the old way helps a lot.

Even the binaries were a bit different when they were built from
different workdir because of PR (probably because of unstripped data in
workdir/image).

So now I first bump PR/INC_PR to target combination, then build without
BBCLASSEXTEND without rm_work inherit or -c build, backup workdir, make
BBCLASSEXTEND change, -c clean, -c build, and diff -rq workdir with
backuped version.

If it's different only in temp/run* temp/log* then it's great :). But
usually static libs are still a bit different but probably in harmless
way.

Regards,

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


