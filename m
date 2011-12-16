Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RbSos-0004gM-UZ for openembedded-devel@lists.openembedded.org;
	Fri, 16 Dec 2011 09:07:07 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RbSi6-00028A-CZ for openembedded-devel@lists.openembedded.org;
	Fri, 16 Dec 2011 09:00:06 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Dec 2011 09:00:06 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Dec 2011 09:00:06 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 16 Dec 2011 08:50:12 +0100
Message-ID: <jcet7i$4n1$4@dough.gmane.org>
References: <1324003173-13994-1-git-send-email-b19537@freescale.com>
	<1324003173-13994-4-git-send-email-b19537@freescale.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
In-Reply-To: <1324003173-13994-4-git-send-email-b19537@freescale.com>
X-Enigmail-Version: 1.3.4
Subject: Re: [PATCH meta-oe 4/9] libnfnetlink: add
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
X-List-Received-Date: Fri, 16 Dec 2011 08:07:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 16-12-11 03:39, b19537@freescale.com schreef:
> From: Zhenhua Luo <b19537@freescale.com>
> 
> libnfnetlink is the low-level library for netfilter related
> kernel/userspace communication. It provides a generic messaging
> infrastructure for in-kernel netfilter subsystems (such as nfnetlink_log,
> nfnetlink_queue, nfnetlink_conntrack) and their respective users and/or
> management tools in userspace.
> 
> Signed-off-by: Zhenhua Luo <b19537@freescale.com> --- 
> .../libnfnetlink/libnfnetlink.inc                  |   15
> +++++++++++++++ .../libnfnetlink/libnfnetlink_1.0.0.bb             |    8
> ++++++++ 2 files changed, 23 insertions(+), 0 deletions(-) create mode
> 100644 meta-oe/recipes-connectivity/libnfnetlink/libnfnetlink.inc create
> mode 100644
> meta-oe/recipes-connectivity/libnfnetlink/libnfnetlink_1.0.0.bb
> 
> diff --git a/meta-oe/recipes-connectivity/libnfnetlink/libnfnetlink.inc
> b/meta-oe/recipes-connectivity/libnfnetlink/libnfnetlink.inc new file
> mode 100644 index 0000000..1862282 --- /dev/null +++
> b/meta-oe/recipes-connectivity/libnfnetlink/libnfnetlink.inc @@ -0,0
> +1,15 @@ +DESCRIPTION = "libnfnetlink is the low-level library for
> netfilter related \ +kernel/userspace communication. It provides a
> generic messaging \ +infrastructure for in-kernel netfilter subsystems
> (such as nfnetlink_log, \ +nfnetlink_queue, nfnetlink_conntrack) and
> their respective users and/or \ +management tools in userspace." + 
> +SECTION = "devel/libs" +LICENSE = "GPL"

Not a valid license.

> +HOMEPAGE = "http://www.netfilter.org/projects/libnfnetlink/index.html" 
> +INC_PR = "r0" + +SRC_URI =
> "http://www.netfilter.org/projects/libnfnetlink/files/libnfnetlink-${PV}.tar.bz2;name=libnfnetlink-${PV}"
>
> 
+
> +inherit autotools pkgconfig + diff --git
> a/meta-oe/recipes-connectivity/libnfnetlink/libnfnetlink_1.0.0.bb
> b/meta-oe/recipes-connectivity/libnfnetlink/libnfnetlink_1.0.0.bb new
> file mode 100644 index 0000000..74decff --- /dev/null +++
> b/meta-oe/recipes-connectivity/libnfnetlink/libnfnetlink_1.0.0.bb @@ -0,0
> +1,8 @@ +include libnfnetlink.inc + +PR = "${INC_PR}.0" + 
> +LIC_FILES_CHKSUM =
> "file://Makefile.in;endline=13;md5=a44bb8f4c22793d55c5e879eec256702" + 
> +SRC_URI[libnfnetlink-1.0.0.md5sum] = "016fdec8389242615024c529acc1adb8" 
> +SRC_URI[libnfnetlink-1.0.0.sha256sum] =
> "3752b03a4c09821ee9a2528d69289423a01e7171f1a22dfdd11d5459e03972fb"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iEYEARECAAYFAk7q+DQACgkQMkyGM64RGpFNiwCePUee3sI2WLe+WJ+8JmVp1yCJ
t1cAn3M1uDICBFvXICg42yweQD8hI/F9
=pvvn
-----END PGP SIGNATURE-----



