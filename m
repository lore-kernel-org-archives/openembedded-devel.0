Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <openembedded@hrw.one.pl>) id 1Gu9Zf-0004BQ-4J
	for openembedded-devel@openembedded.org; Tue, 12 Dec 2006 16:29:43 +0100
Received: (qmail 29201 invoked by uid 813007); 12 Dec 2006 15:28:08 -0000
X-clamdmail: clamdmail 0.18a
Received: from v813.rev.tld.pl (HELO ?192.168.1.90?)
	(marcin@hrw.one.pl@195.149.226.213)
	by smtp.host4.kei.pl with ESMTPA; 12 Dec 2006 15:28:08 -0000
From: Marcin Juszkiewicz <openembedded@hrw.one.pl>
Organization: OpenEmbedded
To: openembedded-devel@lists.openembedded.org
Date: Tue, 12 Dec 2006 16:28:07 +0100
User-Agent: KMail/1.9.5
References: <c384c5ea0612031500o3ee66a23x89d72a948f418532@mail.gmail.com>
	<1165238625.15272.3.camel@localhost.localdomain>
	<c384c5ea0612041234u5fd7e6d6w5de1efc385cacbd7@mail.gmail.com>
In-Reply-To: <c384c5ea0612041234u5fd7e6d6w5de1efc385cacbd7@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <200612121628.07309.openembedded@hrw.one.pl>
Subject: Re: Recent OBJDUMP changes
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
X-List-Received-Date: Tue, 12 Dec 2006 15:29:43 -0000
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia poniedzia=B3ek, 4 grudnia 2006 21:34, Leon Woestenberg napisa=B3:

> My assumption was wrong, the correct (cross-toolchain) objdump is used.
>
> However, the shlibs system seems to fail elsewhere, this is what I see
> if I disable the objdump command error redirection "2>/dev/null" in
> package.bbclass:

> NOTE: Couldn't find shared library provider for libc.so.6

Does someone found better fix then mine?

[hrw@misc1 classes]$ mtn dif package.bbclass
#
# old_revision [76f1fdf6dff425bfdddcd67c4430bf4bc23ab36c]
#
# patch "classes/package.bbclass"
#  from [b4538ccc18abcaa057513563f37b2d25fdce5784]
#    to [969285b9af2e3bc59048d34cf396dd529e496c1e]
#
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=2D-- classes/package.bbclass     b4538ccc18abcaa057513563f37b2d25fdce5784
+++ classes/package.bbclass     969285b9af2e3bc59048d34cf396dd529e496c1e
@@ -576,6 +576,7 @@ python package_do_shlibs() {
                                path =3D os.path.join(root, file)
                                if os.access(path, os.X_OK) or lib_re.match=
(file):
                                        cmd =3D bb.data.getVar('OBJDUMP', d=
, 1) + " -p " + path + " 2>/dev/null"
+                                       cmd =3D "PATH=3D\"%s\" %s" % (bb.da=
ta.getVar('PATH', d, 1), cmd)
                                        fd =3D os.popen(cmd)
                                        lines =3D fd.readlines()
                                        fd.close()
[hrw@misc1 classes]$

=2D-=20
JID: hrw-jabber.org
OpenEmbedded developer/consultant

      I don't know. I don't care. And it doesn't make any difference.




