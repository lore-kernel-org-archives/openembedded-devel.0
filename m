Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1TOkWj-0005Ug-6h for openembedded-devel@lists.openembedded.org;
	Thu, 18 Oct 2012 09:28:21 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1TOkJx-0006i7-IB for openembedded-devel@lists.openembedded.org;
	Thu, 18 Oct 2012 09:15:09 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Oct 2012 09:15:09 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Oct 2012 09:15:09 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 18 Oct 2012 09:14:56 +0200
Message-ID: <k5oa9b$nik$1@ger.gmane.org>
References: <1350483671-28179-1-git-send-email-ross.burton@intel.com>
	<1350483671-28179-2-git-send-email-ross.burton@intel.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:15.0) Gecko/20120907 Thunderbird/15.0.1
In-Reply-To: <1350483671-28179-2-git-send-email-ross.burton@intel.com>
X-Enigmail-Version: 1.4.4
Subject: Re: [PATCH] [meta-multimedia] gst123: add package
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
X-List-Received-Date: Thu, 18 Oct 2012 07:28:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 17-10-12 16:21, Ross Burton schreef:
> gst123 is useful for testing as it simply uses PlayBin, but can display
> the pipeline being used for QA purposes.
> 
> Signed-off-by: Ross Burton <ross.burton@intel.com> --- 
> .../recipes-multimedia/gstreamer/gst123_0.3.1.bb    |   19
> +++++++++++++++++++ 1 file changed, 19 insertions(+) create mode 100644
> meta-multimedia/recipes-multimedia/gstreamer/gst123_0.3.1.bb
> 
> diff --git a/meta-multimedia/recipes-multimedia/gstreamer/gst123_0.3.1.bb
> b/meta-multimedia/recipes-multimedia/gstreamer/gst123_0.3.1.bb new file
> mode 100644 index 0000000..b543958 --- /dev/null +++
> b/meta-multimedia/recipes-multimedia/gstreamer/gst123_0.3.1.bb @@ -0,0
> +1,19 @@ +SUMMARY = "gst123"

Can you add a more verbose summary please?

> +DESCRIPTION = "Flexible command line player in the spirit of ogg123 and
> mpg123, based on GStreamer" +HOMEPAGE =
> "http://space.twc.de/~stefan/gst123.php" +LICENSE = "LGPLv2.1+" 
> +LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2
> \ +
> file://src/gst123.cc;beginline=1;endline=19;md5=05d2f5d54b985b986c26af931d2084f8"
>
> 
+
> +DEPENDS = "libx11 gstreamer gtk+ ncurses" + +PR = "r0"

And drop that, it's the default value.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFQf6xwMkyGM64RGpERAljjAJ9aGC2Q5HRMTnFYOlcJb2ywBqIHwwCfRfh5
Luyj+s0dnDIfr77ziVYK7PE=
=tMxI
-----END PGP SIGNATURE-----



