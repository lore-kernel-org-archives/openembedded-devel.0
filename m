Received: from [66.249.82.227] (helo=wx-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <pmiscml@gmail.com>) id 1Hjbif-0005WL-4F
	for openembedded-devel@openembedded.org; Thu, 03 May 2007 15:51:41 +0200
Received: by wx-out-0506.google.com with SMTP id t13so423463wxc
	for <openembedded-devel@openembedded.org>;
	Thu, 03 May 2007 06:42:08 -0700 (PDT)
Received: by 10.90.113.20 with SMTP id l20mr1716679agc.1178199728014;
	Thu, 03 May 2007 06:42:08 -0700 (PDT)
Received: from cube ( [82.193.98.2])
	by mx.google.com with ESMTP id 37sm1805884nzf.2007.05.03.06.42.06;
	Thu, 03 May 2007 06:42:07 -0700 (PDT)
Date: Thu, 3 May 2007 16:42:06 +0300
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Priority: 3 (Normal)
Message-ID: <183568912.20070503164206@gmail.com>
To: Richard Purdie <rpurdie@rpsys.net>
In-Reply-To: <1178198199.6312.30.camel@localhost.localdomain>
References: <35653307.20070503154732@gmail.com>
	<1178198199.6312.30.camel@localhost.localdomain>
MIME-Version: 1.0
Cc: openembedded-devel@openembedded.org
Subject: Re: [ALERT] Security vulnerability with recent OE bitbake.conf changes
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 03 May 2007 13:51:47 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Richard,

Thursday, May 3, 2007, 4:16:39 PM, you wrote:

> On Thu, 2007-05-03 at 15:47 +0300, Paul Sokolovsky wrote:
>> Hello openembedded-devel,
>> 
>> A commit made some time ago,
>> 
>> http://lists.linuxtogo.org/pipermail/openembedded-commits/2007-April/004912.html
>> 
>> introduced a hole which may lead to unnoticed security vulnerabilities
>> slipping into the packages/images produced. Specifically, it defines a
>> random application of a random suite to be used for resolving patching
>> conflicts/failures. If you don't happen to have that random tool,
>> patching failure will be silently swallowed, leading to any adverse
>> effects imaginable - from compile failure to the mentioned security
>> vulnerabilities.


[]

> Is there really any need for this?
> It doesn't encourage me to give a sensible reply, does it...

        Apparently no. But for me, it's pretty clear that even
gnome-terminal shouldn't be used by default, and in expectation of
hardnesses regarding arguing this, I tried to draw picturesquely
absurd "extension", overspiced with few buzzwords. It's of course a
mere small bug otherwise, but I truly looking for solution which won't
by default trouble KDE, other WMs, and classy console guys in favor of
GNOME crowd.


> Patch failure should not be silently swallowed, the builds should abort.
> If they don't, we need to fix that underlying problem.

        Yes, I didn't even bother to ruin my pamphlet with such
down-to-earth triviality ;-). I'd be looking into it as time permits
of course.

> FWIW, your first solution using SHELLRCCMD won't actually work due to
> the way IO redirection is done in recent bitbake. 

> Your second solution of adding the DEPENDS is impractical due to the
> amount of -native packages it would require.

> So we need to find the real problem and fix that, probably somewhere in
> patch.bbclass an error code isn't being propagated at a guess.

> I will also hint at the use of PATCH_RESOLVER = "noop" which means the
> user gets the old behaviour of patch failure aborts the build with no
> help from any resolver. It should have always been the default but
> wasn't. I'm not sure what the current default is but we can change it to
> that if its not.

        Ack, and vote for. Let's have defaults not overloaded with
interactivity, and working along the lines of standard unix/posix
build tools. Frontends, likes one(s) you work on, can have own
config/overrides then. (And few people won't used them anyway, no
matter which potential benefits they give - and not out of
bare-commandline orthodoxy, but because they may have other frontends
relying on classical unix behavior of tools).

> Cheers,

> Richard



-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



