Received: from [80.68.91.202] (helo=xora.org.uk)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <dp@xora.org.uk>) id 1IlNBB-0000b7-PJ
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Oct 2007 13:16:41 +0200
Received: from cimmeria ([::ffff:78.86.130.156])
	(AUTH: LOGIN dp, SSL: TLSv1/SSLv3,256bits,AES256-SHA)
	by xora.org.uk with esmtp; Fri, 26 Oct 2007 12:09:14 +0100
	id 0006856E.4721CADA.000006B0
Date: Fri, 26 Oct 2007 12:09:25 +0100
From: Graeme Gregory <dp@xora.org.uk>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Message-ID: <20071026120925.12c7a624@cimmeria>
X-Mailer: Claws Mail 3.0.2 (GTK+ 2.12.0; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Subject: [RFC] Handling Patch Series in OE
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
X-List-Received-Date: Fri, 26 Oct 2007 11:16:41 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

OM developers are making use of patches stored with a series file
(quilt style) and have a special pre patch function to apply these
patches.

This interferes with OE's current file://patch.patch;patch=1
application. Namely all patches applied in this way are forgotten from
patches/ directory when the first OE patch is applied.

I would like to add a new peice of handling to patch.bbclass that
handles a patchseries=1 type argument when passed with a URI which
points to a directory of patches+series file.

This new handling should play nice with OE's current system to avoid
information on patches being "lost"

I am making the assumption that in the case of things like this.

SRC_URI = "http://blah.tag.gz file://unfsck.patch;patch=1
http://series.tar.gz;patchseries=1 file://unfsck2.patch;patch=2"

Then the series should be applied after the first patch and before the
second. To avoid people getting suprised.

Any comments before I start to learn python?


