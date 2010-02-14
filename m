Received: from dd20204.kasserver.com ([85.13.140.93])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <bernhard.guillon@opensimpad.org>) id 1NgfmK-00065E-Ua
	for openembedded-devel@lists.openembedded.org;
	Sun, 14 Feb 2010 15:49:00 +0100
Received: from dd20204.kasserver.com (kasmail1.kasserver.com [85.13.137.172])
	by dd20204.kasserver.com (Postfix) with SMTP id 52217185B3BB9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Feb 2010 15:23:09 +0100 (CET)
from: bernhard.guillon@opensimpad.org
to: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
X-SenderIP: 95.90.75.53
Message-Id: <20100214142309.52217185B3BB9@dd20204.kasserver.com>
Date: Sun, 14 Feb 2010 15:23:09 +0100 (CET)
X-SA-Exim-Connect-IP: 85.13.140.93
X-SA-Exim-Mail-From: bernhard.guillon@opensimpad.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: How to sane replace a path in a pkgconfig file ?
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
X-List-Received-Date: Sun, 14 Feb 2010 14:49:00 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi all,
currently I am working on fixing blackbox. I had to add a lot of includes=
 to fix compiler errors.
After fixing the compiler errors I came over a sed error of the recipe. s=
ed was not able to find the pc file but the recipe inherits pkgconfig.

----snipped of blackbox_0.70.1.bb----
#fix path of pc file
do_install_append() {
        sed -i s#${STAGING_LIBDIR}#${libdir}#g ${D}/${libdir}/pkgconfig/l=
ibbt.pc
}

do_stage () {
        sed -i s#${STAGING_LIBDIR}#${libdir}#g ${STAGING_LIBDIR}/pkgconfi=
g/libbt.pc
}

It looks like the pkgconfig class is called after do_stage()?  What is th=
e right place to replace the wrong path in the libbt.pc file?

I changed the above to this:

#fix path of pc file
do_install_prepend() {
        sed -i s#${STAGING_LIBDIR}#${libdir}#g ${S}/lib/libbt.pc
}

But I am not sure if this is safe! Is there any place where the original =
path in the pkconfig file is needed? With my approach this file would hav=
e the wrong path inside.

What do you think about it? I am looking forward to any advice :)

Best regards
Bernhard Guillon






