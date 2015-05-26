Return-Path: <max.oss.09@gmail.com>
Received: from mail-wi0-f195.google.com (mail-wi0-f195.google.com
	[209.85.212.195])
	by mail.openembedded.org (Postfix) with ESMTP id 8043C75650
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 May 2015 17:28:12 +0000 (UTC)
Received: by wibbw19 with SMTP id bw19so8685694wib.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 May 2015 10:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:content-type:mime-version:content-transfer-encoding;
	bh=SFICXn7bxxLaAvwDNE503H43/aHqj6SO6YxHavxYYso=;
	b=VvUjgx6ltnFQyFybbk3M8CMJR+E/lytxonHo+9iNi0vRzUHg0PP2ZQ6am640RsIRXj
	sMxnUa0KnJxtjWdQFf2l8W5aAIapvvS2jXwNiWxsJCGrpnFsz6eyHNAFqXAC9L+Awocy
	L1aUVN4SQ44HaiDwucvnm+FWmwMByUE1YPX7VhjFC/6j9ztJmHUOGlQBQpeE26KumlNy
	enfFPWudWIYlWWr/122Z3/6dcZAYkCxG2h28Nnh1hNff6oFFTzQT/uhDuAbehWJ38hzn
	5J6tqbVd6VQygPNHKpxPfYpCwMzwo0oLwfSrtr14C/VNtjqzumb4GV03MHVtBE7Q/r7e
	SwNA==
X-Received: by 10.194.232.5 with SMTP id tk5mr41171471wjc.158.1432661293186;
	Tue, 26 May 2015 10:28:13 -0700 (PDT)
Received: from [192.168.0.7] (212-41-82-38.adsl.solnet.ch. [212.41.82.38])
	by mx.google.com with ESMTPSA id
	fs9sm22757055wjc.34.2015.05.26.10.28.11
	(version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128/128);
	Tue, 26 May 2015 10:28:12 -0700 (PDT)
Message-ID: <1432661286.2291.4.camel@Saturn.local.all>
From: Max Krummenacher <max.oss.09@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 26 May 2015 19:28:06 +0200
In-Reply-To: <1431771255-20841-1-git-send-email-max.oss.09@gmail.com>
References: <1431771255-20841-1-git-send-email-max.oss.09@gmail.com>
X-Mailer: Evolution 3.10.4 
Mime-Version: 1.0
Subject: Re: [meta-gnome][PATCH] florence: use ${SOURCEFORGE_MIRROR} in SRC_URI
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
X-List-Received-Date: Tue, 26 May 2015 17:28:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi all

Ping.

florence do_fetch currently fails because the server can't be found.

Regards
Max

Am Samstag, den 16.05.2015, 12:14 +0200 schrieb Max Krummenacher:
> http://switch.dl.sourceforge.net has been down for some time.
> Use the OE provided mirror variable instead.
> 
> Signed-off-by: Max Krummenacher <max.oss.09@gmail.com>
> ---
>  meta-gnome/recipes-support/florence/florence_0.5.1.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-gnome/recipes-support/florence/florence_0.5.1.bb b/meta-gnome/recipes-support/florence/florence_0.5.1.bb
> index 9eab385..71014f0 100644
> --- a/meta-gnome/recipes-support/florence/florence_0.5.1.bb
> +++ b/meta-gnome/recipes-support/florence/florence_0.5.1.bb
> @@ -10,7 +10,7 @@ PR = "r1"
>  
>  DEPENDS = "gtk+ libxml2 libglade librsvg libxtst gconf cairo intltool-native gnome-doc-utils libnotify"
>  
> -SRC_URI = "http://switch.dl.sourceforge.net/project/florence/florence/0.5.1/florence-0.5.1.tar.bz2 \
> +SRC_URI = "${SOURCEFORGE_MIRROR}/florence/florence/${PV}/florence-${PV}.tar.bz2 \
>             file://0001-Fix-glib-includes.patch"
>  SRC_URI[md5sum] = "56d12e5b47c100d9df172aa5ddc0f609"
>  SRC_URI[sha256sum] = "7b06ed84ef2b7b22d8d2cf0c7d013a05409bd82028240ac8719a68b192d5bc62"



