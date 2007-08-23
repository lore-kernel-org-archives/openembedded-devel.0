Received: from [64.233.166.176] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <yakov.zaytsev@gmail.com>) id 1IOHfR-0004Yn-5i
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Aug 2007 20:44:29 +0200
Received: by py-out-1112.google.com with SMTP id a25so1199918pyi
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Aug 2007 11:43:16 -0700 (PDT)
Received: by 10.35.44.16 with SMTP id w16mr2444458pyj.1187894596255;
	Thu, 23 Aug 2007 11:43:16 -0700 (PDT)
Received: by 10.35.93.7 with HTTP; Thu, 23 Aug 2007 11:43:16 -0700 (PDT)
Message-ID: <1ef816af0708231143v70b227daga19b961d23cc5bdc@mail.gmail.com>
Date: Thu, 23 Aug 2007 22:43:16 +0400
From: yakov.zaytsev@gmail.com
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <46CD69E3.707@whitby.id.au>
MIME-Version: 1.0
References: <1ef816af0708221151m5c3c2b4ds9b90fdbddc56d8d1@mail.gmail.com>
	<19c1b8a90708221646p6cfd0e6do6574668bbe15d775@mail.gmail.com>
	<1ef816af0708230241s62454f78oa0147b10cae53ce6@mail.gmail.com>
	<46CD69E3.707@whitby.id.au>
X-Content-Filtered-By: Mailman/MimeDel 2.1.9
Subject: Re: binutils-cross_2.17.50.0.5.bb failed
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
X-List-Received-Date: Thu, 23 Aug 2007 18:44:29 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

I've tried to rebuild inside
/Volumes/OE/stuff/build/tmp/work/armv5te-angstrom-linux-gnueabi/binutils-
cross-2.17.50.0.5-r1/binutils-2.17.50.0.5

with this error

make: *** No rule to make target `rebuild-package-binutils-cross'.  Stop.

On 8/23/07, Rod Whitby <rod@whitby.id.au> wrote:
>
> yakov.zaytsev@gmail.com wrote:
> > ..binutils-cross-2.17.50.0.5-r1/temp/log.do_configure.8057 contains
> >
> > --
> >
> /Volumes/OE/stuff/build/tmp/work/armv5te-angstrom-linux-gnueabi/binutils-
> > cross-2.17.50.0.5-r1/temp/run.do_configure.8057: line 782: do_configure:
> > command not found
>
> You've been bitten by the "build crosses midnight GMT" bitbake bug.
>
> Rebuild the affected package using "make rebuild-package-binutils-cross"
> if this occurs.  See Mickey's other email on the subject.


What does "build crosses midnight GMT" mean?!


-- Rod
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

