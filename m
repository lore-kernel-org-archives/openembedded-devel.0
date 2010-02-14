Received: from mail-fx0-f225.google.com ([209.85.220.225])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1Nglua-0006Xm-DY
	for openembedded-devel@lists.openembedded.org;
	Sun, 14 Feb 2010 22:21:55 +0100
Received: by fxm25 with SMTP id 25so2364093fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Feb 2010 13:19:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=7EqHr+8JwU1tK/VvxpxJlT4Njp1IIxUmR1VA4NWMLFc=;
	b=sfW6otSPZpE54GmMJzFyYqMlVdZyliKmrivzWx6pnwRFFg1R5CZ6T/umExOzYb2QkC
	1m2rmKJ1BBOpPbqamqYccRQ7y1gIQROf4i0tsdxhGpHGkk2gMsr8UIlPE8BcuQYfaieR
	tP5er85ZHbSf+tQx520uBP1F0PXdMaW4KhGX8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=AWYImb4OcH3awWaWrL3fPCA0vZ0oPLYlRZClBAkx2wXWhk8oJxPW1i/ulOqnleQUKv
	auCWj6kOZMe4IMY5S6ghvR/KCilsP2deVeVrs51VbqcFYSt9LLRu7Vsugzevt6FI+F6G
	kOfiXb4fBREaR9myl5v62P8CQBC4rwopBBWcE=
Received: by 10.223.5.207 with SMTP id 15mr2034681faw.6.1266182354066;
	Sun, 14 Feb 2010 13:19:14 -0800 (PST)
Received: from s42.loc ([84.119.103.202])
	by mx.google.com with ESMTPS id g28sm8949041fkg.38.2010.02.14.13.19.12
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 14 Feb 2010 13:19:13 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.71)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1Nglv3-0005IE-IU; Sun, 14 Feb 2010 22:22:21 +0100
Date: Sun, 14 Feb 2010 22:22:21 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100214212221.GI30265@mx.loc>
References: <hl9luq$dgl$1@ger.gmane.org>
	<20100214203851.3C855185B3BD2@dd20204.kasserver.com>
MIME-Version: 1.0
In-Reply-To: <20100214203851.3C855185B3BD2@dd20204.kasserver.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.220.225
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
X-List-Received-Date: Sun, 14 Feb 2010 21:21:55 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Feb 14, 2010 at 09:38:51PM +0100, bernhard.guillon@opensimpad.org wrote:
>> > classes/pkgconfig.bbclass suggests that .pc are fixed up in
>> > do_install_prepend() (why does the efl class duplicate this, btw?)
>> > and that this depends on stage.
>> 
>> Because the efl classes suck, they also override things like PACKAGES.
>> With new-style staging and the current state of e svn we should be able
>> to get rid of that crap altogether.
>> 
>> That reminds me, I wanted to add
>> 
>> do_configure_prepend() {
>> 	 autopoint
>> }
>> 
>> to those clase to make the modules build again.
>
>I found the problem for blackbox. The path is in -rlink-path and this is currently ignored by pkgconfig.bbclass.
>
>This fixed it on my system but I have no clue if this is a good idea at all :D
>
>diff --git a/classes/pkgconfig.bbclass b/classes/pkgconfig.bbclass
>index f3d9371..1da508f 100644
>--- a/classes/pkgconfig.bbclass
>+++ b/classes/pkgconfig.bbclass
>@@ -3,7 +3,7 @@ DEPENDS_prepend = "pkgconfig-native "
> do_install_prepend () {
> 
> for i in `find ${S}/ -name "*.pc" -type f` ; do 
>-            sed -i -e 's:-L${STAGING_LIBDIR}::g' -e 's:-I${STAGING_INCDIR}::g' $i
>+            sed -i -e 's:-L${STAGING_LIBDIR}::g' -e 's:-I${STAGING_INCDIR}::g' -e 's:-rpath-link,${STAGING_LIBDIR}::g' $i

I'd go for plain
sed -i -e 's:${STAGING_LIBDIR}::g' -e 's:${STAGING_INCDIR}::g' $i

to avoid massaging  -rpath / -Y / --library-path et al later on.
>         done
> }
>
>
>Should I prepare a proper patch for pkgconfig.bbclass and send it to the list or is this approach the wrong way?


