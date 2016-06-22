Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-vk0-f66.google.com (mail-vk0-f66.google.com
	[209.85.213.66])
	by mail.openembedded.org (Postfix) with ESMTP id 60EA073174
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jun 2016 14:20:03 +0000 (UTC)
Received: by mail-vk0-f66.google.com with SMTP id w1so8044167vka.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jun 2016 07:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to; 
	bh=zrvJvOvKFTIAKoebHSgyqVtISwlyuYpa8yJD4UsyuLQ=;
	b=FKnRhJc4krqaDSnQSNj8AwxgwDz85Uztfb1rLRB68hMeHdS2B+Fs5Vr+h1uIPAG+UP
	66ERkb7mbG4cqwJehwZhG9DcadhGmipCcLqEZkFTjvqVmtjTK7/Rm32ppWaP9KoufAxz
	Y1B0szxXrj84DOBiDMtKXYO3RuWSA0vWL1xbOXZ9D5f/au5/rXspf2mICfuUQbmYLUje
	cP38vy2ue8D7+UvwN3E/doY3wLuxzKvsF40FBI8iRwxYYcqLkWu0HDaqgOqfXUn5zaNY
	hjUsd0gr9nGOMxMw9z5Kvh4Eg97MmdMplErFLc7OEV2aedslJR+heRDh/NJYpk+z6HgE
	48LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to;
	bh=zrvJvOvKFTIAKoebHSgyqVtISwlyuYpa8yJD4UsyuLQ=;
	b=bL6Xh/dt1RcT7aGkr0YK1iLKvFdW5/2SS1skhbdPgxHBJWkl4pUS7xoRBN7QKS7A53
	NwTpd2655g6lWl0mZ5/PaW+wIl1kYwMzQ7cNR/KKZihJx+aQK6O7ND8IUB7r2fQy7gNo
	+94BQRhnh2aP5+3fvvYodhRiVDxAuPRdnXBX9Ob48MGcSCea/jUlHty1oQCAr09T91PS
	oI6qX//rhBomAxHs6TwY+dXoFFdfaz+UihA53M4lcWXwmjN8c54GtBxuhPczYDwGkAU6
	HIem0XL6O5haO+xkN0Gpml1udfXlRIBO4DCuFvggyVAKHyFfqq76l4L4kLKXQZzuL23J
	oORQ==
X-Gm-Message-State: ALyK8tJIofrVvI8l4N5V8bBpanPo4TR7m3a4M3nqYodLoKhQU4iEMJuCXklxfql+TSIVfA==
X-Received: by 10.31.202.71 with SMTP id a68mr12464098vkg.79.1466605203006;
	Wed, 22 Jun 2016 07:20:03 -0700 (PDT)
Received: from mail-vk0-f45.google.com (mail-vk0-f45.google.com.
	[209.85.213.45]) by smtp.gmail.com with ESMTPSA id
	x70sm10835057vkd.10.2016.06.22.07.20.01
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 22 Jun 2016 07:20:01 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-vk0-f45.google.com with SMTP id j2so63848556vkg.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jun 2016 07:20:01 -0700 (PDT)
X-Received: by 10.31.193.145 with SMTP id r139mr12315588vkf.4.1466605201169;
	Wed, 22 Jun 2016 07:20:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.192.195 with HTTP; Wed, 22 Jun 2016 07:20:00 -0700 (PDT)
In-Reply-To: <20160622141632.GA18936@awe-nav5>
References: <CAP9ODKqwQEaf-8BH-CeWrv6h=kdXe0gEcm+YMzqbNec4REeGJg@mail.gmail.com>
	<1466604652-18822-1-git-send-email-frederico.cadete@awtce.be>
	<20160622141632.GA18936@awe-nav5>
Date: Wed, 22 Jun 2016 11:20:00 -0300
X-Gmail-Original-Message-ID: <CAP9ODKp+yf=R+b+gtVVRgKQt8RA85gViQU6bAs1-xhZh2=QKEw@mail.gmail.com>
Message-ID: <CAP9ODKp+yf=R+b+gtVVRgKQt8RA85gViQU6bAs1-xhZh2=QKEw@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2] gtest: fix installation in multilib
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
X-List-Received-Date: Wed, 22 Jun 2016 14:20:03 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jun 22, 2016 at 11:16 AM, Frederico Cadete
<frederico.cadete@awtce.be> wrote:
> There it is, now with signed-off.
> It could also be useful to backport onto jethro and krogoth.
> It applies cleanly there.

Agreed however the request must be made after it is merged into master.


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

