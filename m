Received: from [85.199.173.110] (helo=mx51.mymxserver.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hs4233@mail.mn-solutions.de>) id 1LmTwE-0004iI-T6
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 Mar 2009 15:18:38 +0100
Received: from localhost (localhost [127.0.0.1])
	by localhost.mx51.mymxserver.com (Postfix) with ESMTP id 6D4E4148003;
	Wed, 25 Mar 2009 15:17:04 +0100 (CET)
X-Virus-Scanned: by Mittwald Mailscanner
Received: from mx51.mymxserver.com ([127.0.0.1])
	by localhost (mx51.mymxserver.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xzt5BbDae-Cn; Wed, 25 Mar 2009 15:17:04 +0100 (CET)
Received: from lin01.mn-solutions.de (pD95F9E0B.dip0.t-ipconnect.de
	[217.95.158.11])
	by mx51.mymxserver.com (Postfix) with ESMTP id A7B5414800C;
	Wed, 25 Mar 2009 15:17:03 +0100 (CET)
Received: by lin01.mn-solutions.de (Postfix, from userid 116)
	id ED2531E0125; Wed, 25 Mar 2009 15:17:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.1.7-deb (2006-10-05) on 
	lin01.mn-logistik.de
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00 
	autolearn=ham version=3.1.7-deb
Received: from mnz66.mn-solutions.de (mnz66.mn-solutions.de [192.168.233.66])
	by lin01.mn-solutions.de (Postfix) with ESMTP id 5AA041E0124;
	Wed, 25 Mar 2009 15:16:58 +0100 (CET)
From: Holger Schurig <hs4233@mail.mn-solutions.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 25 Mar 2009 15:16:44 +0100
User-Agent: KMail/1.9.7
References: <b6ebd0a50903171218i7f5716afifd99177982b6df5b@mail.gmail.com>
	<gqd31s$5vk$1@ger.gmane.org>
	<1237988215.5328.40.camel@dax.rpnet.com>
In-Reply-To: <1237988215.5328.40.camel@dax.rpnet.com>
MIME-Version: 1.0
Message-Id: <200903251516.44480.hs4233@mail.mn-solutions.de>
Cc: openembedded-devel@openembedded.org
Subject: Re: Package Maintenance
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
X-List-Received-Date: Wed, 25 Mar 2009 14:18:39 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

> * Who maintains file X (be it a class/recipe/conf/sitefile
> etc)? * Who last changed file X?
> * Who are the contributors to file X?
> * Can we easily create a subset of the metadata which is
> "maintained"?

I don't really think that -- in the general case -- maintaining 
maintainers on a per-file or per-recipe basis works for the 
recipes. There are just too many.

But maybe maintainership based on categories make sense.

* all cross-compilation and build tools
* all Java stuff
* all Python stuff
* all matchbox stuff
* all KDE stuff
* all OPIE stuff
* (more categories that are easily identifiable and make sense)
* the "pool" :-)

The point is: a package that is in the python category could 
easily be in Mickey scope of interest anyway. Similar for other 
categories. There's no exact match, but still a high degree of 
correlation.

Now it's easy to say "John Doe is our Java guy". And John could 
of course have sub-maintainers.


