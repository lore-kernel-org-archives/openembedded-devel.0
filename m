Return-Path: <ml@communistcode.co.uk>
Received: from owm.eumx.net (eumx.net [91.82.101.43])
	by mail.openembedded.org (Postfix) with ESMTP id AB78A6D99C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Nov 2013 17:01:12 +0000 (UTC)
Message-ID: <5283B052.1060000@communistcode.co.uk>
Date: Wed, 13 Nov 2013 17:01:06 +0000
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1384361811-17730-1-git-send-email-ml@communistcode.co.uk>
In-Reply-To: <1384361811-17730-1-git-send-email-ml@communistcode.co.uk>
Subject: Re: [meta-oe][PATCH] gtkextra: initial add v3.0.5
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
X-List-Received-Date: Wed, 13 Nov 2013 17:01:14 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 13/11/13 16:56, Jack Mitchell wrote:
> From: Jack Mitchell <jmitchell@cbnl.com>
> 
> Signed-off-by: Jack Mitchell <jmitchell@cbnl.com>
> ---
>  .../recipes-gnome/gtkextra/files/remove-tutorial.patch   | 12 ++++++++++++
>  meta-oe/recipes-gnome/gtkextra/gtkextra_3.0.5.bb         | 16 ++++++++++++++++
>  2 files changed, 28 insertions(+)
>  create mode 100644 meta-oe/recipes-gnome/gtkextra/files/remove-tutorial.patch
>  create mode 100644 meta-oe/recipes-gnome/gtkextra/gtkextra_3.0.5.bb
> 
> diff --git a/meta-oe/recipes-gnome/gtkextra/files/remove-tutorial.patch b/meta-oe/recipes-gnome/gtkextra/files/remove-tutorial.patch
> new file mode 100644
> index 0000000..da4f3f4
> --- /dev/null
> +++ b/meta-oe/recipes-gnome/gtkextra/files/remove-tutorial.patch
> @@ -0,0 +1,12 @@
> +Upstream-Status: Inappropriate [configuration]
> +
> +diff --git a/docs/Makefile.am b/docs/Makefile.am
> +index f5375f5..c306f23 100644
> +--- a/docs/Makefile.am
> ++++ b/docs/Makefile.am
> +@@ -1,4 +1,4 @@
> +-SUBDIRS = reference tutorial
> ++SUBDIRS = reference
> + 
> + EXTRA_DIST = \
> + 	COPYING \
> diff --git a/meta-oe/recipes-gnome/gtkextra/gtkextra_3.0.5.bb b/meta-oe/recipes-gnome/gtkextra/gtkextra_3.0.5.bb
> new file mode 100644
> index 0000000..f343143
> --- /dev/null
> +++ b/meta-oe/recipes-gnome/gtkextra/gtkextra_3.0.5.bb
> @@ -0,0 +1,16 @@
> +SUMMARY = "Gtk+Extra is a set of custom widget for plots and images"
> +HOMEPAGE = "http://gtkextra.sourceforge.net/"
> +
> +LICENSE = "LGPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
> +
> +SRC_URI	= "${SOURCEFORGE_MIRROR}/gtkextra/${P}.tar.gz \
> +           file://remove-tutorial.patch \
> +"
> +
> +SRC_URI[md5sum] = "486cea93666020f85f101ed8341baf41"
> +SRC_URI[sha256sum] = "9cab6c5d6b792eb828d17cec2b9c1baba2ef57f789a290464afab80b53969e65"
> +
> +DEPENDS	= "gtk+"
> +
> +inherit autotools
> 

Ignore, bust indentation v2 incoming.

-- 
  Jack Mitchell (jack@embed.me.uk)
  Embedded Systems Engineer
  Cambridgeshire, UK
  http://www.embed.me.uk
-- 

