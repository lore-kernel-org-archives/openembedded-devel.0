Return-Path: <sven.ebenfeld@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 593B677246
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 31 Jan 2016 16:13:59 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id r129so5444947wmr.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 31 Jan 2016 08:14:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:references:in-reply-to:subject:date:message-id:mime-version
	:content-type:content-transfer-encoding:thread-index
	:content-language;
	bh=0PXamfqYbdmFEuAIDI5/096ZgwcpAezRzGqAk6w1YwY=;
	b=mE3jDzoZyiOgi2OHxBLHEY1Zv/vJMhZVXmTVVqNaVGbPlCgmJTETjrt6uSGcFwmIjL
	ogIAQAM2jUU47t5XQpJRJst2ZXJ1VEbHBk2sPHLNwIXmO/gU0eaiyEY1FxbYvLZABOhJ
	kTsWND+3d5yuLGPajonwCPRXP+L2Wg6qBtgM6N4gO3WOd6k3FrLHPW64EUN06b6jHgGw
	kdRodNdjDMcwYsIOdykIgDpTT57Ziqrpb6AbjgwCKPwXndnV5tRFqKQ/GmFM8+TLpsLw
	BAl8PikGOfEs2nC+9cWuO9CpQw22LCPADYoHgOYPsBS0UDVgPWzxuDX7HK5xxzf1Vpsd
	ARbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:references:in-reply-to:subject:date
	:message-id:mime-version:content-type:content-transfer-encoding
	:thread-index:content-language;
	bh=0PXamfqYbdmFEuAIDI5/096ZgwcpAezRzGqAk6w1YwY=;
	b=PoQrYkhiZV2oQGPJ+6nxwjbp0qFnEJPpq/IbBijuWdoz5IS5/0XnENb7ZOksrbZKHs
	fB0c3giZr2+Qi1kQ9l7aX/3mq0quMc8rXR3t47q/iCaABNngVyNe/BAocGwn+ELKYlvp
	efyMtyi4lsRyF6EtJdyBZnKo+GQTvRrZbkxD+UPdlQJCOjbOW6vcwlhoFRtlVHj7AcXN
	zN/FacUAREA24OpVpqWYEIXw7ThRsxTNa5TCHLo22mXPkmMm2J1s/MOjImIqyuwB2JQb
	U+6Fgav1tuJRrFR75ae2/29wtEruXJTMCUJ2ZcjY5ACiEOwapjR7TBWkE1i8caItdwfX
	WiTw==
X-Gm-Message-State: AG10YOSN4aoymyY2Rl7eIO7mWC49vy4gNQCGhF/Ww1FNKDZhPxuT/vYTBmQmejK93DQIZA==
X-Received: by 10.194.94.232 with SMTP id df8mr17914525wjb.25.1454256840395;
	Sun, 31 Jan 2016 08:14:00 -0800 (PST)
Received: from svenpc ([2001:470:1f0a:1031:191a:a0ec:75d9:34e8])
	by smtp.gmail.com with ESMTPSA id
	lc1sm24925650wjc.5.2016.01.31.08.13.59
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 31 Jan 2016 08:13:59 -0800 (PST)
From: "Sven Ebenfeld" <sven.ebenfeld@gmail.com>
To: <openembedded-devel@lists.openembedded.org>
References: <1454254968-8596-1-git-send-email-sven.ebenfeld@gmail.com>	<1454254968-8596-2-git-send-email-sven.ebenfeld@gmail.com>
	<CAMKF1sqD+vsprAKVV97YxXdbApfzkZCKKpdLQzZ40hqOoir=iQ@mail.gmail.com>
In-Reply-To: <CAMKF1sqD+vsprAKVV97YxXdbApfzkZCKKpdLQzZ40hqOoir=iQ@mail.gmail.com>
Date: Sun, 31 Jan 2016 17:13:58 +0100
Message-ID: <005501d15c42$649442d0$2dbcc870$@gmail.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 15.0
Thread-Index: AQJ7eOCU+0HdcZ4o/u3/rMFw/LeHEAGQzOV5AY/8w5edqIwlkA==
Subject: Re: [meta-oe][PATCH v2] mongodb: 2.6.0 -> 3.3.0 and remove	from pnblacklist
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
X-List-Received-Date: Sun, 31 Jan 2016 16:14:00 -0000
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: de

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On
> Behalf Of Khem Raj
> Sent: Sunday, January 31, 2016 5:02 PM
> To: openembeded-devel <openembedded-
> devel@lists.openembedded.org>
> Subject: Re: [oe] [meta-oe][PATCH v2] mongodb: 2.6.0 -> 3.3.0 and remove
> from pnblacklist
> 
> On Sun, Jan 31, 2016 at 7:42 AM, Sven Ebenfeld <sven.ebenfeld@gmail.com>
> wrote:
> > -DEPENDS = "openssl libpcre boost libpcap"
> > -# Mongo uses tcmalloc on x86_64, which is provided by gperftools
> > -DEPENDS_append_x86-64 = " gperftools"
> > +DEPENDS = "openssl libpcre libpcap zlib"
> 
> why is gperftools dep dropped ?

gperftools dependency is added by PACKAGECONFIG[tcmalloc] if the parameters
require it.

> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


