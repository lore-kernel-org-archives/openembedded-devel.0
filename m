Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.67)
	(envelope-from <tobias.pflug@gmx.net>) id 1ItPiL-0003ju-Tt
	for openembedded-devel@lists.openembedded.org;
	Sat, 17 Nov 2007 16:36:10 +0100
Received: (qmail invoked by alias); 17 Nov 2007 15:34:18 -0000
Received: from p549A9BD3.dip0.t-ipconnect.de (EHLO [192.168.1.100])
	[84.154.155.211]
	by mail.gmx.net (mp034) with SMTP; 17 Nov 2007 16:34:18 +0100
X-Authenticated: #283898
X-Provags-ID: V01U2FsdGVkX1/7rNNDoc37MAVkZWuG9J/QiD9v7FPEn4wHiUvNa5
	Ir3xalBeUDwaLi
From: Tobias Pflug <tobias.pflug@gmx.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <b6ebd0a50711161410m1e6ea2ddq60b7c3c942a3c736@mail.gmail.com>
References: <1195158580.6376.328.camel@toontown>
	<b6ebd0a50711161410m1e6ea2ddq60b7c3c942a3c736@mail.gmail.com>
Date: Sat, 17 Nov 2007 16:36:11 +0100
Message-Id: <1195313771.6376.335.camel@toontown>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.0 
X-Y-GMX-Trusted: 0
Subject: Re: altering cflags for autotools
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
X-List-Received-Date: Sat, 17 Nov 2007 15:36:10 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit


On Fri, 2007-11-16 at 15:10 -0700, Chris Larson wrote:
> On Nov 15, 2007 1:29 PM, Tobias Pflug <tobias.pflug@gmx.net> wrote:
> > hi..
> >
> > today i've been trying to package mod_python but had some difficulties
> > because ${STAGING_INCDIR} was not included in the path thus
> > mod_include.h (staged from the apache2 package) could not be found ->
> > can't compile mod_python.
> >
> > Changing CFLAGS or EXTRA_CFLAGS has no effect. Looking at the autotools
> > class that is no surprise because it doesn't seem to be read anywhere.
> > How can I fix this? Do I have to patch the configure.in file ?
> 
> It doesn't need to be read anywhere.  It's exported, and autoconf uses
> the environment CFLAGS by default.

Alright.. I was being silly. The problem is that I need to overwrite
the values used by apxs which is used for building ..

Still, thanks for your clarification



