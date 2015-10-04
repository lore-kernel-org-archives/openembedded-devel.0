Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 8351F77065
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  4 Oct 2015 06:37:30 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1ZicvE-0005uA-MA for openembedded-devel@lists.openembedded.org;
	Sun, 04 Oct 2015 08:37:24 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sun, 04 Oct 2015 08:37:24 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 04 Oct 2015 08:37:24 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Sun, 4 Oct 2015 08:37:11 +0200
Message-ID: <muqhen$di2$1@ger.gmane.org>
References: <1443907359-22569-1-git-send-email-manuel.bachmann@iot.bzh>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:38.0)
	Gecko/20100101 Thunderbird/38.1.0
In-Reply-To: <1443907359-22569-1-git-send-email-manuel.bachmann@iot.bzh>
Subject: Re: [PATCH v3][meta-multimedia] mkvtoolnix: fix Boost 1.58 build, update to 7.9.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 04 Oct 2015 06:37:32 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 03-10-15 om 23:22 schreef Manuel Bachmann:
> mkvtoolnix does not compile with newest Boost 1.58, mostly due to the
> following bugs : https://github.com/mbunkus/mkvtoolnix/issues/1172 
> https://github.com/mbunkus/mkvtoolnix/issues/1176
> 
> Update to the version immediately subsequent to their fixes, and adapt
> configure steps accordingly.
> 
> Signed-off-by: Manuel Bachmann <manuel.bachmann@iot.bzh> --- 
> meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_git.bb | 15
> +++++++++++---- 1 file changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_git.bb
> b/meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_git.bb index
> dd613b3..da10153 100644 ---
> a/meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_git.bb +++
> b/meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_git.bb @@ -6,9 +6,16
> @@ LIC_FILES_CHKSUM =
> "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> 
> DEPENDS = "curl boost expat zlib libebml libmatroska libogg libvorbis
> bzip2 lzo file ruby-native"
> 
> -PV = "7.1.0+git${SRCPV}" -SRCREV =
> "0c89ff941bfdd9f3378312f293a84f13cf3e2a96" -SRC_URI =
> "git://github.com/mbunkus/mkvtoolnix.git" +PV = "7.9.0+git${SRCPV}" 
> +SRCREV_mkvtoolnix = "1a8b23b1e82ed180a5aaeb43537f2426be252985" 
> +SRCREV_libebml = "04b34b0dbded40e0cec93cafa6a4f4c8e90c3206" 
> +SRCREV_libmatroska = "db5d627b5bf48516c9e0b540254c0d36595760c3" 
> +SRCREV_FORMAT = "mkvtoolnix" +SRC_URI = " \ +
> git://github.com/mbunkus/mkvtoolnix.git;name=mkvtoolnix \ +
> git://github.com/Matroska-Org/libebml.git;name=libebml;destsuffix=git/lib/li
bebml
> \ +
> git://github.com/Matroska-Org/libmatroska.git;name=libmatroska;destsuffix=gi
t/lib/libmatroska
> \ +          "

Wouldn't:

SRCREV = "1a8b23b1e82ed180a5aaeb43537f2426be252985"
SRC_URI = "gitsm://github.com/mbunkus/mkvtoolnix.git;name=mkvtoolnix"

Be much easier to maintain?

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFWEMkXMkyGM64RGpERAn7oAJsF+fflyuIAfXQ0VRUWDfucw7od7gCgquGN
MKNt3Fd8j7MicGjLPZsoyIA=
=ipI0
-----END PGP SIGNATURE-----


