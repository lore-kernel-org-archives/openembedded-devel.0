Return-Path: <thomas.senyk@pelagicore.com>
Received: from mail-ee0-f41.google.com (mail-ee0-f41.google.com [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id 29BCC6F8E6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Mar 2014 14:36:39 +0000 (UTC)
Received: by mail-ee0-f41.google.com with SMTP id t10so3009194eei.28
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Mar 2014 07:36:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:organization
	:user-agent:in-reply-to:references:mime-version
	:content-transfer-encoding:content-type;
	bh=uYoYLduMouYcpz4Mq0ikllJFDS1wiPycNBaQajxOtVU=;
	b=EbECxQkLa7RkXQ9TBIoZI5Woqb2kWkpU2AXI5JpMdmZbfMqG9mPUtmdkIbtL+cueEV
	QR5hfLaPsRV9s6VqM2WMJC1a6aqbrDDKjwNJkAA4O8HVdwpM6ZWiuaUCSYRAo4dRO5V5
	KVZuyQMM4Mqy2jpf5BgL1/rkAsqNFgdiwMIvtqFGhsSylyDPkx0jeuyI+mhqMordqFXj
	eV2Nk77ydnLInexQFmPp46RuyEcfN4AJ1kTCzcoz3Yw9NiKVpBxXY67EhEAoMe7LAjJC
	CiQh3rt+C81ZU2jBLWUuuSiQshARoL1Z/C/3VLTpjwnPbsGiAkfaXCgufOw36xXbTSlc
	YS3Q==
X-Gm-Message-State: ALoCoQkVsEL7FOPDutXiYNozLvUBIbbIvnHHYFsfpCiyJ9ziVtKIYq5XVw/iFNirHR2apEsk+j5O
X-Received: by 10.14.194.70 with SMTP id l46mr702566een.95.1395931000555;
	Thu, 27 Mar 2014 07:36:40 -0700 (PDT)
Received: from rudolf.localnet (ppp-83-171-184-33.dynamic.mnet-online.de.
	[83.171.184.33])
	by mx.google.com with ESMTPSA id q49sm4737610eem.34.2014.03.27.07.36.39
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 27 Mar 2014 07:36:40 -0700 (PDT)
From: Thomas Senyk <thomas.senyk@pelagicore.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 27 Mar 2014 15:36:39 +0100
Message-ID: <5896879.V9IzFsXxVK@rudolf>
Organization: Pelagicore AG
User-Agent: KMail/4.12.3 (Linux/3.13.6-1-ARCH; KDE/4.12.3; x86_64; ; )
In-Reply-To: <1395930787-25372-1-git-send-email-thomas.senyk@pelagicore.com>
References: <1395930787-25372-1-git-send-email-thomas.senyk@pelagicore.com>
MIME-Version: 1.0
Subject: Re: [PATCH] qtbase.inc: add -no-xkbcommon
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
X-List-Received-Date: Thu, 27 Mar 2014 14:36:44 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

sorry I think I've missed 

--subject-prefix="meta-qt5][PATCH"

... Is that 'bad' enough to re-send it?

Is it:
--subject-prefix="meta-qt5][PATCH"
or
--subject-prefix="oe][meta-qt5][PATCH"

?

Greets
Thomas

On Thursday, 27 March, 2014 15:33:07 Thomas Senyk wrote:
> If one builds with xkb, both -no-xkb and
> -no-xkbcommon should be set.
> Without -no-xkbcommon you'll get link-errors
> for libcomposeplatforminputcontextplugin.so
> ---
>  recipes-qt/qt5/qtbase.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-qt/qt5/qtbase.inc b/recipes-qt/qt5/qtbase.inc
> index 89736be..8aefb5c 100644
> --- a/recipes-qt/qt5/qtbase.inc
> +++ b/recipes-qt/qt5/qtbase.inc
> @@ -105,7 +105,7 @@ PACKAGECONFIG[xsync] = "-xsync,-no-xsync"
>  PACKAGECONFIG[xvideo] = "-xvideo,-no-xvideo"
>  PACKAGECONFIG[openvg] = "-openvg,-no-openvg"
>  PACKAGECONFIG[iconv] = "-iconv,-no-iconv,virtual/libiconv"
> -PACKAGECONFIG[xkb] = "-xkb,-no-xkb,libxkbcommon"
> +PACKAGECONFIG[xkb] = "-xkb,-no-xkb -no-xkbcommon,libxkbcommon"
>  PACKAGECONFIG[evdev] = "-evdev,-no-evdev"
>  PACKAGECONFIG[mtdev] = "-mtdev,-no-mtdev,mtdev"
>  # depends on glib


