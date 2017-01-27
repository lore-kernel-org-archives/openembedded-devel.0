Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 25F5B77471
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jan 2017 20:07:52 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id 194so25750410pgd.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jan 2017 12:07:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=fpewGaifDEgDnq1A0G8TGsCdCtDZmcS2ZwOkFtuux6s=;
	b=of5T9gP9cyhvDqjIRIYKfG2PHhbWR1WKbv6x/GOUdQwQqu9w2m4lO1Uv+XCTlLwOI8
	x3+SWNz1xuDtV2cpxzoIuW3R3HNE5tAuRmNCrpUXIiWe+E66+/pHE6wo0XqI4nX/9fJ0
	BdwADQlUYbhMC7PYQbQg5DxqOy1cULvsSmUDNKWaf+g7VJJRrtx8PGDJ73NeJ+Xt+7AE
	r6u1A1zwnM4wFe9dTtoyyM+LRRZTNnaBKbmKRg8mEgRSbMBvjMw418ciW2oxv166+PkP
	CyWAJOvToNHyEAEFrvv9TvNPHr3bHxytIZhnWrwqO9RLqHfs6N2M+rR7+7nUMr3rfaB+
	MDKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=fpewGaifDEgDnq1A0G8TGsCdCtDZmcS2ZwOkFtuux6s=;
	b=P38tf1SPckk7eXFAGUnR5vPcbSebr5l1Hf649+mEa7xb7nSiz/cpZpzn/6iKjtNBcW
	lJGDkmHIyZagGrBP5Tr2UTRy9wKk30AC25JMa82tV5wt0sg23/OJNzPocKrW4C/YFFfA
	YFdge6cUnsXoWMAOImYaZS7FaOFRvB+bX1oU9ywHgCGCE+ZiUMAJHj86kXe5Ue4axLT6
	MG4eb7P8rSPo2lDLtK8wCxI38ykP7DOeRh7f0WzjHXDnWcG4KbFFc/fJ/FGYc2K2MYJU
	RO0X3Umd8Xr8KfzeI0G6h7UCy5uJfQKZddjUOH/liScWTgG04RPY0iKrbuQvXUMTeIoL
	AihQ==
X-Gm-Message-State: AIkVDXKx/vQEgh96qQ6MAvQE/heXbmpuDnxKBE0+TQCzI+0yaHD84D/6GtxGMc83rfO0Dw==
X-Received: by 10.84.254.74 with SMTP id a10mr14762859pln.57.1485547673255;
	Fri, 27 Jan 2017 12:07:53 -0800 (PST)
Received: from CACSVMO-14452.local ([2601:646:8882:b8c:6d8d:a1ec:12d:52de])
	by smtp.gmail.com with ESMTPSA id
	d124sm13321849pga.30.2017.01.27.12.07.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 Jan 2017 12:07:52 -0800 (PST)
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>,
	Martin Jansa <martin.jansa@gmail.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
References: <20170127152157.15342-1-ricardo.ribalda@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <ba9f9b77-b2d7-5f10-3b48-14f3c8ea53e7@gmail.com>
Date: Fri, 27 Jan 2017 12:07:51 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <20170127152157.15342-1-ricardo.ribalda@gmail.com>
Subject: Re: [PATCH] opencv: Configure freetype via PACKAGECONFIG
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
X-List-Received-Date: Fri, 27 Jan 2017 20:07:54 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit



On 1/27/17 7:21 AM, Ricardo Ribalda Delgado wrote:
> Since: http://errors.yoctoproject.org/Errors/Details/117456/ opencv
> freetype module fails to build.
> 

I wonder if we need to export RANLIB in configure
along with CC and CXX

> This patch disables that module by default via PACKAGECONFIG until we
> find out a better way to do it.
> 
> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> ---
>  meta-oe/recipes-support/opencv/opencv_3.2.bb | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta-oe/recipes-support/opencv/opencv_3.2.bb b/meta-oe/recipes-support/opencv/opencv_3.2.bb
> index f18aa796f9aa..f47347ab4455 100644
> --- a/meta-oe/recipes-support/opencv/opencv_3.2.bb
> +++ b/meta-oe/recipes-support/opencv/opencv_3.2.bb
> @@ -61,6 +61,7 @@ PACKAGECONFIG[amdblas] = "-DWITH_OPENCLAMDBLAS=ON,-DWITH_OPENCLAMDBLAS=OFF,libcl
>  PACKAGECONFIG[amdfft] = "-DWITH_OPENCLAMDFFT=ON,-DWITH_OPENCLAMDFFT=OFF,libclamdfft,"
>  PACKAGECONFIG[dnn] = "-DBUILD_opencv_dnn=ON -DUPDATE_PROTO_FILES=ON -DBUILD_PROTOBUF=OFF,-DBUILD_opencv_dnn=OFF,lapack protobuf protobuf-native,"
>  PACKAGECONFIG[eigen] = "-DWITH_EIGEN=ON,-DWITH_EIGEN=OFF,libeigen gflags glog,"
> +PACKAGECONFIG[freetype] = "-DBUILD_opencv_freetype=ON,-DBUILD_opencv_freetype=OFF,freetype,"
>  PACKAGECONFIG[gphoto2] = "-DWITH_GPHOTO2=ON,-DWITH_GPHOTO2=OFF,libgphoto2,"
>  PACKAGECONFIG[gstreamer] = "-DWITH_GSTREAMER=ON,-DWITH_GSTREAMER=OFF,gstreamer1.0 gstreamer1.0-plugins-base,"
>  PACKAGECONFIG[gtk] = "-DWITH_GTK=ON,-DWITH_GTK=OFF,gtk+3,"
> 

