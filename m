Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com
	[209.85.210.51])
	by mail.openembedded.org (Postfix) with ESMTP id 3F84E7D6A2
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 May 2019 17:19:42 +0000 (UTC)
Received: by mail-ot1-f51.google.com with SMTP id s19so3015038otq.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 May 2019 10:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=7CqxpW32Lrdg+rYshnYlE/sP415jLck8WwcIfkJL2Cs=;
	b=snLEK8CjMfoP18CC3NdEYN/k2dIoA7ojmsTfhi4B4wMZ03K6v6kylABNUx6zeHdF9p
	FY826ybATLI9/JLpTKUk0GUySfUUu1u2VTmRpDL+GUSDhkFcBc/A/Q7BeStNXXI50/gL
	vrZfheq+gexQYu12TB8ygfpdi/ori5uBK7nVuYMWTLxgZ9fmlcYFwVFeYStgGptdlaPG
	SZSQjJRb+FuvIXidcYyY0mTbbfFTnig27XiEB2iLm1Kp0pv+kinMghvxT7bMjACWm/MA
	/wFAeGsqKqH7dgq8LStTaNelOAjMcf1A8UoogXGWL233wIIdlWbpz1/dxUdLKUcidTVG
	kmyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=7CqxpW32Lrdg+rYshnYlE/sP415jLck8WwcIfkJL2Cs=;
	b=VfAHb1475U9AsVgK/7kjGeiULjax9qQFFKpYTfQ2plQOdAW0r1k14/wuJxw5X2wSuo
	AJtjX3z1UgRQhoqN0uuWVciXWzLEdEwsKHryZWz6yx5qYQ70VfWXRnn43KI8KmZcVLcj
	SuHukzmgZcj2L2RXeRm6hwJcD0/QxkGIyGmkfOKXGZxNzXoHstmsnvOHuI/OOn0uu/dJ
	PVF7A4noANKMpYiaE7NSBudZz/AitvhR9qUrnrPp1k3xnFqDkd5Do0CRwky1raJtBYqF
	LP8ihspUPy8H9gKROl3EELXQimHLHyi7ZYiKJlJtm78/VRNAv0y3NSotcM0pDCMLLXTw
	xNfA==
X-Gm-Message-State: APjAAAXv0UhcPs5ColXmJF9gf1yN4bZd9+mAFz01Iwrk5WKV1Efmx0q8
	ep5H2qcQA0SK0yN2RilRDhKYccCJzbochMw35gE=
X-Google-Smtp-Source: APXvYqwY9FSwA8UpB0tSVWQpOx7udfxgMzgxMHZcyWxufMeILeT55E8gaRy15tzXYynTs5AphtqAJgIFjngl2AsHqcI=
X-Received: by 2002:a9d:4a9c:: with SMTP id i28mr3630459otf.326.1557422383214; 
	Thu, 09 May 2019 10:19:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190509081557.383974-1-parthitce@gmail.com>
	<845976C0-9771-46A4-927C-429CE67147BB@gmail.com>
	<18bd4168-41a5-f857-4d23-1f0e7d213aa7@gmail.com>
In-Reply-To: <18bd4168-41a5-f857-4d23-1f0e7d213aa7@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 9 May 2019 19:19:31 +0200
Message-ID: <CANNYZj9mKeFguQW0DYAw65-A1EF22_kwUU0DcxkZKGbw5HhtPg@mail.gmail.com>
To: Parthiban Nallathambi <parthitce@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] python3-tinydb: add version 3.13.0
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
X-List-Received-Date: Thu, 09 May 2019 17:19:42 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, 9 May 2019 at 18:24, Parthiban Nallathambi <parthitce@gmail.com> wrote:
> It's not copying the file into recipes-sysroot, but into native just for
> the installation purpose.

That was a bit hasty reply, yes.

Still, as we are installing a target package, we need the target
sysconfigdata, not the native one. We specifically patch native python
to pick it up:
http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/recipes-devtools/python/python3/0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch

Alex

