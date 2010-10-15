Received: from mail.reciva.com ([62.7.80.110] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1P6n4k-0006Rc-GA
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Oct 2010 18:24:11 +0200
Received: from [192.168.106.10] (helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1P6n4D-0008Rg-Nz
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Oct 2010 17:23:37 +0100
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <philb@gnu.org>) id 1P6n4D-000736-H2
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Oct 2010 17:23:37 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 15 Oct 2010 17:23:37 +0100
Message-ID: <1287159817.3770.582.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.1.2 
X-Broken-Reverse-DNS: no host name found for IP address 192.168.106.10
X-SA-Exim-Connect-IP: 62.7.80.110
X-SA-Exim-Mail-From: philb@gnu.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=AWL,BAYES_00,SPF_SOFTFAIL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: TSC minutes for 20101007
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
X-List-Received-Date: Fri, 15 Oct 2010 16:24:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

TSC Meeting of 20101007T1500

Present: Richard, Chris, Holger, Phil

1. OEDEM

Richard reports Intel have everything under control.  No action needed
except to announce the venue (same as ELC-E) and solicit items for the
agenda (see wiki page Oedem/2010).

2. Revert policy

Frans Meulenbroeks requested the TSC to consider whether a particular
reversion commit (which was pushed without review despite changing
"core" files) was in breach of the agreed policies. 

Although the commit policy calls for changes to core files to be
reviewed, the existing revert policy does state specifically that
reverting one's own changes is permitted without further review.  There
is some ambiguity over whether the general requirement in the commit
policy for changes to "core components" to have review still applies to
the specific case of reversions, or whether this general requirement is
overridden by the specific guidance in the revert policy.

The TSC is of the opinion that, although the interaction between the
policies could be more clearly spelled out, the intended effect is that
one should always be able to revert one's own changes without further
review.  Consequently, the TSC considers that the commit in question was
legitimate and did not breach the policies.  Holger will write to Frans
and inform him of this decision. 

3. MAINTAINER(S)

Frans Meulenbroeks requested the TSC to consider whether the MAINTAINER
field in recipes should be revived, on the grounds that the existing
MAINTAINERS text file is not performing well and many recipes/distros
appear to be orphaned.

The TSC considers that the MAINTAINER field has not been a success in
the past and there is no evidence that it will work better this time.
The TSC also feels that, since MAINTAINER is included in output
packages, it would be best left to individual DISTROs to decide how (if
at all) they wish to set that variable.

However, the TSC acknowledges that the existing MAINTAINERS file is
indeed stale and of questionable value.  Accordingly, the TSC proposes
to start with a fresh copy of the file and invite active maintainers to
migrate their entries from the old one.

4. Speed of removal

Richard noted that he feels the pace of removal has been too slow.

Chris noted that the pace of development has been too slow in general,
and that removals are just one part of this.

5. Future meetings

Phil suggested that it might be useful to hold TSC meetings more often
than the current once per month.  It was agreed that we will now hold
meetings every 2 weeks (next to be on Oct 21) and see if that works out
better.

Holger noted that, since he is now living in Europe, he would no longer
object to the meetings being held later in the day.  Absent any desire
for change from other members, however, it was agreed to leave the
meeting time unchanged at 15:00 UTC.

Meeting closed 16:16.





