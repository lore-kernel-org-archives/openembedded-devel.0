Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <coolaj86@gmail.com>) id 1Oneaq-0000il-44
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Aug 2010 23:30:15 +0200
Received: by fxm6 with SMTP id 6so3581005fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Aug 2010 14:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=Ckx7N8LnIudjYM2W9Jp0sp58Plde/9YFTsLVDTG+ztM=;
	b=H4kERWJfvmh4/OOVMjqy0Ms8uY2ePnBf6B2vR4mtC2A36trqj/DH/UPqzAN7VhqLXm
	EVgU5GbijQ1c4j+lnxiftpyyukUJMHvRpUfhOf0FFLKIuyVdcWUASUEQ1pLAubINsLDJ
	ZJ6fgi0+SCMhzLsHNSoTRvMv3NZEUYT3a+pj4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=kCqywMZfir5cQxENv6qirn29CN7J2v0gTmssw8hhR31DFipc7w3CTVodnX9nvxs5ci
	qZIt4+sHQEuxgopfI0Y/GQmCn1iFyODws8B96sYwDsy4/fXnmIAcXxke8OBtfXX+Y+aG
	ipVZ8mgAvXaU8uJ8dIQ5XyD8F/bdfZxgNB3is=
Received: by 10.223.106.132 with SMTP id x4mr5119724fao.15.1282598986940; Mon,
	23 Aug 2010 14:29:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.125.209 with HTTP; Mon, 23 Aug 2010 14:29:26 -0700 (PDT)
In-Reply-To: <i4tcnp$qie$6@dough.gmane.org>
References: <1282198068-25415-1-git-send-email-coolaj86@gmail.com>
	<i4iqg8$g6i$2@dough.gmane.org>
	<AANLkTim2hsYd7ya-SZ6hRpjU2_MHRAQAeczkTnQVuRD3@mail.gmail.com>
	<i4tcnp$qie$6@dough.gmane.org>
From: AJ ONeal <coolaj86@gmail.com>
Date: Mon, 23 Aug 2010 15:29:26 -0600
Message-ID: <AANLkTin=rGHBqRGSnw6mzYR_f4MgqLEAG_Mj5J=Y+SEt@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Rcpt-To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Mail-From: coolaj86@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] added a .bb for node.js
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
X-List-Received-Date: Mon, 23 Aug 2010 21:30:16 -0000
Content-Type: text/plain; charset=ISO-8859-1

>
> >>
> > No, if I do `make install` it will try to install to the host location. I
> > tried adding ./configure --prefix=${D}, but that ends up installing to
> > `./work/arm......./usr/bin/bin`
> >
> >
> > I don't know how to add the [v2] onto a patch, but I'm going to submit
> again
> > with what I have working.
>
> Doesn't nodejs have some form of DESTDIR option? I think it did when I
> built it natively.
>
>
You're going to have to give me an example. What should it be set to?

${D}
${bindir}
${something-else-entirely}

I don't really understand these things do or what they're for. I was just
blindly copying the only example that I could find.

