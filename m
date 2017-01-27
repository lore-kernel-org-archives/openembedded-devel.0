Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 958D96069C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jan 2017 10:10:10 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id c85so109555972wmi.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jan 2017 02:10:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to; 
	bh=8nKudHZMmoMRCR2I/OFFvXbm/yK92293zyJQrRvxMCU=;
	b=TT7mDPHOY68nuMi++9VcMSsT/Q0FiSQP+rvbSYIyBRxsIHez2cXHI2fWbWhLL3Va5I
	FS/y1GUm9ovqbB8PU7fRSaiEBK/km6prAOaS4ZFRg1qo5B9FocwbzQ41BnkcApnot+Yj
	zwAwpBfTwLkWUm9c3R9V/txJV+xdUArXAX2xItu6DozXcPmR9bw9nu5/aD1QHD+rNIMs
	vilrAd14LcTqlzPTGdtrJYO6GSdqzHgxe2kZ6UXDtIQZPJBtTtIINbu71hvs7hfh+Pbu
	IsInQhraUglmM2d/O9eReo0TQvVjRpYc/L2+86o84SnVYbq5q61XtzFYS8xqPrFbk1nI
	dYFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to;
	bh=8nKudHZMmoMRCR2I/OFFvXbm/yK92293zyJQrRvxMCU=;
	b=ZtPXYcND5ZmFsdhfhRGRan++IrPiLcuh9MIoJW9qAy1Ux3mGKVjPfHkgo6wXzbMMuf
	nIhr/MAsRRsUEPW5zkbdPcvkCUuMNR0yP1MFuj/DXwBpFq5PYiK7f+tb09PIE0kkB4iF
	39AnJ9CJ+kthljlRhL3gMJVBBDn+QXoeLseNfKL31shtz5HUnonqKzN4PQpLdADrpR56
	+/e7DIndjE6s1i9L4eWwHWP+SP9tav82iUxHhlF9DaePdCtAQpTh3esD6ffAxxXqX61r
	jh4gCHWVyD9jrQwsWDfMLOQUrzweCwm59unq8S5tmErO8OzRveRecnkrmo9iKo8dVIu1
	8lnw==
X-Gm-Message-State: AIkVDXIoEOtpvlzpFNNMkhU6B3v7Cd6oVYA4r9I/iPC4N9P68Nf7fLxf9Uym/axuziIb1Q==
X-Received: by 10.28.141.78 with SMTP id p75mr2209774wmd.114.1485511810593;
	Fri, 27 Jan 2017 02:10:10 -0800 (PST)
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com.
	[74.125.82.53]) by smtp.gmail.com with ESMTPSA id
	o143sm3060588wmd.3.2017.01.27.02.10.09
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 Jan 2017 02:10:09 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-wm0-f53.google.com with SMTP id c206so128916268wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jan 2017 02:10:09 -0800 (PST)
X-Received: by 10.223.130.204 with SMTP id 70mr6500660wrc.128.1485511809012;
	Fri, 27 Jan 2017 02:10:09 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.69.17 with HTTP; Fri, 27 Jan 2017 02:10:08 -0800 (PST)
In-Reply-To: <5dfb289d-2a44-1233-3761-f7e372c6dafc@gmail.com>
References: <1484608187-28597-1-git-send-email-max.krummenacher@toradex.com>
	<1484608187-28597-2-git-send-email-max.krummenacher@toradex.com>
	<CAEHkU3UX4NhOVvg6QXcuWgw_H5Z1EaOgih3Lsj9D+hfvC1s44A@mail.gmail.com>
	<5dfb289d-2a44-1233-3761-f7e372c6dafc@gmail.com>
Date: Fri, 27 Jan 2017 08:10:08 -0200
X-Gmail-Original-Message-ID: <CAP9ODKoPaq_wxJCBQk=o0d03uDUbmsJcYj7M34X3StNpJy7NwQ@mail.gmail.com>
Message-ID: <CAP9ODKoPaq_wxJCBQk=o0d03uDUbmsJcYj7M34X3StNpJy7NwQ@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-browser][PATCH 2/2] README: add -s to git send-email example
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
X-List-Received-Date: Fri, 27 Jan 2017 10:10:12 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jan 26, 2017 at 11:03 PM, Khem Raj <raj.khem@gmail.com> wrote:
> what happens if commits are already having a sign-off ?

A new one is added.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

