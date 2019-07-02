Return-Path: <jupiter.hce@gmail.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id 4084A7E83D
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Jul 2019 01:52:39 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id w25so33341452ioc.8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Jul 2019 18:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=Oi2RFks7DeY4x/LrH85lA9ASsKk22i5hDSDB8yNjxj4=;
	b=UnUV+Q71wLJe13CyHd+Tdfv6m8pds3un4I3bCl8SS0FnAiDkHkxR//THc9EznrAyjE
	WT2J3NBQJw0Lzh0W7uE9wW1qi1mc6BoGTO6ImbQS5sAEDq0kxKERuuzRXwXFAc30a2lZ
	OD6Ejc9l7RePZeWoo0ZR0rZnwOuFVh2FqiKAgXa4ITAaHlB9vwXraOZIgviNK8PwelHv
	9bYnZKZlcw1WsLWA30YLODhdfFlUKgCgVvoVm3ANH8N1Fn6tyFMpMFK6SR7TST2w7Yu3
	UWVjyxaQGVBxQucith5+cpDpt/DvskDJ/mSci6BJjxkhotMCjgEg1elZTqGQ5B88wIqH
	6KdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=Oi2RFks7DeY4x/LrH85lA9ASsKk22i5hDSDB8yNjxj4=;
	b=oIVmwNvc/fYBOUu1jzcz4rI/dco2U3WrFGByE3Hvm3sGulH/+sBKUZZhKa/bjoO3N9
	ue790jTpRwH82UlHtM1Ky2P0dba6v1uUKVAzLMgmanCRYEF0G2pvUK09ExehlmW5dS8S
	sgF7j39sClDfkhIwxCIHeOAuuJzh1G1Y6XDjRQjFuxZaWJBxXZrQIhXKDlWf8M3d2mUK
	IAdDtOhxnM0OFo4BZ3r+nN7Jjn4rfn26CWINNUMHXkso56m6ERM/lJxWN0H0FDgcDd5w
	ElvN/Fhb5zL5gJnY08S3tWRrjWOVB0BOE9pM1i23sA+TDFDY4KFBU70FEe6JFFiKKk4Z
	iq/g==
X-Gm-Message-State: APjAAAUHM5zmRO9Y8Fk5NP1ylVcHj0NLBIYL13c4AJmIiGl5vzOYloiQ
	xboo9aDCZ9CIIgpXS4k/YP7vYtpFgDRdCyAYtWEApFYc
X-Google-Smtp-Source: APXvYqyf0t0DxAKhsv0sW2mO3Sm9X0YoH7MumCqoHs63LijIQqZJjQzh/wUabQ/w0Vpki3a7OBUW2/LuK+w+VdtZJ2A=
X-Received: by 2002:a6b:7f06:: with SMTP id l6mr13049565ioq.53.1562032360031; 
	Mon, 01 Jul 2019 18:52:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac0:8a3d:0:0:0:0:0 with HTTP;
	Mon, 1 Jul 2019 18:52:39 -0700 (PDT)
In-Reply-To: <CAA=hcWS+-bC8S+90VqbRMW2wpTz2Rfv7umxKSHovQXWD2K6imA@mail.gmail.com>
References: <CAA=hcWS+-bC8S+90VqbRMW2wpTz2Rfv7umxKSHovQXWD2K6imA@mail.gmail.com>
From: JH <jupiter.hce@gmail.com>
Date: Tue, 2 Jul 2019 11:52:39 +1000
Message-ID: <CAA=hcWS-tgsh2Yyx6oZOjkiSKS0WPh9Z6nrhsiCzWScwWpuGOQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Allow choose of U-Boot config for machine
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
X-List-Received-Date: Tue, 02 Jul 2019 01:52:39 -0000
Content-Type: text/plain; charset="UTF-8"

Tried to add  UBOOT_CONFIG=nand to local.conf and from command line,
bitbake does not like it????

On 7/2/19, JH <jupiter.hce@gmail.com> wrote:
> Hi,
>
> I am running BitBake Build Tool Core version 1.40.0, originally I
> built an image on imx6ullevk booting from SD card, I am building a new
> image for a customized i.MX6ULL board booting from NAND. The following
> link commented by Otavio Salvador for a patch to allow user to use
> UBOOT_CONFIG=nand either in local.conf or command line. Given the
> patch was many years old, I think that the current version is able to
> support UBOOT_CONFIG=nand either in local.conf or command line, there
> is no need to run the patch, is that correct?
>
> http://lists.openembedded.org/pipermail/openembedded-core/2013-August/082284.html
>
> Thank you.
>
> Kind regards,
>
> - JH
>

