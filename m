Return-Path: <twoerner@gmail.com>
Received: from mail-vk0-f42.google.com (mail-vk0-f42.google.com
	[209.85.213.42])
	by mail.openembedded.org (Postfix) with ESMTP id 8AE2A7780A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Jun 2017 00:58:58 +0000 (UTC)
Received: by mail-vk0-f42.google.com with SMTP id 191so7315280vko.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Jun 2017 17:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=lM0VgShd+BILiFZc3yKHpa7xeBV7wmZAeyPqUDQjoa4=;
	b=Zb9gXIJsfYTNRbYrYQVw9BHdk3/jkpmg33jh+CDn3u7vsHcfovhwpTa6gGfW1scLYt
	wYaI75j1IaJ/VJWeZojhburdz8uv3KGykQC9Fuse8veCNib1dXzSgQOQo66/n9pPQOog
	5H3N/Df0oO/9a3oRM50vUfrGaySScH7Babi/8C95Yn/Zoo7wC3wPFuuj42LAY0fSt9Uq
	ZXOQlMj2Ust5k/0rzHBq1st5QpxIRK6eICu9UiHhw5A+NqGHn+gVkb6WR646NQKEMbhV
	UQGZh3EMfnbRxVBvBpBb93cTEZR/icwB43CE9mjsf6Yjz01yLoEQv6AwiD3vdC1BLufb
	jycw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=lM0VgShd+BILiFZc3yKHpa7xeBV7wmZAeyPqUDQjoa4=;
	b=JY/a4HrY2+JKvdkbGzpj0ORKXR8iCDiPLlyX9x2RaQs7dkvrF8/IBeGwOhiSVdO6d2
	ZTP64BUAmODA3OSOggU8j2gRcKSCiVxCXkt7ue0BTB0z64gz7ynvOl79ruV20aFXlPW+
	2GA0H6wKgljqIEgbgLcX5h9s/s9xwxIgrkvQ4NWhrE78/Wx7CGobMJ4bqw3ZZXFEyAPB
	AbJdi9HRDNowCzV6oQNfsFMXEHVJlcoKjVnypKp0dEwYj9OJcehPr1mqCl4OGDkHsQ1w
	wHXLh2CmqMa2xUO+NZMjbTF0fObXNw0a9qfA8ehtfWuA29qaguYG66NqZ1jEbZywPtYM
	fwlg==
X-Gm-Message-State: AKS2vOyLPnhU+mbU961bNNYAeFUDv4cV/c591URH5OWHtdRfNDeFBoF2
	5dTF7MC2w205YYjmvyDUk0bPKMqhIg==
X-Received: by 10.31.98.2 with SMTP id w2mr1386413vkb.24.1498179539425; Thu,
	22 Jun 2017 17:58:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.84.198 with HTTP; Thu, 22 Jun 2017 17:58:58 -0700 (PDT)
In-Reply-To: <20170622193547.GT28053@denix.org>
References: <1496925018-5300-1-git-send-email-samuli.piippo@qt.io>
	<91dc3ff5-ad3a-ff4c-163a-4b82bb721422@gmail.com>
	<CA+chaQe9JFMTrZ8HcOPyVqj7VDvg4N_8VKGRf3X3vDuwC37f8w@mail.gmail.com>
	<CA+chaQe=8hRDdymjoqn0wRo03XUF0cTdvNiLQTUuvqzLsL2Q2w@mail.gmail.com>
	<CABXoSoWZBLfn4K2DcHED90U3Bvcj8GRLX9Qa5XL844hZB0+Tzg@mail.gmail.com>
	<CA+chaQc8V+tVZ4g+B7CAeR49wbDgs4+Uo+B++8ieKgG8HA4Zig@mail.gmail.com>
	<CAHUNapTL=U_t4EwTKkQ8B8A7j+=WKCU64u_MFeioB0yv_VfACA@mail.gmail.com>
	<20170622193547.GT28053@denix.org>
From: Trevor Woerner <twoerner@gmail.com>
Date: Thu, 22 Jun 2017 20:58:58 -0400
Message-ID: <CAHUNapTJJfR8R7aUvuJDOV+KbcpkRb_dGEFO=k2a9Y+OQye3rA@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH v3] Upgrade to Qt 5.9.0
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
X-List-Received-Date: Fri, 23 Jun 2017 00:58:58 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 22, 2017 at 3:35 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> On Thu, Jun 15, 2017 at 01:25:12AM -0400, Trevor Woerner wrote:
>> On Fri, Jun 9, 2017 at 4:16 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
>> > Then why does it work for chromium which used to have the same issue?
>>
>> https://github.com/OSSystems/meta-browser/blob/master/recipes-browser/chromium/chromium/chromium/m32.patch
>
> Hmm, I'm wondering who comes up with such nonsense upstream that we have to
> patch it out? Is it due to laziness or are there some real limitations?

Unfortunately genius and insanity are virtually indistinguishable from
each other ;-)

