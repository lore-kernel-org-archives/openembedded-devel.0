Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stefan@datenfreihafen.org>) id 1Q9Eq6-0007jO-Oq
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Apr 2011 12:59:26 +0200
Received: from [2001:638:602:1183:fc72:82ea:fd94:eb19] (helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.69 #1)
	id 1Q9Enx-0005Gc-Ol by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Apr 2011 12:57:15 +0200
Received: from stefan by excalibur.local with local (Exim 4.75)
	(envelope-from <stefan@excalibur.local>) id 1Q9Enw-00035K-Rk
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Apr 2011 12:57:12 +0200
Date: Mon, 11 Apr 2011 12:57:12 +0200
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110411105712.GA5626@excalibur.local>
References: <1302456441-3417-1-git-send-email-anders@chargestorm.se>
	<20110411080125.GB28101@jama.jama.net>
	<1217FED4-A7EC-4603-9CD7-19BEA0827E96@chargestorm.se>
MIME-Version: 1.0
In-Reply-To: <1217FED4-A7EC-4603-9CD7-19BEA0827E96@chargestorm.se>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,NO_RELAYS
	autolearn=ham version=3.2.5
Subject: Re: [PATCH v2] lowpan-tools_0.2.2; : fix build with static libnl1
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
X-List-Received-Date: Mon, 11 Apr 2011 10:59:26 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Mon, 2011-04-11 at 11:08, Anders Darander wrote:
> 
> 
> On 11 apr 2011, at 10:02, "Martin Jansa" <martin.jansa@gmail.com> wrote:
> 
> > On Sun, Apr 10, 2011 at 07:27:21PM +0200, Anders Darander wrote:
> >> * add NL_CFLAGS to a few Makefiles.am
> > 
> > look like adding -D_GNU_SOURCE not $(NL_CFLAGS) except iplink/Makefile.am 
> > and lib/Makefile.am, why was -D_GNU_SOURCE needed?
> 
> Hm, I should probably update that patch description to reflect that NL_CFLAGS is only added on a couple of places, while _GNU_SOURCE is added on a few more places.
> 
> -D_GNU_SOURCE was added as otherwise a struct, ucred if I remember correctly, was undefined. (I don't currently have access to that computer.)
> 
> > and lowpan-tools_0.2.2.bb gets PR bump from INC_PR, no need to bump .1
> > too.
> 
> Ok, I bumped PR in lowpan-tools_0.2.2.bb as I modified that file also...
> 
> > but otherwise looks ok (I haven't tested it - never used lowpan-tools).
> > 
> 
> I'll try to make a somewhat better explanation in the included patch during the evening, and I can also remove the PR bump before submitting a third revision of the patch. Hopefully I can find some time this evening.

Thanks for this. I will test your patch and push it out after this.

While I still want to get lowpan-tools fixed for libnl2 I think this
is a good solution for the current releases.

regards
Stefan Schmidt


