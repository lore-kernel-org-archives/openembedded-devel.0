Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NtGK3-0006fV-Kr
	for openembedded-devel@lists.openembedded.org;
	Sun, 21 Mar 2010 09:15:52 +0100
Received: by gye5 with SMTP id 5so2071938gye.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Mar 2010 01:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=8XvIjIsGIUljufAm/IcOdhszUG5QMf+ccQKJ8DcDr4k=;
	b=Qf1W1FiObl40qxgU44qUk3OFwDHb8ZnnvSY4ogFNwSFkQkTwfASeQxcV8E4VtpQRvO
	tlmKFGWCJe/W+nAQxi8DXgU6faWG+XpyiNQDEg9AUIWTVPkaEQWcuGrAlPT+TS4OvzDs
	ok4ZMi25h6S3z89Uaq6Oy9YxvT5stKFedo70k=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=CG1veIbzaFGEc1OQAtYV4vOZiq9AIuB8xabv1trxmSip2sNKBQ0y3cYHR8jv6/4ZAg
	TIr/ihxjV4gcKogRccUGkU59EL5uBWTQJTwiS9+uaIJuPF9usi27dIUOSkf5wxKxXnFC
	Pm/Dv282NnNDEwwXv0tuafje6vW1AfF3Ntk98=
Received: by 10.101.135.35 with SMTP id m35mr12491403ann.193.1269159160297;
	Sun, 21 Mar 2010 01:12:40 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id 21sm2290484iwn.15.2010.03.21.01.12.39
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 21 Mar 2010 01:12:39 -0700 (PDT)
Date: Sun, 21 Mar 2010 01:12:36 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100321081236.GA6455@gmail.com>
References: <4B9E1C0D.5050806@dresearch.de>
MIME-Version: 1.0
In-Reply-To: <4B9E1C0D.5050806@dresearch.de>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: gcc atomic instruction support for armv5te
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
X-List-Received-Date: Sun, 21 Mar 2010 08:15:52 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (15/03/10 12:37), Steffen Sledz wrote:
> As mentioned before i try to create a recipe for rsyslog.
> 
> Now i hit the next big problem. The last item at
> http://www.rsyslog.com/doc-build_from_repo.html says that
> 
> "The availability of atomic instructions is vital for rsyslog"
> 
> The gcc version 4.3.3 which is used for armv5te by default
> misses this. :(
> 
> Is there a newer gcc version with atomic instruction for armv5te
> machines available/tested? I heard rumors that 4.4.3 shell
> have it?

yes 4.4+ should have them as intrinsic functions. Which ones are needed by rsyslog ?

> 
> Steffen
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


