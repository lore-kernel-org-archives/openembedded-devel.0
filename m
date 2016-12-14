Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vk0-f42.google.com (mail-vk0-f42.google.com
	[209.85.213.42])
	by mail.openembedded.org (Postfix) with ESMTP id 7CAAA7722A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Dec 2016 23:28:21 +0000 (UTC)
Received: by mail-vk0-f42.google.com with SMTP id w194so52461537vkw.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Dec 2016 15:28:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=wVxLpmWmDJrJ/71XVWCP6WtEsR9AIwxrR6sdrQPRTfA=;
	b=Xymaf4W/cq4ArqFgUdhPQqmj2G6a3sl3l6J1LChql/2/8PDHlLcoN2BALPemt4Ef5c
	TF40rLM1tYky0EE2DUYPePmkHE3Xzz2mZw28a/nWlctPbiAtv+A34OitxEvZduTAnxWW
	N2nXUJZ3TQe/nt9FNrpBBJ6SCybgXS6tHUfZGaQl5EEYu/P4KhX2XHgepmnoXmSwZe+o
	SpjYT6DvcJMwo3gIxfn28+tvvHeLxwEFCEC78wwU0i5IWpwGk7EPQUV/7Y5W3JKNUMkG
	3zMsP48cUczFpudrObUca4n9nIqxNgi4DU2b/bB0A2QsKEzfBPIvLZ5S6ZmsIECInnjG
	zYvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-transfer-encoding;
	bh=wVxLpmWmDJrJ/71XVWCP6WtEsR9AIwxrR6sdrQPRTfA=;
	b=M3Q326qr66iYVAO2wXe5NqDseM2+1T6CO9xyCVQjGPuDXypEhSE7lQoQ7PJXBVnirm
	7D49HC6v6C5QRf8yvWf522rt7+QhWnbB4FnZUJxoW09WbeiYDrBA6luHbAVMVbp9we2c
	hQ3NzLOM2Hlp7KdSZ6NUjtNAShjLPUBKGI7ZilhzW1eB0xXAAS4zKov8j0DooXHv8Ezd
	YUFBqt4igEkOtOaiYgEinpT6UnWVvf/p8yrFl71WVIoTem8QE1s9PSD2R5cg5dlKIDe1
	619+Px4vWqMsq2FoJGFX3BmQ4Wid4ZCwi9hvZJcqVqnxyRH/fN5fVVL2cCBmPbQp2dRg
	jmlA==
X-Gm-Message-State: AKaTC03EC0mbpyRtTuwN3EPaYdOWkIKx1WU1XNgjCfOfnSzxmTF7pq4StmCGWe6PA3yY9MZxwXQg18OGsmpZZg==
X-Received: by 10.176.5.130 with SMTP id e2mr93424036uae.108.1481758102362;
	Wed, 14 Dec 2016 15:28:22 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.85.157 with HTTP; Wed, 14 Dec 2016 15:28:21 -0800 (PST)
In-Reply-To: <CALbNGRSX7gZwpAAKp0jiPp4CT+xUXHr6wU_Zs2n+ug7xwp2hHg@mail.gmail.com>
References: <1481755778-16443-1-git-send-email-schnitzeltony@googlemail.com>
	<CALbNGRSX7gZwpAAKp0jiPp4CT+xUXHr6wU_Zs2n+ug7xwp2hHg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Thu, 15 Dec 2016 00:28:21 +0100
Message-ID: <CALbNGRSD5thQE61ov3Jqrj1aHFWavqGD-Q_0vhTAJ7Jn-3rodQ@mail.gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-browser][PATCH 0/2] firefox fix build on oe-core master
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
X-List-Received-Date: Wed, 14 Dec 2016 23:28:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 14, 2016 at 11:58 PM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> On Wed, Dec 14, 2016 at 11:49 PM, Andreas M=C3=BCller
> <schnitzeltony@googlemail.com> wrote:
>> * recent 'use system's nss/nspr' broke firefox
>> * to build properly patch just sent to oe-core is necessary [1]
>>
>> [1] http://lists.openembedded.org/pipermail/openembedded-core/2016-Decem=
ber/130211.html
>>
>> Andreas M=C3=BCller (2):
>>   firefox: fix configure with oe-core master - there is no nss-config
>>   firefox: use pkg-config to find nspr
>>
>>  .../firefox/0001-use-pkg-config-to-find-nss.patch  | 47 +++++++++++++++=
+++++++
>>  .../firefox/0002-use-pkg-config-to-find-nspr.patch | 37 +++++++++++++++=
++
>>  recipes-mozilla/firefox/firefox_45.5.1esr.bb       |  2 +
>>  3 files changed, 86 insertions(+)
>>  create mode 100644 recipes-mozilla/firefox/firefox/0001-use-pkg-config-=
to-find-nss.patch
>>  create mode 100644 recipes-mozilla/firefox/firefox/0002-use-pkg-config-=
to-find-nspr.patch
>>
>> --
>> 2.5.5
>>
> And again sent out too early firefox still fails - continue with V2 :/
>
really wonder how the last system nss/nspr patch was tested...

Andreas

