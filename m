Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ua0-f174.google.com (mail-ua0-f174.google.com
	[209.85.217.174])
	by mail.openembedded.org (Postfix) with ESMTP id 7B60777E06
	for <Openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jul 2017 16:32:26 +0000 (UTC)
Received: by mail-ua0-f174.google.com with SMTP id j53so3467022uaa.2
	for <Openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jul 2017 09:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=6cd6S3EO2tQUA8og7hezqL/npbL3g0iVX8vYk8qxKpk=;
	b=EA4t6rqkW9aeP8uFnqTJCDFCS+SYhvWXxTp9g0C8Ur6LdDAtR9isEphFPLu+/PLuEJ
	59TVzO/6OolX1p/UrU91xHtUbFolSgj/DIXQMHU2fG5DCFF5KxN6gycmJ7QduAtC3J1L
	73e06MDNqKG9GnMi6lFrjzlUi1U/1BZKRS0u4zN4mjfeScXkwIx9VlU45ll1BqfUPB5U
	9oS8mSL+t9Bal1Utc0ZKJGt5xvJ0LXqYkr6k3cMa/JGEBCamgNpym2mmqRq4UTmCWhMz
	ztcSsOeFKrVWkKVnhLBSMfgbQD588NMECt2jS8MyVQSXvvNOi9EUjB2EQZ60dwkacyD0
	WC2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=6cd6S3EO2tQUA8og7hezqL/npbL3g0iVX8vYk8qxKpk=;
	b=GTBF0+8McEiT8OGrrf6bn0eNM+zWj9nL+SmHuIHL0ZMhCwvgxijqstxqI1Q2ur02Hg
	bXXZd2OHre4mJFi+CpgDQjAYxj+Wi8PrApzhLmqaxLgNk3bURBxDyzH6An5ulXWvUkSH
	h3ubYMf+UIHY97ADe5G/wF4rOKuIqAF/HFAlZVW5aU3YHeo11ovSRmqPtUQD7WPAdfuJ
	0ZgTNqACSCDUj8a4LYqbgglsuhtBq3m3AzRZPacTyFPobezd53Eag7bsbEDQwB3Y1wN9
	Kzd0BXOWoAaPyz07QXoKBEhGXQtcstLHnsaqeCEz//Ksntpx7E+8Qd5S/JRtFPxEOUz3
	1p+Q==
X-Gm-Message-State: AIVw1133NQnukswNdvdILAMGJ8fFy9vJnPpwTwhKQJ83qHZ9qVLNN+9f
	C8QQBlMeuj6YNSfYCyuE9QUk/+UVbwhH
X-Received: by 10.176.0.104 with SMTP id 95mr429466uai.124.1499790747919; Tue,
	11 Jul 2017 09:32:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.77.72 with HTTP; Tue, 11 Jul 2017 09:32:27 -0700 (PDT)
In-Reply-To: <CAMKF1spB+OyV7HLOyTy7NfE88+NQD_9QRADisH-ipdQGm2V_tw@mail.gmail.com>
References: <CAMKF1squ2QyqpKvUKbz7QP5YsBvd94B6jFaju0hL+qWy6cA7tA@mail.gmail.com>
	<CALbNGRQi_rdechQn35Dv+R9-42cvVahNt=K8MPYkaqhUhF90_A@mail.gmail.com>
	<CAMKF1spB+OyV7HLOyTy7NfE88+NQD_9QRADisH-ipdQGm2V_tw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Tue, 11 Jul 2017 18:32:27 +0200
Message-ID: <CALbNGRRxTNuWm_sLb2vUZjGHMerFP7OkkbptY6HM6iEXxjTXUQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5] qdbuscpp2xml native Crash
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
X-List-Received-Date: Tue, 11 Jul 2017 16:32:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 11, 2017 at 5:58 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Tue, Jul 11, 2017 at 12:22 AM, Andreas M=C3=BCller
> <schnitzeltony@googlemail.com> wrote:
>> On Tue, Jul 11, 2017 at 8:42 AM, Khem Raj <raj.khem@gmail.com> wrote:
>>> Hi Andreas
>>>
>>> This patch was added by you.
>>>
>>> https://github.com/meta-qt5/meta-qt5/blob/master/recipes-qt/qt5/qtbase/=
0012-qdbuscpp2xml.pro-do-not-build-with-bootstrapped-depe.patch
>>>
>>> This is actually causing qdbuscpp2xml  tool to segfault just on invocat=
ion
>>> when I build using on arch linux host.
>> Have you tried qdbuscpp2xml without this patch? Although it does not
>> solve your problem: I have Fedora 25 on my machines and qdbuscpp2xml
>> does not crash.
>
> if I disable this patch then build goes through fine. I have qt5 5.9.x
> installed on build machine as part of KDE desktop, I wonder if that
> has some influence over native qt5 packages.
The more I think of this - yes: Building qdbuscpp2xml not bootstrapped
causes linking against host's libraries and makes build dependent on
the version installed on host. The only way out I see is to remove
this patch and hope a bootstrapped qdbuscpp2xml 5.9 works properly for
kde's baloo..

Andreas

