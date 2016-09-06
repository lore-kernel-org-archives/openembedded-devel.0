Return-Path: <hasanvand.milad@gmail.com>
Received: from mail-oi0-f50.google.com (mail-oi0-f50.google.com
	[209.85.218.50])
	by mail.openembedded.org (Postfix) with ESMTP id 46B827738C
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Sep 2016 05:11:53 +0000 (UTC)
Received: by mail-oi0-f50.google.com with SMTP id s131so11879544oie.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Sep 2016 22:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to;
	bh=j+WWrOG32YcPRIrunMPZ3K7ZJtj8scjHkPZTcWNmvxU=;
	b=ma3Zf7ApxFXFSXdGYxRW6/KRq9vacWhI7zsvhbwRJLH1ef26ZmVl12BS6CPy6YG0f7
	/mPT6AGfeh+vEQsZg19LSgViGkFW8TkJfFoV0mcaZQZCDvZfUv3C07e7WcmoyItBlB6a
	O/6iB8cNOYAnUjmgz+6MBwehGzAyF99rBuKFjGt/xpbmxzMfLk4TycvG09E6I3taRjGd
	YLzMhg0iYhXctpPkqIslQqc4Gmx/6J9azmTRP6ME6L7YOGIW0LRuch5mpI/G40Igc5pp
	DMvrSk38/XbFriZJYoSWgTezUhLWA0ETa1pqieGPWPXx8K7ukHVyaG4c6p0q2A7jUGGJ
	yyaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=j+WWrOG32YcPRIrunMPZ3K7ZJtj8scjHkPZTcWNmvxU=;
	b=CN3w3vgMmIDuBfRvwYNgRv1MZ+z0vb5CuvynM3agIEK4XPwXpi0AM17tA8fmjeDXPW
	rPvdMyZz0Du3Xz4dHeU2JtmD/5wsUe9TrlLHyaEkt09SJQWTlABSasuSR0zz4LNEInRF
	+gpFA24ehk0kCkGhWnTlix7qlJQFCUZHKzxDUKEdrsbEZIpE0Q75+56/UaRx2NbeBy6P
	zA+v37xbXF5Oyfxj8gSYuEi0xsatavYwP/muwL+D9njmkT1JCPlsCYBm/bdv2XCMabCt
	tBQiwH5fgpOgZ46m/ggHrDykgUzVEg4J5tEaBF3MfmXwyYxMuZY95pRAnkafm0GaA/2e
	ymiA==
X-Gm-Message-State: AE9vXwOorqItH6auH0kvI/mWmpAVsFSgYI9V6X/OAifcYjHZe7u+yxhXcv0bQ3gjkjaf77XKEyIiBJUJGeoI9A==
X-Received: by 10.107.142.139 with SMTP id q133mr2866263iod.185.1473138713338; 
	Mon, 05 Sep 2016 22:11:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.79.0.26 with HTTP; Mon, 5 Sep 2016 22:11:52 -0700 (PDT)
From: milad hasanvand <hasanvand.milad@gmail.com>
Date: Tue, 6 Sep 2016 09:41:52 +0430
Message-ID: <CAPSYY_TerXvG8TiFfe_cWbzjcAQo-BjtmLVcxgXsOZt7JCPPgg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: question about yocto+qt5+qemu
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
X-List-Received-Date: Tue, 06 Sep 2016 05:11:53 -0000
Content-Type: text/plain; charset=UTF-8

Dear all,

please correct me if it not the right place to ask this question.
has anyone built qt5 using meta-qt5 and yocto(krogoth) for qemux8?

I have tested every possible hint I found on the internet but none of led
to a concrete solution.
sometimes the build process completes but it couldn't find or load eglfs.
linuxfb doesn't show the sample program and sometimes leads to system
freeze.
other situation it fails in qt5 do_compile or do_configure stage.

isn't there a solid solution to that? for example a reference local.conf
file or something similar such as the one in the following link:
http://wiki.wandboard.org/index.php/Building_Qt5_using_yocto_on_Wandboard

which also didn't work out for my case.



I will be thankful if anyone can help get passed this stage.



Regards;

*Milad Hasanvand*

*Connected Car System Designer @ AIRIC-SAIPA*

-------------------------------------------------------------------------------------------

<http://airic-ir.com/>

Automotive Industries Research & Innovation Center (AIRIC)
SAIPA Group

15th Km Karadj Makhsoos Rd., Tehran, Iran.
P.O. Box 13445/967
hasanvand.milad@airic-ir.com
Mobile:   +98 938 510 0152

