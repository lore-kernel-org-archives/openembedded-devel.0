Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1MdNPE-0002yC-9D
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Aug 2009 14:03:13 +0200
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1MdN8W-0001NN-NM
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Aug 2009 12:45:56 +0100
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <pb@reciva.com>) id 1MdN8T-0003ct-PT
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Aug 2009 12:45:54 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1250591188.3555.5.camel@utx.utx.cz>
References: <1250551346.5083.3@zaurus>  <1250591188.3555.5.camel@utx.utx.cz>
Date: Tue, 18 Aug 2009 12:45:50 +0100
Message-Id: <1250595950.27980.68.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.3 
Subject: Re: xtscal fails + other Xorg init problems.
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
X-List-Received-Date: Tue, 18 Aug 2009 12:03:13 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2009-08-18 at 12:26 +0200, Stanislav Brabec wrote:
> That is why I would like to propose:
> - remove all xcalibrate and xcalibrabrateext recipes
> - find recipes and images that need them and migrate them to
> libxcalibrate and calibrateproto.
> - fix git versioning of libxcalibrate and calibrateproto, maybe
> increment PE.

Yes, that sounds reasonable enough.  I'm not quite sure how we ended up
with these multiple competing recipes for the same thing but clearly
there is no benefit to having them.  The only thing to watch out for
would be the backwards compatibility symlink for the pkgconfig data.

p.




