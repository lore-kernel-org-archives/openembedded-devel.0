Return-Path: <ian@boundarydevices.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 6D8BB76E3F
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Nov 2015 01:12:37 +0000 (UTC)
Received: by wmff134 with SMTP id f134so98346208wmf.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Nov 2015 17:12:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=boundarydevices_com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=LL4puugpEMHM3uAy/aC5ucxcVPx7+Hx2MkMoIsMaRsE=;
	b=JjOUE4A6MC8kXhSrkdZ2PPz7mqE9JSmJhPvcvt6N0BkwBxK0KmxqbAtpSSCJE+KF/2
	xmQXpMjjscN7MOT/yvrMvptce6fEa/IOcXl6F4r8sh9DOCF1KBR7upAmYjKEQsiBFkvR
	RGBPYixQoUf8YClZ4XewCDmrS5c7tine86fS/0MMVVuBNKAjKAeXF5zHV+5vpdv6kdY3
	3QXWpCoNuQ/r3NhcBCqU0jWGhQ+4imX7nOIXETsoKtxIW2cMi9ZkN2w1ZL2yjxZUNeRw
	GMGi7l5h2q/woxdnRjWWQjzd7kCd4udzoC0Q8PzCBjYVn9FiL06qD3iShNAhPrYow7+f
	h/yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:date:message-id:subject:from:to
	:content-type;
	bh=LL4puugpEMHM3uAy/aC5ucxcVPx7+Hx2MkMoIsMaRsE=;
	b=fMYKna4xd+22+GkkMmseKbaAcUdOBhrz3AcNtTQpjUirURf6JYmBRdKFzGSEYmyDic
	jqi5+7Ogan35seiGnAHHgHiSu482gU9fCO1f001oC3cA8DV9yHn2yfEIOk78iahVgJGh
	pGDW7tNMrUrk36rS2RlRwCccI+bQNe4CCGGlyICK6WZW2rD5VCvPsFth29kWgdi4k1U0
	I5a8Sa3/mkCGdSbLXAfu/EotQEZujZYONkgfUbm7lsbOMsADc6ptaiavWrfmxmTvwKr0
	CI0/pFTNJJg0D+ncrGef8tRLho9iksNz4ZB1tWgmFoTbMuonLZLWiHVk4+LjmG5kaUqM
	hh5w==
X-Gm-Message-State: ALoCoQnlIEIalx1GBnPVx4P9QaP3Ohbdfgluup9XdFAFgZ1nwJxx9Fja1CuRXzy4RQVEjwH+gtZ9
MIME-Version: 1.0
X-Received: by 10.28.94.129 with SMTP id s123mr163451wmb.78.1446599557339;
	Tue, 03 Nov 2015 17:12:37 -0800 (PST)
Received: by 10.27.155.207 with HTTP; Tue, 3 Nov 2015 17:12:37 -0800 (PST)
Date: Tue, 3 Nov 2015 17:12:37 -0800
Message-ID: <CADseiPkMQaDUwMWP5V67XW0=0sW3i5TfYk72eZ8OafdM2dO9Ww@mail.gmail.com>
From: Ian Coolidge <ian@boundarydevices.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [meta-browser] chromium libffmpeg
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
X-List-Received-Date: Wed, 04 Nov 2015 01:12:41 -0000
Content-Type: text/plain; charset=UTF-8

Hello,

In the chromium recipe, there is a package chromium-codecs-ffmpeg which
puts libffmpegsumo.so in /usr/lib/chromium/. However, it only seems to work
when placed in /usr/bin/chromium/.

Is there a flag I can pass to chromium to look in /usr/lib/chromium/ for
that library? What step am I missing here?

Thanks!
-Ian Coolidge

