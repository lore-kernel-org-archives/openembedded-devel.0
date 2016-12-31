Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f43.google.com (mail-vk0-f43.google.com
	[209.85.213.43])
	by mail.openembedded.org (Postfix) with ESMTP id 503C3601D4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 31 Dec 2016 18:45:23 +0000 (UTC)
Received: by mail-vk0-f43.google.com with SMTP id p9so252347398vkd.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 31 Dec 2016 10:45:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=uzdf/HAfqdg4o8G/j5sdPLKfOQxF9nj5bMlaUAhBPs4=;
	b=HjngafwEjj+sEUpJreq6HUHJMEgo2RxqrYjWwGJwJRDU/KHjs0cH7YmIqTcTOZ3vVF
	fEF1g0I8/ffTY1AQ3ql4b8sjKAH5pp7TsjDS5FD+W2WdhsEyvEdvlHvhhzsh1S4OP/2V
	TIjh0ZEQsooVJKlL6cXDU3FZreC0T1GlTG39jbmWgFH3OpOJKPyb5l1/2gs/eUxXMpcb
	DBv+ngP6vk0PCPgi1k6YzIGdCgWRbIByZjVQVKM/JY0/pUWuAHG6tFDLBZwSHIxBWo+7
	mqpEJF9ICuIYPtC6OzDZZN8EV9QUQcsHAkY0gVH2zY3bLhMXTIbhAm0TB17Dmwss1w3o
	9HfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=uzdf/HAfqdg4o8G/j5sdPLKfOQxF9nj5bMlaUAhBPs4=;
	b=gPg2jXFGe1LRR76e9Eis7YgX5JQsET3sjyGsokGK/hI0DI9Z6sE/p6EcNVrDadYZqD
	rR8vjCTSiAjfXuduFTEG+58b5cIx6xdRarA4kpuqmlG9yFsGrPFt5LjLi95Vkyoo466n
	Ywkm3mVHsiEGGwSKyvThbKMQvr3/1WS8/gXCpC9gQUfx6j3d/FhT+hIDgggUse+/vm96
	k06jisyXwJgBC32iLo/oMx+4FxP2c7RpUfhEXyBBjNe//31dQPNDkbsaEBWoDMbkU+5A
	mtI8NIJC80rGh69sbubH9wDJu3/8aeAUhGKh32U/+jz34+LpjqO/VvCPVaODWSuzlyAf
	ijJA==
X-Gm-Message-State: AIkVDXItAMCKgIHPTa5XBUKhrN+5xkC/t6SH6elA1NXcLUYEzNUaBJKITJtC4gxxNAsUbpSZ9TulSKIzcotf1w==
X-Received: by 10.31.115.205 with SMTP id o196mr18685823vkc.139.1483209924622; 
	Sat, 31 Dec 2016 10:45:24 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.48.87 with HTTP; Sat, 31 Dec 2016 10:44:54 -0800 (PST)
In-Reply-To: <1483077771-28877-1-git-send-email-oleksandr.kravchuk@pelagicore.com>
References: <1483077771-28877-1-git-send-email-oleksandr.kravchuk@pelagicore.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 31 Dec 2016 10:44:54 -0800
Message-ID: <CAMKF1srr_XS4X8QOVs6f_YvKs_F7=h0Ng-+9CLHToz9ufu2_1w@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] tcpreplay: upgrade to 4.1.2
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
X-List-Received-Date: Sat, 31 Dec 2016 18:45:24 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Dec 29, 2016 at 10:02 PM, Oleksandr Kravchuk
<oleksandr.kravchuk@pelagicore.com> wrote:
> +SRC_URI[md5sum] = "3105b10b07dbc0b07ce2da07a2368359"
> +SRC_URI[sha256sum] = "da483347e83a9b5df0e0dbb0f822a2d37236e79dda35f4bc4e6684fa827f25ea"

explain this change in commit message as well. what change is causing
the checksum change

