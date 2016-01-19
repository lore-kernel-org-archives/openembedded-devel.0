Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-vk0-f53.google.com (mail-vk0-f53.google.com
	[209.85.213.53])
	by mail.openembedded.org (Postfix) with ESMTP id 4AC526FF76
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jan 2016 00:58:13 +0000 (UTC)
Received: by mail-vk0-f53.google.com with SMTP id k1so340101767vkb.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jan 2016 16:58:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=atZouIwjRFeIRBjhUUytK62fuc7twZuEQ92fgWi97ZY=;
	b=DNoArb4ZWoUWouant0SOW9dnGFz1FbpTUvzUSCr5RKhHxJPQdwnr/8qx2SxUBk3Rp+
	q5nZDPJwyAebJ+rGqi+Tu3KElSXun5xiEy3CGjzo6m36f0ioUkvdIVr/fSczj0AHge+8
	s+ZrEVhChlIEexQUp63LBuj563SnL/QzJix+MbUI1d8HNTj/2vK5nGiDiFMqBsnMychY
	u5+F9i2xhewnHzblo+R4uofXMonFT+kDZQ7CZLAGCUHDVWS2Pw91ch+/2pRoidL8VGU0
	Z/6rpcZg07eabGoW3So3g7oqmuMXupUBDW3ktMq1aXfL2D4Pl0ZhtrChfezRJl0Hby91
	3oKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to
	:content-type;
	bh=atZouIwjRFeIRBjhUUytK62fuc7twZuEQ92fgWi97ZY=;
	b=anxr+K66B41nmckWDkdFhdrxjPVTbOr+cY5NIjD5c/Qn29qISegvhwIR0HNCldUpnK
	oMYucnaKKOACY3pTb4YWhHh5sInX/jej2dELG/Vv4A4UdmD0vZCtSdGEEPChndRYpKmo
	CH9Ar5IjO6sF9wbhr7Z9dXJTz/1uhp9PRi2ylXMdTpRLPY7xWVAshhbAi7Q/yyzja/Jo
	vuslH5ST5KXeuYRpDt8/IDoql9a4AINOUO6I7N0v6vrPBhh3iu7GsBpUGBCwA7G/rpah
	Zyn0MDAlwji7V6S6ROsbgJKE0PzACFZ1ncxJulLEaMo8z7YavjyJfBbCwOxYVIo1A7Ia
	Fcvg==
X-Gm-Message-State: ALoCoQkG6ABe358Tz45sjbBKNkwcSdLyGvpaBDO8h+U5UaHvoAFQjsarLNen9ScSpy2+Bdezq6CoFyEJCzs3+Cl9Ldx1iH7SZQ==
X-Received: by 10.31.162.20 with SMTP id l20mr17030108vke.137.1453165094047;
	Mon, 18 Jan 2016 16:58:14 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.166.146 with HTTP; Mon, 18 Jan 2016 16:57:54 -0800 (PST)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Tue, 19 Jan 2016 13:57:54 +1300
Message-ID: <CADySD0EvwTFr-0hGLTJDGTVLyhEtju3Rgxj85R8Tv=etXnRPuw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: meta-toolchain-qt5 error on fido branch
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
X-List-Received-Date: Tue, 19 Jan 2016 00:58:13 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

While building qt5 toolchain, I am getting this error :

Collected errors:
 * satisfy_dependencies_for: Cannot satisfy the following dependencies for
packagegroup-core-standalone-sdk-target:
 *     libgcov-dev *
 * opkg_install_cmd: Cannot install package
packagegroup-core-standalone-sdk-target.

ERROR: Function failed: do_populate_sdk
ERROR: Logfile of failure stored in: /home/nws/yocto-fido-dev/oe-
layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa8hf-vfp-neon-linux-gnueabi/meta-toolchain-qt5/1.0-r0/temp/log.do_populate_sdk.65427
ERROR: Task 8
(/home/nws/yocto-fido-dev/oe-layersetup/sources/meta-qt5/recipes-qt/meta/
meta-toolchain-qt5.bb, do_populate_sdk) failed with exit code '1'

Complete log @ http://pastebin.com/CNuJk2i2

I have tried removing previous build tmp/work but still get this error on
fresh builds.

thanks

