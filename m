Received: from mail-bw0-f213.google.com ([209.85.218.213])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1Njgzq-0005BU-QT
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Feb 2010 23:43:25 +0100
Received: by bwz5 with SMTP id 5so2021595bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Feb 2010 14:40:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=YBJVV1ZZMUx3BIpc9xkUooL2bgspPpZBoCodnrpeCkA=;
	b=Syp/luTVYP3hzzLlPvkgfajwFAZUu6KTAqbZzHxpqeHvbw1j5LzfMotgjLS4YGrLLJ
	C6ZieduIHByN+1FfjaxEQiTlrY0rFTpYvYo3NAUgEu9B38rE4pmBPqNPn1QsywhfI0ZV
	EVNFpjpl5dxlph0shtsUWbnfv2jaXx2PtlsuE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=uerX5piVvwl9NAyrsQfaPaoiIRRsR6m2Ge7BJgs431ESJ4WwwvpJMkOnLRpNW+IL2w
	SiNI50AenF6kVGdFFNrbFwVPtO5YqJWlqmFSFZbmd90fMXtU6OjiFpdF3YsIV+R7vN+i
	SDr6dm3v6z+AANkTLz5Rq0exCAh3XxZt1rJlI=
Received: by 10.204.132.131 with SMTP id b3mr1697778bkt.135.1266878438626;
	Mon, 22 Feb 2010 14:40:38 -0800 (PST)
Received: from s42.loc ([84.119.103.202])
	by mx.google.com with ESMTPS id 14sm1416411bwz.2.2010.02.22.14.40.37
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 22 Feb 2010 14:40:37 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.71)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1Njh27-0003hy-Kh; Mon, 22 Feb 2010 23:45:43 +0100
Date: Mon, 22 Feb 2010 23:45:43 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100222224543.GD30265@mx.loc>
References: <1266766352-28786-1-git-send-email-rep.dot.nop@gmail.com>
	<20100222162424.GA27420@denix.org>
	<1266857709.14566.348.camel@mill.internal.reciva.com>
	<b6ebd0a51002220906p53b3b3b2h5257ebca50d6227c@mail.gmail.com>
	<20100222181754.GB24049@jama> <20100222194159.GZ30265@mx.loc>
	<20100222214335.GB30265@mx.loc> <20100222220621.GB27420@denix.org>
MIME-Version: 1.0
In-Reply-To: <20100222220621.GB27420@denix.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.218.213
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] git: add SRC_URI name
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
X-List-Received-Date: Mon, 22 Feb 2010 22:43:26 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 22, 2010 at 05:06:21PM -0500, Denys Dmytriyenko wrote:

>> Not using "archive" as Martin likes as default, but uri%d, but
>
>For multiple SRC_URIs, using uri1/uri2 can be more confusing and may be not 
>much better than looking up real names in .inc file...

ok, so let's drop that superfluous .note and the url%d handling.
Other opinions?


