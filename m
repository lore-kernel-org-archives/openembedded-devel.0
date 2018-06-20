Return-Path: <samuli.piippo@gmail.com>
Received: from mail-io0-f194.google.com (mail-io0-f194.google.com
	[209.85.223.194])
	by mail.openembedded.org (Postfix) with ESMTP id E5B20754DC
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jun 2018 11:57:38 +0000 (UTC)
Received: by mail-io0-f194.google.com with SMTP id t6-v6so3177221iob.10
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jun 2018 04:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ABTqgh+lUhfWbsutawCwNBWhG9v/B4V+4rnnqPiuGLA=;
	b=A8C0rQPwbr1K5yaIoPpW97ZqTtfanKkHWxNsB/xhhOfzjuxjIN5kSxUwAeW4vF7HTz
	vUKdubqGx5DOUaTy+KmCagmOmqZOUu1kwXgWYN+Kp9BTF5GKd94smPcsIYAiZRkLC3Zs
	weeFZ4zu49G9QiRUviGhyVmG/+7ash1XwFfeXAil/yASCeha54PWiV/Tv9KQP9kv8n4Q
	Q2TrYth4f1JmUs+mpvNa7nESh3QFiaHtEJ5+xagPOXtxck6IF+e90DU0uxux1RbC8HLK
	wTmcAS3Tzbd9dcCjt+6hFylMWXZTprRMpyLA5PtxKnwIQOqCZqwnRl9jEIunsFYyX3G2
	CWbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ABTqgh+lUhfWbsutawCwNBWhG9v/B4V+4rnnqPiuGLA=;
	b=G0uxmq4qR0JtJGI+xkH7630Wn5HvE5hjuKyNJS0eIKpDXVndbdo+vN1TgrBt8c/gV6
	mdEC0hM4qhzv3ecmaQftb1/LxGULwI3+uUByXTMuL11PtcKcvDsqJQlfi8o5iYIdjgBr
	SXGcPPd4AK8xMLLj9I/FsCzs/VrxzEYtbbODvD8Jfpiu5MLoxw13HL1DQlF3tfY193+t
	msdN4n95w5aIG3RidZhrjWOmvL/X/VglKco8lnWPkmMcKhPWZT6/p6rju09mZtjw6mv2
	CrrY45ov43x7DPUQgXK0td9g/3KZN7Arbg0eEOP0lwp5Lx+9SdYUbjtO1ls80qLY5NKL
	+1Lw==
X-Gm-Message-State: APt69E3asLJ+EgdSeuF7pBAXHpsJ55wP157qIxIOXoPCDYRJ+Y6tedUf
	nGsBqaurC+7zuYQB1xf3cSZjd4y7A9EFjww8hMw=
X-Google-Smtp-Source: ADUXVKJZWW4hkL3ZBGZ0QZA52HtG68EZrUnZjdCdlv+kts46xjkGDEAcv02kQ8NRBpOIaL01cRxBUjTBNXnEkOM5Wqs=
X-Received: by 2002:a6b:dd14:: with SMTP id
	f20-v6mr16447365ioc.7.1529495859848; 
	Wed, 20 Jun 2018 04:57:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a6b:8855:0:0:0:0:0 with HTTP; Wed, 20 Jun 2018 04:57:39
	-0700 (PDT)
In-Reply-To: <20180620112953.GA3257@jama>
References: <20180529092556.25053-1-samuli.piippo@qt.io>
	<69a631ae-09ec-a7c0-5965-f5372ef463c7@zonque.org>
	<CA+chaQfXaWZvyUqWSE-Zq=nSW13Jwt=GVPhXTj0dVbzVGpebww@mail.gmail.com>
	<d2df5115-8f79-fb79-e761-919fed4cd50f@zonque.org>
	<20180620112953.GA3257@jama>
From: Samuli Piippo <samuli.piippo@gmail.com>
Date: Wed, 20 Jun 2018 14:57:39 +0300
Message-ID: <CABXoSoU8YpM1XNNDW7r=9vjhNtuJGwsT9Z+BCHvv7pBA=dy7wg@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH] qt5: Update to Qt 5.11.0
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
X-List-Received-Date: Wed, 20 Jun 2018 11:57:39 -0000
Content-Type: text/plain; charset="UTF-8"

On 20 June 2018 at 14:29, Martin Jansa <martin.jansa@gmail.com> wrote:
> 3) we cannot use nobranch=1, because that breaks AUTOREV

How does it break AUTOREV?
We are using nobranch=1 when testing non-released Qt versions and
haven't seen issues with it.

