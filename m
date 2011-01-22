Received: from p3plsmtpa01-05.prod.phx3.secureserver.net ([72.167.82.85])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <mike@mwester.net>) id 1PgSGL-0000Ef-GJ
	for openembedded-devel@lists.openembedded.org;
	Sat, 22 Jan 2011 02:27:33 +0100
Received: (qmail 17416 invoked from network); 22 Jan 2011 01:26:38 -0000
Received: from unknown (209.242.7.132)
	by p3plsmtpa01-05.prod.phx3.secureserver.net (72.167.82.85) with ESMTP;
	22 Jan 2011 01:26:38 -0000
Message-ID: <4D3A3242.1020700@mwester.net>
Date: Fri, 21 Jan 2011 19:26:26 -0600
From: Mike Westerhof <mike@mwester.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.24) Gecko/20100228 Thunderbird/2.0.0.24 Mnenhy/0.7.6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1295598456-12847-1-git-send-email-raj.khem@gmail.com>
In-Reply-To: <1295598456-12847-1-git-send-email-raj.khem@gmail.com>
Subject: Re: [PATCH 1/2] slugos.conf: Define IMAGE_DEV_MANAGER to be udev
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
X-List-Received-Date: Sat, 22 Jan 2011 01:27:33 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 1/21/2011 2:27 AM, Khem Raj wrote:
> * Dont hardcode udev to RDEPENDS but use IMAGE_DEV_MANAGER
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

Acked-by: Mike Westerhof <mike@mwester.net>


> ---
>  conf/distro/slugos.conf      |    1 +
>  recipes/tasks/task-slugos.bb |    2 +-
>  2 files changed, 2 insertions(+), 1 deletions(-)
> 
> diff --git a/conf/distro/slugos.conf b/conf/distro/slugos.conf
> index 853a58e..96c2f45 100644
> --- a/conf/distro/slugos.conf
> +++ b/conf/distro/slugos.conf
> @@ -15,6 +15,7 @@ IPKG_VARIANT ?= "opkg-nogpg-nocurl-slugos"
>  PREFERRED_PROVIDER_opkg ?= "opkg-nogpg-nocurl-slugos"
>  PREFERRED_PROVIDER_virtual/update-alternatives ?= "opkg-nogpg-nocurl-slugos"
>  IMAGE_INITSCRIPTS ?= "initscripts-slugos"
> +IMAGE_DEV_MANAGER = "udev"
>  # Disable installing ldconfig
>  USE_LDCONFIG = "0"
>  require conf/distro/include/slugos.inc
> diff --git a/recipes/tasks/task-slugos.bb b/recipes/tasks/task-slugos.bb
> index 88475cd..ffaac67 100644
> --- a/recipes/tasks/task-slugos.bb
> +++ b/recipes/tasks/task-slugos.bb
> @@ -132,7 +132,7 @@ RDEPENDS_${PN} += "\
>  	kernel \
>  	base-files base-passwd netbase \
>          busybox initscripts-slugos slugos-init \
> -        update-modules udev \
> +        update-modules ${IMAGE_DEV_MANAGER}  \
>  	module-init-tools modutils-initscripts \
>  	libgcc \
>  	beep \



