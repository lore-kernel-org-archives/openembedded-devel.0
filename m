Received: from mail.reciva.com ([82.71.203.194] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1NSyyR-0001tP-Nl
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Jan 2010 21:28:54 +0100
Received: from 89-168-180-155.dynamic.dsl.as9105.com ([89.168.180.155]
	helo=[192.168.2.155])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1NSywR-00037k-7x
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Jan 2010 20:26:47 +0000
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <c384c5ea1001071148h770db2a7p10f6a7b51582fea5@mail.gmail.com>
References: <hi5b61$f7h$1@ger.gmane.org>
	<1262892164.2553.230.camel@lenovo.internal.reciva.com>
	<c384c5ea1001071148h770db2a7p10f6a7b51582fea5@mail.gmail.com>
Date: Thu, 07 Jan 2010 20:26:43 +0000
Message-ID: <1262896003.2553.266.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: RFC: Bump default version for gtk+ to 2.18.3
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
X-List-Received-Date: Thu, 07 Jan 2010 20:28:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2010-01-07 at 20:48 +0100, Leon Woestenberg wrote:
> What should that responsibility involve?
> 
> I usually "test" on one or two machines but still set a DEFAULT_PREFERENCE "-1".
> 
> It's very hard for the committer to collect enough testing evidence
> for all the use cases / variables.

It seems fairly clear that no individual committer is going to be able
to test all the possible permutations for even moderately complicated
packages.  If we require exhaustive testing before anything can land in
the tree then development will just grind to a halt.  And, as I
mentioned in my previous email, the primary responsibility for
integration lies with the DISTRO maintainers, who can use tools like
PREFERRED_VERSION to limit the amount of unexpected churn in their
configurations.

It's probably a job for the TSC to come up with a definitive policy in
this area.  But, for myself, I would consider someone checking in a new
version to have discharged their duties in a responsible manner if:

 - the new version has the same, or at least an equivalent, default
configuration as the old one (i.e. no gratuitous changes to EXTRA_OECONF
or the like); and

 - all the patches that were applied to the old version are either still
applied to the new version, or have been established to be unnecessary;
and

 - the new package has been successfully compiled, and ideally tested,
in at least one configuration; and

 - once we have a functioning waterfall view in tinderbox, the checkin
doesn't cause any of our primary MACHINE/DISTRO combinations to burst
into flames

I guess the key thing is not to make committers feel that they will be
held to account for things that are outside their realistic control
(i.e. bugs that have been introduced upstream in the new version), while
still expecting them to take reasonable steps to avoid introducing
unnecessary breakage.

Automatically adding new versions with a negative DEFAULT_PREFERENCE
doesn't scale: if everybody did this then, eventually, we would end up
with virtually the whole tree being D_P -1.  And it sends a confusing
message to other users, since people tend to assume that a recipe with a
negative D_P is broken or harmful in some way rather than merely
untested or untrusted.  I would also propose that, in future, any
setting of DEFAULT_PREFERENCE in a recipe must be accompanied by a
comment explaining why it was set, and (if it is set negatively) under
what conditions it can or should be removed.

p.




