Return-Path: <schnitzeltony@gmail.com>
Received: from mail-il1-f193.google.com (mail-il1-f193.google.com
	[209.85.166.193])
	by mail.openembedded.org (Postfix) with ESMTP id DC3357FE45
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Dec 2019 10:13:30 +0000 (UTC)
Received: by mail-il1-f193.google.com with SMTP id v15so1231013iln.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Dec 2019 02:13:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=XYnUaz72hqa1gUdA6e7Gv8oIjcrTmHSiO4dNNByuQzs=;
	b=DmCeFEUIWGVmNqZx5Nl/+tm2YWdoH3h15ZIxOXbI8GGH9052rU9xIprfdVXTvJuCX0
	1ORBbFH5C9+tkjgh7B+X2Mn8jS4VEVv34GF/a70YYeGyTwKkoAGSYoY1f1BbKSKvLLuq
	Qsd5lk5s/x0xTbIGyZHs3NL5EKXnk7meCJFxNlDLoXXC9ky9b/YAbt7xrYheUE+HDSHk
	fMU7Da3spOgTYIlHGpvQv9PucQyHfSrL0HTxLPGzeecHP5EMptRCdCIGOItL9PZx32gj
	oMKz7YPkzABztfJ20JxddCT1qWzSQRA3DIjD52em/jirAE++/ASkqzGyPnXZS6GNgDfR
	ragw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=XYnUaz72hqa1gUdA6e7Gv8oIjcrTmHSiO4dNNByuQzs=;
	b=J1vzwgSugXXfaSZE4xw8HdmFGXgBgUR/mRT9ZdcZeH08/otJ+c/0uVP6pGo9nsJhGZ
	Y4TE+8WPpR9Q7cJ/fUaB6CSeQM27ftLpxc8Jx7DJP+05Y34hF6TrKxlBlQy7450whOAt
	asWsuP+XG93XMWJytwtGr97QkBka5edLvvQ4QZUgmwmhsLKDKl30MYtW8782RKsYANwh
	hpAJJ4T+5Q/nzpoNWJIGc4vlcjSZtJ7H7uUQZa1dajthfTSWMxwQrVISIPg6XPm++HS0
	ouwyln+5Kz02Gv3nVbj9DXU0/PH+5IfboBBFOkxqROYHXSTv2VUwYYc22iOycM688EQG
	qw7w==
X-Gm-Message-State: APjAAAVXI/J1Wh0AedRKzhDB3UU+S2F8h2fzijINHIo7MUdO/z53NaoK
	Z22Lu0IZpEsedD0oIdWa811zaO3eY5xrXojOlls=
X-Google-Smtp-Source: APXvYqxS2lF5v9LDKMit8+Hpq9wE1DiI7zGKYiumnkLWclwDV0LQLCIf9XujRLSgseGXLv2496Rl4qsw0Nny4j+PGlA=
X-Received: by 2002:a92:4781:: with SMTP id e1mr1051852ilk.147.1576664011828; 
	Wed, 18 Dec 2019 02:13:31 -0800 (PST)
MIME-Version: 1.0
References: <20191218024810.2874990-1-raj.khem@gmail.com>
In-Reply-To: <20191218024810.2874990-1-raj.khem@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Wed, 18 Dec 2019 11:13:20 +0100
Message-ID: <CALbNGRQZvCmx=2Z3OR3QfakVfzjcNLNgJ2BoCqO0ON+FJjpzjA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-multimedia][PATCH 1/3] tinyalsa: fix installation libdir path to match multilibs
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
X-List-Received-Date: Wed, 18 Dec 2019 10:13:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 18, 2019 at 3:48 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> Fixes
> ERROR: tinyalsa-1.1.1+gitAUTOINC+8449529c7e-r0 do_package: QA Issue: tiny=
alsa: Files/directories were installed but not shipped in any package:
>   /usr/lib
>   /usr/lib/libtinyalsa.a
> Please set FILES such that these items are packaged. Alternatively if the=
y are unneeded, avoid installing them or delete them within do_install.
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Andreas M=C3=BCller <schnitzeltony@googlemail.com>

Acked-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>

