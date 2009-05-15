Received: from [71.6.201.124] (helo=easi.embeddedalley.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <trini@embeddedalley.com>) id 1M4zyR-0005kP-Mb
	for openembedded-devel@openembedded.org; Fri, 15 May 2009 18:09:32 +0200
Received: (qmail 24167 invoked from network); 15 May 2009 16:02:29 -0000
Received: from easi.embeddedalley.com (HELO localhost) (easi@71.6.201.124)
	by easi.embeddedalley.com with SMTP; 15 May 2009 09:02:29 -0700
Date: Fri, 15 May 2009 09:02:29 -0700
From: Tom Rini <trini@embeddedalley.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090515160229.GV7973@smtp.west.cox.net>
References: <1242247998-30548-1-git-send-email-clarson@mvista.com>
	<4A0CE800.5040407@dls.net>
	<b6ebd0a50905150808s16773addp27a1f06a6476e12f@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <b6ebd0a50905150808s16773addp27a1f06a6476e12f@mail.gmail.com>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [PATCH] bitbake.conf, freeze.inc: Add version lockdown	implementation and use it by default.
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
X-List-Received-Date: Fri, 15 May 2009 16:09:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 15, 2009 at 08:08:29AM -0700, Chris Larson wrote:
[snip]
> It does change behavior, but only within the context of a single tmp
> directory existance.  I doubt anyone in particular relies on their
> build suddenly switching to a newer version of something when the
> newer version shows up in the repository, but perhaps they do.  I

People with buildbots (hrw, myself, I'm sure others) do, for our
incremental builds.  But of course, the reason for incremental builds is
the behavior that this would change.

-- 
Tom Rini


