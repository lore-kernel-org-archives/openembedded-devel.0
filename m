Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1NsLZa-00076V-8w
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Mar 2010 20:40:03 +0100
Received: by gwj23 with SMTP id 23so1132951gwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Mar 2010 12:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=vwZFXYLeuADRunm/MyN3AomcBeiLVN+WDCNg+0dn2FI=;
	b=L5UvKQKXPAfcsacfIwCVGPy7MiMIIolUDFDCE/BSgvK3RZNaLt8ZWe96jMDDJp2qVW
	T1egLrWIdoN9B66L0wM0/h15ciIxMNKgUaRLik+Et2DERhbjXHdG/B/K0pPMYQ9Cd5gT
	4fKfjeF45ApRvdw5+r1mKVLoB5llyVPN6xOGc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=m28+lTpDGeC07S4OnhyYu/G+i3d8j0eUv1sa5KKZDtA8JUJ16JupP/H1pWfwXwGhJn
	r6MI6Ou2qL1ujRd/Q2HiPJGb8usNWfpHpuQjeghLQG2v64e88lp63qm68FYI6leWu/ux
	+qghnlFMgyRlGae5YjzvQC+R+zUPE8vMdKv2E=
MIME-Version: 1.0
Received: by 10.101.193.30 with SMTP id v30mr4975010anp.199.1268941017213; 
	Thu, 18 Mar 2010 12:36:57 -0700 (PDT)
In-Reply-To: <201003182212.31873.roman@khimov.ru>
References: <201003182212.31873.roman@khimov.ru>
Date: Thu, 18 Mar 2010 20:36:57 +0100
Message-ID: <ac9c93b11003181236u5d7701ebiaa778519b0013700@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC/PATCH] Perl 5.10.1 and a bunch of modules
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
X-List-Received-Date: Thu, 18 Mar 2010 19:40:03 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/3/18 Roman I Khimov <roman@khimov.ru>:
> Hello all.
>
> As perl 5.10.1 is a big patch by itself and series overall is 42 patches and I
> don't want to banned from list for spam ;), I've commited that to the
> "rik/perl-5.10" branch of OE repo.
>
> In general, the most interesting and the most requiring review are the first
> 4, all the other are just various modules. So, please
> review/try/test/ack/nack.
>
Nice work Roman!
Any particular reason not to go to 5.11?

BTW had some issues with perl in the past where it came to path's (in
perl-config or something like that).
Also I'm not sure whether all the native recipes we have now are really needed.
Perhaps the new staging will take care of that. Do you have any idea?

Frans.


