Return-Path: <schnitzeltony@gmail.com>
Received: from mail-yw1-f66.google.com (mail-yw1-f66.google.com
	[209.85.161.66])
	by mail.openembedded.org (Postfix) with ESMTP id 34D1F7C0E3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Jan 2019 11:16:06 +0000 (UTC)
Received: by mail-yw1-f66.google.com with SMTP id n21so5632346ywd.10
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Jan 2019 03:16:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=selOkDC3EIEN3EjJ6eqFph4QjFjs3qUDJ4DK4SF8/WM=;
	b=avOLEBswNeIE1te9ZBeUpvcP7wQ92nEjCfU2Drd8RZrwAFAcqekSF6/rAdgqn9rf5Z
	+MWDfet5wymoltdeMUwmO7QfJXZ+zYNe3zYgmFlVw+iBGUf+scqZgMyxuluSX49K2pHE
	xcu2YjdmnZ0bvB7qyUIPlsIk3+VC58UiNswASKXfsMKgK8sjwdUfaQEp/g0nZEexfHu6
	iH3Vu/KY6X+zbB6eet0YTl/xCC2qoBXuTFSDqP73/HRaNAhZB9mYFrnXcOutYNvfkI+3
	RenpXQzUjpgQ+oHSq5xepHtNx6PM7rMMrjuNE7aHNSANrpMSgHzbTjeTuq7SBoRJrKIp
	TJ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:content-transfer-encoding;
	bh=selOkDC3EIEN3EjJ6eqFph4QjFjs3qUDJ4DK4SF8/WM=;
	b=t0dRSKUDJ9d2Ep0SRnauzLV55qAOUc+WSj7TqTEghlbOpyQVxKrf42qkx/HCpRLRua
	MYt47DzPRxn3BFXPBjIp6KQ83njlJzuuc53tV+Fs1/npqjN77Y3Zar50VgEvCKx4lnny
	k3twr1GwOr54kVr+WpQ2kJ58GkojyWjgOdCd/XeBBznBWBwlFL9+XCOhK0wH4SyfWQ3D
	DxnxNX5Uq+e/dEcCxbv6mw8MTRZ0/dxILKKQtBMsYp4EPtgngKbT0qduUCkLJxhSxn5s
	T5RU40fq1QpWBxEFcnY68rv19tsDNENZB0Hhy2uQcjVS9WR8XEnfw0vxWB546F4ZSNQ2
	dC6A==
X-Gm-Message-State: AJcUukf5R64nPpt1oQNyDG0aWOlwMAvo89N/Chf2hY7N7BiXFsQ5Az7w
	6wE0Xgbv3BemcyJ3Im5VzShNmm2D4US9PU06Dv5IpA==
X-Google-Smtp-Source: ALg8bN5GuxaBAezc7FhYj1MSLk3elkEcxolLlFrq7uQQDE+j/0EKx4IYp+EekNxEK7bjKtO4Ip47coOjpP56szMuFQE=
X-Received: by 2002:a81:514c:: with SMTP id f73mr13543454ywb.272.1547205366630;
	Fri, 11 Jan 2019 03:16:06 -0800 (PST)
MIME-Version: 1.0
References: <20181228151713.19266-1-schnitzeltony@gmail.com>
In-Reply-To: <20181228151713.19266-1-schnitzeltony@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Fri, 11 Jan 2019 12:15:54 +0100
Message-ID: <CALbNGRQSDpsjP8=2wyuo_f9kdK3ekXrA4q8Tp0iqhmB5jjfhrg@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [thud][PATCH 0/4] Fixes
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
X-List-Received-Date: Fri, 11 Jan 2019 11:16:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 28, 2018 at 4:17 PM Andreas M=C3=BCller <schnitzeltony@gmail.co=
m> wrote:
>
> Patch 2 is an update but necessary to build gvfs with libmtp in PACKAGECO=
NFIG
>
> Andreas M=C3=BCller (4):
>   libxklavier: Fix keyboard layout bug for xfce4-settings
>   libmtp: upgrade 1.1.5 -> 1.1.16 and rework
>   networkmanager: move udev-rules from /usr/lib -> /lib
>   openjpeg: fix build for multilib
>
Ping?

