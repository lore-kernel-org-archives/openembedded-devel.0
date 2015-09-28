Return-Path: <adrian.freihofer@gmail.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id D015776FC9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Sep 2015 07:09:54 +0000 (UTC)
Received: by wiclk2 with SMTP id lk2so90932940wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Sep 2015 00:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:subject:from:to:cc:date:content-type:mime-version
	:content-transfer-encoding;
	bh=OmUpEEGHDGLspWQ6dIgCaNtXa9eRbzQCgqTDk8xpnM4=;
	b=YIiNl1/YioXojJWXEOtvUB7Ok5B21AoLmE8KqurXCZg2KM/L5C4B3SX5aCpwWsbjMd
	eT1zyZMlnm4/LVt9Ps7nsoK4XeYvtYWPbraSCL9TCoXtCzsUo5/uWqghVhA0Wzjih08F
	JbT4i7jfDk2yuGV8+wd8BDtXGESM5fshKfQhRNpeOnpp+rcYoED2Efw/7/YLRpRH83hx
	W3++zBm7vEl78TmneRp3FmnKVCoV+QwqFMXH0GeoTjGsfudpR2Q+qXQvE9BeLRSTkW4f
	BtvXeCzM0BQoZEECUo+ygbMBq7dPo2TP3s78u8pLqCvEX+/Bx6mE187Faru82UiyiUYs
	CaXw==
X-Received: by 10.180.188.232 with SMTP id gd8mr4047215wic.0.1443424194031;
	Mon, 28 Sep 2015 00:09:54 -0700 (PDT)
Received: from minint-s4ms3ka.neratec.local (mail.neratec.com. [46.140.151.2])
	by smtp.gmail.com with ESMTPSA id
	h7sm16753098wjz.7.2015.09.28.00.09.52
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 Sep 2015 00:09:53 -0700 (PDT)
Message-ID: <1443424191.2504.94.camel@gmail.com>
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: martin.jansa@gmail.com
Date: Mon, 28 Sep 2015 09:09:51 +0200
X-Mailer: Evolution 3.16.5 (3.16.5-3.fc22) 
Mime-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 0/3] libgudev fixes
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
X-List-Received-Date: Mon, 28 Sep 2015 07:09:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Martin

Currently all my images/distros are without x11 and without alsa flag.
I cannot test the packages mentioned by you without creating a new
setup (distro/image). This is too much work for me. Sorry.

Regards,
Adrian


On Mon, Sep 21, 2015 at 10:59:32AM +0200, Adrian Freihofer wrote:
> Exclude usage of libgudev with older systemd versions providing
libgudev as
> well.
> Fix networkmanager and modemmanager to use libgudev instead of udev.

There are more libgudev dependencies according to QA log from last
world
build:

gstreamer1.0-plugins-bad-1.4.5: gstreamer1.0-plugins-bad-uvch264
rdepends on libgudev, but it isn't a build dependency? [build-deps]
gstreamer1.0-plugins-good-1.4.5: gstreamer1.0-plugins-good-video4linux2
rdepends on libgudev, but it isn't a build dependency? [build-deps]
gst-plugins-good-0.10.31: gst-plugins-good-video4linux2 rdepends on
libgudev, but it isn't a build dependency? [build-deps]
clutter-gst-3.0-3.0.8: clutter-gst-3.0 rdepends on libgudev, but it
isn't a build dependency? [build-deps]
gammu-1.32.0: gammu rdepends on libgudev, but it isn't a build
dependency? [build-deps]
devicekit-power-014: devicekit-power rdepends on libgudev, but it isn't
a build dependency? [build-deps]
network-manager-applet-1.0.4: network-manager-applet rdepends on
libgudev, but it isn't a build dependency? [build-deps]
cheese-2.30.1: cheese rdepends on libgudev, but it isn't a build
dependency? [build-deps]

are you interested in fixing some of these? Maybe some will be fixed
transitively from networkmanager

Thanks!

Regards,
> 
> Adrian Freihofer (3):
>   libgudev: exclude use with systemd <=220
>   networkmanager: depend on libgudev not on udev
>   modemmanager: depend on libgudev not on udev
> 
>  meta-oe/recipes-connectivity/modemmanager/modemmanager_1.4.2.bb    
 | 2 +-
>  meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.4.bb
| 2 +-
>  meta-oe/recipes-gnome/libgudev/libgudev_230.bb                     
 | 2 ++
>  3 files changed, 4 insertions(+), 2 deletions(-)
> 
> -- 
> 2.4.3
> 

-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa at gmail.com
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 181 bytes
Desc: Digital signature
URL: <http://lists.openembedded.org/pipermail/openembedded-devel/attach
ments/20150923/8de692e4/attachment-0001.sig>

