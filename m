Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1MdkOs-0001eI-P7
	for openembedded-devel@openembedded.org; Wed, 19 Aug 2009 14:36:25 +0200
Received: (qmail 17903 invoked by uid 813007); 19 Aug 2009 12:19:12 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO host4.kei.pl)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 19 Aug 2009 12:19:12 -0000
References: <6978a1740908180652y36467f0evcfc467153cf9ac64@mail.gmail.com><h6ed6d$r1l$2@ger.gmane.org>
	<6978a1740908182358l69cf380awefdf8d966f75678a@mail.gmail.com>
In-Reply-To: <6978a1740908182358l69cf380awefdf8d966f75678a@mail.gmail.com>
Received: from 83.22.159.1
	(Poczta WWW KEI.pl authenticated user marcin@juszkiewicz.com.pl)
	by poczta813.kei.pl with HTTP; Wed, 19 Aug 2009 14:19:12 +0200 (CEST)
Message-ID: <8d7a1face05be6d40b10e2449a443196.marcin@juszkiewicz.com.pl>
From: <marcin@juszkiewicz.com.pl>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 19 Aug 2009 14:19:12 +0200
MIME-Version: 1.0
X-Priority: 3
X-Mailer-Version: 1.0
X-Mailer: Poczta WWW KEI.pl
X-Organisation: KEI Provider
X-User-IP: 83.22.159.1
X-Http-User-Agent: Mozilla/5.0 (Macintosh; U; PPC Mac OS X 10.5; pl;
	rv:1.9.1.2) Gecko/20090729 Firefox/3.5.2
Subject: Re: Create dir with 700 permissions from recipe
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
X-List-Received-Date: Wed, 19 Aug 2009 12:36:43 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Dnia Wed, 19 Aug 2009 08:58:25 +0200 napisales[as]:

> > 1) never ever in=
stall something into $HOME
=20
> 1) Is there possibly something written w=
hy not to do that?

Not every device has $HOME on same partition as / (fo=
r example most of Zaurus devices). And as those files ends in package what =
will happen if user will change file in $HOME and then package will overwri=
te it with other contents? What with users other then root?

I know that =
in your situation most of those reasons are nothing to worry about but this=
 is why we do not touch anything in $HOME.





