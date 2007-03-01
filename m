Received: from [209.242.20.70] (helo=green.dls.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <mwester@dls.net>) id 1HMoxs-0002Gw-Ii
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Mar 2007 18:21:12 +0100
Received: from twilight (gw.mwester.net [209.242.5.110])
	by green.dls.net (Postfix) with ESMTP id A5DDF41229F
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Mar 2007 11:21:16 -0600 (CST)
Message-ID: <06b101c75c25$edc2a410$6e01a8c0@twilight>
From: "Mike \(mwester\)" <mwester@dls.net>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 1 Mar 2007 11:20:37 -0600
MIME-Version: 1.0
X-Priority: 3
X-MSMail-Priority: Normal
X-Mailer: Microsoft Outlook Express 6.00.2800.1807
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2800.1896
Subject: mtd-utils change: missing lzo1x.h
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
X-List-Received-Date: Thu, 01 Mar 2007 17:21:12 -0000
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

The latest changes to mtd-utils isn't working; complains about a missing
header file (lzo1x.h).  Is there a missing dependency somewhere, or perhaps
a PR didn't get bumped?   I can't find that file anywhere (oh, a google
search finds many copies, but I expect that's not the right way to fix this
;-)   And it really didn't give me a good hint as to what package that file
might be contained in so I could add the dependency...

FWIW using PREFERRED_VERSION to go back to the original isn't working
either; bbimage now apparently requires the newest mtd-utils-native:
mkfs.jffs2: Unknown compressor name lzo

Mike (mwester)




