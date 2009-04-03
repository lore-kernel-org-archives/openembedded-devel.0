Received: from [209.85.198.245] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Lpovz-0002p0-Ar
	for openembedded-devel@openembedded.org; Fri, 03 Apr 2009 21:20:16 +0200
Received: by rv-out-0708.google.com with SMTP id b17so1080873rvf.0
	for <openembedded-devel@openembedded.org>;
	Fri, 03 Apr 2009 12:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:cc:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=8njawK+Gya8Hf9fIzUDuwACP2sk86B8oQgMhrij6a5Q=;
	b=UI/3+TbQIYJ4mASwjmV7KxlkikJ/ckfKLhX5SIb3SxGUcmmVJ1PlBea0mhma7QOBIJ
	7pxCkFGObTD7/pKpqoCpOzIAdP47EeL/zRqeq2svZuc2MAJl20JE4N8aJczCA4GKnqkW
	G3+t/cIxiZTCrAvDqb3UmWSSGIqqC2RjxHp3s=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=RltqU0phC+f9BilAYjWVr0YS/vjRp5p0xkhIEdWHMQF2PKrZSLqiyHuqSoFRkPY419
	9dvJ9I/+Q2E2ykXLMnAH9KMAQj1Evxo0RztneGgJsZ9+46Y4L+goN5Q9izIZNTPHY8vo
	K2tslFhQ4Rb3PfEp9XS8fWukfzJzmyi0hZimQ=
Received: by 10.114.169.20 with SMTP id r20mr751198wae.110.1238786257418;
	Fri, 03 Apr 2009 12:17:37 -0700 (PDT)
Received: from gmail.com (adsl-71-146-4-184.dsl.pltn13.sbcglobal.net
	[71.146.4.184])
	by mx.google.com with ESMTPS id j39sm2466851waf.28.2009.04.03.12.17.36
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 03 Apr 2009 12:17:36 -0700 (PDT)
Date: Fri, 3 Apr 2009 12:17:33 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090403191733.GC29161@gmail.com>
References: <20090403175901.GA11095@smtp.west.cox.net>
MIME-Version: 1.0
In-Reply-To: <20090403175901.GA11095@smtp.west.cox.net>
User-Agent: Mutt/1.5.17+20080114 (2008-01-14)
X-SA-Exim-Connect-IP: 209.85.198.245
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=AWL,BAYES_40,RDNS_NONE,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: OpenEmbedded Devel List <openembedded-devel@openembedded.org>
Subject: Re: gcc-cross-kernel-3.3.4
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
X-List-Received-Date: Fri, 03 Apr 2009 19:20:16 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (03/04/09 10:59), Tom Rini wrote:
> On Wed, Apr 01, 2009 at 09:48:56AM -0000, =?utf-8?b?SsO2cmcgQmFra2VyIDxqb2VyZ0BoYWtrZXIuZGU+?= wrote:
> 
> > Yes, you're right. Changed patch is attached.
> [snip]
> > diff -Nur openembedded/recipes/gcc/gcc-cross-kernel-3.3.4_3.3.4.bb build/recipes/gcc/gcc-cross-kernel-3.3.4_3.3.4.bb
> > --- openembedded/recipes/gcc/gcc-cross-kernel-3.3.4_3.3.4.bb	2009-03-21 10:44:02.000000000 +0100
> > +++ build/recipes/gcc/gcc-cross-kernel-3.3.4_3.3.4.bb	2009-03-21 17:39:11.000000000 +0100
> > @@ -1,2 +1,3 @@
> >  require gcc-cross-initial_${PV}.bb
> >  require gcc-cross-kernel.inc
> > +SRC_URI_append = "file://gcc334-collect2_file_open_args.patch;patch=1"
> 
> Grabbed this as mbox from patchwork, so I hope this gets followed-up
> right.  The patch is good, but we should be doing this for all 3.3.4's
> we have left.  I'll take care of that and push shortly.  Thanks.

I have a slightly different opinion. This only solves one problem which
is due to FORTIFY_SOURCES on ubuntu native gcc. On newer host distributions (with
gcc 4.x). When we chose a OE distro (target) which uses old compilers (
3.4 or below) we end up compiling the cross compilers with relatively
newer compiler which may have problems. Same could be true for other
host utilities which are old. 

I think best solution is to build a native compiler from the same
version first. Now it will add to compilation time but
then we can have ASSUME_PROVIDED.

> 
> -- 
> Tom Rini
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


