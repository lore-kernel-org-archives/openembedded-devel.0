Received: from [81.169.178.128] (helo=h6563.serverkompetenz.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <oe@hentges.net>) id 1HKQ9i-0001k0-Da
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Feb 2007 03:27:30 +0100
Received: from localhost (localhost [127.0.0.1])
	by h6563.serverkompetenz.net (Postfix) with ESMTP id F1E52308214
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Feb 2007 03:27:29 +0100 (CET)
Received: from h6563.serverkompetenz.net ([127.0.0.1])
	by localhost (h6563 [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 19437-02 for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Feb 2007 03:27:27 +0100 (CET)
Received: from mhcln04.hentges.priv (xdsl-213-196-246-16.netcologne.de
	[213.196.246.16]) (using TLSv1 with cipher RC4-MD5 (128/128 bits))
	(No client certificate requested)
	by h6563.serverkompetenz.net (Postfix) with ESMTP id D7C0F3081E6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Feb 2007 03:27:06 +0100 (CET)
From: Matthias Hentges <oe@hentges.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <45DAFC38.40000@dominion.kabel.utwente.nl>
References: <45D98799.1080309@dominion.kabel.utwente.nl>
	<200702191259.25200.openembedded@hrw.one.pl>
	<45D9984C.6090705@dominion.kabel.utwente.nl>
	<45DAAEF4.50701@dominion.kabel.utwente.nl>
	<45DAFC38.40000@dominion.kabel.utwente.nl>
Date: Fri, 23 Feb 2007 03:26:04 +0100
Message-Id: <1172197564.5203.11.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.3 
X-Virus-Scanned: by amavisd-new-20030616-p10 (Debian) at hentges.net
Subject: Re: RFC: splitting deploy/ipk into subarchs
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
X-List-Received-Date: Fri, 23 Feb 2007 02:27:30 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Am Dienstag, den 20.02.2007, 14:48 +0100 schrieb Koen Kooi:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Koen Kooi schreef:
> 
> > Marcin and I merged a slightly different version of this today.
> 
> As some people found out, their upload scripts broke with this change. I'm sorry that
> happened, but those scripts are more easily fixed than ipkg-utils :(
> Due to bug in ipkg-utils being I haven't been using a straight rsync for a while now, so
> for the curious:

Why not make this change optional via a variable 
(ie: SPLIT_DEPLOYDIR_IPK = -1 to turn it off) ?

The current version breaks local OE feeds and requires needless
post-processing.

A slugos deploy dir looks like this now:

all
armv5te
i686
ixp4xxle

I honestly don't see any advantage to the previous mode of operation. If
it is needed for unique situations like the rare case of a multi-machine
build, it should be off by default and - by all means - optional.

My 2 cents
--
Matthias Hentges



