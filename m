Received: from [64.233.166.178] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <mwhoosier@gmail.com>) id 1IlaBF-0006od-C6
	for openembedded-devel@lists.openembedded.org;
	Sat, 27 Oct 2007 03:09:37 +0200
Received: by py-out-1112.google.com with SMTP id a25so2023495pyi
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Oct 2007 18:02:06 -0700 (PDT)
Received: by 10.35.49.4 with SMTP id b4mr4061671pyk.1193445338827;
	Fri, 26 Oct 2007 17:35:38 -0700 (PDT)
Received: by 10.35.15.5 with HTTP; Fri, 26 Oct 2007 17:35:38 -0700 (PDT)
Message-ID: <d543f5920710261735i273ddba4v48be826753c8b341@mail.gmail.com>
Date: Fri, 26 Oct 2007 19:35:38 -0500
From: "Matt Hoosier" <matt.hoosier@gmail.com>
Sender: mwhoosier@gmail.com
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1193436953.6177.117.camel@localhost.localdomain>
MIME-Version: 1.0
References: <d543f5920710260628m752ebe95qb0e874df43f46cf8@mail.gmail.com>
	<1193436953.6177.117.camel@localhost.localdomain>
X-Google-Sender-Auth: 5558621b64510222
Cc: openembedded-devel@openembedded.org
Subject: Re: GLIBC_BROKEN_LOCALES
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
X-List-Received-Date: Sat, 27 Oct 2007 01:09:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 10/26/07, Richard Purdie <rpurdie@rpsys.net> wrote:
> On Fri, 2007-10-26 at 08:28 -0500, Matt Hoosier wrote:
> > I happened to run afoul of this when trying to build an image for a
> > product that contains tr_TR as one of its localizations.
> >
> > What sort of misbehavior does a locale have to engage in before being
> > banished to this list? I looked at the patches for whichever Ubuntu
> > release also uses glibc-2.5, and can't find any evidence that they do
> > anything to fix the tr_TR localedata in glibc before compiling. Nor do
> > they, as best I can tell, blacklist it the way that OE does.
>
> Usually its failed to build a binary locale under qemu for one or more
> OE devs. I doubt its been investigated more than that. If it does build,
> let us know and we'll probably remove it from the blacklist.

Seems okay for me. I've been building with binary locale generation
enabled. It it matters (since you mentioned qemu), my machine
configuration is targeting xscale.


