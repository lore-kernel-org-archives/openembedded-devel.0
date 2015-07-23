Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id 0C12473CBD
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jul 2015 11:23:52 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 0998BF811DF; Thu, 23 Jul 2015 05:23:52 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=10.0 tests=ALL_TRUSTED,BAYES_00,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 008C3F811DE;
	Thu, 23 Jul 2015 05:23:52 -0600 (MDT)
Message-ID: <55B0CECA.4050909@mlbassoc.com>
Date: Thu, 23 Jul 2015 05:23:54 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1437594429-21142-1-git-send-email-otavio@ossystems.com.br>
	<1437594429-21142-2-git-send-email-otavio@ossystems.com.br>
In-Reply-To: <1437594429-21142-2-git-send-email-otavio@ossystems.com.br>
Subject: Re: [meta-oe][PATCH v3 2/4] opencv: Add 'libv4l' PACKAGECONFIG
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
X-List-Received-Date: Thu, 23 Jul 2015 11:23:54 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2015-07-22 13:47, Otavio Salvador wrote:
> The i.MX SoCs need to allow the removal of libv4l support so a new
> PACKAGECONFIG option has been included.
>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

Acked-by: Gary Thomas <gary@mlbassoc.com>


BTW, this change allows all my cameras on my i.MX6 (TVIN, OV5640_mipi, Webcam)
to work with OpenCV :-)

> ---
>   meta-oe/recipes-support/opencv/opencv_2.4.bb | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-support/opencv/opencv_2.4.bb b/meta-oe/recipes-support/opencv/opencv_2.4.bb
> index f8946f4..75441fd 100644
> --- a/meta-oe/recipes-support/opencv/opencv_2.4.bb
> +++ b/meta-oe/recipes-support/opencv/opencv_2.4.bb
> @@ -30,7 +30,7 @@ EXTRA_OECMAKE = "-DPYTHON_NUMPY_INCLUDE_DIR:PATH=${STAGING_LIBDIR}/${PYTHON_DIR}
>                    ${@base_conditional("libdir", "/usr/lib32", "-DLIB_SUFFIX=32", "", d)} \
>   "
>
> -PACKAGECONFIG ??= "eigen jpeg png tiff v4l \
> +PACKAGECONFIG ??= "eigen jpeg png tiff v4l libv4l \
>                      ${@bb.utils.contains("DISTRO_FEATURES", "x11", "gtk", "", d)} \
>                      ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "libav", "", d)}"
>   PACKAGECONFIG[eigen] = "-DWITH_EIGEN=ON,-DWITH_EIGEN=OFF,libeigen,"
> @@ -40,6 +40,7 @@ PACKAGECONFIG[libav] = "-DWITH_FFMPEG=ON,-DWITH_FFMPEG=OFF,libav,"
>   PACKAGECONFIG[png] = "-DWITH_PNG=ON,-DWITH_PNG=OFF,libpng,"
>   PACKAGECONFIG[tiff] = "-DWITH_TIFF=ON,-DWITH_TIFF=OFF,tiff,"
>   PACKAGECONFIG[v4l] = "-DWITH_V4L=ON,-DWITH_V4L=OFF,v4l-utils,"
> +PACKAGECONFIG[libv4l] = "-DWITH_LIBV4L=ON,-DWITH_LIBV4L=OFF,v4l-utils,"
>   PACKAGECONFIG[jasper] = "-DWITH_JASPER=ON,-DWITH_JASPER=OFF,jasper,"
>
>   inherit distutils-base pkgconfig cmake
>

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

