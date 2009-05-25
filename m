Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1M8XQ3-0006Cw-TW
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 May 2009 12:28:36 +0200
Received: from 88-109-34-80.dynamic.dsl.as9105.com ([88.109.34.80]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1M8XID-0008VE-J9
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 May 2009 11:20:30 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <fce2a370905250207g211af74fg29c1f0cd2593a4ae@mail.gmail.com>
References: <fce2a370905250207g211af74fg29c1f0cd2593a4ae@mail.gmail.com>
Date: Mon, 25 May 2009 11:20:22 +0100
Message-Id: <1243246822.4869.19.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: [RFC] gnome.bbclass change broke lots of package	dependencies
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
X-List-Received-Date: Mon, 25 May 2009 10:28:37 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2009-05-25 at 12:07 +0300, Ihar Hrachyshka wrote:
> @@ -17,6 +17,9 @@ inherit autotools gtk-icon-cache pkgconfig gconf mime
> 
>  AUTOTOOLS_STAGE_PKGCONFIG = "1"
> 
> +PACKAGES =+ "${PN}-scrollkeeper-leftovers"
> +FILES_${PN}-scrollkeeper-leftovers = "${localstatedir}/lib/scrollkeeper"
> +
>  gnome_stage_includes() {
>         autotools_stage_includes
>  }
> 
> As we can see, there is now ${PN}-scrollkeeper-leftovers package for
> every recipe that inherited gnome.bbclass. And this -leftovers package
> is in the current dependency chains (at least for qt4-embedded-dev
> package).

Where is your dependency on -scrollkeeper-leftovers coming from?
Nothing in the patch that you quoted looks like it ought to be causing
that.

That said, the patch does look a bit bizarre: as a general rule we don't
package things from ${localstatedir} since lots of targets have that as
a ramdisk.  It isn't obvious to me what this is going to achieve.

> As for the 1st problem, I suggest adding ALLOW_EMPTY = "1" to
> gnome.bbclass (it works for my current setup, and if you will approve
> the change then I'll send the patch immediately).

No, this would be a poor solution since it will cause a mass of empty
(and hence useless) packages to be generated.  It would be better to
identify the place where the dependency on this package is generated,
and suppress that at its source if the package is empty.

> As for the 2nd problem, there is a big question what should we do.
> Revision bumping for every recipe that inherits gnome.bbclass is not
> an elegant thing (though it will really push the change for all the
> users). Maybe there is another, better way to handle such tasks. If
> you know it please provide me with the info.

The right answer to this probably depends on the answer to what the
patch was trying to accomplish in the first place.  It's possible that
no rebuild is actually necessary for already-deployed packages if this
is intended to deal with some fringe case that only occurs on particular
targets or under rare circumstances.

p.




