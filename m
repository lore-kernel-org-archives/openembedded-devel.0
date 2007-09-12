Received: from [209.85.198.191] (helo=rv-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <bernardo@bandos.net>) id 1IVQ60-0006bO-J8
	for openembedded-devel@openembedded.org; Wed, 12 Sep 2007 13:09:25 +0200
Received: by rv-out-0910.google.com with SMTP id k20so160649rvb
	for <openembedded-devel@openembedded.org>;
	Wed, 12 Sep 2007 04:06:13 -0700 (PDT)
Received: by 10.141.18.14 with SMTP id v14mr189053rvi.1189595172602;
	Wed, 12 Sep 2007 04:06:12 -0700 (PDT)
Received: by 10.141.33.13 with HTTP; Wed, 12 Sep 2007 04:06:12 -0700 (PDT)
Message-ID: <3ef3a7ad0709120406r6aa761e7s610cd291880599db@mail.gmail.com>
Date: Wed, 12 Sep 2007 12:06:12 +0100
From: "=?ISO-8859-1?Q?Jos=E9_Bernardo_Bandos_Rodrigues?=" <bernardo@bandos.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <HOECLKEKOHLAMMGDLLBHAENPMDAA.skoroneos@digital-opsis.com>
MIME-Version: 1.0
References: <c384c5ea0709111614m20b079f8l4939336884b844b6@mail.gmail.com>
	<HOECLKEKOHLAMMGDLLBHAENPMDAA.skoroneos@digital-opsis.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.9
Cc: openembedded-devel@openembedded.org
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
X-List-Received-Date: Wed, 12 Sep 2007 11:09:25 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

May I add some noise into this argument? A few years ago I contributed to a
source based linux distro. The way we had around this weren't USE flags - we
had as part of the package description files (what you have in .bb files) a
file that had prompts to be given to the user at package configure time, and
what dependencies changed and what arguments were passed to ./configure as a
result of those prompts. Since this was at package configure time, and that
step would run before everything else, the user would get a bunch of prompts
at the beginning, and the results would be stored for future use. The user
could also specify a option to the package build tool to discard these
stored results and re-ask the prompts. A file with the stored dependencies
would also be updated as a result of this, by the dependency checking code
of the package builder. That file would allow one to examine/reproduce a
particular user configuration, if needed.

2007/9/12, Stelios Koroneos <skoroneos@digital-opsis.com>:
>
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
>
> Stelios S. Koroneos
>
> Digital OPSiS - Embedded Intelligence
> http://www.digital-opsis.com
>
>
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

