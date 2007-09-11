Received: from [64.233.166.178] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <leon.woestenberg@gmail.com>) id 1IVEyl-0005pD-3R
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Sep 2007 01:17:11 +0200
Received: by py-out-1112.google.com with SMTP id a25so44732pyi
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Sep 2007 16:14:04 -0700 (PDT)
Received: by 10.35.71.1 with SMTP id y1mr7989108pyk.1189552444675;
	Tue, 11 Sep 2007 16:14:04 -0700 (PDT)
Received: by 10.90.50.8 with HTTP; Tue, 11 Sep 2007 16:14:04 -0700 (PDT)
Message-ID: <c384c5ea0709111614m20b079f8l4939336884b844b6@mail.gmail.com>
Date: Wed, 12 Sep 2007 01:14:04 +0200
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1189545023.6163.57.camel@localhost.localdomain>
MIME-Version: 1.0
References: <200709111318.52432.openembedded@haerwu.biz>
	<c384c5ea0709111037o723dda57x171c148a0f93a91a@mail.gmail.com>
	<46E6EC08.209@student.utwente.nl>
	<1189545023.6163.57.camel@localhost.localdomain>
Subject: Re: USE flags - why they won't work for OE
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
X-List-Received-Date: Tue, 11 Sep 2007 23:17:11 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello Richard,

On 9/11/07, Richard Purdie <rpurdie@rpsys.net> wrote:
> On Tue, 2007-09-11 at 21:27 +0200, Koen Kooi wrote:
> > Leon Woestenberg schreef:
> > > Hello all,
> > >
> >
> > > Maybe a minimal set of USE flags instead of creating -lite or -minimal
> > > .bb is an option?
> > > Or, using an include file that defines configuration variables
> > > (HAVE_GTK, HAVE_X)?
> >
> > Any form of USE flags is *bad* and *unacceptable*. I'll leave it to the other core people
> > to throw around terms like 'deterministic' and 'package space' :)
>
> Agreed. I will try and keep this brief whilst putting something in the
> archives once and for all.
>
Clear. So we use the bitbake recipe namespace to create a diverse set
of packages.

Let's at least come up with a good way of using the namespace:

-lite has been suggested, which I do not prefer (ambiguous, and I
would prefer -light)
-nodbus (if dbus dependency is dropped)

I would prefer using:

-without-x
-without-gtk
-without-dbus
...

as the package suffix, as it re-uses the "configure" options
namespace, well known to most developers.

Also, -minimal comes to mind for a truely minimally configured package.

Regards,
-- 
Leon


