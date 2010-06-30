Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OTxM1-0002pd-1j
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Jun 2010 15:29:29 +0200
Received: by fxm12 with SMTP id 12so463759fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jun 2010 06:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:cc:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=RmEJ23B4pKqjmYRhoKPyy3PwX0stW7lOcgZgtLJPyDU=;
	b=KgO8p9zw6ePGJs+/aKHzErIH0lSHpW6FSRJOh7oUAzKqCn+NATFlUqjKcruyoEAWIk
	jVyxuKlKPWzwkITBB0jT5BUIMAGKi+BMmfkOwG6CxZRN/hv/n4dLHk6tteBWD0SRBcec
	Hwhp27ZsS8VBfGrYb9ojCLt/ix3ajcvGyIcYs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=ufdzNj54hXmfOWBrDqAH0rEZH1VRdTbZwGbm6pOH400dPZDFn2FNIHqwvUXMqYiZGd
	tnQQfwBccjx7QBQPP5MYrm1FD3VuCz5c3Uxnugar0yE0kyyGq7q8HuuDYAv6nx7cC3Dh
	6ke51/r164CnyjVYPqW0NqjIsa0AZGcO8XpVc=
Received: by 10.223.105.10 with SMTP id r10mr7468421fao.24.1277904284499;
	Wed, 30 Jun 2010 06:24:44 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id u12sm56085854fah.4.2010.06.30.06.24.43
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 30 Jun 2010 06:24:43 -0700 (PDT)
Date: Wed, 30 Jun 2010 15:23:50 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
	openembedded-devel@lists.openembedded.org
Message-ID: <20100630132349.GA4774@jama>
References: <E1OTx25-0000G6-Q2@melo.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <E1OTx25-0000G6-Q2@melo.openembedded.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-commits@openembedded.org
Subject: Re: [oe-commits] Dmitry Eremin-Solenikov : xcb-proto: allow empty xcb-proto
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
X-List-Received-Date: Wed, 30 Jun 2010 13:29:29 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 30, 2010 at 01:08:53PM +0000, git version control wrote:
> Module: openembedded.git
> Branch: org.openembedded.dev
> Commit: e90cf71fe69917d5716fbf25846ba0e91f0b5bd7
> URL:    http://gitweb.openembedded.net/?p=openembedded.git&a=commit;h=e90cf71fe69917d5716fbf25846ba0e91f0b5bd7
> 
> Author: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
> Date:   Tue Jun 29 16:12:02 2010 +0400
> 
> xcb-proto: allow empty xcb-proto
> 
> xcb-proto-dev depends on (empty) xcb-proto. Allow building of empty xcb-proto packet
> 
> Also bump PR for xcb-proto 1.6 to force rebuilding.
> 
> Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>

http://git.openembedded.org/cgit.cgi/openembedded/commit/?id=357763adbae6e4d52be61b84c0fffc9aa11a8044
deja vu..

please don't forget to rebase next time :)

btw: what happen with that git hook proposed here :/

Regards,

-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


