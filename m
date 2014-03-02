Return-Path: <net147@gmail.com>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id 388036EF75
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  2 Mar 2014 04:15:38 +0000 (UTC)
Received: by mail-pa0-f47.google.com with SMTP id lj1so2436234pab.34
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 01 Mar 2014 20:15:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=Wm6qtIo3wTT5q8XTOxI8YEHDFSwapmU3st8uPlIIvOc=;
	b=B1upUXpX6YChhWQQreGt4+YhAnMBkjMGbWQW7OsbqvTyRyNg0vVjhkIeqxjVnoTuCf
	b1Y0h+wzX225ADBrOkY4WwDApvTGCWb/AacqMoHg4AHGgr3k1KzXR03NeVcL9q6pCFfs
	sLsQd/YsfyeWOOzWshZp9LvkBIS9D518plNuvmXOcwCMm8GmLql6Ww77AeWocdYDmNvB
	xr4wKJXo+yLu7iHk/YUCPhb0eOQIeArCmOe7V0+Jenh/i/jIldfg/kdZY3g8BhfB+KiW
	r7CVVIYL/9rRxUt9vdRpxEIp639M1rGMn7gucokYljxYM/mlTK+2meTtN32dVlce7BUt
	Tmew==
X-Received: by 10.69.31.171 with SMTP id kn11mr12406896pbd.47.1393733739467;
	Sat, 01 Mar 2014 20:15:39 -0800 (PST)
Received: from [192.168.0.2] (60-242-179-244.static.tpgi.com.au.
	[60.242.179.244])
	by mx.google.com with ESMTPSA id cz3sm21522614pbc.9.2014.03.01.20.15.37
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 01 Mar 2014 20:15:38 -0800 (PST)
Message-ID: <5312B064.9040404@gmail.com>
Date: Sun, 02 Mar 2014 15:15:32 +1100
From: Jonathan Liu <net147@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1393732560-14368-1-git-send-email-net147@gmail.com>
	<1393732560-14368-2-git-send-email-net147@gmail.com>
In-Reply-To: <1393732560-14368-2-git-send-email-net147@gmail.com>
Subject: Re: [meta-qt5][PATCH v3 2/2] packagegroup-qt5-toolchain-target: include all modules for development
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
X-List-Received-Date: Sun, 02 Mar 2014 04:15:42 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2/03/2014 2:56 PM, Jonathan Liu wrote:
> This adds the necessary target packages for development with all of the
> Qt 5 modules.
>
> Signed-off-by: Jonathan Liu <net147@gmail.com>
> ---
>   .../packagegroup-qt5-toolchain-target.bb           | 69 +++++++++++++++++-----
>   1 file changed, 55 insertions(+), 14 deletions(-)
>
> diff --git a/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb b/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb
> index 997df18..ac66f37 100644
> --- a/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb
> +++ b/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb
> @@ -11,30 +11,71 @@ PACKAGEGROUP_DISABLE_COMPLEMENTARY = "1"
>   USE_RUBY = " \
>       qtwebkit-mkspecs \
>       qtwebkit-dev \
> +    qtwebkit-qmlplugins \
> +"
> +
> +# Requires X11 to work
> +USE_X11 = " \
> +    qtx11extras-dev \
> +    qtx11extras-mkspecs \
>   "
>   
>   RDEPENDS_${PN} += " \
>       packagegroup-core-standalone-sdk-target \
>       libsqlite3-dev \
> -    qtbase-mkspecs \
> -    qtscript-mkspecs \
> -    qtxmlpatterns-mkspecs \
> -    qtdeclarative-mkspecs \
> -    qtsensors-mkspecs \
> +    qt3d-dev \
>       qt3d-mkspecs \
> -    qtlocation-mkspecs \
> -    qtsvg-mkspecs \
> +    qt3d-qmlplugins \
>       qtbase-dev \
> +    qtbase-fonts \
> +    qtbase-mkspecs \
> +    qtbase-plugins \
> +    qtbase-staticdev \
> +    qtconnectivity-dev \
> +    qtconnectivity-mkspecs \
> +    qtconnectivity-qmlplugins \
>       qtdeclarative-dev \
> -    qtscript-dev \
> -    qt3d-dev \
> +    qtdeclarative-mkspecs \
> +    qtdeclarative-plugins \
> +    qtdeclarative-qmlplugins \
> +    qtdeclarative-staticdev \
> +    qtgraphicaleffects-qmlplugins \
> +    qtimageformats-dev \
> +    qtimageformats-plugins \
>       qtlocation-dev \
> +    qtlocation-mkspecs \
> +    qtlocation-plugins \
> +    qtlocation-qmlplugins \
> +    qtmultimedia-dev \
> +    qtmultimedia-mkspecs \
> +    qtmultimedia-plugins \
> +    qtmultimedia-qmlplugins \
> +    qtquick1-dev \
> +    qtquick1-mkspecs \
> +    qtquick1-plugins \
> +    qtquick1-qmlplugins \
> +    qtquickcontrols-qmlplugins \
> +    qtscript-dev \
> +    qtscript-mkspecs \
>       qtsensors-dev \
> +    qtsensors-mkspecs \
> +    qtsensors-plugins \
> +    qtsensors-qmlplugins \
> +    qtserialport-dev \
> +    qtserialport-mkspecs \
>       qtsvg-dev \
> -    qtxmlpatterns-dev \
> -    qtdeclarative-dev \
> -    qtdeclarative-plugins \
> -    qtdeclarative-qmlplugins \
> -    qtgraphicaleffects-dev \
> +    qtsvg-mkspecs \
> +    qtsvg-plugins \
> +    qtsystems-dev \
> +    qtsystems-mkspecs \
> +    qtsystems-qmlplugins \
> +    qttools-dev \
> +    qttools-mkspecs \
> +    qttools-plugins \
> +    qttools-staticdev \
> +    qttools-tools \
>       ${@base_contains('BBFILE_COLLECTIONS', 'ruby-layer', '${USE_RUBY}', '', d)} \
> +    ${@base_contains('DISTRO_FEATURES', 'x11', '${USE_X11}', '', d)} \
> +    qtxmlpatterns-dev \
> +    qtxmlpatterns-mkspecs \
>   "
Patch v4 will add Wayland support.

Regards,
Jonathan

