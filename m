Received: from [72.14.220.159] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <philipp.zabel@gmail.com>) id 1JKYBl-0007Lo-4Z
	for openembedded-devel@openembedded.org; Thu, 31 Jan 2008 13:06:41 +0100
Received: by fg-out-1718.google.com with SMTP id e12so585016fga.0
	for <openembedded-devel@openembedded.org>;
	Thu, 31 Jan 2008 04:06:49 -0800 (PST)
Received: by 10.82.134.12 with SMTP id h12mr3609630bud.29.1201781209295;
	Thu, 31 Jan 2008 04:06:49 -0800 (PST)
Received: by 10.82.120.17 with HTTP; Thu, 31 Jan 2008 04:06:49 -0800 (PST)
Message-ID: <74d0deb30801310406p71480902w6907b9e63575e8f0@mail.gmail.com>
Date: Thu, 31 Jan 2008 13:06:49 +0100
From: "pHilipp Zabel" <philipp.zabel@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1201393407.4717.30.camel@localhost.localdomain>
MIME-Version: 1.0
References: <fnchem$8v4$1@ger.gmane.org>
	<200801260151.13034.mickey@vanille-media.de>
	<1201355021.4717.16.camel@localhost.localdomain>
	<1201393407.4717.30.camel@localhost.localdomain>
Cc: openembedded-devel@openembedded.org
Subject: Re: RFC: strip "-native" from $S for native packages automatically (bug 1856)
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
X-List-Received-Date: Thu, 31 Jan 2008 12:06:41 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Jan 27, 2008 1:23 AM, Richard Purdie <rpurdie@rpsys.net> wrote:
> On Sat, 2008-01-26 at 13:43 +0000, Richard Purdie wrote:
> > On Sat, 2008-01-26 at 01:51 +0100, Michael 'Mickey' Lauer wrote:
> > > If we really want to have that (I'm -0 on that), I would rather propose
> > >
> > > S = ${@"%s/%s" % ( bb.data.getVar("WORKDIR", d, 1), bb.data.getVar("P", d, 1).replace( "-native", "" ) ) }
> >
> > Would it be worth adding syntax to bitbake for this kind of operation,
> > something like:
> >
> > S *= "${S}-native"
> >
> > ?
>
> This syntax doesn't solve the original problem of course.
>
> People have requested -= and I've been wondering if we should add that
> as a search and remove operator. To match the existing language that
> would have to work on space delimited lists though so its of no use to
> this use case. We could pair this with a *= or operator which worked the
> same way without the space delimiter like .= does...
>
> S *= "-native"
>
> ?
>
> maybe ~= would be a better pairing with -=?
>
> Having syntax which allowed variable reuse like the original example
> above could also be useful:
>
> S = "foo"
> S *= "${S}-native"
> print bb.data.getVar("S", d, 1)
>     foo-native
>
> Does anyone have any other language enhancement requests for bitbake
> while I'm thinking about it (or any thoughts on the above)?

While you're already busy proposing obscure syntax enhancements :)
What about allowing bashisms/dashisms in the ${...} variable expansion?
We could write
S = "${S%-native}"
or
S = "${S/-native/}"
then.

regards
Philipp


