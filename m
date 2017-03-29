Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f44.google.com (mail-it0-f44.google.com
	[209.85.214.44])
	by mail.openembedded.org (Postfix) with ESMTP id 81DAC65D00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Mar 2017 08:35:25 +0000 (UTC)
Received: by mail-it0-f44.google.com with SMTP id y18so49067935itc.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Mar 2017 01:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=0LIuyGQ/YDB54r08cjDdh+YKAm7vTKGh1OePv61umJo=;
	b=WsYu2RzhCGBsAYTcIVnplou+eOfF/Wy5/RpV1qd9uPbUt0vc7VfJqJDWP2d8egAlXz
	Vb3Wotr9a+jETxncvtgDwB6NzL6TIO6eOhhMce2MfVOnCJwneI8/6lbsFJwPVp2Frz/3
	Gby6M1p5k4zWXcnDXYwI86SFSfF+I8OcGWtpc1GbbcnIB/eS0y615YG8tZ6CAn8+qAPi
	F6gkUzBehLUmNOXqDgIPSmta6ebQEgRZ0sUTo7OoKCRdZvR2FYLAyd3st2tZrfa6ucaF
	l0WF1oPCjybfBgo0+MHNwmQpLdNTLSzMfAcWKy9nbE7jk+qowQNnbzxXka+PhgHHvykx
	qp6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=0LIuyGQ/YDB54r08cjDdh+YKAm7vTKGh1OePv61umJo=;
	b=JBO42bURQH0Cg4dSSEKIwAyhabarxhAeHcT+G9gTwJ5eQpbo+k7YK1uQ5Is6JZmTCQ
	YNFuW/YLnuYGO3vtwUGjvVpSn5cWOl/Sfp3QKv8a4r8ueGIhLMHlqI89uwKBCv9Kt6Ip
	40cI+tkunAGGROS8AIgqfJSCfLAPg/VlV4jvC7IMr+3AHePbZvs9QvhvUKryDjMgtfhA
	LKRmSxvWiG4ObutXrVM1lxFbXiGErBX3uhQy+gxyhBg9mY2LBUU2Iyub9ZgaEUfJKEzh
	/sDkUWw9kbXJcgSDaR5ZTe9wj/TwSAZSnr5qAScv31VHT6n8bwqno+r1ApNl6lYvCFMl
	4Pag==
X-Gm-Message-State: AFeK/H0fSDATeY6sUUG3I1fUnnX1wCVMSljF+Xqpepj4zwJry72RzrKQ1qlOTrME07g/Ivu0
X-Received: by 10.107.138.14 with SMTP id m14mr34695042iod.235.1490776527296; 
	Wed, 29 Mar 2017 01:35:27 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8D6D7.dip0.t-ipconnect.de. [93.232.214.215])
	by smtp.gmail.com with ESMTPSA id
	m63sm3402823ioa.15.2017.03.29.01.35.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 29 Mar 2017 01:35:26 -0700 (PDT)
Message-ID: <1490776523.6396.407.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 29 Mar 2017 10:35:23 +0200
In-Reply-To: <20170329072316.GA3298@jama>
References: <20170329072316.GA3298@jama>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] State of bitbake world, Failed tasks 2017-03-27
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
X-List-Received-Date: Wed, 29 Mar 2017 08:35:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2017-03-29 at 09:23 +0200, Martin Jansa wrote:
> INFO: jenkins-job.sh-1.8.19 Complete log available at http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.report.20170328_014155.log

That used OE-core 552bd78, if I read this right:

        == Tested changes (not included in master yet) - openembedded-core ==
        latest upstream commit: 
        552bd78 wic: use kernel_dir to find systemd-efi bootloader

>     * openembedded-core/meta/recipes-core/ovmf/ovmf_git.bb:do_compile

http://errors.yoctoproject.org/Errors/Details/135202/

"gcc-ar: not found" - that should have been fixed by OE-core 23a12d87a6
"fix toolchain selection", which is included in OE-core 552bd78 and thus
should have been included in the build.

However, the error above was "Submitted on: 11/03/17 10:13", which was a
while ago and in particular before that fix.

Did ovmf really fail in the latest world build?

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




