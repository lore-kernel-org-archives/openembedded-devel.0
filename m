Return-Path: <dachaac@gmail.com>
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by mail.openembedded.org (Postfix) with ESMTP id E33CF6014F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Oct 2016 18:27:24 +0000 (UTC)
Received: by mail-lf0-f67.google.com with SMTP id b75so100120lfg.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Oct 2016 11:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=Ch9qN+JlOAyoHt2jr3F8cX2MMsSRkWPHVBR0K+PYb0E=;
	b=GWnwvRp7sTYP9KFCJOjZjF8wG3J/M7Fx/kXRtWuaHsLCuXCLkiXBQHm1rrH+Jp39NJ
	DWY7IKMwNmE+b3xes0PZN+HiCP/KHk5+qMCnKBuHgw9uH+kA2WShGQ4UsE6bLZ+DlzkF
	8wX+8ppntSsYEO3OWhQB71qFsAcG+SNNKUdxJ1TXht/h6AL9uWTFf1uR4wD3vs6Keawg
	2RG1bm+yZPrd/iDuGnRqZt+Gvv+cNRdyOUE5PQ2qUPohh9/zV40rvvUnYXtvAiDaMb8g
	RzD0uPrpBI7v2CFMxV3xcg1CjRiBTKjNetP7lG4EwZ2bOPZ4l7ijTKwNFTX0rW63YEVG
	rimQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=Ch9qN+JlOAyoHt2jr3F8cX2MMsSRkWPHVBR0K+PYb0E=;
	b=KTqdaBRWFIrbuiuEzS4tf0tEpDn1TijM6Sd3NtM9h8Wwwf4QM1v+GD0WdubECsv2JX
	YNMIRta9B3RsiQo95a773NCDKYSwfshhif7GZkUURbGCJHKfPPG2JSzW2uqIiYCk0fbw
	fVUnGo1+EeU5x2avWVFgBWblS2LTiHRr47qH5wgKA1XE+11xO+L+a4W4Os+w/CzSAij2
	Pmc98d1jb8CLB+HZFaNKSmuHyKPL3uO/U9ou4qi92LQRca8OBlvwyb/jwBeAGZ3LmH6/
	i5bAwqHSa+VkHayR97iVaV27ASbsn3UT861cWkOn1Lnl1lRQ8i9Jl2mAtetUwoYK1n1S
	jPgw==
X-Gm-Message-State: AA6/9RkA2M4p5h7KH7+MDy0uyBh3FDOwxKUj0ewQsK/whjqdT0nyI9SFRuirkcOQDlQPhA==
X-Received: by 10.25.40.74 with SMTP id o71mr1896704lfo.183.1476815245076;
	Tue, 18 Oct 2016 11:27:25 -0700 (PDT)
Received: from ?IPv6:2001:14ba:80fe:4000:1dad:48c1:9280:9491?
	(dtd-fyyy911fpdfzywwkt-3.rev.dnainternet.fi.
	[2001:14ba:80fe:4000:1dad:48c1:9280:9491])
	by smtp.googlemail.com with ESMTPSA id
	f68sm3647233lfg.18.2016.10.18.11.27.24
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Oct 2016 11:27:24 -0700 (PDT)
To: openembedded-devel@lists.openembedded.org
References: <20160811034947.GW8521@denix.org> <20161018172329.GJ2494@denix.org>
From: =?UTF-8?B?VmVzYSBKw6TDpHNrZWzDpGluZW4=?= <dachaac@gmail.com>
Message-ID: <01175d17-569e-9507-ae81-20c16aa76ece@gmail.com>
Date: Tue, 18 Oct 2016 21:27:23 +0300
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20161018172329.GJ2494@denix.org>
Subject: Re: [meta-qt5] Latest Qt5 5.6.1+ update breaks qtwayland?
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
X-List-Received-Date: Tue, 18 Oct 2016 18:27:25 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On 18/10/2016 20.23, Denys Dmytriyenko wrote:

> On Wed, Aug 10, 2016 at 11:49:47PM -0400, Denys Dmytriyenko wrote:
>> Has anyone seen this:
>>
>> git/src/client/qwaylandintegration_p.h:91:29: error: 'QPlatformAccessibility* QtWaylandClient::QWaylandIntegration::accessibility() const' marked 'override', but does not override
>> |      QPlatformAccessibility *accessibility() const Q_DECL_OVERRIDE;
>>
> Ping on this one. Anyone else is seeing this? Is it C++11 specific? I'm using
> gcc-5.3 from Linaro...
>
Try the patch I sent earlier to this mailing list:
http://lists.openembedded.org/pipermail/openembedded-devel/2016-September/109281.html

FYI -- filed the bug report for this:
https://bugreports.qt.io/browse/QTBUG-56192

Thanks,
Vesa Jääskeläinen

