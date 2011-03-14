Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philip@balister.org>) id 1PzGBq-0000Ue-4F
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Mar 2011 23:24:38 +0100
Received: (qmail 4163 invoked by uid 1003); 14 Mar 2011 22:22:59 -0000
Received: from unknown (HELO ?192.168.1.167?)
	(philip@opensdr.com@74.107.167.114)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	14 Mar 2011 22:22:58 -0000
Message-ID: <4D7E953E.2000706@balister.org>
Date: Mon, 14 Mar 2011 18:22:54 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.13) Gecko/20101209 Fedora/3.1.7-0.35.b3pre.fc14
	Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4D7E3B34.5050100@mentor.com>
In-Reply-To: <4D7E3B34.5050100@mentor.com>
Subject: Re: Discussion: Version retention policy in oe-core
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
X-List-Received-Date: Mon, 14 Mar 2011 22:24:38 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/14/2011 11:58 AM, Tom Rini wrote:
> Hi all,
>
> The TSC has discussed this item at the request of the community and has
> come up with the following recommendation which we are looking for
> feedback (positive/negative/neutral) before putting this up on the wiki.

Looks reasonable. One thing I did not see is asking people not to add a 
new recipe and delete the old one in separate commits. This makes it 
easier to figure out problems when they arise.

Philip

>
> -------- Original Message --------
> Subject: Re: Discussion: Version retention policy in oe-core
> Date: Thu, 24 Feb 2011 15:05:25 -0600
> From: Mark Hatle <mark.hatle@windriver.com>
> Reply-To: tsc@lists.openembedded.org
> Organization: Wind River Systems
> To: <tsc@lists.openembedded.org>
>
> This is a follow on to Tom's original post. The attempt is to merge his
> original thoughts with my own.
>
> ---
>
> As has been discussed in a few places, there needs to be a policy that
> is followed about how long to retain (or when to replace) old recipes
> within the oe-core repository as well as what to do with older versions
> of things.
>
> It is expected that OE will have a related meta-oe or similar layers
> which older components can be moved into while they are still useful and
> desirable to maintain. However, these will be alternative versions and
> not the "core" version any longer.
>
> Within the oe-core we can divide the components into two classes.
> Critical infrastructure components and standard components. The critical
> components include the toolchain, autotools, and key libraries.
> Virtually everything else fits into the standard components bucket.
>
> We also have use cases such as:
> - Upstream provides provides support (new releases) and clear guidelines
> on upgrading for version 4.0 (current), version 3.8 (previous and
> stable) and version 3.6 (further previous, stable). Upstream is also
> working on version 4.1.x (unstable, active development).
> - Upstream provides no clear policy about what's supported other than
> current.
> - Community standards indicate a specific version should be used rather
> then the latest for some reason
> - An architecture requires specific versions.
>
> We would like to propose the following:
>
> The goal of oe-core is to remain a stable, yet up-to-date set of
> software that forms the foundation of the Open Embedded world. While not
> everyone will be able to agree on a broad definition of "stable, yet
> up-to-date" the following guidelines will help define the rules for the
> inclusion and/or replacement of different versions into the oe-core.
>
> First, each of the packages need to be divided into two categories:
> Critical Infrastructure and Core components. If an item is neither of
> these, then the oe-core is likely the wrong place for the component.
>
> By default we want to use the latest stable version of each component.
> The latest stable version of each component is defined by the
> component's upstream. When there is no clear policy from upstream we
> simply have to apply best judgment.
>
> There of course will be exceptions to the default policy. However, when
> an exception occurs it must be clearly stated and documented when and
> why we did not use the latest stable version -- or why we may have
> multiple versions available of a given component. This will allow us to
> reevaluate the exceptions on a timely basis and decide the exception is
> no longer reasonable.
>
> Most of these exceptions will be located in the critical infrastructure
> components, specifically the toolchains. In many cases we will need to
> support variants of these components either for stability or
> architectural reasons.
>
> Another common exception is to meet specific policy or compatibility
> objectives within the system, such as the need to support both GPLv2 and
> GPLv3 versions of selected components.
>
> If multiple versions are provided, usually the latest stable version
> will be preferred, however best judgment will be used to determine the
> preferred version.
>
> As existing versions of removed, if they are still desirable, they
> should be moved into meta-oe or a suitable layer.
>
> We also have the issue of upcoming development versions it is suggested
> that upcoming development versions of software be worked on in specific
> development layers until they have reach sufficient maturity to be
> considered stable and ready for inclusion in oe-core.
>
> Related to this are:
> - We want to encourage distributions that are tracking the latest to try
> and stay with the latest.
> - We want to encourage recipes which people are interested in to be
> maintained long term to be maintained, long term, in meta-oe.
> - We want to encourage distributions to work with and add to / maintain
> the core rather than deciding we have too frequent of an unhelpful churn
> (which is to say 4.0.1 -> 4.0.2 of $whatever is good, 4.0.1 -> 4.4.3 of
> $whatever is not).
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


