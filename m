Received: from [71.6.201.124] (helo=easi.embeddedalley.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <trini@embeddedalley.com>) id 1MWuX4-0006vH-Ei
	for openembedded-devel@openembedded.org; Fri, 31 Jul 2009 18:00:34 +0200
Received: (qmail 10016 invoked from network); 31 Jul 2009 15:45:26 -0000
Received: from easi.embeddedalley.com (HELO localhost) (easi@71.6.201.124)
	by easi.embeddedalley.com with SMTP; 31 Jul 2009 08:45:26 -0700
Date: Fri, 31 Jul 2009 08:45:25 -0700
From: Tom Rini <trini@embeddedalley.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090731154525.GL25691@smtp.west.cox.net>
References: <1248989671.3629.1358.camel@conroy-linux>
	<b6ebd0a50907301516i2ba54f1cif687e5b76f675862@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <b6ebd0a50907301516i2ba54f1cif687e5b76f675862@mail.gmail.com>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: Packaged-staging and RPATH with native/cross/sdk
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
X-List-Received-Date: Fri, 31 Jul 2009 16:00:35 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 30, 2009 at 03:16:58PM -0700, Chris Larson wrote:

> I've been using a $ORIGIN rpath in my builds, and it's definitely a
> step in the right direction.  Iirc there are a few quirks with things
> like perl modules and such, but you can work around those.
> 
> There are a lot of relocation issues with stuff we stage that need to
> be fixed one by one to use those particular staging packages with tmp
> in a different location, though.  Sadly, few upstream packages are
> really relocatable.  Some of it can be worked around by exporting env
> vars.. for example, you can point 'file' at its data with an env var,
> and you can override nearly all the paths used in autoconf/automake
> via env vars (the autotools branch i started work on does that).

Perhaps we need to whitelist some cross/native/sdk packages?  What
people really notice is building gcc a few times, and that stuff is
relocatible (and if these aren't, it's a recipe bug).  Might be a few
others too, but just not rebuilding gcc will be noticed.

-- 
Tom Rini


