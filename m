Received: from [209.242.20.84] (helo=green.dls.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <mwester@dls.net>) id 1IIGxP-00068b-Of
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Aug 2007 06:46:11 +0200
Received: from twilight (gw.mwester.net [209.242.5.110])
	by green.dls.net (Postfix) with ESMTP id 20E9A4121DE
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Aug 2007 23:43:48 -0500 (CDT)
Message-ID: <0cc301c7d8ad$4d1a2790$6e01a8c0@twilight>
From: "Mike \(mwester\)" <mwester@dls.net>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 6 Aug 2007 23:42:03 -0500
MIME-Version: 1.0
X-Priority: 3
X-MSMail-Priority: Normal
X-Mailer: Microsoft Outlook Express 6.00.2800.1807
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2800.1896
Subject: fakeroot 1.7.1 & LT_INIT?
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
X-List-Received-Date: Tue, 07 Aug 2007 04:46:11 -0000
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

Background: fakeroot is misbehaving on my system (it gets confused with its
inode cache, and attempts to pass off a file as a directory, which causes
mkfs.jffs2 to fail (among other things)).  Upgrading fakeroot to 1.7.1 seems
to resolve this problem.

Do_configure fails with 1.7.1; it attempts to create a configure script from
the configure.ac file, but cannot expand the following two lines in
configure.ac:

LT_INIT
LT_LANG(C)

Because it's just the way I am (yes, as a kid I stuck a knife into an
electrical socket just to see what would happen), I deleted those two lines
from configure.ac and tried again.  Somewhat to my surprise, nothing
broke -- it works just fine that way (unlike placing a butter knife in an
outlet - that did not work so very well).

So the question: do those lines do anything that matters to us, and can I
commit the updated recipe for fakeroot 1.7.1?  Or is there something else I
should do to make the autotools happy with the LT_* stuff?

Thanks,
Mike (mwester)



