Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <rpurdie@rpsys.net>) id 1GFekn-0006Za-L6
	for openembedded-devel@openembedded.org; Wed, 23 Aug 2006 00:29:49 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.6) with ESMTP id k7MMSO78026132
	for <openembedded-devel@openembedded.org>;
	Tue, 22 Aug 2006 23:28:24 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 25922-06 for <openembedded-devel@openembedded.org>;
	Tue, 22 Aug 2006 23:28:21 +0100 (BST)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.6) with ESMTP id k7MMSEkC026099
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Tue, 22 Aug 2006 23:28:18 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <1156284877.17332.51.camel@gandalf.tm.informatik.uni-frankfurt.de>
References: <E1GFeQg-0001om-Nn@linuxtogo.org>
	<1156284877.17332.51.camel@gandalf.tm.informatik.uni-frankfurt.de>
Date: Tue, 22 Aug 2006 23:28:16 +0100
Message-Id: <1156285696.5920.33.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [oe-commits] org.oe.dev task-angstrom: mask out broken	packages
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 22 Aug 2006 22:29:49 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2006-08-23 at 00:14 +0200, Michael 'Mickey' Lauer wrote:
> > @@ -142,7 +142,7 @@ RDEPENDS_angstrom-task-office := "\
> >      gnumeric \
> >      abiword \
> >      imposter \
> > -    evince \
> > +#    evince \
> >      gqview"
> 
> Does that really work that way? Isn't '\' just concatenating the lines
> so we end up with
> 
> angstrom-task-office = "gnumeric abiword imposter evince # gqview" which
> isn't what we want or is it?

It does work. It is a bug in the parser though :)

Richard



