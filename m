Return-Path: <samuli.piippo@gmail.com>
Received: from mail-it1-f175.google.com (mail-it1-f175.google.com
	[209.85.166.175])
	by mail.openembedded.org (Postfix) with ESMTP id B2E757CC0C
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Mar 2019 15:41:23 +0000 (UTC)
Received: by mail-it1-f175.google.com with SMTP id f186so6730034ita.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Mar 2019 07:41:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=6tpaqX2G5DHrRCM3rBU+0mIRB+6q5/Ls+fU/vGOrYx4=;
	b=ClWY4owZMCsygnxtCgGobEeemdWti54wZMKXy+JtH7du20o3ysO3u+ltC90H27ttLG
	UhFdkgLR1r4UvuY4v01qJ9oMEewIAk3xWEjej4Wz/jyg40HL77Kkd4Ir8Y4BDzUBAnz4
	KEVE2c2Ti9MnDDi8AkRHAJ7rzfrvCgoQQly9pvEi6wvPdGHWo/X+46zK4+XT+iHqUwDy
	kcis8jSbUPyFqV0tBUfYSq4p9zG3OAa0yx4QinagL+jBEaICyQrIOkDBj4JTX+J8HVS1
	xjiffHzLl7IKey6DQfJTU6Nj3ugVMLLFn3tBwU2QD6bBdUDixp+HpLMei3VqgcMRgAYc
	o1nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=6tpaqX2G5DHrRCM3rBU+0mIRB+6q5/Ls+fU/vGOrYx4=;
	b=aHz7ulTI042jHUBd8BYPQ/xIEeWzuPq3Qd0iqObZ9DOe2AblErFvgc/pPnKz/Y8tIc
	dsy0RRU+UvaWsfIIxqIbWQ7qe/kLRKeQivaJo+ITKZyfUJ4i5qEq9sJeXn8M+LJ1vfLV
	zbNMHEADnWPDOaVZeKijp6cxnSDqvIyVBJjSVCdOiT7BnRMh9xHxcTCALU0NJLXiXLQj
	VfsEXVzmdzAhP/yhJvSg01UTDiBJ51tnGub9WykaVoo5Z086kmyZoGuSCH+ax5SeTYI2
	C4rLu3JRZ6XueC4GnFJFisKsQhVNmUFSUP/a1d8ecfk4Lrab8GhQBRb++U+FvlxtE0uq
	b2Lw==
X-Gm-Message-State: APjAAAWIP+zwgG50goI6LIUYWl3S7RBsB3cy2otZXDsjD7Pe+GLB8Oiy
	w1gQOdMf5zMWquthueeGYlqaAoVIDJPY1XErB+o=
X-Google-Smtp-Source: APXvYqxD4koSGM3xRtyxynEyUbfVBgDEYOr0ZBlA1asyK8kwpJAYy+KL3Jz5YJHMOL3yFy/QO5LpbI04csMM4pB1NKo=
X-Received: by 2002:a24:f001:: with SMTP id s1mr8490370ith.60.1552059684444;
	Fri, 08 Mar 2019 07:41:24 -0800 (PST)
MIME-Version: 1.0
References: <trinity-c0b64e17-7878-4cf2-b46c-881a1b38055e-1552051786391@3c-app-webde-bs44>
	<CA+chaQePK29qJaYxfkkaYTs4S5z+i=bdFQSe8npP0f6HY=3Y-Q@mail.gmail.com>
	<trinity-4571896f-c682-4775-a201-8fcb128244b2-1552055246508@3c-app-webde-bs44>
In-Reply-To: <trinity-4571896f-c682-4775-a201-8fcb128244b2-1552055246508@3c-app-webde-bs44>
From: Samuli Piippo <samuli.piippo@gmail.com>
Date: Fri, 8 Mar 2019 17:41:13 +0200
Message-ID: <CABXoSoUk5CpFVWQf_FWXmwbvxWrih1JbFOLGCt+FY=G2k8UhMw@mail.gmail.com>
To: JK.Behnke@web.de
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: meta-qt5 - support for QT 5.12.1?
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
X-List-Received-Date: Fri, 08 Mar 2019 15:41:23 -0000
Content-Type: text/plain; charset="UTF-8"

Plan is to release Qt 5.12.2 next week, we'll send a pull merge request then.

On Fri, 8 Mar 2019 at 16:27, <JK.Behnke@web.de> wrote:
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

