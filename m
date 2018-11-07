Return-Path: <schnitzeltony@gmail.com>
Received: from mail-yw1-f67.google.com (mail-yw1-f67.google.com
	[209.85.161.67])
	by mail.openembedded.org (Postfix) with ESMTP id 8627879EFB
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Nov 2018 23:28:46 +0000 (UTC)
Received: by mail-yw1-f67.google.com with SMTP id d126-v6so7313188ywa.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Nov 2018 15:28:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=0KVuWH1TSAiPXBhBdf8XRbqkaUEhmVrPQMKH6gVCpcc=;
	b=qveAhqLnJPiNnmEW4nmvWXws922qLc3gZAhhFihS26vn+a83insNM4t7Ugv7AdT/B4
	mphtrmmLQamt4D87Ge+epywTgr3Qi5jNKnPOc5ql3dZeNv5I4LnspnHd7A5y25iohtjF
	lnhsKyTm61R/36l2eTlRPLfOF5UszyLF3zMV2esbWqSO3g6QZE+yoKl+w79DYwpzEje+
	JcwCo2YILwTkyclFHUON7bkxeNKQsdRMYm6OGOMpFDCKVUTjovswawCd4cYVcQCXYEsZ
	cJIjU5SLbk3n9L8UKi7EjZI56xHaK+g4YcK5181aDzBTx9gn0NWmq1M0Pq36e843Tpj4
	3ZMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=0KVuWH1TSAiPXBhBdf8XRbqkaUEhmVrPQMKH6gVCpcc=;
	b=cpDXeb5Kl6Vn/B0FaUjIHUalIEEpO6DHLCW437nAcz60VK/aNyLUyDGdMfVal5/n4e
	hJflrr/VtqFehFMSbjuvwgjjxh3TEL8son0mKNlRDk0U+4n3yVr6+Xl59P1aY3pkDMYy
	5/YoRv77ONpMdG+9U6BJjNk3Jt4Jry31qZ3PC4C0S/KR51gM+NihpyKOo0JKPHd6boLb
	Y7wVF8in+LIruHfI0X3s1kdCnDImWAWK/UTyIJ0pAHre3BjN9KWMHR85cY410N0XqNEI
	HLilOzb9j54G+fHex3isw9fQxgLGFudmySnDw0CKldmmaHLnxSjxSELenFcfTEvYCj1z
	tDFw==
X-Gm-Message-State: AGRZ1gIEVs8QRJWPPsrq37t9d+pSdbkZ4NSNPtPXAexSA+iYZfqJbmvH
	tkunY2LgC3HwrRhUFwmqZx33rn69PCYpgL8QyEcvxQ==
X-Google-Smtp-Source: AJdET5dcbnqjX5ILwtsYeb1Vb0zgpzWCuNIM9YPLeTD6qLZ2yVLlg+Fjo55seRdIRcMq7dUMmQLVKjnYOsDnKQIQfH8=
X-Received: by 2002:a81:2f89:: with SMTP id
	v131-v6mr2261608ywv.104.1541633327627; 
	Wed, 07 Nov 2018 15:28:47 -0800 (PST)
MIME-Version: 1.0
References: <20181107200637.22770-1-raj.khem@gmail.com>
In-Reply-To: <20181107200637.22770-1-raj.khem@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Thu, 8 Nov 2018 00:28:35 +0100
Message-ID: <CALbNGRSnu2=xyt9LxkZ4Hi=dxUznfAyJiuOo=WBrymxH7x6OwA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] networkmanager: Fix build with musl
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
X-List-Received-Date: Wed, 07 Nov 2018 23:28:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 7, 2018 at 9:06 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> Remove redundant header includes
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> ---
>  ...-net-ethernet.h-and-linux-if_ether.h.patch | 53 +++++++++++++++++++
>  .../networkmanager/networkmanager_1.14.4.bb   |  1 +
>  2 files changed, 54 insertions(+)
>  create mode 100644 meta-networking/recipes-connectivity/networkmanager/n=
etworkmanager/0001-Do-not-include-net-ethernet.h-and-linux-if_ether.h.patch
Hey Khem,

Just did a glibc build/run test: You are right: the includes seem to be use=
less

Thanks for taking care!

Andreas

