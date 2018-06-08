Return-Path: <samuli.piippo@gmail.com>
Received: from mail-it0-f68.google.com (mail-it0-f68.google.com
	[209.85.214.68])
	by mail.openembedded.org (Postfix) with ESMTP id 624B0753DC
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Jun 2018 04:21:14 +0000 (UTC)
Received: by mail-it0-f68.google.com with SMTP id n7-v6so791562itn.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Jun 2018 21:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=8Gq2hWHAYqJS3eCMtTV1lnT4aUHkreY83Bo4gxdboT4=;
	b=MKNrAbSo+5ZAcRcK/mAm7bD8TS9Mm0TNAebz9+uSD5cz8nHTgzJf8g9eaE0KTCnVE2
	6esBf0e2nb31u1KHLgCT+NXzJ1WBuZDQqkzTTxx1cWYa2JaXLdKExpnbfDxPbqAsWOav
	B+tzoXVLSSOFwwpiscfyriepPuy+YeY5dVzEJRstfOUCMp2cCBq6CCq9eF8AatNt/6Gr
	zm1fOoSuXSRb9B9IAlG1zTNniXYMiENl97gautTSFX8CL9HKZcYQnHYVFrBlxQ+1rzlq
	uBpDot6SAqssu5cRi/YJeW6xW6N1qldKySLnJghgLHDCCwTwWMNaHC+cDKtT+g0xftGO
	vdww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=8Gq2hWHAYqJS3eCMtTV1lnT4aUHkreY83Bo4gxdboT4=;
	b=htF59MHa5NREb7wQuN1lR0/lUMubI+CQzEMjvAKjVQ8kVlVF7KFqsY3KHkoAy+0gpI
	AsEirw38qCDZaGO5xIHeNEDnuBj2vNvVNt++fmt1f1QwV55MO0wpzxawTOmnm7nU/h37
	8bd6Q7MtkFYL2kNzLHeMxbrikXtmVr+oFZrAG5RHPfu2XVX2GBzGDEcuijkOfNp0E0Jy
	HjkFd5dYf8FdCYJhwh2+LP4c2SxiBP5GKW32ENuLeNpeC3/6Q8icbrJZyIzq74YcXTgx
	WLScWaf3esEYVtpza3bb/hFvA5TPTYwiRqlMipq59hnl0IL5O80SJk2k86h4LOeC8enC
	vBWg==
X-Gm-Message-State: APt69E1FxWVXOU2W9DosvF5rnIm4ghPnMe7e5CMJ58BEBRJ0h7pk1nLF
	Q9WGPWL0aP3gnrEnI/CIg3iThbI9hWDGqHO6es8=
X-Google-Smtp-Source: ADUXVKIhQ7aYvyh/jOOGFFDiebVEJ2Pbxv2jGj09UTKFSi8jgaH4/0qQ9MwPGgv0H3dqhgG70+K769jS6wfATzYMJxk=
X-Received: by 2002:a24:648c:: with SMTP id
	t134-v6mr419373itc.150.1528431675107; 
	Thu, 07 Jun 2018 21:21:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a6b:8855:0:0:0:0:0 with HTTP;
	Thu, 7 Jun 2018 21:21:14 -0700 (PDT)
In-Reply-To: <20180606200506.GA1353@jama>
References: <20180529092556.25053-1-samuli.piippo@qt.io>
	<20180606200506.GA1353@jama>
From: Samuli Piippo <samuli.piippo@gmail.com>
Date: Fri, 8 Jun 2018 07:21:14 +0300
Message-ID: <CABXoSoUparq518CmSYB-8g6nemqE46pyU5CBwQHWT6B+QdXNJQ@mail.gmail.com>
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
X-List-Received-Date: Fri, 08 Jun 2018 04:21:14 -0000
Content-Type: text/plain; charset="UTF-8"

On 6 June 2018 at 23:05, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Tue, May 29, 2018 at 12:25:56PM +0300, Samuli Piippo wrote:
>> Add recipes for Qt OPC UA and Qt WebGL platform plugin.
>
> Unfortunately qtremoteobjects is causing gcc 8.1 to segfault
> during the build:
> http://errors.yoctoproject.org/Errors/Build/60747/
> the same with slightly older SRCREV currently in meta-qt5/master:
> http://errors.yoctoproject.org/Errors/Build/60753/
>
> Can you check what in qtremoteobjects is triggering that and report the
> issue to gcc?

We'll look into this.

