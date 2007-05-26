Received: from [209.242.20.70] (helo=green.dls.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <mwester@dls.net>) id 1Hrr8F-0000fH-MN
	for openembedded-devel@lists.openembedded.org;
	Sat, 26 May 2007 09:56:13 +0200
Received: from twilight (gw.mwester.net [209.242.5.110])
	by green.dls.net (Postfix) with ESMTP id EB79C411F79
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 May 2007 02:54:58 -0500 (CDT)
Message-ID: <038201c79f6a$f9859720$6e01a8c0@twilight>
From: "Mike \(mwester\)" <mwester@dls.net>
To: <openembedded-devel@lists.openembedded.org>
Date: Sat, 26 May 2007 02:53:40 -0500
MIME-Version: 1.0
X-Priority: 3
X-MSMail-Priority: Normal
X-Mailer: Microsoft Outlook Express 6.00.2800.1807
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2800.1896
Subject: PREFERRED_PROVIDER syntax is eluding me...
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
X-List-Received-Date: Sat, 26 May 2007 07:56:17 -0000
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

I'm missing something simple, I expect.  But try as I might, I cannot figure
this out.

Bitbake 1.8.3, building unslung-image (worked fine on 1.6): Bitbake says:
[snip]
NOTE: multiple providers are available for runtime libc6-unslung (glibc,
glibc-initial);
NOTE: consider defining a PREFERRED_PROVIDER entry to match runtime
libc6-unslung
[snip]

This is a problem, because with bitbake 1.8, without a preferred provider
specified, it seems to try to build both.  But only glibc builds;
glibc-initial fails (and the build loops forever).   This is easily fixed by
adding the following line to the local.conf file:

PREFERRED_PROVIDER_libc6-unslung = "glibc"

Except that it doesn't do a blasted thing.  Neither does this line:

PREFERRED_PROVIDERS += " libc6-unslung:glibc"

Thinking that perhaps the "-unslung" was implied since the machine is
"unslung", I tried:

PREFERRED_PROVIDERS += " libc6:glibc"

Still no change.  Being persistent, I tried every variant of the above that
I could think of, to no avail.  It seems that bitbake is not understanding
or processing the info provided.  The -D flag offers no further hints,
either.

For background, back in the glibc bitbake recipes, glibc-initial.bb does a
"require" of glibc.bb (hence the multiple providers).  Near the tail-end of
glibc.bb we find:

PACKAGES_unslung = "libc6-unslung"
RDEPENDS_libc6-unslung = "nslu2-linksys-libs"
RPROVIDES_libc6-unslung = "libc6"
FILES_libc6-unslung = "/lib/librt*"

Figuring that perhaps the problem is that nothing actually "PROVIDES" libc6,
and that maybe bitbake needs to see the build-time dependency in order to
handle the run-time dependency PREFERRED_PROVIDER stuff, I even added
PROVIDES_libc6-unslung = "libc6"
to the glibc.bb recipe, and went back through the list of
PREFERRED_PROVIDERS in the local.conf file.  No luck.  No difference.

I finally hacked the glibc bitbake recipes so that glibc-initial doesn't
"RPROVIDE" libc6 anymore.  Success - bitbake is happy.  But I'm not.  That
doesn't seem like the correct way to resolve the multiple providers issue,
and I expect that commiting such a change would (rightfully) anger many
folks.

If some kind soul could point me to the document or another recipe that
provides the correct syntax for handling this, or provide a pointer to
whatever it is that I'm missing, I'd be most grateful.

Thanks!

Mike (mwester)






