Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-pd0-f182.google.com (mail-pd0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id 1582371144
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  7 Jun 2015 10:50:40 +0000 (UTC)
Received: by pdbki1 with SMTP id ki1so81489664pdb.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 07 Jun 2015 03:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=svafQ+BDph3YkGxbkAbdH6QpI4atEnRR6e018nI/LvA=;
	b=NvLrSv8C+VsoI8ZTXtw88t3V6Kb3lUNOqOb9Ath8OscNItRvBsOrCQ05SH7WT9mCqp
	0SJhQBX7A0X4aebCOVJ82MqpEXQiznCeUvyC0JLX6MjwwlPAYbgeU/6seodc1RuwekRO
	7zC5ReDv5qZL+zvVxwAYTLGY+/1hmNnpPeHCKDDCsz3jiPCo/FjveZ5C9rR1QwvgnTE5
	eRf0z6EHeXxE2nvap+XOaCe7AMDBQCnL3jasAp/TPb6DlnRnzIZWAqlSbKUoDnlUU07K
	4rcO1yiJTvbYcbiAwFW5LYIkYiq+Ek4rD+J6U2xNR+VlAktz19LpUQVWDiDLQ2fiLNlD
	Zllw==
MIME-Version: 1.0
X-Received: by 10.69.10.196 with SMTP id ec4mr20686163pbd.69.1433674241867;
	Sun, 07 Jun 2015 03:50:41 -0700 (PDT)
Received: by 10.70.44.41 with HTTP; Sun, 7 Jun 2015 03:50:41 -0700 (PDT)
In-Reply-To: <CALbNGRQg=_5U+2Mf6B=sHhAXbFRyesWKKv2Ow9x0ajWuX4zXHA@mail.gmail.com>
References: <CALbNGRQg=_5U+2Mf6B=sHhAXbFRyesWKKv2Ow9x0ajWuX4zXHA@mail.gmail.com>
Date: Sun, 7 Jun 2015 12:50:41 +0200
Message-ID: <CALbNGRR-Zk6cFwSD3n=cGC59X5216NaAD9J7SCu8P=nTFaLoeA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5] What am I missing with qt5-opengles2-test
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 07 Jun 2015 10:50:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 7, 2015 at 2:24 AM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> Hi,
>
> to gather information regarding my BPS's Open GL ES trouble I tried to
> run qt5-opengles2-test: it segfaults.
> To check why it does so, I added qt5-creator to my image, cloned
> qt5-opengles2-test and compiled & debugged on target machine.
> Result: qt5-opengles2-test segfaults in qtsensors /
> qtaccelerometer.cpp / QAccelerometerReading::x().
>
> I think I don't have accelerometers on my board and therefore the
> variable d containing accel info is not set.
>
> So if anybody has run qt5-opengles2-test successfully: Let me know
> what makes the trick
>
Solved - patch in preparation

Andreas

