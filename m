Received: from [64.233.178.243] (helo=hs-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <e.robertson.svg@gmail.com>) id 1JgjjX-0001Zx-2G
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Apr 2008 18:53:15 +0200
Received: by hs-out-0708.google.com with SMTP id 23so2466066hsn.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Apr 2008 09:53:13 -0700 (PDT)
Received: by 10.100.251.5 with SMTP id y5mr19832612anh.56.1207068793072;
	Tue, 01 Apr 2008 09:53:13 -0700 (PDT)
Received: from debian ( [74.254.162.162])
	by mx.google.com with ESMTPS id 34sm229294agc.32.2008.04.01.09.53.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 01 Apr 2008 09:53:11 -0700 (PDT)
From: E Robertson <e.robertson.svg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 1 Apr 2008 10:52:56 -0500
User-Agent: KMail/1.9.7
References: <200803311438.09825.e.robertson.svg@gmail.com>
	<200804010807.38670.e.robertson.svg@gmail.com>
	<200804011648.57903.zecke@selfish.org>
In-Reply-To: <200804011648.57903.zecke@selfish.org>
MIME-Version: 1.0
Message-Id: <200804011053.07102.e.robertson.svg@gmail.com>
Cc: Holger Freyther <zecke@selfish.org>
Subject: Re: stable branch checksum missmatch for quilt-0.45
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
X-List-Received-Date: Tue, 01 Apr 2008 16:53:15 -0000
X-Groupsio-MsgNum: 4887
Content-Type: multipart/signed; boundary="nextPart3257016.vpJjjtCXa4";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart3257016.vpJjjtCXa4
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Tuesday 01 April 2008 09:48:57 am Holger Freyther wrote:
> On Tuesday 01 April 2008 15:07:34 E Robertson wrote:
> > You must be the funny one.
>
> Sometimes, I have many faces and don't hide them :)
>
> > Since it was already built by the dev branch and I use the same local
> > file to build the stable branch, would it / should it skip the build and
> > use the built binary? Or would it just rebuild the binary?
> > What is the command to a clean build?
>
> Ah you build stable and dev from the same directory and have a dev built
> there? No this does not work. We recently changed the layout of staging
> directory so dev and stable are not compatible. The only bug we have there
> is we warn about 'upgrading' but not about 'downgrading' of the ABI in the
> staging directory.

Thanks. I created a new TMPDIR and rebuild successfully.

Unless their are any objections, I'll add this to the user manual along wit=
h a=20
note that the best way to do a _clean_ build is to delete tmp dir=20
contents(?).


> > In your last point above, what is a "dep graph"?
>
> With OE/BitBake we have tasks (e.g. do bitbake -clisttasks nano). These a=
re
> like fetch, unpack, configure, compile, install, stage, package. E.g. to
> configure nano you will need a C library for your target, this is where
> dependencies between tasks get added. This ends up in a dep(endency) grap=
h.
>
> > Thanks.
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



--nextPart3257016.vpJjjtCXa4
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQBH8lpj2sS31XKVICURApuXAJ9UzQlbCWSTxzJNFDfqg+USBLRlpACbB+yp
GH9wxq/A10wy3lGyY+bziH0=
=VVH+
-----END PGP SIGNATURE-----

--nextPart3257016.vpJjjtCXa4--
