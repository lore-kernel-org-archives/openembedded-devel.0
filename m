Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id 1767460125
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Nov 2015 17:33:20 +0000 (UTC)
Received: by iodd200 with SMTP id d200so97410636iod.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Nov 2015 09:33:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems_com_br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc:content-type;
	bh=ZonVOkGT6JjoD1YXQK0PPKitF7REQ1w4k8MrhduH974=;
	b=mM8rw4jzGH2yVdAMdZ/QN0Xl88wtH/Q/xSBPgNrXb39mce09AYhZfbyKasLyvlsDeQ
	/EAWzncp6T/lCt0qMW8F67KyRUIJUWua+d1/JstlyFd1v7NckaR+wDLrC3X7AFBdSSSP
	XO49Wp2fgWvAN7TAiLgnLfe1i+oPO9ShbK8KMYjN+2yKEJycfsO6iXmwwSNKp1ct9BKx
	hQo6x5LBu+wcs9et3TAGkS9BXVYd7Uh6gTLJ2BCiv9KbRqsKWE1dsNjAwFt1m9vYM2bl
	nuQlo9OM9XBWXBvMieXO/0/7oKktrhgpFRCfjcjAAzNSAQkGOnN2WE1qZwtYQpUb7IFr
	HQKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=ZonVOkGT6JjoD1YXQK0PPKitF7REQ1w4k8MrhduH974=;
	b=KjD07kYdhY4WLFY7uRz8ZR2kdQya9LuV14lKsaBnpClkQJgZaLEu3Zcfegzyk/ugh2
	uWElYZ8YmYN5nY/jiJEZUhO0kEI0eMC8Ore8x4TOAwi7IROf9AZRuwwJGG+6FHwVYLSv
	LTeEaCSQ5AoYLhvVGHgggjrUqxQhnCAF/YYzdOzH1wYfDMU9z3YXOKov17rnA92Qwkw/
	s3I63HsALbo4s6clNRGizfj+QnoAsU77hZlxP/Y90/0gwoFzUYqjG/aFJzvM+kYwq+yH
	X1+05Meemowi65uZhHZjFdmMWx47BaPVv3n3kPYiTqeJRMD1cAPH4kMA2/2yHKv3G0q5
	X3wg==
X-Gm-Message-State: ALoCoQkCwJU0lHwwysL/JkWMg/zzUIW8Fkca56YPGIkt5spQoTHCrZ9hxWZ23zzVPeVweWXosdZk
X-Received: by 10.107.152.2 with SMTP id a2mr10531478ioe.123.1446744800680;
	Thu, 05 Nov 2015 09:33:20 -0800 (PST)
Received: from mail-ig0-f171.google.com (mail-ig0-f171.google.com.
	[209.85.213.171]) by smtp.gmail.com with ESMTPSA id
	f128sm3250553ioe.13.2015.11.05.09.33.19
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Nov 2015 09:33:19 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by igvi2 with SMTP id i2so15823962igv.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Nov 2015 09:33:18 -0800 (PST)
MIME-Version: 1.0
X-Received: by 10.50.25.162 with SMTP id d2mr4818998igg.46.1446744798798; Thu,
	05 Nov 2015 09:33:18 -0800 (PST)
Received: by 10.36.15.197 with HTTP; Thu, 5 Nov 2015 09:33:18 -0800 (PST)
In-Reply-To: <1446741911-8554-1-git-send-email-fabio.berton@ossystems.com.br>
References: <1446741911-8554-1-git-send-email-fabio.berton@ossystems.com.br>
Date: Thu, 5 Nov 2015 15:33:18 -0200
X-Gmail-Original-Message-ID: <CAP9ODKrNNx7N0xPKri0AMvHv_1O8aUEEQpun8VH_VQSAhOdGDQ@mail.gmail.com>
Message-ID: <CAP9ODKrNNx7N0xPKri0AMvHv_1O8aUEEQpun8VH_VQSAhOdGDQ@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: Fabio Berton <fabio.berton@ossystems.com.br>
Subject: Re: [meta-networking][PATCH v2] lldpd: Update to version 0.7.19
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
X-List-Received-Date: Thu, 05 Nov 2015 17:33:21 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Nov 5, 2015 at 2:45 PM, Fabio Berton
<fabio.berton@ossystems.com.br> wrote:
> The new release has following important changes, worth noticing:
>
> - fix-libevent-configure patch has been applied upstream
> - fix for CVE-2015-8012
>
> Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

