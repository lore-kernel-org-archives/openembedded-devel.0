Received: from mail-bw0-f219.google.com ([209.85.218.219])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1NgmIY-0005Ew-Uf
	for openembedded-devel@lists.openembedded.org;
	Sun, 14 Feb 2010 22:46:42 +0100
Received: by bwz19 with SMTP id 19so3061078bwz.28
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Feb 2010 13:44:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=liXhQ6YW5ZxBIiGSxfPMLB0HO3pxpeSZmvFq99+jk5U=;
	b=jVV1V/ba5gCXFFzdh1CuXOZMn6ZZlnW8oHXx8ikHB+i/LtFNk3vjoAM5yMQEJ/A/YJ
	ErTJ8diNJ4mqYdGTEm0Zr1PLR66mNFGRtTM22B5emFqqVTVz0xfoedzUSOfG5Z/MuIKk
	C526NbQWbYIc4Ak2pfjxBBA5NDfT5+Yy0W16M=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=WHAcXdLXZeRqxtLq+oZwZ0Ef+M6/3PUKtmHjMkGA/XmI22ErrWSQdyFdyqGzKeOviq
	lvRcl9rqCi2+TQxgMfyx6W0UUbWYlgi5FshNoR7AbMkdV7J8q44pvF6XSv/BRBn4bWrD
	AIZHTB40ITZYevgcbxNCDj8eb5OguxIPL60tY=
Received: by 10.204.133.21 with SMTP id d21mr1717895bkt.108.1266183841574;
	Sun, 14 Feb 2010 13:44:01 -0800 (PST)
Received: from s42.loc ([84.119.103.202])
	by mx.google.com with ESMTPS id 13sm2382032bwz.6.2010.02.14.13.44.00
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 14 Feb 2010 13:44:00 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.71)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1NgmJ3-0001Af-BM; Sun, 14 Feb 2010 22:47:09 +0100
Date: Sun, 14 Feb 2010 22:47:09 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100214214709.GJ30265@mx.loc>
References: <hl9luq$dgl$1@ger.gmane.org>
	<20100214203851.3C855185B3BD2@dd20204.kasserver.com>
	<20100214212221.GI30265@mx.loc>
	<1266183110.5437.34.camel@lenovo.internal.reciva.com>
MIME-Version: 1.0
In-Reply-To: <1266183110.5437.34.camel@lenovo.internal.reciva.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.218.219
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: = ? UTF-8 ? B ? Ww== ? =oe= ? UTF-8 ? B ? XQ== ? = How to sane replace a path in a pkgconfig file ?
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
X-List-Received-Date: Sun, 14 Feb 2010 21:46:42 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Feb 14, 2010 at 09:31:50PM +0000, Phil Blundell wrote:
>On Sun, 2010-02-14 at 22:22 +0100, Bernhard Reutner-Fischer wrote:
>> I'd go for plain
>> sed -i -e 's:${STAGING_LIBDIR}::g' -e 's:${STAGING_INCDIR}::g' $i
>> 
>> to avoid massaging  -rpath / -Y / --library-path et al later on.
>
>Does that actually work?  I would have thought it would leave you with a
>load of surplus "-L" and "-I" options with missing arguments.

It wouldn't, you're right.
So either come up with a stanza that lists all path-touching tokens
explicitly or write a sed/awk script that does that -- i'd be surprised
if nobody wrote something like that yet since that's a pretty common
thing to do.


