Return-Path: <alex.kiernan@gmail.com>
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com
	[209.85.166.179])
	by mail.openembedded.org (Postfix) with ESMTP id C17BE7F859
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Nov 2019 19:43:40 +0000 (UTC)
Received: by mail-il1-f179.google.com with SMTP id m5so6818883ilq.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Nov 2019 11:43:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=LAQ96wqRFu/S9/B95e9KWBMt4YoRh3AfW+Pz+trFSYc=;
	b=VOjXoxy2gjjHVccZhWPpdM/P/FXXXf4b6f+XWwKDIkGOLppgKIwOLUNx4nxRl0H8tq
	ZSJc9r4wo2M8RmOzil5CfQuNeiHJKC9SpksiAy4fpdEgA8nmQqnq726P5JTpq0LeD71M
	eWEtmLCF0Lp/3NlLvVPk2ZQdUCa7kl7nV2l4qpUA4m4wvankmwIjiTHsqrXB+KO8ZPUc
	CUei78rnO7W6xCMzVa68lqXVDqP77xPzdLp8eMcJCzPhf1jG0tYyd+iawpNc/0AXApx8
	fFVJSEKjJ9d5Oc9SmfpX+mmdckVFeoQ73HJw0w6yM1D9Ot5bwicGBi05tGFFjFcOWDmR
	PlxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=LAQ96wqRFu/S9/B95e9KWBMt4YoRh3AfW+Pz+trFSYc=;
	b=FdzVMNS0FusdV5Wa36qMXkuIrwQJcUR13u2aJCaubWslDRjpFOPFgdVB3rI5MgJK/K
	hxG7N2rQhXu3luAqNsy2H42dqL4taHlJWVHjyhASfsMaxbc30KA0ZPRcCltSkUNuMbp/
	K3sLfmuo6rf4Pav9r2oJEhE3LMQOIhyr4TOF4CsqAl2EbJUsSZgwQepn9NSJuxVmsEcf
	9oaP+EZHPm8wiTkUu9lP7EAIbX4D8NE+0IohCKNnmVldGcn5+El9dHMgxytMf/gIDdY6
	ll5W77DGDgkr4cLokdsauJDJhasRMYV11o5F9NSBG44RBoGC0g7/Qv/42uAOw3NoFtlh
	vM9Q==
X-Gm-Message-State: APjAAAUSzGdFUrECZixoIuCuqVBVcxBc/JXh98g4tqIr1V2MV/z/slc4
	4ydJjO/tMjZLRdgxDi+e02esm1jD3UYJYIhBC56q09eH
X-Google-Smtp-Source: APXvYqznGkbPrkql641JmirmWBxeDo7OmjTtg476IaSvkqHIUTTbgrvPS9AtkehptjE02TlWVsl9thcl5GscvQBXf2A=
X-Received: by 2002:a92:7308:: with SMTP id o8mr32000754ilc.102.1572896621604; 
	Mon, 04 Nov 2019 11:43:41 -0800 (PST)
MIME-Version: 1.0
References: <20191104160052.6615-1-open.source@oleksandr-kravchuk.com>
In-Reply-To: <20191104160052.6615-1-open.source@oleksandr-kravchuk.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Mon, 4 Nov 2019 19:43:30 +0000
Message-ID: <CAO5Uq5THZzp+Wxu0S4tEtkZOZG5+v_9-Ey0-qO8t4exxbqD9Zw@mail.gmail.com>
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH][meta-oe] iwd: update to 1.0
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
X-List-Received-Date: Mon, 04 Nov 2019 19:43:40 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 4, 2019 at 4:01 PM Oleksandr Kravchuk
<open.source@oleksandr-kravchuk.com> wrote:
>
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> ---

This is failing for me when building w/ systemd enabled:

ERROR: iwd-1.0-r0 do_package: QA Issue: iwd: Files/directories were
installed but not shipped in any package:
  /usr/lib/systemd/network
  /usr/lib/systemd/network/80-iwd.link
Please set FILES such that these items are packaged. Alternatively if
they are unneeded, avoid installing them or delete them within
do_install.

-- 
Alex Kiernan

