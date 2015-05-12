Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id 35F7974030
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 May 2015 21:18:17 +0000 (UTC)
Received: by wicnf17 with SMTP id nf17so32086373wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 May 2015 14:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ig0OCsTKwqkpzeT01/giJw7N5CYdSj1nZ0MxmzWlvMI=;
	b=BYuAZY28X/behGYkqkgmXYGSU6Im+Nyy/Yh3YbZPwPJLVKJZMCTlrzA35PmIi3ZTtW
	CYvTviDYA7wmh1dYXvL2/mlgug/cMgpsrgU3YBa0gpg5QfGlpsPh7+aXurOU1wbcFdDm
	oBZCdAL5dBBQqTUpGc6dDJekELSXt0fm05NNoaiu3QXPXRjXZ/miPrFeKvq5ZpqYtl2q
	CP54/otWjeiVBIeP6hbL6pZVARLpwCzhvB0ElNnZXUtfXre4eJqwnYFaLsrk+QGG4WYO
	CwiLTs2lwrtN2MEKHJ+u122mO9c5bnL0+T1fCMLoEwpaFHl5KsxhjXs6rGFMEoivRe1U
	1bpA==
X-Received: by 10.194.205.37 with SMTP id ld5mr34516110wjc.14.1431465498663;
	Tue, 12 May 2015 14:18:18 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id
	l20sm29566315wjw.42.2015.05.12.14.18.17
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 May 2015 14:18:17 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 12 May 2015 23:18:22 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150512211822.GE2714@jama>
References: <1430194195-1325-1-git-send-email-raj.khem@gmail.com>
	<1430194195-1325-3-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1430194195-1325-3-git-send-email-raj.khem@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-browser][PATCH 3/3] chromium, cef: Package codecs separately
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
X-List-Received-Date: Tue, 12 May 2015 21:18:19 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 28, 2015 at 04:09:55AM +0000, Khem Raj wrote:
> chromium does not use versioned shared objects so deal with it
> Remove the band-aid to pretend to have versioning shared objects
> put the ffmpeg plugins in directory of its own in /usr/lib to
> avoid namespace conflict with same .so coming from other codec packages

There is still some overlap between chromium and cef recipes:

ERROR: The recipe cef3 is trying to install files into a shared area
when those files already exist. Those files and their manifest location
are:
   /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/lib/chrome/libpdf.so
 Matched in manifest-qemux86-chromium.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/lib/chrome/libffmpegsumo.so
 Matched in manifest-qemux86-chromium.populate_sysroot
Please verify which recipe should provide the above files.

Can we please disable staging these 2 libraries in one of them?

Regards,

