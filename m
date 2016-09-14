Return-Path: <piotr.lewicki@elfin.de>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 5A5346011F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Sep 2016 12:39:23 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id 1so28391028wmz.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Sep 2016 05:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elfin.de; s=google;
	h=to:from:subject:message-id:date:user-agent:mime-version
	:content-transfer-encoding;
	bh=LPaPQscLYj/HO/KOEYgSLtb+itgRkiTI9M0w/iaG1jo=;
	b=KHiZO0hKNRJV5HclLe7M2tEgi94095CKnWWijlyMkpgFWPMDO+xVltRfUHmQZdc7jU
	s/n+cicXJAv6UerRXGkXL92RkN9U2s/Y9kczWjnfIG/ZkTJAKJ55aLf2yQBp4qWC06Bd
	CiHXiHSUPNMyxFVFjfd9MglAKuhgsEU1LxFyvaOaB2lPcrC3HNgEF48I+cOAXmUnPNpt
	AK6nZTC0hVubhfw+O/jdp0/P0U+REyMz45P53I7A71cLiJN2J4faDA+QzMst7dRvjzjA
	qYNRME9Gcmdr3E++UPIpVdo29FeMkayFnoAmyzagi5YxiQkiFgzdKdtNuRdVVL59MWJ5
	Iqog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:to:from:subject:message-id:date:user-agent
	:mime-version:content-transfer-encoding;
	bh=LPaPQscLYj/HO/KOEYgSLtb+itgRkiTI9M0w/iaG1jo=;
	b=jDTJrSiHX6sPr3eL6dywR0l+WvwdFjHR2BsI0ICcbXBxcxTVeJEk5WXLrcJjco5QmQ
	m1P2oPSqqylKqy1HM7joZC8Uf7gcDkL/39eSb3NbyL0dent9znyRnFeSVuehK1uOjV+t
	PkKTC5wA1f6r1ycdlRUS/qQHmjZbmhDU/d99HQer+iMJh7/q6ySG1vZkbfA69bjsfIWI
	aHbk4YRF5bv2Izr3pP+Wl/+5zDEAMDaYbWNl9HdICb64fPD2qKgl2/NcQt6v2+Av+F2U
	NVjK4HguLlypkL6h9CyuMZRCBdrF5nLAvKpkg+hkGpp7qEMYQDcbkpA5+IdmAw+PWkEN
	y9xg==
X-Gm-Message-State: AE9vXwNZQt+zdAMY7cDq5eXVdG0W3KeHvhTiaBDrXdpmfKQO6o8Ol/1vS6xQtEIGLvG4pQ==
X-Received: by 10.194.243.10 with SMTP id wu10mr2430340wjc.130.1473856763986; 
	Wed, 14 Sep 2016 05:39:23 -0700 (PDT)
Received: from [192.168.2.170] (b2b-94-79-174-114.unitymedia.biz.
	[94.79.174.114]) by smtp.gmail.com with ESMTPSA id
	bl3sm4013749wjc.26.2016.09.14.05.39.23
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 14 Sep 2016 05:39:23 -0700 (PDT)
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
From: "piotr.lewicki" <piotr.lewicki@elfin.de>
Message-ID: <3a7cc6c5-fec8-ee48-5492-8e3d91488bc1@elfin.de>
Date: Wed, 14 Sep 2016 14:39:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
Subject: [meta-qt5][bug] configure step of qtdeclarative fail during "populate_sdk" step
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
X-List-Received-Date: Wed, 14 Sep 2016 12:39:24 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I just tried to execute "populate_sdk" step but my build failed due to 
the error in "nativesdk-qtdeclarative". (log below)

I use the newest version of meta-qt5 
(4656ab3636c099906989e0d923e1ac7a8ffe7b31) and I'm building an image for 
raspberry pi.

Could you help me with this?


Thank you,

Piotr Lewicki


ERROR: nativesdk-qtdeclarative-5.7.0+gitAUTOINC+d48b397cc7-r0 
do_configure: Error calling 
/home/piotr.lewicki/yocto-raspberry/2016-08-15/build/tmp/sysroots/x86_64-linux/usr/bin/qt5/qmake 
-makefile -o Makefile     CONFIG+=OE_QTXMLPATTERNS_ENABLED 
/home/piotr.lewicki/yocto-raspberry/2016-08-15/build/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-qtdeclarative/5.7.0+gitAUTOINC+d48b397cc7-r0/git/qtdeclarative.pro 

ERROR: nativesdk-qtdeclarative-5.7.0+gitAUTOINC+d48b397cc7-r0 
do_configure: Function failed: do_configure (log file is located at 
/home/piotr.lewicki/yocto-raspberry/2016-08-15/build/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-qtdeclarative/5.7.0+gitAUTOINC+d48b397cc7-r0/temp/log.do_configure.17400)
ERROR: Logfile of failure stored in: 
/home/piotr.lewicki/yocto-raspberry/2016-08-15/build/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-qtdeclarative/5.7.0+gitAUTOINC+d48b397cc7-r0/temp/log.do_configure.17400
Log data follows:
| DEBUG: Executing python function sysroot_cleansstate
| DEBUG: Python function sysroot_cleansstate finished
| DEBUG: Executing shell function qmake5_base_preconfigure
| Previously configured separate build directory detected, cleaning 
/home/piotr.lewicki/yocto-raspberry/2016-08-15/build/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-qtdeclarative/5.7.0+gitAUTOINC+d48b397cc7-r0/build
| DEBUG: Shell function qmake5_base_preconfigure finished
| DEBUG: Executing shell function do_configure
| NOTE: qmake prevar substitution: ' CONFIG+=OE_QTXMLPATTERNS_ENABLED'
| ERROR: Error calling 
/home/piotr.lewicki/yocto-raspberry/2016-08-15/build/tmp/sysroots/x86_64-linux/usr/bin/qt5/qmake 
-makefile -o Makefile     CONFIG+=OE_QTXMLPATTERNS_ENABLED 
/home/piotr.lewicki/yocto-raspberry/2016-08-15/build/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-qtdeclarative/5.7.0+gitAUTOINC+d48b397cc7-r0/git/qtdeclarative.pro
| 
/home/piotr.lewicki/yocto-raspberry/2016-08-15/build/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-qtdeclarative/5.7.0+gitAUTOINC+d48b397cc7-r0/git/.qmake.conf:1: 
Cannot find feature qt_build_config
| Could not find qmake configuration file linux-oe-g++.
| Error processing project file: 
/home/piotr.lewicki/yocto-raspberry/2016-08-15/build/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-qtdeclarative/5.7.0+gitAUTOINC+d48b397cc7-r0/git/qtdeclarative.pro
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_configure (log file is located at 
/home/piotr.lewicki/yocto-raspberry/2016-08-15/build/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-qtdeclarative/5.7.0+gitAUTOINC+d48b397cc7-r0/temp/log.do_configure.17400)
ERROR: Task 
virtual:nativesdk:/home/piotr.lewicki/yocto-raspberry/2016-08-15/build/../layers/meta-qt5/recipes-qt/qt5/qtdeclarative_git.bb:do_configure 
(virtual:nativesdk:/home/piotr.lewicki/yocto-raspberry/2016-08-15/build/../layers/meta-qt5/recipes-qt/qt5/qtdeclarative_git.bb:do_configure) 
failed with exit code '1'
NOTE: Tasks Summary: Attempted 4627 tasks of which 4573 didn't need to 
be rerun and 1 failed.
NOTE: Writing buildhistory

Summary: 1 task failed:
virtual:nativesdk:/home/piotr.lewicki/yocto-raspberry/2016-08-15/build/../layers/meta-qt5/recipes-qt/qt5/qtdeclarative_git.bb:do_configure
Summary: There were 2 ERROR messages shown, returning a non-zero exit code.


