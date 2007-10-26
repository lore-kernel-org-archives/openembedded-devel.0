Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rpurdie@rpsys.net>) id 1IlPpX-0006k9-IH
	for openembedded-devel@openembedded.org; Fri, 26 Oct 2007 16:06:31 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l9QDx4ka018439
	for <openembedded-devel@openembedded.org>;
	Fri, 26 Oct 2007 14:59:04 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 18219-06 for <openembedded-devel@openembedded.org>;
	Fri, 26 Oct 2007 14:58:57 +0100 (BST)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l9QDwveg018428
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Fri, 26 Oct 2007 14:58:57 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <20071026120925.12c7a624@cimmeria>
References: <20071026120925.12c7a624@cimmeria>
Date: Fri, 26 Oct 2007 14:58:58 +0100
Message-Id: <1193407138.6177.76.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [RFC] Handling Patch Series in OE
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 26 Oct 2007 14:06:31 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2007-10-26 at 12:09 +0100, Graeme Gregory wrote:
> OM developers are making use of patches stored with a series file
> (quilt style) and have a special pre patch function to apply these
> patches.
> 
> This interferes with OE's current file://patch.patch;patch=1
> application. Namely all patches applied in this way are forgotten from
> patches/ directory when the first OE patch is applied.
> 
> I would like to add a new peice of handling to patch.bbclass that
> handles a patchseries=1 type argument when passed with a URI which
> points to a directory of patches+series file.
> 
> This new handling should play nice with OE's current system to avoid
> information on patches being "lost"
> 
> I am making the assumption that in the case of things like this.
> 
> SRC_URI = "http://blah.tag.gz file://unfsck.patch;patch=1
> http://series.tar.gz;patchseries=1 file://unfsck2.patch;patch=2"
> 
> Then the series should be applied after the first patch and before the
> second. To avoid people getting suprised.
> 
> Any comments before I start to learn python?

No objections to the principle, just some comments about the exact
syntax and how we might want to structure this. A nice game you can play
with SRC_URIs is:

FILESDIR = "${WORKDIR}"

SRC_URI = "http://some.site/some.tarball.of.patches.tar.gz \
           file://patch1;patch=1 \
           file://patch2;patch=1"

Where patch1 and patch2 will get unpacked from the archive and then we
can apply them. This syntax is often quite useful and it would be nice
to extend this to have support for:


SRC_URI = "http://some.site/some.tarball.of.patches.tar.gz \
           file://patch1;patch=1 \
           file://custom_series;patchseries=1 \
           file://patch2;patch=1"

where custom_series is a file from some.tarball.of.patches.tar.gz. 

Yes this means two lines in SRC_URI rather than one but that could be
considered an advantage since the name "series" isn't hardcoded. I
suspect when you get into the code this will actually be simpler to
write too ;-).

Cheers,

Richard






