Return-Path: <schnitzeltony@gmail.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id 731A56BD08
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  5 Oct 2019 14:39:14 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id v2so19665418iob.10
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 05 Oct 2019 07:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=etZTBZXlY1x/Ru7FesHSBPMzY9iR60u1jXUkuY0osvA=;
	b=j0QVZtwzlgQyZQJaSOT6InDs3ShMqXIGmhUhVRmDS3MCZN4FPtDJOgmE8Qi8LHru02
	PFo2eIk1fzFUqRzmiPvarLudhsp1YHlkSdI7RlNmHbV9je8Ijl/s1Lp7RCxEsfij/uz1
	l2mto1zXWpzn9jVoB31R+SFWIiF2edEfsbBQMUjEqjGzU8AwHy0bXx6o73+9AGZtVVLq
	6V3/y+yla7ydA31PZalWdeAF7lEK9nPdewjsvmuzEa/6mWOJBNj4qAZA66goUmbeqHtG
	MtRLh2udWaTpFcWHYnACAclyzoSivClStXGmHfhA/EHt3jzfJeD7of0g/VGcxula9CkL
	HhgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=etZTBZXlY1x/Ru7FesHSBPMzY9iR60u1jXUkuY0osvA=;
	b=ehLAB/lul/Er8hbKxSlsNt1D4hTdWTLnT5Rfk0i6lgEeAwoxEE+ZghwqTRlEH0x5Uw
	6ACH97BhiGlTPNQH1oC4xCQc9Nazt9JuXSNrYJY+E0VCuIgK2KSGVONRgVpSQPDjSdiV
	9dU+GpYf+KaXswNuX8lnFNO/0SP1kFNCZYYftu45KI5gJKvbN0a95SOe6fCQK0/EFJhE
	m/wWqSOazGbIopidmid0aeKDOONgcV3hveNQonNaS0wZUvbcaBuLLx09XDnRys6WNcJ9
	YL2aZ4OamAtldSGNWZvdka/lkM+adH44X4oH+9sQw+QyTgZTQtBQfmOfWZ08i26B4H52
	P7lg==
X-Gm-Message-State: APjAAAV9LTtRodzIcsz/WX5etGffv4XZ1RbtpWCtpdjJdH2WVtPb6dZl
	pki9Bkfw2q8Klb72dDhe72wI7jAWqc8Lq5rshqRC0w==
X-Google-Smtp-Source: APXvYqzj6H0i9/+R9qwL2UNoa4gmVoN9qUqK4WIMkWTkQRwQ521eDU4lLJg6XeyYlEFtsu/6PRZGep2jvetI3MV1Ig0=
X-Received: by 2002:a05:6638:928:: with SMTP id
	8mr19326839jak.124.1570286355356; 
	Sat, 05 Oct 2019 07:39:15 -0700 (PDT)
MIME-Version: 1.0
References: <20191005025353.6028-1-Trevor.Gamblin@windriver.com>
In-Reply-To: <20191005025353.6028-1-Trevor.Gamblin@windriver.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Sat, 5 Oct 2019 16:39:04 +0200
Message-ID: <CALbNGRQ0f+XM--sn6wi4OCFG7fDEaeuiQ1g_U3mHu0efbZRm5A@mail.gmail.com>
To: Trevor Gamblin <Trevor.Gamblin@windriver.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-gnome][PATCH] gnome-desktop3: upgrade from 3.32.0 to 3.34.0
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
X-List-Received-Date: Sat, 05 Oct 2019 14:39:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 5, 2019 at 4:54 AM Trevor Gamblin
<Trevor.Gamblin@windriver.com> wrote:
>
> From: Trevor Gamblin <trevor.gamblin@windriver.com>
>
> Update to fix CVE-2019-11460 as well as add various bugfixes
> from upstream.
>
> CVE: CVE-2019-11460
>
> Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
Have same here under test - so

Acked-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>

