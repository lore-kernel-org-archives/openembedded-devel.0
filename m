Received: from fg-out-1718.google.com ([72.14.220.156])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1O08qs-0006z7-Tv
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Apr 2010 09:42:26 +0200
Received: by fg-out-1718.google.com with SMTP id e12so61370fga.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Apr 2010 00:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=cd5yw+c7YwlPZi0as4I/wpcQ5/H3lR0QU4nscRdSWb4=;
	b=xn0MBB+gPg2LcudqND5+/KT5hrAVqH5d+xkBzfy4F9lXcC2eQfTtPgaYpAmqL+ZpO8
	+abNGIHKHVDS4MF8O7zt0uMTMxuAnraKLsyZomfOfRFIxRS/RBLynryHgRsSjSuJ0thK
	nURMIteX2SLUT+sTWBXIIvpTu6wjHl+Voh8e4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=E/mg2pPb3WJxSyFa7v36oONBmhkdxtmQ85/x3kuO/UQeJcs386SQ6qWbpXJkxoAS+Z
	hG+i+SSYaro54eHKCtfvzjR2fRp31f8Ekk4EgdqAOP0KNjXCsPHTzNjkLK9iG5xE/D5v
	rwpECRcgr3T/2CqQvDg87et77H8z9HBhn1it4=
Received: by 10.87.63.21 with SMTP id q21mr1832412fgk.52.1270798721523;
	Fri, 09 Apr 2010 00:38:41 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 15sm563349fxm.3.2010.04.09.00.38.40
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 09 Apr 2010 00:38:40 -0700 (PDT)
Date: Fri, 9 Apr 2010 09:38:52 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100409073852.GH3269@jama>
References: <201004081428.07413.khimov@altell.ru>
	<1270797788-25090-1-git-send-email-khimov@altell.ru>
MIME-Version: 1.0
In-Reply-To: <1270797788-25090-1-git-send-email-khimov@altell.ru>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 72.14.220.156
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/2] tzdata/tzcode: leave only latest version
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
X-List-Received-Date: Fri, 09 Apr 2010 07:44:05 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 09, 2010 at 11:23:07AM +0400, Roman I Khimov wrote:
> I don't see any value in old tzdata/tzcode-native recipes as tzcode is only
> used to compile tzdata and compiled tzdata should be compatible with any
> version of glibc and it's good to have it latest. So I think we should only
> leave latest tzdata version and move that forward whenever someone discovers
> that elsie.nci.nih.gov dropped that version. Same for tzcode.
> 
> Add comments to unconditionally move that versions forward whenever there is
> a new release.

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


