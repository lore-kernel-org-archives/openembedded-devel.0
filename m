Return-Path: <zoltan.kuscsik@linaro.org>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id 822E773D46
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Nov 2015 05:49:33 +0000 (UTC)
Received: by wicll6 with SMTP id ll6so82956810wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Nov 2015 21:49:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linaro_org.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=0ciAnyAgddL1HOWKCtzI8LxPe9GJfYHY3BwvC29nzJ8=;
	b=Sd7bZADWBBLLpONX1dbMqlFHHuFFf+Zp7VdZDEWB6557MGwwWayy64sP5abZpIYu9g
	hb+Ba3R4/h5QQlSEiXzFwLG1pSHHorCqFYc7mlHqwL51aPuLSTtXj0nXgYtoOwT2PwLn
	BadsbmptRWgWwNLBXufeawYf/kqJyBlsDoHFO1QsLhnU8G3kD+j1Vzhzg9pUrn8HEQGh
	nYjhp2T6jkgXAs/op47vHvWoX3lz1GQqJi9kryKnAX0Gadox/A4WZoHxsU2XQqB+Bdna
	0UKURZJmLN20wOgaS/t/F9ocR1PNvb+HvuzSlbT73t+q4o3TM7b1SfSoy9ILMcEYXHHT
	nVvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to
	:content-type;
	bh=0ciAnyAgddL1HOWKCtzI8LxPe9GJfYHY3BwvC29nzJ8=;
	b=iMzX7LApqfSAEGJ1hfvLzIvpNsIf7+CzPTUzBL/JmSRdbR3roh6zXomWPDpOED44Ae
	FdZZnOwm02aZy1Gro4jcE1qTByBxlHUVuNXgUSDDmey2Lj2KZDXYsQ8RjLldB1WwM7pk
	DBbb2K1qfYhTLzCicpp3CzyyjLRraFrawoz2Psfc/6TJIQMNxfN81Qr7l2uamq2XV6Vv
	s529vm4hQXD6umd+T2E7ntWPoJY+mknIJ0YpdKpn/LrVOjHocsGzNwqZLTO4jod8nCwu
	2jB600t1ktKIqYTFY2EVg72ipdvJ2bVZOg7aicDq8AI8POkRcf6pgaJNhomRq3VKGPDp
	S48w==
X-Gm-Message-State: ALoCoQk8efZUUHU8DCQzhGJqRQ49P4lRLOhzfE+kC4RShOuLSCyuCbCThK4ijkqUciq9lVLYId/a
X-Received: by 10.194.22.234 with SMTP id h10mr33328872wjf.72.1446616173358;
	Tue, 03 Nov 2015 21:49:33 -0800 (PST)
MIME-Version: 1.0
Received: by 10.27.127.213 with HTTP; Tue, 3 Nov 2015 21:49:13 -0800 (PST)
From: Zoltan Kuscsik <zoltan.kuscsik@linaro.org>
Date: Wed, 4 Nov 2015 06:49:13 +0100
Message-ID: <CAAzKXnh+YUjyco6ZJWUEV5aHG8BfSB8ifmZqv5vxwcWMz_+irw@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [meta-browser] gclient/git support
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
X-List-Received-Date: Wed, 04 Nov 2015 05:49:35 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

I'm still in the progress of updating the meta-browse patches to a new
chromium release. It would be nice to use the  gclient to fetch the source,
but I realized that calling gclient from the recipe would break the way how
Wayland patches are added to SRC_URI.

I have submitted a gclient fetcher patch to bitbake-devel  which should
reduce
the complexity of the chromium recipes and make easier to keep Chromium in
sync with the wayland ozone project.

Here is a working example how we can fetch the full chromium source,
wayland-ozone and apply the wayland patches:

https://github.com/kuscsik/meta-testing/blob/master/recipes-core/fetcher/wayland-ozone-fetcher-test.bb

Comments are welcome.

Br,

Zoltan

