Received: from [209.242.20.84] (helo=green.dls.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <mwester@dls.net>) id 1ImzuI-0002u7-Rp
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Oct 2007 23:49:59 +0100
Received: from twilight (gw.mwester.net [209.242.5.110])
	by green.dls.net (Postfix) with ESMTP id D4BC24125C0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Oct 2007 17:30:17 -0500 (CDT)
Message-ID: <10c701c81b44$549de860$6e01a8c0@twilight>
From: "Mike \(mwester\)" <mwester@dls.net>
To: <openembedded-devel@lists.openembedded.org>
References: <472799E6.5050007@gmx.net>
Date: Tue, 30 Oct 2007 17:29:25 -0500
MIME-Version: 1.0
X-Priority: 3
X-MSMail-Priority: Normal
X-Mailer: Microsoft Outlook Express 6.00.2800.1807
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2800.1896
Subject: Re: fakeroot 1.7.1 not fetchable
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
X-List-Received-Date: Tue, 30 Oct 2007 22:49:59 -0000
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: 7bit

fakeroot 1.7.1 was considered unstable when it was added to OE, but it
worked better than the 1.5.x version for some newer distros.  I suspect the
correct solution is to upgrade to the 1.8.x version.  Please open a bug so
we can track this issue; I'll do a cursory test with the most recent 1.8.x
version and commit a fix.

Mike (mwester)

----- Original Message ----- 
From: "Robert Schuster" <theBohemian@gmx.net>
To: <openembedded-devel@lists.openembedded.org>
Sent: Tuesday, October 30, 2007 3:53 PM
Subject: [oe] fakeroot 1.7.1 not fetchable


Hi,
fakeroot 1.7.1's source cannot be fetched from debian mirrors. It is not
available there. A short googling revealed that is available through
gentoo's mirrors instead:

ftp://ftp.gentoo.org.ua/distfiles/fakeroot_1.7.1.tar.gz

File a bug?

Regards
Robert



----------------------------------------------------------------------------
----


#
# old_revision [420247a040098c2b3bf47d7ef03fd8a8adbc70ee]
#
# patch "packages/fakeroot/fakeroot_1.7.1.bb"
#  from [9671a1e7cbc80f1694a5f396598c05ac2f9f1269]
#    to [3136d26e1e4100fa3f4bcca51f30a2b9c13cc37f]
#
============================================================
--- packages/fakeroot/fakeroot_1.7.1.bb
9671a1e7cbc80f1694a5f396598c05ac2f9f1269
+++ packages/fakeroot/fakeroot_1.7.1.bb
3136d26e1e4100fa3f4bcca51f30a2b9c13cc37f
@@ -5,7 +5,7 @@ PR = "r2"
 RDEPENDS = "util-linux"
 PR = "r2"

-SRC_URI =
"ftp://ftp.debian.org/debian/pool/main/f/fakeroot/fakeroot_${PV}.tar.gz \
+SRC_URI = "ftp://ftp.gentoo.org.ua/distfiles/fakeroot_${PV}.tar.gz \
            file://work-with-older-libtool.patch;patch=1"

 inherit autotools



----------------------------------------------------------------------------
----


> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



