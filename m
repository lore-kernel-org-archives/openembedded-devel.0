Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1P9BYJ-000225-KO
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Oct 2010 08:56:36 +0200
Received: by bwz15 with SMTP id 15so967224bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Oct 2010 23:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=IezdmTb46K3ea/m5aB6T6F4Te6Lo8VpE894XeJ440Q4=;
	b=gWHAoUdB0dH62p6/b3P220wbmiNpGq8TX9xTNhKHzMFBgxqRb+2dK7NmLoQ1a5SQuN
	LziuI21qphObrVg15wdp1EyH1E7wNtwocxtu3T1HVYGY9M2bH1yg/y0K97fHrq0tdo3b
	P9JS/hjKDab5IGcg9VzvF7lVYWCwm8L0aENfk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=PGbQmoTVgP2TUf/ZYWosgiZdUZK/iRVVunQXGVMwCQ+k6F/ysAjH86v8S1R/pmsDw+
	nOr30YESoRaNF5QPLko/S8S/SlfInzpOEQPP5NalzIXdsJsqv4G7wyciLSOxc8f5H4pQ
	wyVAe3XnZx82r74t7zgh2APrwaLoqIKxljW2s=
Received: by 10.204.63.193 with SMTP id c1mr1613075bki.110.1287730554771;
	Thu, 21 Oct 2010 23:55:54 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id y19sm1870500bkw.6.2010.10.21.23.55.53
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 21 Oct 2010 23:55:54 -0700 (PDT)
Date: Fri, 22 Oct 2010 08:55:59 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101022065559.GC3527@jama>
References: <AANLkTin7MbMksEO7F4r3b-EAbCrx1ZG58OBu3ybHkNmG@mail.gmail.com>
	<i9rbsq$tad$1@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <i9rbsq$tad$1@dough.gmane.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: patchwork cleanup call
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
X-List-Received-Date: Fri, 22 Oct 2010 06:56:36 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 22, 2010 at 08:44:42AM +0200, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> On 21-10-10 22:58, Khem Raj wrote:
> > Hello OE'ers
> > 
> > We have accumulated quite a bit of mails in patchwork. Patches that
> > are send to OE ml are nicely captured by
> > patchwork and shown when one visits http://patchwork.openembedded.org
> > 
> > It would be nice if committers,reviewers and authors update the patch
> > status when they deal with the patch
> > 
> > So please spare few minutes and have a look at the patchlist and see
> > if there is a patch authored or committed by you and update the status
> > accordingly.
> > 
> > I regularly use this tool to pick up patches and this exercise will
> > help to remove the stale patch states
> 
> We can do as we did in the past and say "On the first of november we're
> archiving all patches older than october 2010" to give people a bit more
> incentive.

Would be nice to have spam feature in patchwork.

Just sending state query to every Submitter email for patches in some
state (in this case not archived, "Action Required"), with link to it's
patchwork entry.

Maybe someone with better patchwork knowledge or pwclient can get the
list of Submitters easier than parsing html?

Regards,

-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


