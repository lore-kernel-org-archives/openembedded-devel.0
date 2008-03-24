Received: from [195.170.0.77] (helo=kane.otenet.gr ident=OTEnet-mail-system)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <skoroneos@digital-opsis.com>) id 1JdhXV-0004Bt-Jq
	for openembedded-devel@openembedded.org; Mon, 24 Mar 2008 08:56:17 +0100
Received: from dias (athedsl-105864.home.otenet.gr [87.203.53.38])
	by kane.otenet.gr (8.13.8/8.13.8/Debian-3) with ESMTP id m2O7uGqX031929
	for <openembedded-devel@openembedded.org>;
	Mon, 24 Mar 2008 09:56:16 +0200
Message-Id: <200803240756.m2O7uGqX031929@kane.otenet.gr>
From: "Stelios Koroneos" <skoroneos@digital-opsis.com>
To: <openembedded-devel@openembedded.org>
Date: Mon, 24 Mar 2008 09:55:49 +0200
MIME-Version: 1.0
X-Mailer: Microsoft Office Outlook, Build 11.0.5510
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2900.3198
Thread-Index: AciNaT+1wn9vf4VCQQqHZutFb/G0RwAFbkYg
In-Reply-To: <47E72E65.3030609@dls.net>
Subject: Re: [RFC] move to opkg
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
X-List-Received-Date: Mon, 24 Mar 2008 07:56:17 -0000
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: 7bit

I though a lot whether I should send this email or not and at the end come
up to the conclusion that its better to speak up although I run the risk of
having crowds with pitchforks coming after me :)

Recently I have been working on a part of a project that does not include OE
related development but tried to keep up with what is going on with OE
although not doing any active development, but that allowed me to have a
different perspective on things.

The problem I see is that .dev is turning into .experimental where all kind
of "infrastracture" changes get done with little or no afterthough
I do understand that .dev is just that, a development branch, and so
breakage is expected to happen, but I think recently we are having more days
with .dev in breakage than in a "working" state.

The main reason is that people simply don't use the SCM we have for the
reason we have it.
SCM's exists so,among other things, branches can be made, where experimental
code and "disruptive" changes can exists,without interfearing with the
actual development. 
Then one day these changes can either get merged to the main branch or
cherry pick what ever we want, after things get tested on the branch and
major issues are solved.
I know that the obvious answer to this, is "mtn sucks, we need <put your
favorite scm here>" but I strongly believe it's a matter of workflow and not
tools.
(for the record we use svn internally and mtn was an additional "pain" we
had to go over to use OE)
I've been with OE for the something like 3 years now and I have never seen
any developer create a branch to test big changes (with the exception of the
avr32 work I did with Koen, which by the way had almost 0 infrastracture
changes ) and things simply get "imported" into .dev after a (usually sort)
RFC "period".

The other major issue I see more and more and I am sure we will face more in
the future, is that a lot of these infrastracture changes are coming from
companies that are using OE and are trying to "sync" OE with their
developments than the other way around.
I am not saying this is a bad thing, but I am just wondering what would
happen if for example one of choices they made for their OE based distro was
"not compatible" with the rest distro's or what would happen if the 2 major
commercial entities that use OE now decided to take a totally different
approach on a matter.

Change is a good thing (and that goes for opkg also) but as OE grows larger
we will face these issues more and more, so we better come up with a
solution before things get out of control.

And for closing this, let me clarify that I REALLY don't reffer to any
developer(s) in particular or even the recent opkg issue but it's my view of
what is going on.


Stelios S. Koroneos

Digital OPSiS - Embedded Intelligence
http://www.digital-opsis.com
 





