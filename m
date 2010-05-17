Received: from mail-ew0-f225.google.com ([209.85.219.225])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OE5U3-0005Ay-CM
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 May 2010 20:56:12 +0200
Received: by ewy25 with SMTP id 25so1381934ewy.27
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 May 2010 11:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=HONEMMdbdB0ELbFh1vi45KaMkS4/VPJvx7UuKjbmWQ4=;
	b=PYPrMhf65l6gU764Z+9BkRmGQYgr7HuAImvfeb8Mkby2RqRnRKAZvtzGrOteKGEJOY
	cPTRdYoi1khn9dUOl1FSqMEsf6rNwfwq1Rp6urBUU38orhxvXRwSalWKx+HAsVvB+AwZ
	zRJOjzAfMnluh1RNGqgG8mCZQM9zBFK5CJIis=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=vFWjDehS+RO/KOOIcGJwzxtTTmdxAxpPifl26Y61N3m3jct/mT8Ql/lQTwKdCts9qb
	MqqYf6vDKGQIFNBxN+MjckUrvUIOU/K1rws580XCP5u4/nhjeAhYdyAFwwWkie329LEV
	bWIImmmizzS88Okc/4/mXHgTXB5F+Lmm74edA=
Received: by 10.213.66.5 with SMTP id l5mr2791092ebi.71.1274122331755;
	Mon, 17 May 2010 11:52:11 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id 14sm2987274ewy.6.2010.05.17.11.52.09
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 17 May 2010 11:52:10 -0700 (PDT)
Date: Mon, 17 May 2010 11:52:35 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100517185235.GA7868@gmail.com>
References: <hsql3t$o5c$1@dough.gmane.org> <20100517055550.GA6686@gmail.com>
	<hsr2pr$4vp$1@dough.gmane.org>
	<AANLkTin6PIr6ZgeYS6rB9IGK83vQH9Tn9xreVOwOAt0M@mail.gmail.com>
	<hsrsq8$d0r$1@dough.gmane.org>
	<AANLkTimXPVpXkm-vJbKvsYim3zM_ckn6XEH_XtS_pDot@mail.gmail.com>
	<1274119962.25944.147.camel@trini-m4400>
MIME-Version: 1.0
In-Reply-To: <1274119962.25944.147.camel@trini-m4400>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.219.225
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Question: is 'gcc' supposed to replace the libstdc++.la installed by 'gcc-cross'?
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
X-List-Received-Date: Mon, 17 May 2010 18:56:13 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (17/05/10 11:12), Tom Rini wrote:
> On Mon, 2010-05-17 at 10:45 -0700, Khem Raj wrote: 
> > On Mon, May 17, 2010 at 10:02 AM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> > > -----BEGIN PGP SIGNED MESSAGE-----
> > > Hash: SHA1
> > >
> > > On 17-05-10 18:49, Khem Raj wrote:
> > >> On Mon, May 17, 2010 at 2:38 AM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> > >
> > >> I could not build a console-image as I ran out of disk space. Have you
> > >> considered removing
> > >> -g3 from default angstrom builds.
> > 
> > what is -g3 offering over -g at -O2 and how good the additional debug info is ?
> 
> -g3 offers lots of stuff, spelled out in some doc or another is macro
> expansion, for example.  I don't know if it offers enough stuff that you
> say don't need the sources themselves around still too tho.  Koen?

If -g3 is intended, some options to reduce debug info size should be
considered like
-feliminate-dwarf2-dups -femit-struct-debug-baseonly
-femit-struct-debug-reduced
etc.

-Khem


