Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f181.google.com (mail-qt0-f181.google.com
	[209.85.216.181])
	by mail.openembedded.org (Postfix) with ESMTP id C142177AF2
	for <Openembedded-devel@lists.openembedded.org>;
	Thu, 23 Mar 2017 11:44:40 +0000 (UTC)
Received: by mail-qt0-f181.google.com with SMTP id x35so172350744qtc.2
	for <Openembedded-devel@lists.openembedded.org>;
	Thu, 23 Mar 2017 04:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=OCah6cUpJ0iYUEO+k1qHmoR3QSd7bqoyqCBUuAdHYsM=;
	b=KFSQuSZVRpDDGAJrHnZwm0NC/qa14Xp65gfwjE+6/IE7u8r/0omr0sbaxQunHjY/7a
	x+27gESUOgN6dbqaWNj4HwEbX5qU5KPba13pi94angulLMvOjUJdNz5+RAyt7uNW0avs
	6QnABhg8woN1mZPBZQFZTjxTUxP6N4iejbAJd8Sb++r8f76jlRVIbnfM70buMyc9MjiT
	/Bk3StjUmeklMjEBa/C6D6m+oPck+BQkx2rY4GNtXNJs8dVYzXNq/A1OtPwjd/D0JVEd
	tnymVRnOkDQGbkVLOylkxUHb6Nf1ejGqdLmlXJ9ruxwSKev9osVCxVs+Sa6GH3YgxngK
	St1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=OCah6cUpJ0iYUEO+k1qHmoR3QSd7bqoyqCBUuAdHYsM=;
	b=qATA3MHVK/Mm2xoFZ5fj8iY6/mh1tQL00B/Z6yTrptjuOM01Kk8qg1c1gDL3HiovjJ
	1OW3XLMM6S2yh6uBPQPZbFgq97bHFPVqITJ8E7OSdq6otXplmkPoKaIU6uSKRQQc4+zK
	pvkLrVRtMQW4GWHFyB3yO12JMNBKeN2RU2KN7vtt4SmimDoYPTnkuDkVnQNHjM+D+4bb
	CewoubcaST3io50YTJ4PPs/1WuiIOvEWgMCGHCOcjVFk3aNAvJrvHC7F14Gs4/dazzHT
	DEYCZXZB0Or2nYQvqVH2ODyge3bIek2ye+2ZkwYynU3F4gfVO1fUXa04IGpr0MsBB2Lu
	Q/JA==
X-Gm-Message-State: AFeK/H0COXaeadVZTWHW0zUvqFX7gSjASeQHLZ7ivPt2lXFZs8srYQEz+DCDZHZ+niuZTyGEgi0wHlmM66w92aqG
X-Received: by 10.237.43.69 with SMTP id p63mr1717486qtd.68.1490269482126;
	Thu, 23 Mar 2017 04:44:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Thu, 23 Mar 2017 04:44:21 -0700 (PDT)
In-Reply-To: <CAMKF1srxsxW=1Hc+ONia7uMAuFNPs74w8Wjy9u5G3S2xhKi=Eg@mail.gmail.com>
References: <CAMKF1srxsxW=1Hc+ONia7uMAuFNPs74w8Wjy9u5G3S2xhKi=Eg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 23 Mar 2017 11:44:21 +0000
Message-ID: <CAJTo0LbK+iLbFhgbR3H_gfBxtdh+Ugw5eAOhRoeWCNpE6GCwEA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <Openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Fedorahosted.org in SRC_URI
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
X-List-Received-Date: Thu, 23 Mar 2017 11:44:42 -0000
Content-Type: text/plain; charset=UTF-8

On 22 March 2017 at 18:24, Khem Raj <raj.khem@gmail.com> wrote:

> meta/lib/oeqa/selftest/recipetool.py:        checkvars['SRC_URI'] =
> 'https://fedorahosted.org/releases/l/o/logrotate/logrotate-${PV}.tar.gz'
> meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:SRC_URI =
> "https://fedorahosted.org/releases/x/m/xmlto/xmlto-${PV}.tar.gz \
> meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb:SRC_URI =
> "http://fedorahosted.org/releases/c/h/chkconfig/${BPN}-${PV}.tar.bz2 \
> meta/recipes-extended/cronie/cronie_1.5.1.bb:SRC_URI =
> "https://fedorahosted.org/releases/c/r/cronie/cronie-${PV}.tar.gz \
> meta/recipes-extended/libuser/libuser_0.62.bb:SRC_URI =
> "https://fedorahosted.org/releases/l/i/libuser/libuser-${PV}.tar.xz \
> meta/recipes-extended/logrotate/logrotate_3.9.1.bb:SRC_URI =
> "https://fedorahosted.org/releases/l/o/logrotate/logrotate-${PV}.tar.gz
> \
> meta/recipes-extended/newt/libnewt_0.52.19.bb:SRC_URI =
> "https://fedorahosted.org/releases/n/e/newt/newt-${PV}.tar.gz \
> meta/recipes-graphics/ttf-fonts/liberation-fonts_1.04.bb:SRC_URI =
> "https://fedorahosted.org/releases/l/i/liberation-fonts/
> liberation-fonts-${PV}.tar.gz
> \
>

I noticed this last week but totally forgot to file a bug or write a mail,
thanks Khem.

I've filed #11226 for oe-core, and hope we can get oe-core sorted before
release.

Ross

