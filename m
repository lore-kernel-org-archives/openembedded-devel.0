Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f171.google.com (mail-pf0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id 942E060797
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  1 May 2016 16:17:32 +0000 (UTC)
Received: by mail-pf0-f171.google.com with SMTP id 77so36012129pfv.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 01 May 2016 09:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=QtXW+ny1nrcMASm9itDlNGOaOiSUBWVn9LBWcDTaVhA=;
	b=AL9Sj6wvwZYodhrZgPuYchO4nIUyXHIJtZEoDWNte3KJBXR4KHFirhF4vnvKRmgCLE
	3ENT7PPFeu2vvQ0r/+Z0LSFdFjcTA7i8getJp99vVgNkcjldsR8EZy6eID5W6s/D3zkj
	R0r92sS67yifwsMbbdnDqk4InJO+DStjZW72KuHEHje9BBY6vywpatiWhw12I4d8bpl1
	wggkfuBgRskkWpBbsuQdju58KY+oKQcyvIyZweEaIDHUdPZaLaSjkEreNKvp50bZv2Y8
	0jrkAZ1ldpxIwg1kd0p/N9tQNYCUjiv5z79ENdOa+5kEd4JuJR1/LEFVTd/wu0TnPuhK
	QYZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=QtXW+ny1nrcMASm9itDlNGOaOiSUBWVn9LBWcDTaVhA=;
	b=DcpvI+Q6wmBfRkH06ezm3/kHybshvAHp1N8FNoe1eryGNG0D3sp14wMLXREx/SrNia
	CxegR22d+8vASEBmcDP77mMoiV/UdEFLMiv+bSaonznFxWAWFExza0+pzyHYZAP7jdUi
	+aBc6xMVDaTDRljzZDbT3thRpU1KptyW22H6dwBgrD0nmyKNr94vV7q55g++yetDw+dI
	yIQDzhe6GOb29wOg5WY/floSvgx7QjY4NI+VIuixMVap/mr1nRSEXzkNSvKOwGcIDwMB
	lQ4Y3onKs8piivP3YilOP5NHPjlTjPDyJRCMOk/gGoCHS0Lkj36x62djzY3XQwDPNhLB
	m5vg==
X-Gm-Message-State: AOPr4FUgkv9tp+N/f7WJ9jpSOMK3u6lx8OrSa/trsfuNiIDOoRJOGwivxGyTTeZMBUlq9w==
X-Received: by 10.98.83.65 with SMTP id h62mr45229370pfb.163.1462119453609;
	Sun, 01 May 2016 09:17:33 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1239:fdac:c1bf:3fbd:cfeb?
	([2601:202:4000:1239:fdac:c1bf:3fbd:cfeb])
	by smtp.googlemail.com with ESMTPSA id
	v75sm38481795pfa.94.2016.05.01.09.17.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 01 May 2016 09:17:32 -0700 (PDT)
To: Otavio Salvador <otavio.salvador@ossystems.com.br>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	Martin Jansa <martin.jansa@gmail.com>
References: <CAAPZna3rXuTpEx1F=jzqUMRyCkD+xh6S_d+QR++XALMh6bBLZA@mail.gmail.com>
	<CAP9ODKrfCC+Nyr9EHd931gnoVsyngZ1hvBfBwT4izx4TiOf-Zg@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <57262C1B.8020700@gmail.com>
Date: Sun, 1 May 2016 09:17:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <CAP9ODKrfCC+Nyr9EHd931gnoVsyngZ1hvBfBwT4izx4TiOf-Zg@mail.gmail.com>
Subject: Re: [meta-python][krogoth] Backport python recipes
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
X-List-Received-Date: Sun, 01 May 2016 16:17:33 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit



On 04/25/2016 11:06 AM, Otavio Salvador wrote:
> Armin,
> 
> On Mon, Apr 25, 2016 at 10:45 AM, Fabio Berton
> <fabio.berton@ossystems.com.br> wrote:
>> Hi all,
>>
>> Recently I sent some python recipes for review and last week were merged to
>> master. Could these recipes be backported for krogoth? I tested all them in
>> krogoth branch.
>>
>> Recipes are listed bellow:
>>
>> python-bcrypt:              cb95c5edaa977c8361628dab04b95192c423fc1a
>> python-blinker:             5a7f267941689eff28b4b0721752708bad4747b6
>> python-flask-bcrypt:        00d5837fd39af7ffae262282f56a0cb42a1c3b89
>> python-flask-bootstrap:     962e2ab371844f5119df2b8ab4a4231f6f7f9f3d
>> python-flask-navigation:    381d498441bd66bdae2d8da1ddcaadee1ff6de73
>> python-flask-sqlalchemy:    3e4ecdd6fe6709f394d92e86ccbc228ae5a43663
>> python-flask-wtf:           4be70064670c34d1b67224672b7caed7b4ed7b04
>> python-pam:                 49b35175d5018dc626a17a9a0662d97e812aab7c
>> python-wtforms:             9676ebb7d14090126f667671d525ce3f3ee89279
>> python-dominate:            5a20e8799eb1c1dd38ec9fee15fd90b88b38bba4
>> python-netaddr:             d3767d923d5044604633be3a3ba8bb4564f51b04
>> python-visitor:             834392bfada652260f6d5924278dd5839d095941
> 
> Please check above. To be honest, I think all in meta-oe master could
> go to krogoth but you are the one to decide on this.

seems reasonable to me.

- armin
> 

