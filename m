Return-Path: <schnitzeltony@gmail.com>
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com
	[209.85.166.182])
	by mail.openembedded.org (Postfix) with ESMTP id 95BA97F847
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Nov 2019 07:56:06 +0000 (UTC)
Received: by mail-il1-f182.google.com with SMTP id a7so18739113ild.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Nov 2019 23:56:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=Z2hi0u4dOieJ2Y1zy3AfsV8ViiDxt0h5gYeHiK2ysl8=;
	b=lwJNe+6xlmWtWfoifFTR9bJBnYHfmAbxAr/teFMfe8YUU24dP0Lf1NyP3cA7Wzj69s
	RDPZtIAiywEcZUPxVjIKamaxIc+7fdPFDdAuQSC6xvwYhxqhGQeR0vE7hT5tpzVZvt5V
	4BT+sO/L03KEArBs1JSLKZQcc6/lheuItGJXmUyeSlH4CpIBDPKiRiQNE7TDKLKXuhFI
	rSiOj6EBNVvy8RIQLSmRlGj6CciZxkDd/p9xboVDaj74b5DQvB3t+FzF6k3qCznEFHzl
	6zlQ4/2ZtBbasoZ8lUc5VOC0jkqp6VidgTXoWRV6Ytm1ETyUV7Z1Qgix+PFlFAVw7HJR
	o25g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=Z2hi0u4dOieJ2Y1zy3AfsV8ViiDxt0h5gYeHiK2ysl8=;
	b=MtW448fwDYt7MGIrit14oJOKxL9PNOPY+BxUwtSjLM92Ti+TG90iYP5wJBcPSAmyML
	efBscQu55ouoOYzCmf5cZ6cvLRpzeoxGFliwkOt4p2nZKCsOeoxUVYWv5E9CJVoiRbS4
	bLxSk+xI340NfZVYjHINTzCCVIXVt90Ktoc3MMFFq1TxIGcbqdYwTc3WEdkJDcjooUU8
	szW0xBHzhGIL/XaxLajvoyOQrKmjNrA1CzRKQtaYsi8kmLEw8OfJz1XOjn9gXg23WMc4
	AJZ8Kjo8vVovIc3oVbQebXf7B1uwa/FzsjTRXXb5FC+mUTUdxuC3n3y/7emPJ/zAXIO8
	39sw==
X-Gm-Message-State: APjAAAVWO5V2aDGBo7FoBpuMUhxg/oBn8Th1ND4pHs95Gq2LKg+cFK5K
	02EwloFhfb3j5FTdSfIH0UohS5GgKWUP4P2C3ATRJ4dw
X-Google-Smtp-Source: APXvYqxKPmCw75Ez72CFkI7hEGKttmQeRV0y/IGzHYT2B8wCdt3cwEjM4ytgmw2UQrop1c5MA0m/ravdhIkqU5bzJRo=
X-Received: by 2002:a92:d80e:: with SMTP id y14mr21316884ilm.267.1574150167394;
	Mon, 18 Nov 2019 23:56:07 -0800 (PST)
MIME-Version: 1.0
References: <20191118014035.15189-1-kai.kang@windriver.com>
In-Reply-To: <20191118014035.15189-1-kai.kang@windriver.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Tue, 19 Nov 2019 08:55:55 +0100
Message-ID: <CALbNGRT=hGkyD+ht3DfhAKooTo-g9w6v23cyyVJm=HX8XA1zxA@mail.gmail.com>
To: Kang Kai <kai.kang@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-xfce][Patch] thunar: 1.8.9 -> 1.8.10
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
X-List-Received-Date: Tue, 19 Nov 2019 07:56:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 18, 2019 at 2:40 AM <kai.kang@windriver.com> wrote:
>
> From: Kai Kang <kai.kang@windriver.com>
>
> The tarball name uses all lower case now, so SRC_URI and S are not
> needded to be set in the recipe which have been configured in
> xfce.bbclass already.
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
This one seems to have missed patchwork. Nevertheless

Acked-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>

