Return-Path: <changhyeok.bae@gmail.com>
Received: from mail-ua0-f169.google.com (mail-ua0-f169.google.com
	[209.85.217.169])
	by mail.openembedded.org (Postfix) with ESMTP id 843A0782C6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Sep 2017 14:22:34 +0000 (UTC)
Received: by mail-ua0-f169.google.com with SMTP id k63so773356uak.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Sep 2017 07:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=bwUT+QlJpOsunnA7hdeC1Ks6J8dMBCYW6mtNDxLODyQ=;
	b=LFBrFfx/ZMDWrUfwmM6WQ9jv9ezFeZiPnazW+QnRSX/DLfcvzmshgHHlGGm+V18gJH
	2tumvkFbZInJOTWuQT9A3/xQOBth6eJXcQ0yRdexLhRrSkAnPC2BShsaBXGS2Ay57IFi
	EyrxkoPM29huKErTY230X4tq/aRujgblRcPCpAg2fTzeJLTWlj+gkIsi6hh5+96Br9LF
	oSYGYVuRWuqmJ+QUMSuFyn4KYIPg4Tv/rYOMmeRhQ4dvshtyiMsIYvlnLIXZV3RvNGA3
	sqz+iMIwuTI0g8zmL19fnwfytZLhB0NGxbmMkoPbA/Cagfsvb6EYXo5JXSIlbuM7e0wZ
	gohQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=bwUT+QlJpOsunnA7hdeC1Ks6J8dMBCYW6mtNDxLODyQ=;
	b=jgFAiaQoJ8ok5E57BeXfT1LM8QK0WN/ROdZzadNp3ju+XzxyWck2QUnJ5Zq1FuZe7l
	vegIT2oD4+ztT7pL4q3mREUIbgvzp2m1I2s+f70Dywcka14R0r2ebi3PcY01Tb7faoU7
	t0NlJk96u4bDNyj7M2xV+5I6+fDTRGefcuKkbKlAzFLHHetsxSL0Lt2Rt4DXPk6aVpIH
	tR9ybSZjCOxOQ+cSzfguIwl4UnhdLOJrY2Q9ri3JFqXbK/yzcOxbPtAJR6uLrIUdkETW
	dwZAHdDZrOhluolhul0GdskW1xh6ll4Aj6n4fYnpeKcrn+Vanr5TT0jv2BFNJCxMnxHZ
	RgmA==
X-Gm-Message-State: AHPjjUj4QRw9j0JMvWwJSJ7Xg2U2YIYzv66hKUIYC9Lv6O06uwE1vAQW
	g/W8Y+hnp5jobqcsXNJXKtxOEF2T/zweXsjYtLg=
X-Google-Smtp-Source: AOwi7QCt4/T5TfHq3obbvxH7n3cEm/EHWYqdS058SUZoVshf7JHj53dtQVaZjCi4Pil7WCb1yL7FpMrPkVvZHh6biNI=
X-Received: by 10.176.25.218 with SMTP id r26mr5790042uai.97.1506090155167;
	Fri, 22 Sep 2017 07:22:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.87.70 with HTTP; Fri, 22 Sep 2017 07:22:34 -0700 (PDT)
From: Changhyeok Bae <changhyeok.bae@gmail.com>
Date: Fri, 22 Sep 2017 23:22:34 +0900
Message-ID: <CACrLJgAyV=KOputf8o8O9=Acqu=V7gSUyY6hhBBFPBVECTFhVQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: How to use two toolchains
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
X-List-Received-Date: Fri, 22 Sep 2017 14:22:34 -0000
Content-Type: text/plain; charset="UTF-8"

Hi

I would like to use 64 bit for kernel and 32 bit for userspace(rootfs).
Toolchain is created by OE (Not prebuilt toolchain)
Could you recommend good way to use different toolchains to achieve my goal?
If you have good examples, it's very helpful to me.

Thanks
Changhyeok

