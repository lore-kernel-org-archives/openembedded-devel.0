Received: from mail.reciva.com ([82.71.203.194] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1NmPH3-0002Dh-2J
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Mar 2010 11:24:22 +0100
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1NmPEI-0006wJ-Jc
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Mar 2010 10:21:30 +0000
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <philb@gnu.org>) id 1NmPEI-0004cO-58
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Mar 2010 10:21:30 +0000
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1267497275.4739.292.camel@trini-m4400>
References: <1267497275.4739.292.camel@trini-m4400>
Date: Tue, 02 Mar 2010 10:21:26 +0000
Message-ID: <1267525286.14566.774.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.2 
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,SPF_SOFTFAIL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] Add eglibc-pic, resync eglibc-dev with glibc
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
X-List-Received-Date: Tue, 02 Mar 2010 10:24:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2010-03-01 at 19:34 -0700, Tom Rini wrote:
> eglibc-package.bbclass: Add eglibc-pic, resync eglibc-dev with glibc
> 
> Resync what goes into eglibc-dev based on what we have in glibc-dev.
> This includes zoneinfo and picking up the reset of the static libraries
> (many are missed otherwise and static linking in SDKs fails).  We add in
> a eglibc-pic package to catch all of the pic stuff (some of which would
> otherwise be caught in -dev).

It is a bit of a shame that eglibc doesn't reuse more of the glibc
packaging logic, as opposed to having its own copies of everything.  I
wonder if there is a way that this could be improved.

p.




