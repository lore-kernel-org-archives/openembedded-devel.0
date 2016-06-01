Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-qg0-f67.google.com (mail-qg0-f67.google.com
	[209.85.192.67])
	by mail.openembedded.org (Postfix) with ESMTP id 43C4877323
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Jun 2016 13:43:23 +0000 (UTC)
Received: by mail-qg0-f67.google.com with SMTP id l75so13547412qgd.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Jun 2016 06:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=L2oBt/uOTSoiYcDJ1UViDDjc7DKjz60tZqQgDoXLSa4=;
	b=Y7LQqDlBIKvxnL8HIC/Ys5g3Yfe0fgzPMeqai2nzbALM3ArfinH1uOVddUIya5igrK
	ZGIpLtGMJFRtmY/9wkOX15lxzdowKLLNtE4L9g+UOXmmhxZ7hMRH3b49mhbHcM4H/uw5
	ELRJaYMkED6dtWBt+1qWhD1K9NBvTbIEV3pSUk55ZiHuWhQSuUzRgBfnDvtvWYusRGNn
	Va2DxxBap0j6s27kY9CksTAaWgh1L38RkTZJa9O9m7fjFRmTHoFIIqEMlhRGyW7rzX0o
	FffGp353AcJEsQcboFrZTcMwJ/zBkoPBF2UQiRonTuXKfVyUxDBa7slza02gSUgpzuif
	glhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=L2oBt/uOTSoiYcDJ1UViDDjc7DKjz60tZqQgDoXLSa4=;
	b=OsIgNXjkWxWmSK7WMSpv9zh30Dp6WuBW+WD+Ah5l9GqIJalvtEOZal1bswPqmTyICC
	UbDMVAxBtpYqxjj3BMT7Wxk0TWIyabQngqmAWebVQYHfJ/3cdfqgkfxv3FrobRRDYDTT
	Z9GOrxj8AydqT5Lsh1U/Nn8smIMWG95tNTpb1whlarZWwrc0kJfXy/oqvqu0Yy9lbs/B
	kmqm41ZK51ikkeaOHynL7rYimd78eF2b+5AoJbI+dvzZsjqsYo2Z0RFU/FU15hujCHn5
	PI7Mrxfwp5dHkIdkmnqWy2t2YCPS5TSg4xKByd9RbrVbl9U+9jt0tHhfrMya9d7DqCHr
	0p6w==
X-Gm-Message-State: ALyK8tKFUVfnch4kD6AvVUm1ITY+WjAPvkuHM+BUfZsCWRE6kTT7JDjI1s3Ut7qoXOvUsA==
X-Received: by 10.140.19.5 with SMTP id 5mr35600751qgg.98.1464788603637;
	Wed, 01 Jun 2016 06:43:23 -0700 (PDT)
Received: from mail-qk0-f182.google.com (mail-qk0-f182.google.com.
	[209.85.220.182])
	by smtp.gmail.com with ESMTPSA id 13sm10889051qhr.9.2016.06.01.06.43.21
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 01 Jun 2016 06:43:22 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qk0-f182.google.com with SMTP id y126so14494034qke.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Jun 2016 06:43:21 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.55.99.216 with SMTP id x207mr12795992qkb.163.1464788601676; 
	Wed, 01 Jun 2016 06:43:21 -0700 (PDT)
Received: by 10.237.54.197 with HTTP; Wed, 1 Jun 2016 06:43:21 -0700 (PDT)
In-Reply-To: <1464784422-7127-1-git-send-email-ricardo.ribalda@gmail.com>
References: <1464784422-7127-1-git-send-email-ricardo.ribalda@gmail.com>
Date: Wed, 1 Jun 2016 10:43:21 -0300
X-Gmail-Original-Message-ID: <CAP9ODKoZYt9A0ggaM3=6+uazqVVoNEFiU8vR6RofmWZGOiGW_w@mail.gmail.com>
Message-ID: <CAP9ODKoZYt9A0ggaM3=6+uazqVVoNEFiU8vR6RofmWZGOiGW_w@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-oe][PATCH] opencv: Make gphoto2 dep optional via PACKAGECONFIG
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
X-List-Received-Date: Wed, 01 Jun 2016 13:43:24 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jun 1, 2016 at 9:33 AM, Ricardo Ribalda Delgado
<ricardo.ribalda@gmail.com> wrote:
> Opencv can build without support for gphoto2 if needed.
>
> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

