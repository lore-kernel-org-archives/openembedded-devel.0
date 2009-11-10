Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1N7u1h-0002A1-Gy
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Nov 2009 17:57:08 +0100
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1N7u0P-000601-Re
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Nov 2009 16:55:45 +0000
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <philb@gnu.org>) id 1N7u0O-0007Ps-8E
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Nov 2009 16:55:44 +0000
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Nov 2009 16:55:40 +0000
Message-Id: <1257872140.1484.335.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.3 
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: OEDEM 2009 summary: Death to checksums.ini?
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
X-List-Received-Date: Tue, 10 Nov 2009 16:57:09 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

The current checksums.ini arrangement has a number of issues:

 - single monolithic file is a rich source of merge conflicts
 - concrete URIs require many duplicate entries for different mirrors
 - can be annoying for folks using overlays and/or collections
 - storing the checksum separately from the rest of the .bb file makes
cherry-picking harder than it needs to be
 - large amount of churn in checksums.ini can make it hard to spot cases
where checksums were changed rather than just added.

It was proposed that, rather than storing checksums centrally in
checksums.ini, they should be placed in the individual .bb file to which
the checksum relates.  Bitbake already has a certain level of support
for reading checksums from SRC_URI and it would seem natural to try to
make use of that. 

There was some discussion around alternative proposals of storing the
checksums in separate files within the recipes/ directory.  These
proposals didn't seem to offer any real advantage over storing the
checksums within the .bb file (and, importantly, didn't really solve the
issues around recipe copying/merging) so they were not pursued further.

Some concerns were raised around .inc files and other places where
multiple recipes shared a single definition of SRC_URI, but it seems
like these can all be addressed with strategic use of variable
substitutions.

Also, some concerns were raised over the disk space impact of the
lengthened SRC_URIs.  However, the net increase in disk space usage
seems like it will be marginal at worst: many packages will actually
wind up using less space with the new arrangement.

There was a side discussion around providing a separate mechanism for a
site-local cache of checksums, to be used solely for verifying that a
particular source archive has not changed from one build to the next.
This cache would not be checked in anywhere or distributed.  RP noted
that this was the original intent of checksums.ini.  Agreed to park this
for now since it is independent of (though somewhat related to) the
topic of shared checksums.

Conclusions:

- checksums are clearly part of the metadata, it seems like they
naturally belong in the .bb file. 

- there was general acceptance that the checksums belong in SRC_URI.  

Next steps:

- figure out a way to implement sha256sum checking, either by extending
the code in bitbake's fetcher or by providing equivalent functionality
in base.bbclass

- work out a migration strategy: is it feasible to splice the existing
checksums into the SRC_URIs programmatically?  RP thinks yes.  PB
suggests leaving the existing checksums.ini as read-only and switching
to checksums incrementally for new packages.  RP: can make a git hook to
allow deletion from checksums.ini but no other changes.




