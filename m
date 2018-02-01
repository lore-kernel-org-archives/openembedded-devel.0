Return-Path: <twoerner@gmail.com>
Received: from mail-lf0-f43.google.com (mail-lf0-f43.google.com
	[209.85.215.43])
	by mail.openembedded.org (Postfix) with ESMTP id B484B60110
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Feb 2018 14:22:14 +0000 (UTC)
Received: by mail-lf0-f43.google.com with SMTP id v188so26461980lfa.11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Feb 2018 06:22:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=mj5q6P5b+ltDgkHSY4+MT7xXld8yNnSDBgvMPoZ1o34=;
	b=B0e/smhCcn7GH/BZWkcaHD+CwHtVoNgYMmlEDp7QJh7lcImYH9FIkxwOH8siC3N9lB
	lV2UUVQDbFjZMzlW77vpyBKMiBQPPErqXGc9HcOg8vhzDI/NeDWeBetrVzzyMlqN51aU
	JYrRCoMozc5moByjAaTBsWHMXqx9OgrqvTxXz9tYlG4lKaAdW04D2wrvN0G2m89bN43O
	ynhwVuiK7mDRp4NZBSafToP0gqhDJcY/XbKN8CxxO9kES3ZU/kU6dCL5T0WtosWTyOPW
	vQIj4qHagkFcjVuCCvMibuBF6kkvZi9O5EcrLCktzOvPX2PeArxmHwn9HDygWr4+QSV+
	nRMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=mj5q6P5b+ltDgkHSY4+MT7xXld8yNnSDBgvMPoZ1o34=;
	b=eOQRFin9bCp5lVltGBBI0qcWeChjiM4MvoEDr3Y4lD3vepmBV4UoTw/5DRgKw6SVFW
	KhZP6A/trYEwdT1cpEwdP5CTD+onDMtZDkOQ1xjDeupVjhVWoMM8AEXi2LNeIhv4ApXG
	0Bt50Eq/hWOIteAEuvxmcC1qe2Z0Er2c1WozLmakSjpsE1tLhAg9GVW8gSU6JOgOQtxC
	kP8HZTxsLEbqf5GcmIVi6nD6icaGyxphe9UgmzS2voceX0VNfrXtZI6KPiiMG680ylzK
	gKimK4lAWA8O3D/IRp/E+VerybDC5Aju3XErBFsvulgairUPGK99sxjDhFbFO/QMBX7a
	dTWQ==
X-Gm-Message-State: AKwxytf7iUxs9NnJ1RtyHmrRrykx4PQmHoo38iuLof73fcB5fUdTYWZY
	mQqOdCKKum9sWmJ5mJkhp0vEsMzoKHKDba8PY3I=
X-Google-Smtp-Source: AH8x227gY/aMLfJS2/Rx2kI1LNX3TzuB5Nn9yVZteVo0KrnE6RY9A3ZF9P21+SGeMqCV52Y41D6Fz3sawCJ2P5O/mCY=
X-Received: by 10.25.193.7 with SMTP id r7mr20314446lff.29.1517494935258; Thu,
	01 Feb 2018 06:22:15 -0800 (PST)
MIME-Version: 1.0
Received: by 10.25.217.21 with HTTP; Thu, 1 Feb 2018 06:22:14 -0800 (PST)
In-Reply-To: <CA+chaQcCkNLS49AeBALYKyiW+_Q_kAgtjqfKE+Orz-mWGMyE+w@mail.gmail.com>
References: <20180130121432.508-1-Martin.Jansa@gmail.com>
	<ec48cca7-f05b-826c-e3a5-a23ccdc9d7dd@gmail.com>
	<CA+chaQcCkNLS49AeBALYKyiW+_Q_kAgtjqfKE+Orz-mWGMyE+w@mail.gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
Date: Thu, 1 Feb 2018 09:22:14 -0500
Message-ID: <CAHUNapSQJoSJbexQd6_NWU=YO4ekubf5fwNeBdtrGxP_okkByQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] recipes: use oe.utils.conditional instead of deprecated base_conditional
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
X-List-Received-Date: Thu, 01 Feb 2018 14:22:15 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 1, 2018 at 8:51 AM, Martin Jansa <martin.jansa@gmail.com> wrote:

> I've merged it now to unblock people doing the builds as discussed on
> meta-oe github and also meta-raspberrypi github.
>

Thank you, it'll be nice to have a working master again

