Received: from [64.233.166.180] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <leon.woestenberg@gmail.com>) id 1IVQik-0002zr-93
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Sep 2007 13:49:26 +0200
Received: by py-out-1112.google.com with SMTP id a25so392891pyi
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Sep 2007 04:46:17 -0700 (PDT)
Received: by 10.35.75.15 with SMTP id c15mr8696836pyl.1189597577058;
	Wed, 12 Sep 2007 04:46:17 -0700 (PDT)
Received: by 10.90.50.8 with HTTP; Wed, 12 Sep 2007 04:46:16 -0700 (PDT)
Message-ID: <c384c5ea0709120446p69d21876x5c2c63995222819@mail.gmail.com>
Date: Wed, 12 Sep 2007 13:46:16 +0200
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <HOECLKEKOHLAMMGDLLBHAENPMDAA.skoroneos@digital-opsis.com>
MIME-Version: 1.0
References: <c384c5ea0709111614m20b079f8l4939336884b844b6@mail.gmail.com>
	<HOECLKEKOHLAMMGDLLBHAENPMDAA.skoroneos@digital-opsis.com>
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
X-List-Received-Date: Wed, 12 Sep 2007 11:49:26 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello all,

On 9/12/07, Stelios Koroneos <skoroneos@digital-opsis.com> wrote:
> > Let's at least come up with a good way of using the namespace:
> >
> > -lite has been suggested, which I do not prefer (ambiguous, and I
> > would prefer -light)
> > -nodbus (if dbus dependency is dropped)
> >
> > I would prefer using:
> >
> > -without-x
> > -without-gtk
> > -without-dbus
> > ...
> >
> > as the package suffix, as it re-uses the "configure" options
> > namespace, well known to most developers.
>
> Both comments are correct, but what happens in the case we have a package
> with multiple -without-xyz ?
>
That's exactly why I think the configuration namespace should not be
performed in the package naming.

Although it might work for only a limited number of configuration
items (no X, not GTK, no sound, ...) it quickly becomes hairy.

However, we could start this way, and tidy later.

It seems to be the way of least resistance at this point.

I will commit whatever I think is useful to others. I am sure at some
point someone will stand up and disagree with me then :-)

Regards,

Leon.


