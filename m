Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id 5E5B06FEFE
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Feb 2016 22:34:19 +0000 (UTC)
Received: by mail-pa0-f45.google.com with SMTP id ho8so92947109pac.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Feb 2016 14:34:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:content-type; bh=aPn3kFKtW6aANeNqXtfMJQXR5bOvdfrX0tiPpeWMYWM=;
	b=tze9jlUWzVCl73hsryzu9FM1Cwunz3DwyJ9Yrs6lcUHJdFPWZSyDvRSGk8XTWelSPC
	ZCbRlChR5dM4VIO07wyP2UcaLNLh00Og+s7+a1GItyhcCUgyGcffjrNq4/csWGi3dlzX
	IGEm0o5iDtqP9PIDdkPBYhvrwYi7Kc8F0vcAXWCNvR/c4U9a2iB1d0dZ8MEyWFZvQ8tD
	LpvjFdoC0xRkGSn6nIM/UhjC6Esu0FdOAkTSDGRoac9tjm0rhEtLMTpJMQAP9HqDbHaH
	nlwioTDUL+AopXMHVeiSJkOyeSI6C4u5jnJKikwUBpJ673j/u18mg6n1HjpAC5MVBQ8D
	upCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:content-type;
	bh=aPn3kFKtW6aANeNqXtfMJQXR5bOvdfrX0tiPpeWMYWM=;
	b=kbMgRHXzsLDJY/d4GXxHDKj7D5z5Xn1NOUWi3/80Z6gwCR6WWJ3u2xoCEDqgoYB2q+
	ePwst6RkL6Lc5zQIkbqv9hNZNrPo1nzukQZ5xhUe30pyB81XHcfS/iQ2ugwJXJ3Z1kCd
	YqCV6Ebp2LLz1Pmz89N/Tv6uiXSVNNe3ARndDSk5OWPeUgY0T7WljCBAYdLZXQBtGsE+
	QI9bbHc/8DcCxRJ0u6MDobxnZsZ/vHhUGwzyjQYK6pgEZHpYb8wLMiznMPs1BK6zaRKd
	wjx0B3tmun3QNkRI1BeKE/3ktnOhfycionUf//k1EL88Si8/gYNM9/2kLvjTlaZVJ3n2
	08lg==
X-Gm-Message-State: AG10YOTVNT6YqAt87FMSztturAVLU8ulqqmxpa0Cq8tMrUvzypKcZXcxjfs0OgP7Gea1JQ==
X-Received: by 10.66.225.177 with SMTP id rl17mr26796308pac.46.1455575660127; 
	Mon, 15 Feb 2016 14:34:20 -0800 (PST)
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com.
	[209.85.220.43]) by smtp.gmail.com with ESMTPSA id
	wt2sm40819616pac.48.2016.02.15.14.34.18
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 Feb 2016 14:34:18 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pa0-f43.google.com with SMTP id yy13so91719464pab.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Feb 2016 14:34:18 -0800 (PST)
MIME-Version: 1.0
X-Received: by 10.67.6.10 with SMTP id cq10mr26828839pad.120.1455575658284;
	Mon, 15 Feb 2016 14:34:18 -0800 (PST)
Received: by 10.66.89.9 with HTTP; Mon, 15 Feb 2016 14:34:18 -0800 (PST)
In-Reply-To: <1455467128-4533-1-git-send-email-samuli.piippo@theqtcompany.com>
References: <1455467128-4533-1-git-send-email-samuli.piippo@theqtcompany.com>
Date: Mon, 15 Feb 2016 20:34:18 -0200
X-Gmail-Original-Message-ID: <CAP9ODKrU=fgJ_ooz4_oOpMWRxw+e_UHLc9VrNy3ne=wWdS3Msw@mail.gmail.com>
Message-ID: <CAP9ODKrU=fgJ_ooz4_oOpMWRxw+e_UHLc9VrNy3ne=wWdS3Msw@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH] nativesdk-qtbase: use runtime linked dbus
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
X-List-Received-Date: Mon, 15 Feb 2016 22:34:20 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Feb 14, 2016 at 2:25 PM, Samuli Piippo
<samuli.piippo@theqtcompany.com> wrote:
> Remove direct dependency to nativesdk-dbus. Instead configure
> qtbase to use runtime linked dbus library, if that is found.
>
> Signed-off-by: Samuli Piippo <samuli.piippo@theqtcompany.com>

Why? This puts a dependency on the host operating system version.

Am I missing something?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

