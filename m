Received: from [209.242.20.84] (helo=green.dls.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <mwester@dls.net>) id 1II6uD-0001AZ-LK
	for openembedded-devel@lists.openembedded.org;
	Mon, 06 Aug 2007 20:02:15 +0200
Received: from twilight (gw.mwester.net [209.242.5.110])
	by green.dls.net (Postfix) with ESMTP id 190A3411AA4
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Aug 2007 12:59:48 -0500 (CDT)
Message-ID: <03d301c7d853$58ec39f0$6e01a8c0@twilight>
From: "Mike \(mwester\)" <mwester@dls.net>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 6 Aug 2007 12:58:08 -0500
MIME-Version: 1.0
X-Priority: 3
X-MSMail-Priority: Normal
X-Mailer: Microsoft Outlook Express 6.00.2800.1807
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2800.1896
Subject: STAGING_LIBDIR_NATIVE needed in bitbake.conf
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
X-List-Received-Date: Mon, 06 Aug 2007 18:02:16 -0000
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

In order to fix an ncurses build bug
(http://bugs.openembedded.org/show_bug.cgi?id=2554), we need to set
LD_LIBRARY_PATH in the ncurses bb file.

I've tested, and the following resolves the problem with ncurses not
installing:

    export LD_LIBRARY_PATH = "${STAGING_BINDIR_NATIVE}/../lib"

That's not too elegant, so I'd like to create "STAGING_LIBDIR_NATIVE" in the
bitbake.conf file instead, which will clean up the recipe and make more
obvious what it is that we're doing.


Anyone have any heartburn with this approach to resolving this problem?

Thanks,
Mike (mwester)



