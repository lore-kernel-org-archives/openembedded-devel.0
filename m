Received: from [81.169.178.128] (helo=h6563.serverkompetenz.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <oe@hentges.net>) id 1Iutoq-0000yO-QC
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Nov 2007 18:57:00 +0100
Received: from localhost (localhost [127.0.0.1])
	by h6563.serverkompetenz.net (Postfix) with ESMTP id 14CD03081E9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Nov 2007 18:54:44 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at hentges.net
Received: from h6563.serverkompetenz.net ([127.0.0.1])
	by localhost (h6563.serverkompetenz.net [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id YLVmqfq4H2b7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Nov 2007 18:54:42 +0100 (CET)
Received: from [192.168.5.2] (xdsl-87-78-210-162.netcologne.de [87.78.210.162])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by h6563.serverkompetenz.net (Postfix) with ESMTP id D021E3081E3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Nov 2007 18:54:41 +0100 (CET)
From: Matthias Hentges <oe@hentges.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <47434BB3.2010705@student.utwente.nl>
References: <E1IuZKt-0006pg-Ms@linuxtogo.org>
	<47434BB3.2010705@student.utwente.nl>
Date: Wed, 21 Nov 2007 18:54:41 +0100
Message-Id: <1195667681.30926.11.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.3 
Subject: Re: [oe-commits] org.oe.dev Add cryptsetup: Stop forcing your	opinions onto other people!
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 21 Nov 2007 17:57:01 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

(due to the retarded ML server, this message may appear twice)

For starters, this mailing list is still broken and violates RFCs in
regards to FROM and REPLY-TO.

Am Dienstag, den 20.11.2007, 22:03 +0100 schrieb Koen Kooi:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> coredump2 commit schreef:
> 
> 
> > +######################################################################################
> > +######################################################################################
> > +######################################################################################
> > +######################################################################################
> 
> Please read (and follow) the styleguide and run the recipe through
> OE-stylize.py to get an idea how it should look like.

Nice "style". With my layout, you at least had a sense about what does
what, the entries were grouped for easy reading.

Your "style" does nothing more than remove any kind of possible grouping
by deleting linefeeds left and right. Your "style" stinks.


> > +pkg_postinst() {
> > +	if test "x$D" = "x"
> > +	then 
> > +		# Work around a problem in module ipk's, where depmod is not always
> > +		# run after installing a kernel-module.
> > +		test -x /sbin/depmod && /sbin/depmod -a
> > +		/bin/true
> > +	fi
> 
> And don't add such hacks, please remove it.
> 

The "hack" had a very valid purpose. I even explained the purpose for
you alone in the .bb. It worked around a very real bug in module
handling which no one (not even you) bothered to fix for > 1 year.
A bug which is *impossible* to track-down or fix for most end-users.

Would be PLEASE STOP MESSING WITH OTHER PEOPLES FILES??
Only because YOU do not like something does NOT give you the bloody
right to revert or even change other peoples commits!

THIS IS NOT KOEN-EMBEDDED
-- 
Matthias 'CoreDump' Hentges 
Cologne / Germany

Webmaster of Hentges.net & Embedded Linux Developer
GPG ->  gpg --keyserver gpg-keyserver.de --recv-keys 0xAF3030D9

My OS: Debian SID: Geek by Nature, Linux by Choice





