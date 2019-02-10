Return-Path: <daiane.list@gmail.com>
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67])
	by mail.openembedded.org (Postfix) with ESMTP id 92D6B6C45E
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Feb 2019 22:03:32 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id n23so6273283lfl.4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Feb 2019 14:03:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:sender:from:date:message-id
	:subject:to:cc;
	bh=hjRtctIjc8qz642WU9kw62Xp+rkda8U0m5hF2RQS5Lg=;
	b=DV7utasZvx9kxnZ5XaZZqR4YXrc5VnQ0ffdKt9ZLk16PIDLv7KhxbfrVo6KpemNnhF
	8eYIF0Mya8JUB0j7hvZqibKuvJE+Kdz15rrArs4HNhe+EFcvk4YUePGF5RYfwR6nIcM1
	CDOnN8lnY6XCQva+zDuVyd6XRJ8qgXEDiIsWhsXI0/hSHqIFWfSzoc+sPxdg21HkNU3m
	JNBxhI8wmXA8nYnxDdOZo+Qc054iKltinVsOL3582XdR+GyXmlZ/Jz7pqU+7NqXjF6E0
	GIj79yuz+aJoXHyLDHsBp0fMTYbwxEnhjlyMCYLzww7aNmoK+V6TFBpvdGMpixU1OSnN
	CwbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:sender:from
	:date:message-id:subject:to:cc;
	bh=hjRtctIjc8qz642WU9kw62Xp+rkda8U0m5hF2RQS5Lg=;
	b=QKfntxlKfI3QAY50T55bBBz0Ko/kgXGAS8T7Ffpx3c1713XNoeYokao0V1aV7S1IYv
	iwTe09tWvtZ0ZTM0eG6x93RPHka+Gxc3XkycOajd0C/EjN13n5RxjV9sp67T/u0T/kTA
	qWPrPXFLWYOs1JLZiRNv4uCNJ/CKjvF03RE9qNPjBY8shxwalQeI/GgJ/FjBrKjs/sfi
	0xs2ylkQD8ApgPckLixNCuZtIqeRis7zABHPRjovYW9ewzLC9VW2Q7OcJ5pBLI8pZECB
	fbP/1DkRdhqQe/TBnSHwx/H17qeLS84q80z8I7xi8RBDBR5SYjP+pvKnyARmZOGG1Ryd
	rZaA==
X-Gm-Message-State: AHQUAublkxxP7InqXH21tylpH/znVe3R54rTfGqHSueA0O5xaLZ6SiAk
	LnV8S5n8bjbM+eXLmJjXim7O/cO47Qe/mMJCBrc=
X-Google-Smtp-Source: AHgI3IZ3XPYmspbctaEscXqb7KhB5zdTJbbdcLaq/IVP1iR+ZCBD2/TS0XiEDWNDrYg3s/zDHlXONoNwhRRkl74WcKU=
X-Received: by 2002:a19:e346:: with SMTP id c6mr3851691lfk.120.1549836212833; 
	Sun, 10 Feb 2019 14:03:32 -0800 (PST)
MIME-Version: 1.0
References: <20181216133801.56483-1-adrian.freihofer@gmail.com>
In-Reply-To: <20181216133801.56483-1-adrian.freihofer@gmail.com>
Sender: angolini@gmail.com
X-Google-Sender-Delegation: angolini@gmail.com
From: Daiane Angolini <daiane.list@gmail.com>
Date: Sun, 10 Feb 2019 20:03:21 -0200
X-Google-Sender-Auth: ipNpFWiHkz60DOl3d1OpPUzkWWA
Message-ID: <CA+jg_OWuwf7o5apnGK3cn6ch87S9iHdU=dD6vih1x0cnp0yMZA@mail.gmail.com>
To: Adrian Freihofer <adrian.freihofer@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] flatbuffers: update to 1.10.0
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
X-List-Received-Date: Sun, 10 Feb 2019 22:03:32 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Dec 16, 2018 at 11:38 AM Adrian Freihofer
<adrian.freihofer@gmail.com> wrote:
>
> From: Adrian Freihofer <adrian.freihofer@scs.ch>
>
> This is in fact an update from 1.7.1 to 1.10.0. (The git hash
> of the 1.9.0 recipe referred flatbuffers release 1.7.1.)

>
> +# BUILD_TYPE=Release is required, otherwise flatc is not installed
>  EXTRA_OECMAKE += "\
> -    -DFLATBUFFERS_BUILD_TESTS=OFF \
> +    -DCMAKE_BUILD_TYPE=Release \
> +    -DFLATBUFFERS_BUILD_TESTS=OFF \

I'm trying to DFLATBUFFERS_BUILD_TESTS=ON and I'm facing a flatc: Exec
format error

Would you have some advice?

Thanks in advance,
Daiane

