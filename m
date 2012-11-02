Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1TUJdB-0008VF-LD
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Nov 2012 16:58:01 +0100
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.6])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1TUJPy-0005m1-JU; Fri, 02 Nov 2012 16:44:22 +0100
Message-ID: <1351871056.4358.109.camel@x121e.pbcl.net>
From: Phil Blundell <philb@gnu.org>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Date: Fri, 02 Nov 2012 15:44:16 +0000
In-Reply-To: <2240810.9tyY23JxNH@helios>
References: <1351009220-30119-1-git-send-email-morgan.little@windriver.com>
	<1363930.E51Pa0kBDd@helios> <20121101173240.GV4673@windriver.com>
	<2240810.9tyY23JxNH@helios>
X-Mailer: Evolution 3.4.4-1 
Mime-Version: 1.0
Cc: "Little, Morgan" <Morgan.Little@windriver.com>,
	openembedded-devel@lists.openembedded.org,
	Joe MacDonald <Joe.MacDonald@windriver.com>
Subject: Re: [meta-oe][meta-networking][PATCH V2 3/3] ntp: Clean up recipes
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
X-List-Received-Date: Fri, 02 Nov 2012 15:58:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-11-02 at 09:59 +0000, Paul Eggleton wrote:
> I'm not sure that it does. I think the split was made just to avoid bringing
> in OpenSSL on systems where it was not needed or desired. Phil Blundell (on 
> CC) made the split quite a while ago in OE-Classic - Phil can you comment?

Yes, exactly.  If ntpdate is the only thing on the system that's linked
with openssl then it ends up dragging in several times its own weight in
dependencies.  And, for most people, having SSL-secured time is not that
much of a priority since the time server is typically on a trusted local
network.

p.





