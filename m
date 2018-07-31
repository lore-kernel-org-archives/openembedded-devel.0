Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by mail.openembedded.org (Postfix) with ESMTP id C328A607E0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Jul 2018 17:47:54 +0000 (UTC)
Received: by mail-oi0-f65.google.com with SMTP id q11-v6so29520024oic.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Jul 2018 10:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=SYdIi++lk0JjNi+JlRUj0xsxoBQlwumrM4YltjUwDc0=;
	b=u+JzZHiiw7yzNq5Ov+1l5/dhqhSoKMREZ7hyyVZ8Lg/VOiVAtEHGYLRgdeynsiJ7Sr
	bdARcpKGijIzqBDIc8h0HXztwGu0PWz/tV+4u/J7JuFk3SBPRdEPEWTHv9GeURVOyFjT
	w0iaCEid533DcKnL2PhepjOaQmFcTycp7IC549UBARkAYiBy/qWu9knQCxqOr7aA2DAv
	d74TrhCDAfT2HmD75wCngo8TCXF561dI8ROW8w8i89Y+NWTUHbwuQNGUEVZaToobowjy
	JqqDFKYgTB3njJ3pFszXyXTIQjNdwBgnhvufVgn6Xgto09zhkpxR9bJYvjXwxQoAXkrG
	azXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=SYdIi++lk0JjNi+JlRUj0xsxoBQlwumrM4YltjUwDc0=;
	b=VK7KH9GtT5j1Ef5+pVWj/bd8H62q2OqNvWovqalc2r4H57auWFvqQD1FuEGrldsSYq
	93uwfL55qc2qhMLJKSXP5HpDfZyzl9JIR6BAGLlNsU1O87DWcjpm6bU3MDj6/q2HMzyK
	NbJy965BSFSVQnK9z07JW5wVEDtVJ80tZ8P5EsOgeBlwnLFQ2JoBP6jOmza4SB966gWP
	YP5AEE0n8wJzbO+dHo+/NMgFNHnh5EQCh+cbiKzVDtEb9thXZvbB3K7h2IkCTxwluxDM
	lbeJDuLf9BU0JAOkekUS2+xTnO7TfAXuBQJjju4MH02caSAn1qrHwBOArU77sNrJdKto
	N9wQ==
X-Gm-Message-State: AOUpUlFH0oPDDha8X5UhXFh5aT9z6/iUgAp0Ua+q4uSsmJ94DFzQRLZm
	b/PQTLmHoRvxMWSJG7Af8Lvd1DyKPxOkAg==
X-Google-Smtp-Source: AAOMgpcnFbLUmLeXvIKAj+yuGZspQ7I+TwPmVWVwF9ZKDUA5/MbYexCqVncwitq6dWmvUu9gq1dpfQ==
X-Received: by 2002:aca:b885:: with SMTP id
	i127-v6mr25284379oif.180.1533059275324; 
	Tue, 31 Jul 2018 10:47:55 -0700 (PDT)
Received: from mail-oi0-f46.google.com (mail-oi0-f46.google.com.
	[209.85.218.46]) by smtp.gmail.com with ESMTPSA id
	c9-v6sm10062888oia.1.2018.07.31.10.47.53
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 31 Jul 2018 10:47:53 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f46.google.com with SMTP id w126-v6so29535928oie.7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Jul 2018 10:47:53 -0700 (PDT)
X-Received: by 2002:aca:a982:: with SMTP id
	s124-v6mr24604260oie.80.1533059273188; 
	Tue, 31 Jul 2018 10:47:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5544:0:0:0:0:0 with HTTP; Tue, 31 Jul 2018 10:47:52
	-0700 (PDT)
In-Reply-To: <1531858514-4984-1-git-send-email-leimaohui@cn.fujitsu.com>
References: <1531858514-4984-1-git-send-email-leimaohui@cn.fujitsu.com>
Date: Tue, 31 Jul 2018 14:47:52 -0300
X-Gmail-Original-Message-ID: <CAP9ODKqkjwXFd+vGuTPUbCCaOkNpBGeV1gwrdVn+6a8FGyAdew@mail.gmail.com>
Message-ID: <CAP9ODKqkjwXFd+vGuTPUbCCaOkNpBGeV1gwrdVn+6a8FGyAdew@mail.gmail.com>
To: Lei Maohui <leimaohui@cn.fujitsu.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][sumo][PATCH] qtwebkit: Make qtwebkit support armv BE
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
X-List-Received-Date: Tue, 31 Jul 2018 17:47:55 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 17, 2018 at 5:15 PM, Lei Maohui <leimaohui@cn.fujitsu.com> wrote:
> Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>

The commit log inside of the patch file deserves a little more love,
it could be improved to describe what it fixes. It also needs the
Upstream-Status field.

Please send it as a PR against our meta-qt5's github repository as we
moved to it as our way to process patches.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

