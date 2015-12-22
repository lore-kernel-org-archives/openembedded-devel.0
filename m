Return-Path: <twoerner@gmail.com>
Received: from mail-qk0-f175.google.com (mail-qk0-f175.google.com
	[209.85.220.175])
	by mail.openembedded.org (Postfix) with ESMTP id 8416E6FFEF
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Dec 2015 04:40:48 +0000 (UTC)
Received: by mail-qk0-f175.google.com with SMTP id p187so145126659qkd.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Dec 2015 20:40:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=2WVhSZoCACxCHv0BwK0YiYRBmos5yevDc5KTvzqFPew=;
	b=mwE+b7BX68c3K0ykz0PbQ1Ts44ZXwQyWA9n3i4lYHgDDBnhNB9LhmFPeXWX7uTIvzI
	jlEX7rTlFrNHs6XN6sEL4/Ivr+tqvhtESCZ4S6Mz6S/hq4OvJoqfDXFYuv7B1LBjjGtc
	N/gGJ3sn6RIL8jy4Vn+G36aMHDublLo21P9Ue6PNJtvAaspYfhh+5rtADFWVppKZFGCE
	bvHf+X129Q1DRZqIxHuy1KGW0G6L9uXuOxSgPcEg8zxl7F6Fkc511ZuYdOq07AhQg403
	CbW4sgQCp3yxKf0of6ln23TXPVbSu0QSsgoLsRScVmPBdKVKlqoBMlKu8vtkKLeXo6nP
	7xzA==
X-Received: by 10.55.54.201 with SMTP id d192mr29690717qka.23.1450759248746;
	Mon, 21 Dec 2015 20:40:48 -0800 (PST)
Received: from [192.168.141.85] (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	u45sm15390217qgd.26.2015.12.21.20.40.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 21 Dec 2015 20:40:48 -0800 (PST)
To: Martin Jansa <martin.jansa@gmail.com>
References: <1448993965-32226-1-git-send-email-twoerner@gmail.com>
	<20151218115129.GE2563@jama>
From: Trevor Woerner <twoerner@gmail.com>
Message-ID: <5678D44A.3040600@gmail.com>
Date: Mon, 21 Dec 2015 23:40:42 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <20151218115129.GE2563@jama>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH v2] nodejs: cleanup and update
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
X-List-Received-Date: Tue, 22 Dec 2015 04:40:48 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 12/18/15 06:51, Martin Jansa wrote:
> On Tue, Dec 01, 2015 at 01:19:25PM -0500, Trevor Woerner wrote:
>> Remove old nodejs_0.4.12 and update nodejs_0.12.7 to the latest stable
>> nodejs_4.2.2.
> It does something strange with CC and ends with invalid parameter for
> qemuarm:
>
> arm-oe-linux-gnueabi-g++: error: unrecognized argument in option '-mfpu=vfpv2'
>
> http://errors.yoctoproject.org/Errors/Details/22678/

Nodejs (actually V8) dropped support for ARMv5 around V8 version 3.22
https://github.com/nodejs/node/issues/3061

A day or so ago I had generated a patch to switch the -mfpu option to
"vfp" (i.e. version 1) instead of vfpv2 (-mfpu=vfp). This allowed nodejs
to build for ARMv5, but when I tried running it, it just crashed and
said "illegal instruction". Since ARMv5 is not supported upstream
anymore I didn't think it was worth my time trying to get it to work. So
I simply removed armv5 from COMPATIBLE_MACHINE. See my v3 patch.

As to this specific error, it doesn't look like gcc5 accepts "vfp2" as
an option to mfpu:
https://gcc.gnu.org/onlinedocs/gcc/ARM-Options.html

