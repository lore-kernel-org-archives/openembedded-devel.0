Received: from [66.249.92.172] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <andrew.paulsen@gmail.com>) id 1HEWpx-00011E-2g
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Feb 2007 21:22:45 +0100
Received: by ug-out-1314.google.com with SMTP id e2so1666383ugf
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Feb 2007 12:22:44 -0800 (PST)
Received: by 10.78.136.9 with SMTP id j9mr1915884hud.1170793363585;
	Tue, 06 Feb 2007 12:22:43 -0800 (PST)
Received: by 10.78.159.2 with HTTP; Tue, 6 Feb 2007 12:22:43 -0800 (PST)
Message-ID: <d46153c40702061222r3567dcecr2f1166ec6ac17128@mail.gmail.com>
Date: Tue, 6 Feb 2007 14:22:43 -0600
From: "Andrew Paulsen" <andrew.paulsen@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <45C8B9C8.3010706@dominion.kabel.utwente.nl>
MIME-Version: 1.0
References: <d46153c40702060903l5dab58b4ha7a237730d51da66@mail.gmail.com>
	<45C8B9C8.3010706@dominion.kabel.utwente.nl>
Subject: Re: GNU Classpath, gconf-dbus inconsistency
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
X-List-Received-Date: Tue, 06 Feb 2007 20:22:45 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 2/6/07, Koen Kooi <koen@dominion.kabel.utwente.nl> wrote:
> Andrew Paulsen schreef:
> > Which is somewhat interesting since
> > $ bitbake gconf -crebuild
> > ...
> > NOTE: package gconf-dbus-2.10.0+svn20060719: started
> > ...
> > NOTE: package gconf-dbus-2.10.0+svn20060719: completed
> >
> > Which actually builds version 2.6.4.14, not 2.10 as the recipe
> > suggests.  I don't know if there is a reason for this or how to fix
> > this if it is a bug, so I submitted bug 1851.
>
> Right, I made that (somewhat stupid) change to work around a bitbake bug a while back. I
> have tried to find a newer gconf-dbus, but I can't seem to find it. Any hints on that?

Unfortunately, no.  The latest version I see on http://svn.gnome.org/
is 23 months old.  Apparently it never caught on.  Any ideas on
satisfying Classpath's (gconf >= 2.11.2) requirement?

Andrew


