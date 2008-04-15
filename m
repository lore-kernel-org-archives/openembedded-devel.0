Received: from [64.233.182.187] (helo=nf-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <matthijs.van.de.water@gmail.com>) id 1JlmoF-0006rq-Dl
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Apr 2008 17:10:59 +0200
Received: by nf-out-0910.google.com with SMTP id h3so877139nfh.22
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Apr 2008 08:10:53 -0700 (PDT)
Received: by 10.78.200.20 with SMTP id x20mr5857952huf.55.1208272253281;
	Tue, 15 Apr 2008 08:10:53 -0700 (PDT)
Received: by 10.78.160.9 with HTTP; Tue, 15 Apr 2008 08:10:53 -0700 (PDT)
Message-ID: <35a670560804150810k603d1986t4e02eefa7f411728@mail.gmail.com>
Date: Tue, 15 Apr 2008 17:10:53 +0200
From: "Matthijs van de Water" <matthijs.van.de.water@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <35a670560804140932s53231dcj1adfa6bc21e0353e@mail.gmail.com>
MIME-Version: 1.0
References: <35a670560804100650w7de4cec0gae583d5ae73b8fad@mail.gmail.com>
	<47FE2530.2@gmx.net>
	<35a670560804101007m1d787b4ai97927bb42fcbfe5d@mail.gmail.com>
	<4800DC3B.9080007@gmx.net>
	<35a670560804140932s53231dcj1adfa6bc21e0353e@mail.gmail.com>
Subject: Re: Building ubuntu/gcc-4_2-branch to get GCJ for arm EABI
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
X-List-Received-Date: Tue, 15 Apr 2008 15:10:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Status update: I managed to get everything (also gcc-cross-sdk) to
compile (needed only 1 additional patch and 1GB of extra memory)
I now still need to:
1) Make sure that the relevant GCJ stuff gets packaged (in the current
state it's at least missing the java include files and the
libgcj-4.2.3.jar)
2) Split out all GCJ related stuff to compile in a separate set of
tasks so that it does not always get build, because this takes ages
and loads of memory.

I'm not sure about the best way to get (2)... any suggestions are welcome.

Regards,
Matthijs


