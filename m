Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QbizD-0006KX-Ne
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Jun 2011 02:50:35 +0200
Received: by pvf24 with SMTP id 24so491346pvf.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Jun 2011 17:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=o19TN2rgQB4WXz9TJKbmfxYm4YIbQW4MCYSBfuhzzYg=;
	b=f9ItuQFmKn8LliM3VgHGdp+3BJHglFX0+z4VYVi33Aooi+UREDhtP0IpNq3r7nUxdm
	i6KDYhq23IMKm9godqNpN3FKRThTqYz0w+1tpIUP34+AuK+TUItejMWXNSkZK3Gt98o5
	04T0gLIOdwzPVo3s6SdSTLP4vSTneeUGUOLQI=
Received: by 10.68.14.66 with SMTP id n2mr266472pbc.421.1309308412906;
	Tue, 28 Jun 2011 17:46:52 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id d1sm510048pbj.56.2011.06.28.17.46.51
	(version=SSLv3 cipher=OTHER); Tue, 28 Jun 2011 17:46:52 -0700 (PDT)
Message-ID: <4E0A75FB.5080204@gmail.com>
Date: Tue, 28 Jun 2011 17:46:51 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110516 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <cover.1309203431.git.otavio@ossystems.com.br>
	<0a7128c3166d0729292e664918b76cf5b7074fe5.1309203431.git.otavio@ossystems.com.br>
In-Reply-To: <0a7128c3166d0729292e664918b76cf5b7074fe5.1309203431.git.otavio@ossystems.com.br>
Subject: Re: [[meta-oe][PATCH 1/4] xf86-video-geode: add 2.11.12 version
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
X-List-Received-Date: Wed, 29 Jun 2011 00:50:36 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/27/2011 12:38 PM, Otavio Salvador wrote:
> Signed-off-by: Otavio Salvador<otavio@ossystems.com.br>
> ---
>   .../xorg-driver/xf86-video-geode_2.11.12.bb        |   11 +++++++++++
>   1 files changed, 11 insertions(+), 0 deletions(-)
>   create mode 100644 meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.12.bb
>
> diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.12.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.12.bb
> new file mode 100644
> index 0000000..d14d63e
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.12.bb
> @@ -0,0 +1,11 @@
> +require xorg-driver-video.inc
> +LIC_FILES_CHKSUM = "file://COPYING;md5=f8ad89d9d9a024f19d7dcc5acb044a42"
> +
> +DESCRIPTION = "X.org server -- Geode GX2/LX display driver"
> +PE = "1"
> +PR = "${INC_PR}.0"
> +
> +SRC_URI[md5sum] = "a99c521db731c2f1df309057a8465e4c"
> +SRC_URI[sha256sum] = "28d845d727d99bfa4d4b93c5486ec01b72eb222e0910a766089db1103b1c2d92"
> +
> +COMPATIBLE_HOST = "i.86.*-linux"

Is it available for strictly x86 or can x86_64 use it.


