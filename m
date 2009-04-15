Received: from [85.199.173.110] (helo=mx51.mymxserver.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hs4233@mail.mn-solutions.de>) id 1Lu2iR-0004Ep-Ra
	for openembedded-devel@openembedded.org; Wed, 15 Apr 2009 12:51:41 +0200
Received: from localhost (localhost [127.0.0.1])
	by localhost.mx51.mymxserver.com (Postfix) with ESMTP id EA23B238077;
	Wed, 15 Apr 2009 12:47:53 +0200 (CEST)
X-Virus-Scanned: by Mittwald Mailscanner
Received: from mx51.mymxserver.com ([127.0.0.1])
	by localhost (mx51.mymxserver.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nUB+05QqR-J5; Wed, 15 Apr 2009 12:47:53 +0200 (CEST)
Received: from lin01.mn-solutions.de (pD95F99E0.dip0.t-ipconnect.de
	[217.95.153.224])
	by mx51.mymxserver.com (Postfix) with ESMTP id 0EFA5238070;
	Wed, 15 Apr 2009 12:47:53 +0200 (CEST)
Received: by lin01.mn-solutions.de (Postfix, from userid 116)
	id 6EC691E04CC; Wed, 15 Apr 2009 12:47:52 +0200 (CEST)
Received: from mnz66.mn-solutions.de (mnz66.mn-solutions.de [192.168.233.66])
	by lin01.mn-solutions.de (Postfix) with ESMTP id C89041E04C8;
	Wed, 15 Apr 2009 12:47:43 +0200 (CEST)
From: Holger Schurig <hs4233@mail.mn-solutions.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 Apr 2009 12:47:33 +0200
User-Agent: KMail/1.9.7
References: <1239784615-19928-1-git-send-email-khimov@altell.ru>
	<gs47uf$uv2$1@ger.gmane.org>
In-Reply-To: <gs47uf$uv2$1@ger.gmane.org>
MIME-Version: 1.0
Message-Id: <200904151247.33585.hs4233@mail.mn-solutions.de>
X-SA-Exim-Connect-IP: 85.199.173.110
X-SA-Exim-Mail-From: hs4233@mail.mn-solutions.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@openembedded.org, Koen Kooi <k.kooi@student.utwente.nl>
Subject: Re: [PATCH] libpcap: weaken bluez-libs dependency
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
X-List-Received-Date: Wed, 15 Apr 2009 10:51:42 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

> NACK, no USE flags in OE.

I'm not sure if this was a mis-design that I made.

When I modeled *.bb and *.bbclass files and wrote parts of the 
initial bitbake, I thought that USE variables lead even more to 
a combinatorical explosion (think package tests!) than the 
overrides I added.

I thought that overrides are strictly necessary to adapt to 
invidual board settings. And I thought that USE= is just handy, 
not neccessary. I also never wrote something about USE= in the 
design documents we had in the old wiki at that time.

In the mean-time I also had thought from time to time that USE 
would be nicer. However, partially we have USE, althought it's 
usually only for defining WHAT comes into image, now HOW to 
compile something. Examples of Gentoo-USE-like variables are 
DISTRO_FEATURES or MACHINE_FEATURES.


However, if we now would add USE like gentoo, I'd like to saner 
syntax than embedded anonymous python scripts :-)

Also, from quite early on it was clear that usage of overrides 
will be recorded and will e.g. into the filenames of generated 
*.ipk files. We'll have to think about how to do that for USE 
flags ...  (if we ever use them). Or how to circumvent this, 
e.g. using MACHINE or DISTRO, depending on where the USE flag 
was defined. But hey, that's all halfbaked, not bitbaked :-)



All historic mention is "AFAIK", it was several years ago, and 
other people like Chris or Mickey and some more from the old 
OPIE community also helped brainstorming.


