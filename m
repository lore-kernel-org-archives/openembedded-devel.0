Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NmsFn-0008Ff-SE for openembedded-devel@lists.openembedded.org;
	Wed, 03 Mar 2010 18:21:00 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NmsD2-0002qG-GN for openembedded-devel@lists.openembedded.org;
	Wed, 03 Mar 2010 18:18:08 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Mar 2010 18:18:08 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Mar 2010 18:18:08 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 03 Mar 2010 18:17:51 +0100
Message-ID: <hmm5jv$e77$1@dough.gmane.org>
References: <b6ebd0a51003030909u58f72751u19f5b3caab614450@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.8) Gecko/20100223 Shredder/3.0.3pre
In-Reply-To: <b6ebd0a51003030909u58f72751u19f5b3caab614450@mail.gmail.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] Initial Proposal for Packaged Staging Revamp (was [RFC] Make some big changes right after next stable)
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
X-List-Received-Date: Wed, 03 Mar 2010 17:21:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 03-03-10 18:09, Chris Larson wrote:

> To summarize, I propose the creation of an archive/package which acts as the
> primary artifact to come out of the build of a recipe. 

That sounds like a good way to do packaged-staging without making my
head explode :)

[snip]

> While I haven't fully worked out the logistics of the implementation of
> this, I did, in the past, create a prototype of a "private staging areas"
> implementation which also implemented this primary archive as a side effect,
> and utilized it for the prototype.  Does anyone have any thoughts on this,
> ideas for improvement, arguments either for or against a pstage revamp, or
> alternative ideas for a revamp?  I'd love to hear what people think about
> this possibility.

I think the 'private staging' approach is the way to go, it makes the
build determistic instead of "might pick up extras from staging". And I
think it will also cure the mysterious "every python recipe breaks when
some, yet unknown, recipe is built"

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLjpm/MkyGM64RGpERAhjkAKCOyTOeYoGo5RFKTOyrGcIgfAqO1gCeMxhs
r3gKpDutUphnVfdOpMZm8as=
=wRtB
-----END PGP SIGNATURE-----



