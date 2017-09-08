Return-Path: <fabien.lahoudere@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	by mail.openembedded.org (Postfix) with ESMTP id 6D61B70101
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Sep 2017 13:18:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: aragua) with ESMTPSA id 679A126CE39
Message-ID: <1504876701.17691.19.camel@collabora.co.uk>
From: Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 08 Sep 2017 15:18:21 +0200
In-Reply-To: <20170908131343.12748-1-fabien.lahoudere@collabora.co.uk>
References: <20170908131343.12748-1-fabien.lahoudere@collabora.co.uk>
X-Mailer: Evolution 3.22.6-1 
Mime-Version: 1.0
Subject: Re: [meta-multimedia][PATCH] libupnp: Add recipe for version 1.8.1
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 08 Sep 2017 13:18:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The version is 1.8.2 not 1.8.1.

On Fri, 2017-09-08 at 15:13 +0200, Fabien Lahoudere wrote:
> Signed-off-by: Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>
> ---
>  .../recipes-connectivity/libupnp/libupnp_1.8.2.bb    | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>  create mode 100644 meta-multimedia/recipes-connectivity/libupnp/libupnp_1.8.2.bb
> 
> diff --git a/meta-multimedia/recipes-connectivity/libupnp/libupnp_1.8.2.bb b/meta-
> multimedia/recipes-connectivity/libupnp/libupnp_1.8.2.bb
> new file mode 100644
> index 000000000..61b209ab8
> --- /dev/null
> +++ b/meta-multimedia/recipes-connectivity/libupnp/libupnp_1.8.2.bb
> @@ -0,0 +1,20 @@
> +SUMMARY = "Portable SDK for UPnP* Devices"
> +DESCRIPTION = "The Portable SDK for UPnP Devices is an SDK for development of \
> +UPnP device and control point applications. It consists of the core UPnP \
> +protocols along with a UPnP-specific eXtensible Markup Language (XML) parser \
> +supporting the Document Object Model (DOM) Level 2 API and an optional, \
> +integrated mini web server for serving UPnP related documents."
> +HOMEPAGE = "http://pupnp.sourceforge.net/"
> +LICENSE = "BSD"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=b3190d5244e08e78e4c8ee78544f4863"
> +
> +SRC_URI = "https://github.com/mrjimenez/pupnp/archive/release-${PV}.tar.gz "
> +
> +SRC_URI[md5sum] = "db8061f7cbd7f9af993ac4e87ad084cb"
> +SRC_URI[sha256sum] = "438ad86bfd933cb1e9be1c41bf3bd69f049daba11d71bbb5d715336e00106cb4"
> +
> +S="${WORKDIR}/pupnp-release-${PV}"
> +
> +inherit autotools
> +
> +EXTRA_OECONF += "--enable-reuseaddr"
> \ No newline at end of file

