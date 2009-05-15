Received: from [216.145.245.200] (helo=mx04.dls.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mwester@dls.net>) id 1M4oe3-0000V3-Og
	for openembedded-devel@openembedded.org; Fri, 15 May 2009 06:03:39 +0200
Received: from [209.242.7.134] (helo=[192.168.231.111])
	by mx04.dls.net with esmtpa (Exim 4.69)
	(envelope-from <mwester@dls.net>) id 1M4oXN-0000hU-Ht
	for openembedded-devel@openembedded.org; Thu, 14 May 2009 22:56:45 -0500
Message-ID: <4A0CE800.5040407@dls.net>
Date: Thu, 14 May 2009 22:56:48 -0500
From: "Mike Westerhof (mwester)" <mwester@dls.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.21) Gecko/20090302 Thunderbird/2.0.0.21 Mnenhy/0.7.6.0
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <1242247998-30548-1-git-send-email-clarson@mvista.com>
In-Reply-To: <1242247998-30548-1-git-send-email-clarson@mvista.com>
Subject: Re: [PATCH] bitbake.conf, freeze.inc: Add version lockdown implementation and use it by	default.
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
X-List-Received-Date: Fri, 15 May 2009 04:03:40 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Chris Larson wrote:
> For each recipe which completes a task successfully, this emits the current
> version into ${TMPDIR}/versions.conf as a PREFERRED_VERSION line.
> ${TMPDIR}/versions.conf and conf/versions.conf are automatically included,
> in that order, in subsequent builds, to provide more deterinistic builds by
> default, and to let the user make the lockdown persist via a simple cp
> command...

Excellent! This is much needed as a feature.  The usage model seems to
be a very reasonable one, and would tend to be consistent with what
users sort of expect for a workflow.

I say "sort of expect" because I think they would rather see the
management of the versions.conf file be done by bitbake.  For example,
the "bitbake crystallize" command (to choose a name) might do no build
at all, but just generate, or re-generate, the versions.conf file.  But
that's a trivial point; they'll have to remember to cp or rm
versions.conf as necessary themselves.

The only big concern that I have is that this is really quite a drastic
change in behavior for the "cookbook-type" OE user community out there
(the folks who have memorized a set of procedures to build their distro
images without any real understanding of how it works).  How do we
propose to roll out this change?

-Mike (mwester)


