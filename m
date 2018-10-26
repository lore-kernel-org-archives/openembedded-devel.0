Return-Path: <schnitzeltony@gmail.com>
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
	[209.85.210.66])
	by mail.openembedded.org (Postfix) with ESMTP id 417026025F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Oct 2018 13:47:44 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id k9so1086697otl.10
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Oct 2018 06:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=uqPKCAjmDQnkNc7XrbPnxqkaUhsc5Qpz8onEaXoVHH4=;
	b=SQsTMCBTQgmUq1yDzy1gFWLxAeYSR32phjESMnvK1mMlErqh/I2lVKhjzhZgpsiNUw
	SmUTo3VPSwuNNRrODjAXWo+xptLmQcKqaYA5rkk1WN//Wc0WkaN/d3jF7rBzOenlNFyX
	gy9loFd+ipL28IamZa9hHO+Rdim5fsx/+dFOI8v2GaCCJLuAm9MMFLc6wpTTfS8NBok6
	Knk+tMNOxwLyR8z+gzVInAhYjNOp3LTZAHtngBwHK2S/+DeRZ9GcqYvX+9iTGzFbnOPs
	EZc94JySqnoa0HMjBk4jp4ajFUClIukAUEvcleVlwEHNQjJYrJRVyuciRdm3nHRmkRq6
	aTyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=uqPKCAjmDQnkNc7XrbPnxqkaUhsc5Qpz8onEaXoVHH4=;
	b=Fi++ER4OyEbyfKCz+qoMMNSxM1poI0hH3AszJ8xORnOBz7HMOMWdA25ulBySDv3xGj
	Ay/0hAsU3CAkoYG3xo4QikyCDqTmK0D0h8rEXoMwNI9f0Bid24VaGsGO3A4XOrPIuCI/
	0sgpLCV4n65fImUyc7887g2pg4kIGI5KECS3N27Am85ay5h10/qO0Wlf0zTQugepiJtO
	dYboxRVvi0xDk8k3qwbV3XP9/bW6azKxkR7AN7pdE2c9mA3Rc7asbU4mufo6ymkI6SAo
	eFceQZIVab7cQn7caV02oApt6JIzBGM8KJ69yxQQKgNnuJuXJE4vFXzKxZsHmR1dJcwP
	8Bqg==
X-Gm-Message-State: AGRZ1gIdikYerfad8X5lcxPOLAB1H8UiMCFyI5SHN1GkjPCumpRXIxRw
	hY9vBfVEKPARfy3DF4RwFxKj3SqkWEcYoqkE0iA=
X-Google-Smtp-Source: AJdET5d3KjJ0QEnhDT2GXevBG/naS+rAuZ1AIysO1NAe2J67VrU+vg6/WlH7uhMvf8o3rmGieGcIjWvBZeXkOpy5VW0=
X-Received: by 2002:a9d:d52:: with SMTP id 76mr2299002oti.326.1540561665096;
	Fri, 26 Oct 2018 06:47:45 -0700 (PDT)
MIME-Version: 1.0
References: <20181026104857.32142-1-schnitzeltony@gmail.com>
	<CAMKF1sqS-wLnd-ULxV+sL9REtC94Btc=FNzyw=pVg9cBtqQaOw@mail.gmail.com>
In-Reply-To: <CAMKF1sqS-wLnd-ULxV+sL9REtC94Btc=FNzyw=pVg9cBtqQaOw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Fri, 26 Oct 2018 15:47:31 +0200
Message-ID: <CALbNGRTo3MqZ1kgT5YhbntmhPp_aS2TqNcEt8EFk_WwK8gw8EA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 1/8] xfce4-settings: upgrade 4.12.3 -> 4.12.4
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
X-List-Received-Date: Fri, 26 Oct 2018 13:47:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 26, 2018 at 2:44 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> Hi Andreas
>
> On Fri, Oct 26, 2018 at 11:49 AM Andreas M=C3=BCller <schnitzeltony@gmail=
.com> wrote:
> >
> > * A GTK3 version is abvailable but keep GTK2: haven't found the time ye=
t to
> >   rework my additions which I would miss.
> > * 0002-Fix-linking-to-dbus-glib-bug-13633.patch had to be aligned sligh=
tly for
> >   changed sources.
>
> I dont see these changes in the patch. It just is the recipe bumping
> the SRC_URI and PV
You are right something must have gone wrong - will check - thanks

Andreas

