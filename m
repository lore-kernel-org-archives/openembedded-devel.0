Return-Path: <sledz@dresearch-fe.de>
Received: from mail-bk0-f49.google.com (mail-bk0-f49.google.com
	[209.85.214.49])
	by mail.openembedded.org (Postfix) with ESMTP id 4687A6E87E
	for <Openembedded-devel@lists.openembedded.org>;
	Tue, 28 Jan 2014 08:09:51 +0000 (UTC)
Received: by mail-bk0-f49.google.com with SMTP id v15so187413bkz.36
	for <Openembedded-devel@lists.openembedded.org>;
	Tue, 28 Jan 2014 00:09:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=zjVv7mYBuX6TWdWIUG21ZdedghcNERo8FtR+odeMRyw=;
	b=RJxomH3M8Hh5tJnCKMhjaXBvpNwutNLXNaiiB0fz1xkQt6GUJ+NHZfBH/QbIohhlS4
	sxNGtLspxDQaXW/pHLYk650TFbeQTmS+piRIfE80buq/71nzGPls258P7cdz2xTm2d3m
	ZaLdiVHxvMU4ySSZygWKppWAqGb54jt37HyBVjfv64ZsCrNPPLJJ/cR2Zylqvhcpu6VR
	jKcjP8bGUMf44tDrO5VU8Ef6bXIL3cNLzRfTs7jmvvV7czcbSZmknu5ntLG6d2rZ2GUj
	QeEDtSvaHha5Hlk2mAyKJ4tCvWV49rlrMFUyanEminIuS6jbwnMhzUdtAkmojh+bgGbk
	3/VQ==
X-Gm-Message-State: ALoCoQkbtql4B6VKINlgqism1trFUoRThtE/Yoj/s/tjYetcGhUBfqJXQOY4cHRJmsY30o2bM0KB
X-Received: by 10.205.25.6 with SMTP id rg6mr1216146bkb.10.1390896590941;
	Tue, 28 Jan 2014 00:09:50 -0800 (PST)
Received: from [172.29.23.6] (zk223.dresearch-fe.de. [217.92.177.116])
	by mx.google.com with ESMTPSA id
	tf11sm16153607bkb.17.2014.01.28.00.09.48 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 28 Jan 2014 00:09:49 -0800 (PST)
Message-ID: <52E765CB.3090600@dresearch-fe.de>
Date: Tue, 28 Jan 2014 09:09:47 +0100
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <52E686D4.4040906@dresearch-fe.de>
	<CAMKF1srbr9PCgJSbmXLFTPcMxsEwno7EUAKqc-ADzbiO1DU6kw@mail.gmail.com>
In-Reply-To: <CAMKF1srbr9PCgJSbmXLFTPcMxsEwno7EUAKqc-ADzbiO1DU6kw@mail.gmail.com>
X-Enigmail-Version: 1.6
Cc: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: Re: opencv QA issue
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
X-List-Received-Date: Tue, 28 Jan 2014 08:09:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27.01.2014 17:29, Khem Raj wrote:
> On Mon, Jan 27, 2014 at 8:18 AM, Steffen Sledz <sledz@dresearch-fe.de> wrote:
>> After the latest update of our build host (Fedora-18) the opencv build fails with an QA issue.
>>
>> -------------> snip <-------------
>> ERROR: QA Issue: non debug package contains .debug directory: opencv-apps path /work/cortexa9hf-vfp-neon-angstrom-linux-gnueabi/opencv/2.4.6+gitAUTOINC+c5afaa4e8d-r0/packages-split/opencv-apps/usr/share/OpenCV/java/.debug/libopencv_java246.so
>> WARNING: QA Issue: opencv-apps: found library in wrong location: /usr/share/OpenCV/java/libopencv_java246.so
>> opencv-apps: found library in wrong location: /usr/share/OpenCV/java/.debug/libopencv_java246.so
>> ERROR: QA run found fatal errors. Please consider fixing them.
>> ERROR: Function failed: do_package_qa
>> ERROR: Logfile of failure stored in: /CACHE/jenkins-workspace/hipos-dfe-closed/build-closed/tmp-eglibc/work/cortexa9hf-vfp-neon-angstrom-linux-gnueabi/opencv/2.4.6+gitAUTOINC+c5afaa4e8d-r0/temp/log.do_package.15005
>> NOTE: recipe opencv-2.4.6+gitAUTOINC+c5afaa4e8d-r0: task do_package: Failed
>> ERROR: Task 502 (/CACHE/jenkins-workspace/hipos-dfe-closed/meta-openembedded/meta-oe/recipes-support/opencv/opencv_2.4.bb, do_package) failed with exit code '1'
>> -------------> snap <-------------
>>
>> After some research we found that the libopencv_java246.so wasn't build before the mentioned build host update. I'm not a cmake guru, so i can't determine why it is build after this update.
>>
>> But it seems to be clear that the path /usr/share/OpenCV/java/.debug/libopencv_java246.so is not covered by the package-split definition in meta-oe/recipes-support/opencv/opencv_2.4.bb:
>>
>> -------------> snip <-------------
>> FILES_${PN} = ""
>> FILES_${PN}-apps = "${bindir}/* ${datadir}/OpenCV"
>> FILES_${PN}-dbg += "${libdir}/.debug"
> 
> it should be added like something below
> 
> FILES_${PN}-dbg += "${datadir}/OpenCV/java/.debug"
> 
> can you try it out if it fixes the problem.

The error is gone. But there's still a QA warning.

-------------> snip <-------------
WARNING: QA Issue: opencv-apps: found library in wrong location: /usr/share/OpenCV/java/libopencv_java246.so
opencv-dbg: found library in wrong location: /usr/share/OpenCV/java/.debug/libopencv_java246.so
-------------> snap <-------------

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058

