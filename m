Received: from mail-ee0-f52.google.com ([74.125.83.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UR13r-0002az-2A
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Apr 2013 16:04:17 +0200
Received: by mail-ee0-f52.google.com with SMTP id d17so1524201eek.25
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Apr 2013 06:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:mime-version
	:content-type:content-disposition:user-agent;
	bh=d2Q1lEZ+1PabBJBGcHbJ4bH+J6mn8MNruC1/kqCigdo=;
	b=mYoG8jNrUDmp6/ridiSQ5PDeMtweNloGA7/e2a4W5SFYqKwqzxW1T4U+qA0ZB2iUOt
	Bgfu9r1EAfCikPLf8Bx0NsrfJcTyUfWShqyhwzdwXuh4PZci+fwpbWK/yBIxaMtUsKsV
	lMS1LuEyS/wXmGHpNGLQNK/iVi5bzAMx8XGFIrHl+VZadZDl8ilOZmCqlwNi1RJ+VzNy
	tl+uybmXQ9k3rTbQpC7ayu0Lzrk2azhOukrNJt+kAibD/abdAhoeKKrg3RbU1ZbiizJA
	LqOhCxbJp11oyzYnroDEPu/pDBidAlYOYDTF5p5c0ZaAZK8kOWd5W6hVAknzpfEC+TUG
	+VsA==
X-Received: by 10.15.102.3 with SMTP id bq3mr39772635eeb.42.1365860805400;
	Sat, 13 Apr 2013 06:46:45 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id a2sm15048158eem.11.2013.04.13.06.46.44
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sat, 13 Apr 2013 06:46:44 -0700 (PDT)
Date: Sat, 13 Apr 2013 15:46:48 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130413134648.GE2477@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Consistent indentation in meta-openembedded metadata
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
X-List-Received-Date: Sat, 13 Apr 2013 14:04:18 -0000
X-Groupsio-MsgNum: 44147
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4fo3mGi7Q6pk/+I3"
Content-Disposition: inline

--4fo3mGi7Q6pk/+I3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

maybe you remember my proposal to make whitespace consistent for python
and shell tasks a while back:

http://lists.linuxtogo.org/pipermail/openembedded-core/2012-July/026176.html

    * This change is only aesthetic (unlike indentation in Python
    * tasks).
    * Some recipes were using tabs.
    * Some were using 8 spaces.
    * Some were using mix or different number of spaces.
    * Make them consistently use 4 spaces everywhere.
    * Yocto styleguide advises to use tabs (but the only reason to keep
      tabs is the need to update a lot of recipes). Lately this advice
      was also merged into the styleguide on the OE wiki.
    * Using 4 spaces in both types of tasks is better because it's less
      error prone when someone is not sure if e.g.
      do_generate_toolchain_file() is Python or shell task and also allows
      to highlight every tab used in .bb, .inc, .bbappend, .bbclass as
      potentially bad (shouldn't be used for indenting of multiline
      variable assignments and cannot be used for Python tasks).

I still have some scripts for semi-automatic conversion.

Now close to creating dylan branch for meta-openembedded is imho best
time to do this, not many changes from released dylan will be backported
to danny, because people will start moving to newer release instead of
backporting more and more stuff to old one (also resolving possible
whitespace merge conflict it not hard). Causing conflicts for merge was
IIRC most important reason why my proposal was rejected for oe-core.

meta-efl, meta-webos(-ports), meta-smartphone layers are already using=20
it for some time and meta-openembedded recipes are using spaces in shell=20
tasks in majority of recipes.

If nobody objects I'll run my scripts after all pending patches are
merged.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--4fo3mGi7Q6pk/+I3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFpYcgACgkQN1Ujt2V2gBwY4ACdEbWQnyFS8a7vmlZ7MZsk22sy
4nMAoLHPRvp6tXvQIJqwLA34unhdfh6v
=Z8mf
-----END PGP SIGNATURE-----

--4fo3mGi7Q6pk/+I3--
