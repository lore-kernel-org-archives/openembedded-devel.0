Return-Path: <pbasista@gmail.com>
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com
	[209.85.167.178])
	by mail.openembedded.org (Postfix) with ESMTP id 6CFAA6C184
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Nov 2018 21:44:39 +0000 (UTC)
Received: by mail-oi1-f178.google.com with SMTP id x23so870801oix.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Nov 2018 13:44:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=7kliMGcBVUUn8kcgu7AwOHRK1iGeqaRbggsx+3TFmI0=;
	b=qr3QTMumLJbvtIG6xfv/eAO/xkzZQBD/F6q5jxsXlxBnm6b+NE/KV5Ddmq7u+qkj1s
	Yf1QhkuXAHQFch9ZtXD8f/+Nx9mZgz5PnApHP4rRZ3hKvoksHnvBbdBLHn5lGkiIpZq2
	ssGDO/e9LTTRZLutCMyThr+EpH7JMZy4HHp5ttEyP7ZZD0bWD52HpEbVmCFfaVwuweXn
	ohzY8rbMSoqpqQehYh3sEGjlmXwgF/5SCN4LODEsbmqWhPgT+BBhOute4A1z+3hnKvTL
	mMrxA4ufoOSb1e1e7+VZ3kBAh/dc8/duzVsUaRjychk6RoH2TackrT3i3+9jxJadbQk1
	bcRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=7kliMGcBVUUn8kcgu7AwOHRK1iGeqaRbggsx+3TFmI0=;
	b=orxrvMiytdoM2l9+AXcFqetJGD+3P3RXutGvyvgoPDjD2GSgFgerJ350KMv2juoJfQ
	q51TYDPlxlmvCpvDzzNv0NAk4mzc/E3kvyTyWiSWKOYuORab6SY+WSdpfq9w0Pekd37j
	TKdUOR3/czDup7zZmV5EKd0i+X/OEIpkSb4mzkqh7tbB5gEfZHr/WxI9EUE6wmjnZSR2
	6Z7aw3gq9J9CjWPNWtsn+gyTQYhXkYtYjyEOk4voydpCBRnkK0Ky3XaCbHVVDUT/KnYR
	G2IL3yJSUlOx8qksQ4Lp1sjdx0ODd6PNAqev28/LbEp//F8IJp5nKZj1SyK/Smwt1z7e
	TDVw==
X-Gm-Message-State: AGRZ1gJ906zaVTR3GCw+/Yy8l6pmJeRbutJLQxbWuoP58CIqbrcNeE5p
	AOEG8Y7Q8fA+O0ltVNuETmzzecXJd9zmYaxMXTrzwg==
X-Google-Smtp-Source: AJdET5djiehaZ1qVjgDWfz0g+DcYR2JE+zr3USGm+P51hdksr+PCWIK+s9Lqf8VZ6yjvLSs5O7EdmUieLQjw8K/F3p0=
X-Received: by 2002:aca:3bc4:: with SMTP id
	i187-v6mr4103309oia.284.1542491080372; 
	Sat, 17 Nov 2018 13:44:40 -0800 (PST)
MIME-Version: 1.0
References: <CA+2FH0+dA+YDr6cU-WbXAXX5EmH7CnO4CDxWgtXy-680KF5FyA@mail.gmail.com>
In-Reply-To: <CA+2FH0+dA+YDr6cU-WbXAXX5EmH7CnO4CDxWgtXy-680KF5FyA@mail.gmail.com>
From: =?UTF-8?Q?Peter_Ba=C5=A1ista?= <pbasista@gmail.com>
Date: Sat, 17 Nov 2018 22:44:29 +0100
Message-ID: <CA+2FH0K_gV1i-kXHYAEdEemcE6NaqXhci-fd0eeB6cirL0Yjrg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [meta-multimedia] Add a working Tvheadend recipe
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
X-List-Received-Date: Sat, 17 Nov 2018 21:44:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

a few months ago, I have created a PR on GitHub about adding a working
Tvheadend recipe:

https://github.com/openembedded/meta-openembedded/pull/91

I would like to have it merged, because I believe that Tvheadend can be
very helpful with setting up a TV streaming server on linux-based DVB
receivers.

But it seems like no one has looked into it yet. Therefore, I would like to
ask here how the process works.

Thank you.

Regards
Peter Ba=C5=A1ista

