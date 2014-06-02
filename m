Return-Path: <ml@communistcode.co.uk>
Received: from owm.eumx.net (eumx.net [91.82.101.43])
	by mail.openembedded.org (Postfix) with ESMTP id 9CD6660425
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Jun 2014 20:56:57 +0000 (UTC)
Message-ID: <538CE517.4090102@communistcode.co.uk>
Date: Mon, 02 Jun 2014 21:56:55 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1401741340-24934-1-git-send-email-eduardo@monkey.io>
In-Reply-To: <1401741340-24934-1-git-send-email-eduardo@monkey.io>
Subject: Re: [PATCH] [meta-webserver]: add Monkey HTTP Server
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
X-List-Received-Date: Mon, 02 Jun 2014 20:56:59 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi Eduardo,

Just the one comment inline.

On 02/06/2014 21:35, Eduardo Silva wrote:
> Signed-off-by: Eduardo Silva <eduardo@monkey.io>
> ---
>   .../recipes-httpd/monkey/monkey_1.5.0.bb           | 38 ++++++++++++++++++++++
>   1 file changed, 38 insertions(+)
>   create mode 100644 meta-webserver/recipes-httpd/monkey/monkey_1.5.0.bb
>
> diff --git a/meta-webserver/recipes-httpd/monkey/monkey_1.5.0.bb b/meta-webserver/recipes-httpd/monkey/monkey_1.5.0.bb
> new file mode 100644
> index 0000000..c6f1a76
> --- /dev/null
> +++ b/meta-webserver/recipes-httpd/monkey/monkey_1.5.0.bb
> @@ -0,0 +1,38 @@
> +SUMMARY = "Fast and Lightweight HTTP Server for Linux"
> +HOMEPAGE = "http://monkey-project.com"
> +BUGTRACKER = "https://github.com/monkey/monkey/issues"
> +
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=2ee41112a44fe7014dce33e26468ba93"
> +
> +PR = "r1"

PR is no longer needed, remove.

> +
> +SECTION = "net"
> +
> +SRC_URI = "http://monkey-project.com/releases/1.5/monkey-${PV}.tar.gz"
> +SRC_URI[md5sum] = "9123fc371334621fde1c060ab17adcd3"
> +SRC_URI[sha256sum] = "f7a5e4839822750930a723f63a4edbf700e0fb8299a4b3637bd8bab5b1d098a7"
> +
> +EXTRA_OECONF = " \
> +             --plugdir=${libdir}/monkey/ \
> +             --logdir=/var/log/monkey/ \
> +             --pidfile=/var/run/monkey.pid \
> +             --default-user=www-data \
> +             --datadir=/var/www/monkey/ \
> +             --sysconfdir=${sysconfdir}/monkey/ \
> +             --enable-plugins=* \
> +             --disable-plugins=polarssl \
> +             --debug \
> +             --malloc-libc \
> +"
> +
> +inherit autotools pkgconfig update-rc.d systemd
> +
> +INITSCRIPT_NAME = "monkey"
> +INITSCRIPT_PARAMS = "defaults 70"
> +
> +SYSTEMD_SERVICE_${PN} = "monkey.service"
> +
> +FILES_${PN} += "/www"
> +
> +CONFFILES_${PN} = "${sysconfdir}/monkey/"
>

