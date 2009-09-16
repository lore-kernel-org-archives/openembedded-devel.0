Received: from [209.85.221.190] (helo=mail-qy0-f190.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msundius@sundius.com>) id 1MnyGO-0007aP-EG
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Sep 2009 19:25:55 +0200
Received: by qyk28 with SMTP id 28so5190806qyk.28
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Sep 2009 10:25:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.229.19.149 with SMTP id a21mr2308000qcb.29.1253121917797; Wed, 
	16 Sep 2009 10:25:17 -0700 (PDT)
Date: Wed, 16 Sep 2009 10:25:17 -0700
Message-ID: <18e217240909161025p279a35f4ma8a714bddb63ec0@mail.gmail.com>
From: C Michael Sundius <msundius@sundius.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.221.190
X-SA-Exim-Mail-From: msundius@sundius.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: slight different confirurations for a package
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
X-List-Received-Date: Wed, 16 Sep 2009 17:25:55 -0000
Content-Type: text/plain; charset=ISO-8859-1

I'd like to be able to build several different configurations of the same
package and I'm wondering if the community might have some good input on the
best way to organize this. My project has several images that are built for
various products and customers and hardware. Generally all of the software
is the same save a few key packages. (really even the kernel is constant
across all platforms). and right now I have a different disto.conf file that
corresponds to an image recipe for each platform.

I want to be able to build all of the platforms together within the same out
dir. (so I don't have to rebuild the bulk of the software wasting disk space
and time).

I've thought about defining separate recipes:
     (foo-config1.bb, foo-config2.bb)
or simply using a variable to define ${PN} from within the recipe:

    PN = ${DISTRO_CONFIG}

 I suppose these could work, but I'm wondering if I can create a whole new
directory under work and staging like when I set PACKAGE_ARCH =
${MACHINE_ARCH} for the kernel and drivers.

as I said, right now I have a separate distro/*.conf file for each image
(and thus configuration) I build, really the difference between these is the
configuration of just a few packages all other software is built w/ the same
recipe and configs. Is there a way anyone can think of to consolidate these
so I can build everything without
changing the local.conf (DISTRO variable).

I realize this is a nebulous question, but if anyone has an experience
similar where they have had to organize various builds and found a clean or
better way to build them all for both development and production or you have
some opinions about how you made your decisions to do things one way or
another , I'd love to hear your comments.

Thank you
Mike

