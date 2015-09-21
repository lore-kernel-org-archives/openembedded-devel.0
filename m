Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id 550F460053
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Sep 2015 18:06:40 +0000 (UTC)
Received: by ioii196 with SMTP id i196so128921024ioi.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Sep 2015 11:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=RIVp7mA7B7PG1pKk+HIAhk8W+mM8hjw8h3YQBlX6OEI=;
	b=Cmn0R6naYkNgMw8ZyzCBYCFSfW1k6m7JkPcP0wxj5GJe2y0XnWxy8Styug9qkcIlpC
	PIhypjcHJe7sr/XX+kmsQKmtOTdeka/xyitaDMQIcZUlG4/TYBWUQA7hnHh6RGgC4piR
	EvpBvj3xC9WwxddoSUuL5/pA8J4LOnIVAPAV7RgzlHUBJQN/Z3JXIZbhhBH2PvA+A7md
	H3i7VGXAsIivFxajxHUsE6Rtkv6JKSWDyj457357IND0tjh/Myebbwc7m8AMon/yIswL
	j0RZKzsFjfAeC4O5Oy9RJ2oJaYMB1vaF2FDzZP9My4dCgqFGyzY/kZJBVHwNrTNVEgd2
	6Vww==
MIME-Version: 1.0
X-Received: by 10.107.10.79 with SMTP id u76mr26357239ioi.99.1442858800459;
	Mon, 21 Sep 2015 11:06:40 -0700 (PDT)
Received: by 10.36.98.5 with HTTP; Mon, 21 Sep 2015 11:06:40 -0700 (PDT)
In-Reply-To: <1442825975-8950-1-git-send-email-adrian.freihofer@gmail.com>
References: <1442825975-8950-1-git-send-email-adrian.freihofer@gmail.com>
Date: Mon, 21 Sep 2015 20:06:40 +0200
Message-ID: <CALbNGRT5JSEntHLBv=22Kqx9gkO1WR7pfFOXZW_jbm5+HQhJFw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Adrian Freihofer <adrian.freihofer@gmail.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 0/3] libgudev fixes
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
X-List-Received-Date: Mon, 21 Sep 2015 18:06:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2015 at 10:59 AM, Adrian Freihofer
<adrian.freihofer@gmail.com> wrote:
> Exclude usage of libgudev with older systemd versions providing libgudev =
as
> well.
> Fix networkmanager and modemmanager to use libgudev instead of udev.
>
> Adrian Freihofer (3):
>   libgudev: exclude use with systemd <=3D220
>   networkmanager: depend on libgudev not on udev
>   modemmanager: depend on libgudev not on udev
>
>  meta-oe/recipes-connectivity/modemmanager/modemmanager_1.4.2.bb     | 2 =
+-
>  meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.4.bb | 2 =
+-
>  meta-oe/recipes-gnome/libgudev/libgudev_230.bb                      | 2 =
++
>  3 files changed, 4 insertions(+), 2 deletions(-)
>
> --
Whole series

Acked-By: Andreas M=C3=BCller <schnitzeltony@googlemail.com>

