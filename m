Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PfSQK-0002q6-Ti for openembedded-devel@lists.openembedded.org;
	Wed, 19 Jan 2011 08:25:45 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PfSPg-0003J5-NR for openembedded-devel@lists.openembedded.org;
	Wed, 19 Jan 2011 08:25:04 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jan 2011 08:25:04 +0100
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jan 2011 08:25:04 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 19 Jan 2011 08:24:20 +0100
Message-ID: <ih63j4$6lr$3@dough.gmane.org>
References: <1295394843.32079.62.camel@mattotaupa>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <1295394843.32079.62.camel@mattotaupa>
X-Enigmail-Version: 1.0.1
Subject: Re: [PATCH 1/2] gst-openmax: remove obsolete patch
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
X-List-Received-Date: Wed, 19 Jan 2011 07:25:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 19-01-11 00:54, Paul Menzel wrote:
> Date: Tue, 18 Jan 2011 16:31:30 +0100
> 
> Task `configure` fails with the following error with `angstrom-2008.1` and `MACHINE = "beagleboard"`.
> 
> 	| configure: using GStreamer tools in /usr/bin
> 	| configure: using GStreamer plug-ins in /usr/lib/gstreamer-0.10
> 	| checking for GST_BASE... yes
> 	| checking for GST_CHECK... no
> 	| no
> 	| configure: No package 'gstreamer-check' found
> 	| configure: error: no gstreamer-check >= 0.10.0 (GStreamer Check unittest Library) found
> 	| ERROR: Function do_configure failed
> 	NOTE: package gst-openmax-0.10.0.4-r0: task do_configure: Failed
> 	ERROR: TaskFailed event exception, aborting
> 	ERROR: Build of /oe/openembedded/recipes/openmax/gst-openmax_0.10.0.4.bb do_configure failed
> 	ERROR: Task 11 (/oe/openembedded/recipes/openmax/gst-openmax_0.10.0.4.bb, do_configure) failed with 256
> 
> With current GStreamer `gstreamer-0.10.31-r2` this patch is not necessary anymore and removing it fixes the build. When the recipe was committed with the patch in 1eef6ac1 [1] GStreamer 0.10.17 was used [2].
> 
> [1] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=1eef6ac18de15ea845b146b1624fcc1f1c4faea2
> [2] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3422a436880509c7f82a3ae5d5693c87ece7a42d
> 
> Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>

Acked-by: Koen Kooi <koen@openembedded.org>


> ---
>  recipes/openmax/gst-openmax/check.diff  |   11 -----------
>  recipes/openmax/gst-openmax_0.10.0.4.bb |    1 -
>  2 files changed, 0 insertions(+), 12 deletions(-)
>  delete mode 100644 recipes/openmax/gst-openmax/check.diff
> 
> diff --git a/recipes/openmax/gst-openmax/check.diff b/recipes/openmax/gst-openmax/check.diff
> deleted file mode 100644
> index 9e74abf..0000000
> --- a/recipes/openmax/gst-openmax/check.diff
> +++ /dev/null
> @@ -1,11 +0,0 @@
> ---- /tmp/gst-check.m4	2008-08-05 17:46:09.000000000 +0200
> -+++ gst-openmax-0.10.0.4/common/m4/gst-check.m4	2008-08-05 17:46:29.000000000 +0200
> -@@ -114,7 +114,7 @@
> - 
> - AC_DEFUN([AG_GST_CHECK_GST_CHECK],
> - [
> --  AG_GST_CHECK_MODULES(GST_CHECK, gstreamer-check-[$1], [$2],
> -+  AG_GST_CHECK_MODULES(GST_CHECK, gstreamer-check, [$2],
> -     [GStreamer Check unittest Library], [$3])
> - ])
> - 
> diff --git a/recipes/openmax/gst-openmax_0.10.0.4.bb b/recipes/openmax/gst-openmax_0.10.0.4.bb
> index d3e1002..b05b65f 100644
> --- a/recipes/openmax/gst-openmax_0.10.0.4.bb
> +++ b/recipes/openmax/gst-openmax_0.10.0.4.bb
> @@ -3,7 +3,6 @@ LICENSE = "LGPLv2"
>  DEPENDS = "gstreamer libomxil-bellagio"
>  
>  SRC_URI = "http://gstreamer.freedesktop.org/src/gst-openmax/pre/gst-openmax-${PV}.tar.bz2 \
> -           file://check.diff \
>            "
>  
>  inherit autotools
> 
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNNpGkMkyGM64RGpERAgphAKCrYfUHcqTf6Xa7KPOLEgoV7rfzjwCfbEjj
A/fPxQcTyRgKMYa/O4kHVrw=
=vhT3
-----END PGP SIGNATURE-----



