Return-Path: <rcagley@gmail.com>
X-Greylist: delayed 390 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 13 May 2014 00:25:04 UTC
Received: from mail-yk0-f179.google.com (unknown [209.85.160.179])
	by mail.openembedded.org (Postfix) with ESMTP id B883565EE2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 May 2014 00:25:04 +0000 (UTC)
Received: by mail-yk0-f179.google.com with SMTP id 19so6557883ykq.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 May 2014 17:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=594zhoJgm7cVI9OvcVFRSvZWahzX5CbG94njRRGwbDg=;
	b=fU62ySf4RRLyW7fImu84caSjJJ3bxGk9F0oCpg5v4N+KDX3qn4lQ7XDpX6F1EgZJhr
	65EAKcjR104QyQ008eeNyXCgvGRmR88lwHF7aYKxuDEHIb3zjW75hyPx0uItEAtQTnW8
	A5Djuylv4fpSpgxAxQcGI4ksQelTop5F/M5PgR8oZJkuWl+nN+fATzm0jKbGzWu/nxQB
	NKCgXnHx5V00owOHyxm0sg4fMYEO4NMytLNCYatsaYtGL/B4Na2FdYvpf2tnvfmLPLpS
	+sRKu32CZ2T/r05zbXNbf/c6V36XAV7uuAGL64938EbORyyiKVwz8yFfwYZU79U9GMTq
	3hIA==
MIME-Version: 1.0
X-Received: by 10.236.26.72 with SMTP id b48mr47430226yha.59.1399940315779;
	Mon, 12 May 2014 17:18:35 -0700 (PDT)
Received: by 10.170.110.8 with HTTP; Mon, 12 May 2014 17:18:35 -0700 (PDT)
In-Reply-To: <53711DD9.6070506@mlbassoc.com>
References: <CAN-NoH3xAYL_GdgvtYzNChD0VneKjT4EoJzPLigAeCZXegcBCA@mail.gmail.com>
	<53711DD9.6070506@mlbassoc.com>
Date: Mon, 12 May 2014 17:18:35 -0700
Message-ID: <CAN-NoH0DsTa+DYTNz8oDwWQCVPTUzBMeEQEi37sO2w9cSHByDQ@mail.gmail.com>
From: Richard Cagley <rcagley@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: kernel config/rebuilding
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
X-List-Received-Date: Tue, 13 May 2014 00:25:09 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, May 12, 2014 at 12:15 PM, Gary Thomas <gary@mlbassoc.com> wrote:

> bitbake linux-xlnx -C compile


That definitely caused the kernel to get rebuilt. Thanks.

While I was waiting for a reply I stumbled on this
https://community.freescale.com/docs/DOC-95045

Do I need to move the new .config into a defconfig file somewhere? Similar
to this step?
$ cp
tmp/work/imx6qsabresd-poky-linux-gnueabi/linux-imx/3.0.35-r33.10/git/.config
../sources/meta-fsl-arm/recipes-kernel/linux/linux-imx-3.0.35/mx6/defconfig

