Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id AA84865C8A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Apr 2016 18:06:44 +0000 (UTC)
Received: by mail-pa0-f47.google.com with SMTP id r5so61328823pag.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Apr 2016 11:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to; 
	bh=+HCuAh0F4DXGeYwlf32ZlEs6xYaG8rN6u49IghAQ5xQ=;
	b=IWvrSbMUGKASo16siV+nSfQzL1yHMP3KU6YH+Nes8+vpfqQ8flV3DK3N9P+QYxC6ui
	+Cp8JnIOC+a1jg1ajI6Iw57+jbm/FoocZf1NqZaLOyRllZ3xgwB9ZXc4vqIpOzHtJ7vB
	/M7RVhbU56s1Lra4C0aLIhKkj9FmQxGJofqV2VqxtthR15Tmi+DLreCdLaqUulKe8Dv3
	p0vy4sHkZ/zRrg21r3TEQZVnGCI198qoshhfI1L4FO2JLe/mK0KoJQ9ZjBZkGPC6W8aQ
	38OyOX7Fj5SdbKIuNs0GW0Gbcrl9+O7zZPb5UUabPNiErhU/bxGexXus7LMDWFEFX6mk
	iq4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to;
	bh=+HCuAh0F4DXGeYwlf32ZlEs6xYaG8rN6u49IghAQ5xQ=;
	b=kj1LDVMErf/+FXWXvYW2xiUAoyG9uh+PQaOs0o3afx/UIOcMfyJl5wrHHG0l26aY/2
	713/6ROM4YecJ6t8KD7ZmYCXf3tVETL73Yr6GX2A5ozxZuC+cTzsbBHFR869TH66Wzlp
	mZkdLxZOA46Yly9ebwsTh3cwoufQydwdE5XT+Iu8jtAiRNU2fdqlqieOj099IdiaEqqp
	xF3bzgB4U6l772tivgTMZpqIRM6xI+fQNcF9cUWmaNPI5VAtKGAg60cW1HkWi1hdg0UN
	oT4FsWFxGbVDk0UKS88Tek+3SC2WUysfi60OVSWAJUe73GJz+P4lcdvxwiCJo4VU8EJ2
	zl2g==
X-Gm-Message-State: AOPr4FUbeVBded1FA/y2z226OBbegL6cM3lGjJRzAlCtm0J0LrbFJD8V60s9XDHjWrmdRg==
X-Received: by 10.66.33.1 with SMTP id n1mr50642164pai.65.1461607605411;
	Mon, 25 Apr 2016 11:06:45 -0700 (PDT)
Received: from mail-pf0-f174.google.com (mail-pf0-f174.google.com.
	[209.85.192.174]) by smtp.gmail.com with ESMTPSA id
	i67sm30415718pfb.56.2016.04.25.11.06.43
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 Apr 2016 11:06:44 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pf0-f174.google.com with SMTP id n1so71539506pfn.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Apr 2016 11:06:43 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.98.80.10 with SMTP id e10mr50730929pfb.141.1461607603558;
	Mon, 25 Apr 2016 11:06:43 -0700 (PDT)
Received: by 10.66.231.37 with HTTP; Mon, 25 Apr 2016 11:06:43 -0700 (PDT)
In-Reply-To: <CAAPZna3rXuTpEx1F=jzqUMRyCkD+xh6S_d+QR++XALMh6bBLZA@mail.gmail.com>
References: <CAAPZna3rXuTpEx1F=jzqUMRyCkD+xh6S_d+QR++XALMh6bBLZA@mail.gmail.com>
Date: Mon, 25 Apr 2016 15:06:43 -0300
X-Gmail-Original-Message-ID: <CAP9ODKrfCC+Nyr9EHd931gnoVsyngZ1hvBfBwT4izx4TiOf-Zg@mail.gmail.com>
Message-ID: <CAP9ODKrfCC+Nyr9EHd931gnoVsyngZ1hvBfBwT4izx4TiOf-Zg@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>, 
	Armin Kuster <akuster808@gmail.com>, Martin Jansa <martin.jansa@gmail.com>
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
X-List-Received-Date: Mon, 25 Apr 2016 18:06:48 -0000
Content-Type: text/plain; charset=UTF-8

Armin,

On Mon, Apr 25, 2016 at 10:45 AM, Fabio Berton
<fabio.berton@ossystems.com.br> wrote:
> Hi all,
>
> Recently I sent some python recipes for review and last week were merged to
> master. Could these recipes be backported for krogoth? I tested all them in
> krogoth branch.
>
> Recipes are listed bellow:
>
> python-bcrypt:              cb95c5edaa977c8361628dab04b95192c423fc1a
> python-blinker:             5a7f267941689eff28b4b0721752708bad4747b6
> python-flask-bcrypt:        00d5837fd39af7ffae262282f56a0cb42a1c3b89
> python-flask-bootstrap:     962e2ab371844f5119df2b8ab4a4231f6f7f9f3d
> python-flask-navigation:    381d498441bd66bdae2d8da1ddcaadee1ff6de73
> python-flask-sqlalchemy:    3e4ecdd6fe6709f394d92e86ccbc228ae5a43663
> python-flask-wtf:           4be70064670c34d1b67224672b7caed7b4ed7b04
> python-pam:                 49b35175d5018dc626a17a9a0662d97e812aab7c
> python-wtforms:             9676ebb7d14090126f667671d525ce3f3ee89279
> python-dominate:            5a20e8799eb1c1dd38ec9fee15fd90b88b38bba4
> python-netaddr:             d3767d923d5044604633be3a3ba8bb4564f51b04
> python-visitor:             834392bfada652260f6d5924278dd5839d095941

Please check above. To be honest, I think all in meta-oe master could
go to krogoth but you are the one to decide on this.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

