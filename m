Received: from [204.127.192.83] (helo=rwcrmhc13.comcast.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <golly@stellarwerx.com>) id 1HNzd2-0006HA-Rp
	for openembedded-devel@lists.openembedded.org;
	Sun, 04 Mar 2007 23:56:33 +0100
Received: from gatekeeper.stellarwerx.com
	(c-68-57-212-205.hsd1.in.comcast.net[68.57.212.205])
	by comcast.net (rwcrmhc13) with ESMTP
	id <20070304225631m13008spn3e>; Sun, 4 Mar 2007 22:56:31 +0000
Received: by gatekeeper.stellarwerx.com (Postfix, from userid 500)
	id 807FA94CD8; Sun,  4 Mar 2007 18:02:43 -0500 (EST)
From: "Mark Gollahon" <golly@stellarwerx.com>
To: openembedded-devel@lists.openembedded.org
Cc: 
X-Originating-IP: 192.168.253.158
X-Mailer: Usermin 1.230
Message-Id: <1173049360.27812@gatekeeper.stellarwerx.com>
In-Reply-To: <45EA8629.8080804@dominion.kabel.utwente.nl>
Date: Sun, 04 Mar 2007 18:02:41 -0500 (EST)
MIME-Version: 1.0
Subject: Re: Fixing QA Errors?
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
X-List-Received-Date: Sun, 04 Mar 2007 22:56:33 -0000
Content-Type: multipart/mixed; boundary="bound1173049361"

--bound1173049361
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 7bit

Koen:

I've tried several different combinations for the FILES_ stuff, but I am still getting both errors.  Since the errors show up when QA checking the libqtaux2 package (as opposed to checking the *-dev, *-doc, etc., packages), could this be more of a problem of the files not getting installed to the right place, or is that what the FILES_* spec is supposed to do?

Regards,
-Mark Gollahon


Koen Kooi wrote ..
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Mark Gollahon schreef:
> > A question for the insane.bbclass developers - how do I go about fixing
> these errors?  Do we have any generalized information about what they mean
> (I can't find any on the wiki or via google...)?
> 
> There's not one definitive doc I can point you too. I can however show
> you an example on
> how to solve the errors you are seeing.
> 
> > ERROR: QA Issue: non -dev package contains symlink .so: libqtaux2 path
> '/work/armv5te-angstrom-linux-gnueabi/libqtaux2-1.2.2-r0/install/libqtaux2/opt/QtPalmtop/lib/libqtaux2.so'
> 
> FILES_${PN}-dev += "/opt/QtPalmtop/lib/*.so"
> 
> > ERROR: QA Issue: non debug package contains .debug directory: libqtaux2
> path /work/armv5te-angstrom-linux-gnueabi/libqtaux2-1.2.2-r0/install/libqtaux2/opt/QtPalmtop/lib/.debug/libqtaux2.so.1.0.0
> 
> FILES_${PN}-dbg += "/opt/QtPalmtop/lib/.debug"
> 
> I'm not sure if the first FILES statement is correct, since I don't know
> about qtopia
> details, but the second one is correct.
> 
> regards,
> 
> Koen
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
> 
> iD8DBQFF6oYpMkyGM64RGpERAk03AJ46ZBPW0OOD9lRe0R0G0t1TF5I8JgCgpL3D
> tbiDHrz0k37RqfzXAAU1csg=
> =OzEM
> -----END PGP SIGNATURE-----
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--bound1173049361--
