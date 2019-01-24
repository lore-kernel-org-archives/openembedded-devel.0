Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D67866B96C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Jan 2019 04:27:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x0O4RodS025320
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Jan 2019 20:27:50 -0800 (PST)
Received: from [172.25.44.4] (172.25.44.4) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Wed, 23 Jan 2019 20:27:50 -0800
To: <openembedded-devel@lists.openembedded.org>
References: <20190124035832.14257-1-Randy.MacLeod@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <4dec5db8-8391-9c4f-74b0-a06c974358fc@windriver.com>
Date: Wed, 23 Jan 2019 23:27:48 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20190124035832.14257-1-Randy.MacLeod@windriver.com>
X-Originating-IP: [172.25.44.4]
Subject: Re: [PATCH] libvncserver: Update to latest commit post 0.9.12
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
X-List-Received-Date: Thu, 24 Jan 2019 04:27:50 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 1/23/19 10:58 PM, Randy MacLeod wrote:
> Update to latest git HEAD which includes a fix for CVE-2018-15127.
> 
> Support for lzo in addition to a bundled minilzo was added so
> add a PACKAGECONFIG[lzo] and add it to the default config.
> 
> Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
> ---
>   meta-oe/recipes-graphics/libvncserver/libvncserver_git.bb | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-oe/recipes-graphics/libvncserver/libvncserver_git.bb b/meta-oe/recipes-graphics/libvncserver/libvncserver_git.bb
> index 25917756f..b789055bb 100644
> --- a/meta-oe/recipes-graphics/libvncserver/libvncserver_git.bb
> +++ b/meta-oe/recipes-graphics/libvncserver/libvncserver_git.bb
> @@ -5,10 +5,11 @@ PRIORITY = "optional"
>   LICENSE = "GPLv2"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=361b6b837cad26c6900a926b62aada5f"
>   
> -PACKAGECONFIG ??= "gcrypt gnutls jpeg png ${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd','',d)} sdl zlib"
> +PACKAGECONFIG ??= "gcrypt gnutls jpeg png lzo ${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd','',d)} sdl zlib"
>   PACKAGECONFIG[gcrypt] = ",,libgcrypt,libgcrypt"
>   PACKAGECONFIG[gnutls] = ",,gnutls"
>   PACKAGECONFIG[jpeg] = ",-DWITH_JPEG=OFF,jpeg"
> +PACKAGECONFIG[lzo] = ",,lzo"
>   PACKAGECONFIG[openssl] = ",,openssl"
>   PACKAGECONFIG[png] = ",-DWITH_PNG=OFF,libpng,libpng"
>   PACKAGECONFIG[systemd] = ",,systemd"
> @@ -18,6 +19,6 @@ PACKAGECONFIG[zlib] = ",,zlib"
>   inherit cmake
>   
>   SRC_URI = "git://github.com/LibVNC/libvncserver"
> -SRCREV = "f997b5a75fa171d79c5e568b7157fba83c8d8355"
> +SRCREV = "c0a23857a5c42b45b6d22ccf7218becd1fa69402"
>   
>   S = "${WORKDIR}/git"
> 

glibc builds are fine,
musl builds are underway.


There are some packaging warnings that I haven't fixed.

It would seem to me that the .so files should be separated
into:
libvncserver
libvncclient
along with a single -dev/dgb package just like debian does:

$ apt show libvnc<TAB>
libvncclient1        libvncclient1-dbg    libvncserver1 
libvncserver1-dbg    libvncserver-config  libvncserver-dev

I'm not sure what's in the -config package yet.

I'll make these packaging changes in another commit in a few days
unless someone objects or beats me to it.

-- 
# Randy MacLeod
# Wind River Linux

