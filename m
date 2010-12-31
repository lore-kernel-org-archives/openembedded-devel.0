Received: from zmta01.irigo.dk ([193.200.44.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eha@doredevelopment.dk>) id 1PYfue-0003Fu-MF
	for openembedded-devel@lists.openembedded.org;
	Fri, 31 Dec 2010 15:25:00 +0100
Received: from localhost (localhost.localdomain [127.0.0.1])
	by zmta01.irigo.dk (Postfix) with ESMTP id 70FA622B485E;
	Fri, 31 Dec 2010 15:24:42 +0100 (CET)
X-Virus-Scanned: amavisd-new at zmta01.irigo.dk
Received: from zmta01.irigo.dk ([127.0.0.1])
	by localhost (zmta01.irigo.dk [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y78tLpfmqvgX; Fri, 31 Dec 2010 15:24:37 +0100 (CET)
Received: from [192.168.1.20] (0x55532124.adsl.cybercity.dk [85.83.33.36])
	by zmta01.irigo.dk (Postfix) with ESMTP id 5A84927B1D06;
	Fri, 31 Dec 2010 15:24:37 +0100 (CET)
From: Esben Haabendal <eha@doredevelopment.dk>
To: bitbake-dev <bitbake-dev@lists.berlios.de>
In-Reply-To: <1293763348.17519.11220.camel@rex>
References: <1293763348.17519.11220.camel@rex>
Organization: =?ISO-8859-1?Q?Dor=E9Development?= ApS
Date: Fri, 31 Dec 2010 15:24:34 +0100
Message-ID: <1293805474.18787.366.camel@eha>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Bitbake Architecture, Roadmap, Maintainers and the future
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
X-List-Received-Date: Fri, 31 Dec 2010 14:25:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi

On Fri, 2010-12-31 at 02:42 +0000, Richard Purdie wrote:

> There are a bunch of people who can commit to bitbake, some inactive,
> some active in different areas with different priorities. I think mine
> are clear above, I'd appreciate others to make their objectives clear so
> everyone understand people's positions and what people plan and don't
> plan to do.

While I do not and cannot be considered a maintainer in any form, I do
have a special use for BitBake.  I use an (almost) upstream BitBake as
part of the OE-lite project, and as such has rather strong investment in
BitBake.

I do not use BitBake as a command, but as a Python module, as OE-lite
has a different dependency and runqueue/cooker model.  Because of this I
hope to find some time improve the separation between the parser, data
and cooker in BitBake, but I will surely notice and have to do something
about it if BitBake is regressed with regards to this.

As for merging with sstate, OE-lite uses a completely different staging
model (simple per-recipe package based), and I would be very unhappy if
merging sstate into BitBake will make it impossible for OE-lite to use
upstream BitBake.  I haven't looked enough into the sstate
implementation with regards to this yet though.

Most of all, I would like to stress that there actually are other users
of BitBake than OE and Poky. I hope this is considered a good thing seen
from a BitBake perspective, and not a disturbance.

If possible, perhaps we could have a small BitBake meeting at FOSDEM,
trying to coordinate the way forward?

Oh, btw.  I feel completely comfortable with Chris as BitBake maintainer,
that were 

/Esben




