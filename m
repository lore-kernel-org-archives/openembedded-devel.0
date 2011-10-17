Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RFvB5-0004JH-Eu
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Oct 2011 23:56:59 +0200
Received: by qam2 with SMTP id 2so826213qam.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Oct 2011 14:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=XK3B0itGpNsBiiKb/06fWth4G1CXsZQCKzLENGtgSPs=;
	b=VAq+yOok7Z7CVv70AZTWygggOYdr9QRVsX4Vdzkn12rsJY4z7Fh6bgtdzp6E8zB4Px
	kYzn2KIxIv5JuSd/3tZS4WpQ8OY1pRczRBeMN/lUCrrx1HqxOeaWFsdVx0vemlDzZIcn
	Uv8KF0fwuKaFyqYJ4Z8tFemLZ4C7fN4RdUgkE=
Received: by 10.224.185.148 with SMTP id co20mr17456276qab.83.1318888266938;
	Mon, 17 Oct 2011 14:51:06 -0700 (PDT)
Received: from [172.23.8.192] (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPS id hr6sm25633631qab.6.2011.10.17.14.51.04
	(version=SSLv3 cipher=OTHER); Mon, 17 Oct 2011 14:51:05 -0700 (PDT)
Message-ID: <4E9CA345.3090006@gmail.com>
Date: Mon, 17 Oct 2011 14:51:01 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1318852253-4171-1-git-send-email-schnitzeltony@gmx.de>
In-Reply-To: <1318852253-4171-1-git-send-email-schnitzeltony@gmx.de>
Subject: Re: [meta-efl][V3] epdfview: add initial recipe with version 0.1.8
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
X-List-Received-Date: Mon, 17 Oct 2011 21:56:59 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/17/2011 4:50 AM, Andreas Müller wrote:
> initial source taken from oe-classic epdfview_0.1.7.bb
> commit 44985d56bc556786812a0a02d6219afd31a7381d
>
> run tested on overo
>
> Signed-off-by: Andreas Müller<schnitzeltony@gmx.de>

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
>   meta-efl/recipes-efl/efl/epdfview_0.1.8.bb |   12 ++++++++++++
>   1 files changed, 12 insertions(+), 0 deletions(-)
>   create mode 100644 meta-efl/recipes-efl/efl/epdfview_0.1.8.bb
>
> diff --git a/meta-efl/recipes-efl/efl/epdfview_0.1.8.bb b/meta-efl/recipes-efl/efl/epdfview_0.1.8.bb
> new file mode 100644
> index 0000000..5351733
> --- /dev/null
> +++ b/meta-efl/recipes-efl/efl/epdfview_0.1.8.bb
> @@ -0,0 +1,12 @@
> +DESCRIPTION = "A lightweight PDF viewer based on gtk and poppler"
> +HOMEPAGE = "http://www.emma-soft.com/projects/epdfview/"
> +LICENSE = "GPLv2+"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
> +SECTION = "x11/applications"
> +DEPENDS = "gtk+ poppler"
> +
> +inherit autotools gettext
> +
> +SRC_URI = "http://www.emma-soft.com/projects/epdfview/chrome/site/releases/epdfview-${PV}.tar.bz2"
> +SRC_URI[md5sum] = "e50285b01612169b2594fea375f53ae4"
> +SRC_URI[sha256sum] = "948648ae7c9d7b3b408d738bd4f48d87375b1196cae1129d6b846a8de0f2f8f0"



