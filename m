Return-Path: <piotr.lewicki@elfin.de>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id B478C731D6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Sep 2016 14:29:22 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id 1so45059945wmz.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Sep 2016 07:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elfin.de; s=google;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=9mYG/4W3cP5f1c1spXuvaPLPK7k84/iV5h8OG4e9i9E=;
	b=Y79YOrkHST1nCIaW7KRptJ+7A4UMDRrwXtubxrtpQ3gojzEe8d+rdZ6qRrW5V9Da2I
	lrMYhwywK4JqgIF9pKl46zCduPM1kKW9jujd1EPUZND2s2za0tkwfaTY3M8UREoZEN9u
	sy0JAe41blE/kSeJyz83KUC42dHzTu/6zNg0wrLTwquQyqOug8yPR3/HLNj3cxoEcITx
	nQSoTsz1unRSw3RsflYbKUdLud+HKKgH/BKpGJNya2tTsKJTlf45Im27OBLalBdmbyQd
	teNUI1MMz1BDKIb3I6cBB+Bc/vOM5lTfu0Bx8Q6E72mpAzS/HUJqoMFskjqoJqpAspw1
	U62w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=9mYG/4W3cP5f1c1spXuvaPLPK7k84/iV5h8OG4e9i9E=;
	b=lMuThyhP3lKMkmy8nBbkXJcuqR2LDic4YiWwJ47hiA2FObKA7Cl1BWTFCEA+jnxl0A
	e3Bma3LeYlIaC0U1mtRNO3ozXDeERx/p2VRhLIpfrhT/+mT1u0n3xoZlolhK8m/nby7C
	ELUZhGZotsxZBs7LVEwqZqB5fLSz3LuisNXCXSlfbYjxJldCyV3cP6JizImPbNF53vqp
	5RxP7WTKpw8FwxKkCykVLcqq57NIZqLOXvHK1dVDnBMh23EMorZKIMjg8RynMVnDR5BL
	iG/8UA0zKilPBRG3wlh0gX2eBRVznREQQ72XuRCaHS+fid/xE2Wmq5w59bgxGj42GwYj
	fh0g==
X-Gm-Message-State: AE9vXwNVMCSMZGHnHwCQUCs/iqs8Tivy3NXNpIgsqBdxvaZ5/Qwf1x6Dn55eD4E8Gtk+qA==
X-Received: by 10.28.66.156 with SMTP id k28mr8018209wmi.58.1474036162644;
	Fri, 16 Sep 2016 07:29:22 -0700 (PDT)
Received: from [192.168.2.170] (b2b-94-79-174-114.unitymedia.biz.
	[94.79.174.114])
	by smtp.gmail.com with ESMTPSA id l3sm8693879wjp.17.2016.09.16.07.29.21
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 16 Sep 2016 07:29:22 -0700 (PDT)
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
References: <3a7cc6c5-fec8-ee48-5492-8e3d91488bc1@elfin.de>
From: "piotr.lewicki" <piotr.lewicki@elfin.de>
Message-ID: <7092297e-7837-f90e-f2c6-33c674b60391@elfin.de>
Date: Fri, 16 Sep 2016 16:29:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <3a7cc6c5-fec8-ee48-5492-8e3d91488bc1@elfin.de>
Subject: Re: [meta-qt5][bug] configure step of qtdeclarative fail during "populate_sdk" step
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
X-List-Received-Date: Fri, 16 Sep 2016 14:29:26 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Just a follow up.

The SDK was built properly after making a clean build.


BR,

Piotr


On 14.09.2016 14:39, piotr.lewicki wrote:
> Hi,
>
> I just tried to execute "populate_sdk" step but my build failed due to 
> the error in "nativesdk-qtdeclarative". (log below)
>
> I use the newest version of meta-qt5 
> (4656ab3636c099906989e0d923e1ac7a8ffe7b31) and I'm building an image 
> for raspberry pi.
>
> Could you help me with this?
>
>
> Thank you,
>
> Piotr Lewicki
>
>
> ERROR: nativesdk-qtdeclarative-5.7.0+gitAUTOINC+d48b397cc7-r0 
> do_configure: Error calling 
> /home/piotr.lewicki/yocto-raspberry/2016-08-15/build/tmp/sysroots/x86_64-linux/usr/bin/qt5/qmake 
> -makefile -o Makefile     CONFIG+=OE_QTXMLPATTERNS_ENABLED 
> /home/piotr.lewicki/yocto-raspberry/2016-08-15/build/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-qtdeclarative/5.7.0+gitAUTOINC+d48b397cc7-r0/git/qtdeclarative.pro 
>
> ERROR: nativesdk-qtdeclarative-5.7.0+gitAUTOINC+d48b397cc7-r0 
> do_configure: Function failed: do_configure (log file is located at 
> /home/piotr.lewicki/yocto-raspberry/2016-08-15/build/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-qtdeclarative/5.7.0+gitAUTOINC+d48b397cc7-r0/temp/log.do_configure.17400)
> ERROR: Logfile of failure stored in: 
> /home/piotr.lewicki/yocto-raspberry/2016-08-15/build/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-qtdeclarative/5.7.0+gitAUTOINC+d48b397cc7-r0/temp/log.do_configure.17400
> Log data follows:
> | DEBUG: Executing python function sysroot_cleansstate
> | DEBUG: Python function sysroot_cleansstate finished
> | DEBUG: Executing shell function qmake5_base_preconfigure
> | Previously configured separate build directory detected, cleaning 
> /home/piotr.lewicki/yocto-raspberry/2016-08-15/build/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-qtdeclarative/5.7.0+gitAUTOINC+d48b397cc7-r0/build
> | DEBUG: Shell function qmake5_base_preconfigure finished
> | DEBUG: Executing shell function do_configure
> | NOTE: qmake prevar substitution: ' CONFIG+=OE_QTXMLPATTERNS_ENABLED'
> | ERROR: Error calling 
> /home/piotr.lewicki/yocto-raspberry/2016-08-15/build/tmp/sysroots/x86_64-linux/usr/bin/qt5/qmake 
> -makefile -o Makefile     CONFIG+=OE_QTXMLPATTERNS_ENABLED 
> /home/piotr.lewicki/yocto-raspberry/2016-08-15/build/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-qtdeclarative/5.7.0+gitAUTOINC+d48b397cc7-r0/git/qtdeclarative.pro
> | 
> /home/piotr.lewicki/yocto-raspberry/2016-08-15/build/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-qtdeclarative/5.7.0+gitAUTOINC+d48b397cc7-r0/git/.qmake.conf:1: 
> Cannot find feature qt_build_config
> | Could not find qmake configuration file linux-oe-g++.
> | Error processing project file: 
> /home/piotr.lewicki/yocto-raspberry/2016-08-15/build/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-qtdeclarative/5.7.0+gitAUTOINC+d48b397cc7-r0/git/qtdeclarative.pro
> | WARNING: exit code 1 from a shell command.
> | ERROR: Function failed: do_configure (log file is located at 
> /home/piotr.lewicki/yocto-raspberry/2016-08-15/build/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-qtdeclarative/5.7.0+gitAUTOINC+d48b397cc7-r0/temp/log.do_configure.17400)
> ERROR: Task 
> virtual:nativesdk:/home/piotr.lewicki/yocto-raspberry/2016-08-15/build/../layers/meta-qt5/recipes-qt/qt5/qtdeclarative_git.bb:do_configure 
> (virtual:nativesdk:/home/piotr.lewicki/yocto-raspberry/2016-08-15/build/../layers/meta-qt5/recipes-qt/qt5/qtdeclarative_git.bb:do_configure) 
> failed with exit code '1'
> NOTE: Tasks Summary: Attempted 4627 tasks of which 4573 didn't need to 
> be rerun and 1 failed.
> NOTE: Writing buildhistory
>
> Summary: 1 task failed:
> virtual:nativesdk:/home/piotr.lewicki/yocto-raspberry/2016-08-15/build/../layers/meta-qt5/recipes-qt/qt5/qtdeclarative_git.bb:do_configure 
>
> Summary: There were 2 ERROR messages shown, returning a non-zero exit 
> code.
>


