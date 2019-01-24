Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f177.google.com (mail-it1-f177.google.com
	[209.85.166.177])
	by mail.openembedded.org (Postfix) with ESMTP id E58217BE41
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Jan 2019 09:21:46 +0000 (UTC)
Received: by mail-it1-f177.google.com with SMTP id m8so2044388itk.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Jan 2019 01:21:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=A7jQAxu3Kl6ZpIZOS/JETIisaqGNvLwseIjPw8+tU10=;
	b=a+DH9689N1zR6aGaeY4uJ6+X4QYkCXJZBT21gYPFsjE5ulK4YR/ek/Ti/cJ/xjR3Ss
	H2D6k2+1GFiTM4MtTLXmQsBzb12rtw9sc8PoRDAdpdYqeKmY1Suy/7hoTLxouiE00mlX
	oZN3bgtaw9+qjVJl4idEJ0Ozo1ZiAkaZ0w8k8t4CSO6bWyuzCXXxJfp7l7IuTyOBzjF4
	UZ1A5ytn36b27yeeImvCge1SdoVAO3dJno5vLBQyJREtmLcPrTU8d2dw/AqUpyR7/Pgf
	XgjA5nnY5gSXxIVyBu67Jh6DRuO+A6RQA9cs5472uCFPwNoyOmXCX6gc0p8g7usGRZ55
	P96w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=A7jQAxu3Kl6ZpIZOS/JETIisaqGNvLwseIjPw8+tU10=;
	b=hnDqecTquNzpLyvEoC8ulB+gzmkrvaU/zqjt+ydxWDnzvrCKzjOafTvL2sUvCgQiaY
	MXFEMOhd7ia9sPaSg+O5r6jmoXjDkbFw9NOcbo8C4IIjq6NClEAOYJGsP7H6V7nIsWOt
	gJi50nC+S7Rxz2NGL+GN3Irc6TmTaNE//PXEgg5GhoOwpEqUH/UpcaAMh0pq2fB/+SBs
	Ub819z/noG8LThYpNsmC7YIGGQBKh1hgKzfffjkMDn/Z613OK+r67bYwTd2e/SeWMtAa
	vAiJTTMeOh588tjJraKXPAQFvm+o7W7ltOjU5bFLtJ4HA3Y9ZSO0RU11XxhY7tfD8cgr
	es9w==
X-Gm-Message-State: AJcUukc2XA82EcGz0c+eQp1iWY+yhiFLZuXMyvlkO787f6sP87UczqKW
	2d1pRV4Bjn2Am9iGlapoVi6oSHAe7FqpVwWWkWI0vw==
X-Google-Smtp-Source: ALg8bN4REwl3M26VZ7A+3kyy0BH470rw7tYniggbReLQ/k/2VXSjvpblQUvLWllOcbddAeeHJR+S80mtsIxhs6vmcjY=
X-Received: by 2002:a24:1d4a:: with SMTP id 71mr850241itj.62.1548321707892;
	Thu, 24 Jan 2019 01:21:47 -0800 (PST)
MIME-Version: 1.0
References: <DM6PR01MB4636E8A23560DB48A9F733678F990@DM6PR01MB4636.prod.exchangelabs.com>
In-Reply-To: <DM6PR01MB4636E8A23560DB48A9F733678F990@DM6PR01MB4636.prod.exchangelabs.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 24 Jan 2019 09:21:35 +0000
Message-ID: <CAJTo0LZTOpWUfMPG6N6DU6Q_BDKa+maD_-By-2yC9jAFZACNNQ@mail.gmail.com>
To: "Muhlenkamp, Lewis" <lewis.muhlenkamp@stryker.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: DATETIME seems to be getting updated
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
X-List-Received-Date: Thu, 24 Jan 2019 09:21:47 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, 24 Jan 2019 at 04:32, Muhlenkamp, Lewis
<lewis.muhlenkamp@stryker.com> wrote:
> It appears that the DATETIME variable is being updated.  From what I read this should not be happening, correct?

DATETIME is defined as follows:

DATE := "${@time.strftime('%Y%m%d',time.gmtime())}"
TIME := "${@time.strftime('%H%M%S',time.gmtime())}"
DATETIME = "${DATE}${TIME}"

So every time bitbake.conf is parsed, the datetime is updated.  This
happens once for the main process, and then again for every worker
that bitbake spawns.

You can silence the 'metadata changed' errors by using vardepsexclude
to mark it as a variable that can change (grep oe-core for examples of
using DATETIME and vardepsexclude).

Ross

