Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 487A665CC2
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Jun 2016 09:47:04 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1b8PDQ-0004qC-Hz for openembedded-devel@lists.openembedded.org;
	Thu, 02 Jun 2016 11:47:00 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Jun 2016 11:47:00 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Jun 2016 11:47:00 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 2 Jun 2016 11:46:44 +0200
Message-ID: <niova4$jt0$1@ger.gmane.org>
References: <1464784422-7127-1-git-send-email-ricardo.ribalda@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
	Gecko/20100101 Thunderbird/45.1.0
In-Reply-To: <1464784422-7127-1-git-send-email-ricardo.ribalda@gmail.com>
Subject: Re: [meta-oe][PATCH] opencv: Make gphoto2 dep optional via PACKAGECONFIG
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
X-List-Received-Date: Thu, 02 Jun 2016 09:47:06 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Op 01-06-16 om 14:33 schreef Ricardo Ribalda Delgado:
> Opencv can build without support for gphoto2 if needed.

You're changing the default without mentioning it, so please add 'gphoto2'
into the default PACKAGECONFIG in v2 of this patch.

> 
> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com> --- 
> meta-oe/recipes-support/opencv/opencv_3.1.bb | 3 ++- 1 file changed, 2
> insertions(+), 1 deletion(-)
> 
> diff --git a/meta-oe/recipes-support/opencv/opencv_3.1.bb
> b/meta-oe/recipes-support/opencv/opencv_3.1.bb index
> 789512f9e0ac..512f1b3dea9b 100644 ---
> a/meta-oe/recipes-support/opencv/opencv_3.1.bb +++
> b/meta-oe/recipes-support/opencv/opencv_3.1.bb @@ -10,7 +10,7 @@
> ARM_INSTRUCTION_SET_armv5 = "arm"
> 
> DEFAULT_PREFERENCE = "-1"
> 
> -DEPENDS = "python-numpy libtool swig swig-native python bzip2 zlib
> glib-2.0 libwebp libgphoto2 protobuf protobuf-native" +DEPENDS =
> "python-numpy libtool swig swig-native python bzip2 zlib glib-2.0 libwebp
> protobuf protobuf-native"
> 
> SRCREV_opencv = "92387b1ef8fad15196dd5f7fb4931444a68bc93a" SRCREV_contrib
> = "5409d5ad560523c85c6796cc5a009347072d883c" @@ -54,6 +54,7 @@
> PACKAGECONFIG ??= "eigen jpeg png tiff v4l libv4l gstreamer samples tbb
> \ PACKAGECONFIG[amdblas] =
> "-DWITH_OPENCLAMDBLAS=ON,-DWITH_OPENCLAMDBLAS=OFF,libclamdblas," 
> PACKAGECONFIG[amdfft] =
> "-DWITH_OPENCLAMDFFT=ON,-DWITH_OPENCLAMDFFT=OFF,libclamdfft," 
> PACKAGECONFIG[eigen] = "-DWITH_EIGEN=ON,-DWITH_EIGEN=OFF,libeigen," 
> +PACKAGECONFIG[gphoto2] =
> "-DWITH_GPHOTO2=ON,-DWITH_GPHOTO2=OFF,libgphoto2," 
> PACKAGECONFIG[gstreamer] =
> "-DWITH_GSTREAMER=ON,-DWITH_GSTREAMER=OFF,gstreamer1.0
> gstreamer1.0-plugins-base," PACKAGECONFIG[gtk] =
> "-DWITH_GTK=ON,-DWITH_GTK=OFF,gtk+3," PACKAGECONFIG[jasper] =
> "-DWITH_JASPER=ON,-DWITH_JASPER=OFF,jasper,"
> 



