Return-Path: <hunterhu.bk@gmail.com>
Received: from mail-vk0-f41.google.com (mail-vk0-f41.google.com
	[209.85.213.41])
	by mail.openembedded.org (Postfix) with ESMTP id 092927890A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Mar 2018 20:46:51 +0000 (UTC)
Received: by mail-vk0-f41.google.com with SMTP id l123so6067863vke.8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Mar 2018 13:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:from:date:message-id:subject:to;
	bh=3tu3J61N9y1h7Aqld8foEdFO6c1jPdFCLF5mWGOtFYU=;
	b=A7Hw+WNOPu3KW5fFZh09oZC3/+9GMKE7cAz4T0hSb3T911AJlw2RXqyFtHF/1bQNY/
	f8qACvwO7qwDS2m3UfW8CC+EabvFjIxO4ZKD3jnJypNpCUbrPF7csyBtR+yAxbGGf999
	Szpw00fdjHrRPk3AzH4L1NsVZW7DrsW0nuxj5SpaPzDYr1hTlBcBhVLR9gm+vplTEohD
	u/PfTyzXw2eBx12dacLPlmR/wOy8xHaClOtNM8QhwRnFP3kUfFd93Oag1tABXmn5l5CT
	x5dXgMyxwHIERwoAGVddQXQ8fnazm0kyZHufYSTUQwcm4lBKSSjnoa+FF8lxyD/jhOgO
	85WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
	:to; bh=3tu3J61N9y1h7Aqld8foEdFO6c1jPdFCLF5mWGOtFYU=;
	b=A4f7mJFA03IYiFFsLE3X4/YxD/DZGdzIoL6cLQasBm+61PjNvJ84+gmDxc3acibN+2
	GrgocvVgqDWA6ACuNXdCIJ5NbJ+vPWp6cWv1zYHrvd2OU/iSRq7FXw9HFfRZP1lUQklM
	fQHaE6XsM85ghJXDTJiMoWB6ZS6U0/SUhihzMDSLUHGX8XUJXI/VGTVzZY/7ooJO3SOn
	Dp4kQzQ/pZGC2cGG9rq1Zl5u9OBB8Qm+nX+Zd9ctCcN7iLdp+vtvaO0va4+eCcVSTnDe
	sLF9tYPLcOuuAQKvHEEzU1pnKl0R2DKjKbVFAJcVGEzB2KQ2zM57ZeaBOY4Uaunt95p6
	nBzg==
X-Gm-Message-State: AElRT7Fpt2aPaqOBexT2+aMtCtUuoNLG3bJzP76MyYrkJk9KFpPmjeGR
	YGFqVegRwHKZkPAqggWuOa/TNqPmG24Kq0R+Og0X
X-Google-Smtp-Source: AG47ELt5vwBFZPPBNWmxt1tpwk6B+cf0G6mGrJOEVMtYfyOG/S8/nEVvEqLMs9EYnIVwgMr5J3pffghbhBW8IV4bK1g=
X-Received: by 10.31.220.1 with SMTP id t1mr15373229vkg.35.1521751612674; Thu,
	22 Mar 2018 13:46:52 -0700 (PDT)
MIME-Version: 1.0
Sender: hunterhu.bk@gmail.com
Received: by 10.176.82.211 with HTTP; Thu, 22 Mar 2018 13:46:52 -0700 (PDT)
From: hunter hu <hunterhu.ca@gmail.com>
Date: Thu, 22 Mar 2018 16:46:52 -0400
X-Google-Sender-Auth: 6K1Ev0Rk4z7AvBm-QSHJ1hLUutk
Message-ID: <CAC-M0MLwD3emQxMPXN+WiowJrPyjveWN01JjeLPeEB58iAVwQQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: meta-xfce and meta-browser
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
X-List-Received-Date: Thu, 22 Mar 2018 20:46:52 -0000
Content-Type: text/plain; charset="UTF-8"

Hi,

I am entering the exciting world of Yocto project, and trying to build a
xfce based image with chromium browser support.

After enabling meta-browser layer and building it, I am expecting the
chromium browser would be included in the final core-image-minimal-xfce
image, but it is not.

I also tested the same with core-image-sato, and the chromium browser is
indeeded included in final core-image-sato image.

What makes the difference between core-image-sato and
core-image-minimal-xfce images? how do I make core-image-minimal-xfce
include chromium browser?

Thanks in advance for your insight,
Hunter

