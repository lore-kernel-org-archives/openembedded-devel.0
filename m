Return-Path: <armccurdy@gmail.com>
Received: from mail-wj0-f177.google.com (mail-wj0-f177.google.com
	[209.85.210.177])
	by mail.openembedded.org (Postfix) with ESMTP id 3269177290
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Dec 2016 14:11:07 +0000 (UTC)
Received: by mail-wj0-f177.google.com with SMTP id v7so150794741wjy.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Dec 2016 06:11:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=DZaBCSvi94T0qogANZHb3AkuYo/OiXhfGkTzv0OskWY=;
	b=btj6KWl0hFCYyQfnX7jzvEp/2Vytz0uzQNmMMEB0cMIZ2J/jnygKosC9Ux/cP+JC1I
	56LdLPDn1cH7gQzOqOWO5ppoydPnMQK4a4+K3Pmbf0rUGYx/qzvKw7BdBYbQn29BS5pY
	6lg1VRDPp0fStzt2yaj4pGXYMgZMQT4ZZ2EHJBhWj4hhoL8yesESAj2JT2zGAQTOJgiJ
	3X4v1xjiavv/1N8nj+XPUe2NQ+GeFAb9Hcvxld1BxysDCa2cjwCYMm3J2j6gAdnacf1E
	x+gYocZ+cfW5nxLASrtom260z9Io9Ju4E3hzCDVfZDQwfHk946RnhJmG8MP2eqKMaYmQ
	KsvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=DZaBCSvi94T0qogANZHb3AkuYo/OiXhfGkTzv0OskWY=;
	b=IxxcTcGh3dKpe1gCdjW1BP3Z6SzraTWNOFeWVw3Gza9bWiWDtxjI0djmeqlzS3AI0y
	m9o6aCBIiM6EWExlvD6H5rvTmpQB30ms9bimVW2fCSv5xMXr+ZeAx8irKt4Rcpy7aaue
	OUnWm78SrCUYagw33W7PP8JlyFP2NDCDMiewuV3GVnyghYyzwBxCsc7M+3WGZhhB8e4E
	nCkBTb7Xleo2+n5/lVI1fnHgvjVV1FolJs8hMDTKRpwcnjdONasg1ePN4DawZNFwWJzY
	a42SPgY0oblcUv+uQsKi8YwqR2Yfq6L4k3hnQXIuvgL7sZn+b3lAnJkXp8PmRKY6GTlN
	GDIA==
X-Gm-Message-State: AKaTC031j2U9V1NPY+ftyk3eeSSD1vaUxkhtDd63zhXbesbgV4nomKdfvs8WO2wR3aeCEP6vdQ4/tbOufxq1Bw==
X-Received: by 10.194.112.170 with SMTP id ir10mr13391933wjb.190.1482156668268;
	Mon, 19 Dec 2016 06:11:08 -0800 (PST)
MIME-Version: 1.0
Received: by 10.194.162.33 with HTTP; Mon, 19 Dec 2016 06:11:07 -0800 (PST)
In-Reply-To: <CAJ86T=UB6T+LpTNRy6_pZ5f0P7FzyJ+qMdgS=8FvDE5HcaG41w@mail.gmail.com>
References: <1482148888-3127-1-git-send-email-armccurdy@gmail.com>
	<CA+chaQeBUTnQQnVEGDhae8opjobSAPF=BU2R-772ECPf8KA4Pg@mail.gmail.com>
	<CAJ86T=UB6T+LpTNRy6_pZ5f0P7FzyJ+qMdgS=8FvDE5HcaG41w@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 19 Dec 2016 06:11:07 -0800
Message-ID: <CAJ86T=XDvJk93+Jc4-v5H+3nTSFJ1KcQbyeUt8yvhJwfTA=pnA@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] rapidjson: add initial recipe
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
X-List-Received-Date: Mon, 19 Dec 2016 14:11:08 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Dec 19, 2016 at 6:08 AM, Andre McCurdy <armccurdy@gmail.com> wrote:
> On Mon, Dec 19, 2016 at 5:11 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
>> Please don't use github archives.

What's the recommended way to fetch from a git tag which doesn't sit
on a branch?

