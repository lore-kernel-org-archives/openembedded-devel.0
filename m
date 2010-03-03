Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NmsMU-0002dQ-Hu for openembedded-devel@lists.openembedded.org;
	Wed, 03 Mar 2010 18:27:56 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NmsJk-0007gT-NV for openembedded-devel@lists.openembedded.org;
	Wed, 03 Mar 2010 18:25:04 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Mar 2010 18:25:04 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Mar 2010 18:25:04 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 03 Mar 2010 18:20:42 +0100
Message-ID: <hmm5pb$est$1@dough.gmane.org>
References: <1267633819.4739.343.camel@trini-m4400>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.8) Gecko/20100223 Shredder/3.0.3pre
In-Reply-To: <1267633819.4739.343.camel@trini-m4400>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] Make some big changes right after next stable
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
X-List-Received-Date: Wed, 03 Mar 2010 17:27:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 03-03-10 17:30, Tom Rini wrote:
> Hey all,
> 
> I'd like to see some comments on the following idea.
> 
> As many people know, there's a lot of "odd" internal things that OE
> does, that if we had it to do over, we would do differently.  What I
> would like to propose is that in time for the next stable branch we:
> 1: Define a set of DISTROs/MACHINEs/build targets that need to stay
> working
> 2: In a separate branch (per big change), get one of these big, going to
> leave some stuff broken changes
> 3: Define / document what needs to be done before these branches can be
> merged back (something like #1 is working still, and if applicable a
> guide to the common problems/how to fix people are going to run into).
> 
> What I'm getting at is that this would let us do things like rework the
> "this is where we place things that we build other recipes with" concept
> so that sysroot just works (and otherwise makes more sense again).  Or
> "let us have more consistency in build with compared to what could end
> up on device".  And so on.
> 
> What do people think?  And what would people work on?

I don't think we need to wait for a next stable to happen. I personally
think a new stable branch can only happen after all legacy staging has
been eradicated. And when people not using the stable branches stop
spreading FUD about them.

regards,

Koen

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLjppqMkyGM64RGpERAhAgAJ4svJi623kKEml/uUI0/s6uuOWmFQCgthSW
pCImVyjJ3TI5BSQAiZWS9Zw=
=gO4h
-----END PGP SIGNATURE-----



