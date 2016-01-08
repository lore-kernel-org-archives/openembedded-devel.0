Return-Path: <piotr.lewicki@elfin.de>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 130D560589
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Jan 2016 09:24:08 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id f206so161833848wmf.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Jan 2016 01:24:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=elfin-de.20150623.gappssmtp.com; s=20150623;
	h=from:subject:to:message-id:date:user-agent:mime-version
	:content-type:content-transfer-encoding;
	bh=hsCQf5ZZOjxhJ+xx04VAMdGP1osQtfIXUT9hTCaDWbs=;
	b=viRCfQ70nfcRXORy2gOH0xeC00fpimq9gmaxPcUJ7QeXNQxqDT4nJrmBu0YoCxSaNR
	lqcmtVqXjC/vxxW9r9s3NnnwhThyl0zYL+sdbALsZDvWlEyagQ9VEpRDuzeTyMjyrmBp
	wtY94w7aO1KgId5v1bA2qBpp4PKCJRFGREERzDkof3vbj966RTS0D2/rV9+88f/dd9hz
	VnvMpyFFRM5FRN/7yVhIOhkf/QV7ncxjSO+nzP4L8kZZS0YwOn7ABabddFq/+622jytN
	CkvryJJh8GQ2qrCIOFj/1lYdSdX+RhQhfORD4PqSRqZKPrJwvH5HFBLEmFm3id+D3FqA
	X0nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:subject:to:message-id:date:user-agent
	:mime-version:content-type:content-transfer-encoding;
	bh=hsCQf5ZZOjxhJ+xx04VAMdGP1osQtfIXUT9hTCaDWbs=;
	b=MMxEyTb7UM+AaKQgBrhtPFy0FmHh0HDf1kXjVXZI9t1kh9SMF2/Ge378p9FQQ+1R3N
	59wGDpvDbJFGR/xRwlIuH/1v6PPp1dvKd3tWN7Q1mHoarwjO6JYq6U7BaOF6ZYaMJEHE
	WIiw2drFWsOUVn04ccUZZqJAWB7h9UhfJxTrHKXr5ZLTo56Xz6P/mrn9/D+pwWeniXmO
	1PSTL9VHb2+b3E5PTRRWNFXVB+1Rl6tc9T+7X8bbed/34SWU2IdNSbVQdAPxv6FU4bVB
	H/PILIwoXKQn5S3V6j9df5NWv/Goo1HKHj0hOD45IAsrVXaEkMz6rDPIXpmZb5/dd1u0
	WDEQ==
X-Gm-Message-State: ALoCoQmmrUl08ArRl0GIAFxagOJTgVrA4Ly1m8BTUbu2JVbx52BXEFhES1z+QoWq9osWpPdby6U2toNnPS7YXn7Qh+FCw2XTSQ==
X-Received: by 10.195.13.201 with SMTP id fa9mr138315084wjd.68.1452245049084; 
	Fri, 08 Jan 2016 01:24:09 -0800 (PST)
Received: from [192.168.2.181] (b2b-94-79-174-114.unitymedia.biz.
	[94.79.174.114]) by smtp.gmail.com with ESMTPSA id
	a126sm17570338wmh.0.2016.01.08.01.24.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 08 Jan 2016 01:24:08 -0800 (PST)
From: Piotr Lewicki <piotr.lewicki@elfin.de>
To: openembedded-devel@lists.openembedded.org, paul.eggleton@linux.intel.com
Message-ID: <568F8037.4050902@elfin.de>
Date: Fri, 8 Jan 2016 10:24:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
Subject: Unblacklisting package
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
X-List-Received-Date: Fri, 08 Jan 2016 09:24:11 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Dear Paul and oe-devel list,
I've found as a part of this tread 
http://lists.openembedded.org/pipermail/openembedded-devel/2014-October/098410.html 
that you know how do "unblacklist" a package from my conf file.

>/You can still disable that PNBLACKLIST in your local.conf or distro.conf. /

I was trying to find out how to disable it but my research failed.
Could you share this knowledge with me?
I'm trying to unblacklist modphp package.

Best regards,
Piotr Lewicki

