Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <openembedded@haerwu.biz>) id 1JeyKu-0001sF-D2
	for openembedded-devel@openembedded.org; Thu, 27 Mar 2008 21:04:32 +0100
Received: (qmail 18894 invoked by uid 813007); 27 Mar 2008 20:04:30 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.lan)
	(marcin@hrw.one.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 27 Mar 2008 20:04:30 -0000
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 27 Mar 2008 21:04:26 +0100
User-Agent: KMail/1.9.9
References: <1206638249.4514.57.camel@dax.rpnet.com>
In-Reply-To: <1206638249.4514.57.camel@dax.rpnet.com>
MIME-Version: 1.0
Message-Id: <200803272104.30232.openembedded@haerwu.biz>
Subject: Re: ipkg/opkg offical response
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
X-List-Received-Date: Thu, 27 Mar 2008 20:04:32 -0000
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia Thursday 27 of March 2008, Richard Purdie napisa=B3:

> Where do we go from here?
>
> I think Marcin has a nogpg version opkg he will commit so people don't
> have any issues with the increased size of ipkg.=20

Opkg can be made smaller by two changes:

1. disable GPG support in opkg (--disable-gpg)
2. disable GnuTLS support in curl

=46irst step gains ~350KB of uncompressed storage. Second step gains ~1MB a=
s=20
libcurl is 20K smaller and we get rid of gnutls and gcrypt libraries. But=20
even then it is bigger then ipkg.

So creation of "opkg-nogpg":

require opkg_svn.bb
EXTRA_OECONF +=3D "--disable-gpg"

would be nice addon. Creation of "curl-nossl" and selecting it is=20
something which should be rather DISTRO choice as it generate same=20
packages as "curl" recipe.

> Does that and rwhitby's symlink fix address everyone's concerns? If not
> can we document the remaining issues and then hopefully address them.

> Do we need something to select between opkg and ipkg or is everyone ok
> with the symlinks?

Solution would be creating DISTRO_IPK_PACKAGE_MANAGER ?=3D "opkg" and using=
=20
it in package_ipk/rootfs_ipk and other places. Then staging=20
ipkg-cl/opkg-cl as ipkg/opkg so we can use "${DISTRO_IPK_PACKAGE_MANAGER}=20
update". Distros which prefer to use ipkg will stay with it, others will=20
move to opkg.

Opinions?

=2D-=20
JID: hrw-jabber.org
OpenEmbedded developer/consultant

    I used to think the brain is the most wonderfull organ in my body,=20
    till I realised what was telling me that




