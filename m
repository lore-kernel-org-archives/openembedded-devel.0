Received: from [209.85.220.172] (helo=mail-fx0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ihar.hrachyshka@gmail.com>) id 1M8WHm-0001YV-BF
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 May 2009 11:16:03 +0200
Received: by fxm20 with SMTP id 20so2992515fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 May 2009 02:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=74edutAwDs2cGKLwiT+zK6suMOBa/yPBkCnkY5Nj+ns=;
	b=o5228dQrBapdAot7P6WpOh91dxxCo/OKZxj+NQ+cqInFTYWiGJ8VlGr5EykRCONJdm
	Z+XD2BEihrYndCTWGyll32bfJdYAHlQRje3HOb9bnA9nzaWV4DJHhKfSsgebCKDli8fp
	FBf2bKlWhsSiBV+ZEdvDtHllMi3LGThip9Ryo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=SqdH4zfYZlUCbXc3Z0uH7kV1Vyz5EmwNSMwT8gLBsZx+Hvl6QvCjxbtDNvlCwid/mb
	KQu2AuoVnXpaEj+34cz35vWOSM0vBSfOdiPivENCJ4eGdHJSrQOxaBXtH8/mv82jUeQD
	LPzg4mz6yk5s/H0APrSz9YJCA2LGtnv8s3GP0=
MIME-Version: 1.0
Received: by 10.103.108.18 with SMTP id k18mr3563962mum.40.1243242477547; Mon, 
	25 May 2009 02:07:57 -0700 (PDT)
Date: Mon, 25 May 2009 12:07:57 +0300
Message-ID: <fce2a370905250207g211af74fg29c1f0cd2593a4ae@mail.gmail.com>
From: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
To: openembedded-devel@lists.openembedded.org, koen@openembedded.org
Subject: [RFC] gnome.bbclass change broke lots of package dependencies
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
X-List-Received-Date: Mon, 25 May 2009 09:16:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello to all!

Today I was working on bringing qt4-embedded toolchain to OE and found
the following problem with the last change
(4c275b5c0350ed1dbd94bfcdd9ce8786ad11b8a1) for gnome.bbclass.
Here is the problematic code snippet I'd like to discuss:

@@ -17,6 +17,9 @@ inherit autotools gtk-icon-cache pkgconfig gconf mime

 AUTOTOOLS_STAGE_PKGCONFIG = "1"

+PACKAGES =+ "${PN}-scrollkeeper-leftovers"
+FILES_${PN}-scrollkeeper-leftovers = "${localstatedir}/lib/scrollkeeper"
+
 gnome_stage_includes() {
        autotools_stage_includes
 }

As we can see, there is now ${PN}-scrollkeeper-leftovers package for
every recipe that inherited gnome.bbclass. And this -leftovers package
is in the current dependency chains (at least for qt4-embedded-dev
package).

At the first place, I'd like to get some explanation on the reason for
pushing the change in the tree. Git log is somehow ambiguous so I
can't understand the reason for doing the commit.

If it's really needed then we should resolve the following problems:
1) this new package (leftovers) is not generated for empty packages
resulting in broken dependency chains (as for gnome-vfs that is
somehow needed by qt4-embedded-dev);
2) this new package (leftovers) is not generated for *every* recipe
that was built *before* the change was made.

As for the 1st problem, I suggest adding ALLOW_EMPTY = "1" to
gnome.bbclass (it works for my current setup, and if you will approve
the change then I'll send the patch immediately).
As for the 2nd problem, there is a big question what should we do.
Revision bumping for every recipe that inherits gnome.bbclass is not
an elegant thing (though it will really push the change for all the
users). Maybe there is another, better way to handle such tasks. If
you know it please provide me with the info.

Thanks for help in advance,
Ihar Hrachyshka


