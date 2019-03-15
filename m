Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id BE42A7C64B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Mar 2019 07:52:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x2F7pssg002470
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 15 Mar 2019 00:52:15 -0700
Received: from [128.224.163.218] (128.224.163.218) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.439.0;
	Fri, 15 Mar 2019 00:52:00 -0700
To: <raj.khem@gmail.com>
References: <20190315074751.47445-1-kai.kang@windriver.com>
	<20190315074751.47445-2-kai.kang@windriver.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <c8ef53de-3389-2081-6883-ee6de712cb5c@windriver.com>
Date: Fri, 15 Mar 2019 15:50:38 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190315074751.47445-2-kai.kang@windriver.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-gnome][Patch 1/2] libgtop: 2.38.0 -> 2.39.91
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
X-List-Received-Date: Fri, 15 Mar 2019 07:52:39 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2019/3/15 下午3:47, kai.kang@windriver.com wrote:
> From: Kai Kang <kai.kang@windriver.com>
>
> Update libgtop from 2.38.0 to 2.39.91.

Oops. Forgot  to update  commit message. V2 will be sent.

Kai


>
> * reset LIBGTOP_LIBS to avoid compile errors which caused by host
>    contamination
> * inherit upstream-version-is-even to ensures that the upstream
>    version check only accepts even minor(stable) versions.
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>   .../recipes-gnome/libgtop/libgtop_2.38.0.bb      | 13 -------------
>   .../recipes-gnome/libgtop/libgtop_2.40.0.bb      | 16 ++++++++++++++++
>   2 files changed, 16 insertions(+), 13 deletions(-)
>   delete mode 100644 meta-gnome/recipes-gnome/libgtop/libgtop_2.38.0.bb
>   create mode 100644 meta-gnome/recipes-gnome/libgtop/libgtop_2.40.0.bb
>
> diff --git a/meta-gnome/recipes-gnome/libgtop/libgtop_2.38.0.bb b/meta-gnome/recipes-gnome/libgtop/libgtop_2.38.0.bb
> deleted file mode 100644
> index 494934fe7..000000000
> --- a/meta-gnome/recipes-gnome/libgtop/libgtop_2.38.0.bb
> +++ /dev/null
> @@ -1,13 +0,0 @@
> -SUMMARY = "LibGTop2"
> -LICENSE = "GPLv2+"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
> -
> -inherit gnomebase lib_package gtk-doc distro_features_check gobject-introspection gettext
> -
> -# depends on libxau
> -REQUIRED_DISTRO_FEATURES = "x11"
> -
> -SRC_URI[archive.md5sum] = "bb0ce7de6b28694b40405eedac8a31b5"
> -SRC_URI[archive.sha256sum] = "4f6c0e62bb438abfd16b4559cd2eca0251de19e291c888cdc4dc88e5ffebb612"
> -
> -DEPENDS = "glib-2.0 libxau"
> diff --git a/meta-gnome/recipes-gnome/libgtop/libgtop_2.40.0.bb b/meta-gnome/recipes-gnome/libgtop/libgtop_2.40.0.bb
> new file mode 100644
> index 000000000..b594198a4
> --- /dev/null
> +++ b/meta-gnome/recipes-gnome/libgtop/libgtop_2.40.0.bb
> @@ -0,0 +1,16 @@
> +SUMMARY = "LibGTop2"
> +LICENSE = "GPLv2+"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
> +
> +inherit gnomebase lib_package gtk-doc gobject-introspection gettext upstream-version-is-even
> +
> +# depends on libxau
> +inherit distro_features_check
> +REQUIRED_DISTRO_FEATURES = "x11"
> +
> +SRC_URI[archive.md5sum] = "c6d67325cd97b2208b41e07e6cc7b947"
> +SRC_URI[archive.sha256sum] = "78f3274c0c79c434c03655c1b35edf7b95ec0421430897fb1345a98a265ed2d4"
> +
> +DEPENDS = "glib-2.0 libxau"
> +
> +EXTRA_OEMAKE += "LIBGTOP_LIBS="


-- 
Kai Kang


