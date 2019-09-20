Return-Path: <schnitzeltony@gmail.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id 8F20B7FD97
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Sep 2019 01:14:15 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id f12so12250883iog.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Sep 2019 18:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=Xf2ubxx2ttZS6yLS8odeTZokHWejD4p5WbO4LH56BPM=;
	b=bblibDwkk4xIJQtpD31Uw4iq9uW7VXpE9bbIeFbcLGEgYpOyLyO3/7/esrc1o347BZ
	Qfhb5cLzSpGqPpNzhr5Lg6/3fYLeS6qCSyZLTUFHFLUfNLljxG1UcpZNMMXm0/eHQqto
	8fnJElxpMejniXTUJsYtyURoAUOxxGLwbJoLOI1LGMDtWIpt7o9QFAaUCGc7bQwOidvN
	nYsiPB3NApbeOpYZzyVawiw3tgd7LivgyM7kzSF3YLp9F6S1YAz5M8HrbzBQgzGlQjEA
	0mNmxIVEQmWwcbsZpqTjIuBpYa4ngqNTHs2OaLEZYjojACaEGVbWsVCzM2azaKzms6L1
	K4tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=Xf2ubxx2ttZS6yLS8odeTZokHWejD4p5WbO4LH56BPM=;
	b=ZJpDlCz4XK4hCYo2vBv+MmhpY3bNyBQYkXJb2KTJ082aL4Qe7LB4Ex5z4Ez6EjxDB5
	kbWMX6dJ3DilFWi1Ct607i7awXoRIrMdnGOEVpOXL3Vn8614s38PHEe0iFKlU+wSQ8R+
	DyHzuH8AWuWNVMuodl+QABE7ZLZE4vmQj0u1DXOh1Mh2rrK1cewY+3LT8Vg+98+s6rTp
	gPZZK3Q0yxuIElKASC8D4kBh+EYvQ5YHVychiQ8z6llajOW4YGBtDenhCJXeZ3rC0XRc
	TF7ifgaT+fia7TnOoTwrDsKhaDAWmqMqXhrOMlGlXe4x88IkHbVLdiHmkd/danfLHOBQ
	GTiA==
X-Gm-Message-State: APjAAAVak+ygCPM8VWtx0A1Zsy/+qNggp6h0CSoHoC9lk43X0e+ZJEOw
	jspwEI47amtdnbsso4Lv+jXgu5xkPVD1lYbCcAA=
X-Google-Smtp-Source: APXvYqzJg8UiQvoB5eZdyI5xPgrZI44dKSYa8SANQ9Zgtp9bRUG0NnO+guZNtJrB1pHyd1sFScuT+V38bYDQ32irKA8=
X-Received: by 2002:a6b:c7c2:: with SMTP id x185mr2090325iof.224.1568942055700;
	Thu, 19 Sep 2019 18:14:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190817081339.22253-1-schnitzeltony@gmail.com>
	<20190817111825.GA2828@localhost>
	<CALbNGRSBQv22cpj+T+KBS-1oOhpUomXBN78FHhFw52=pGEOp9A@mail.gmail.com>
	<efd5c05c-1275-8077-84e1-f17fff05f8f6@gmail.com>
	<CALbNGRQnxLXFXoSkPxWnFZJHWWdDvVP_=i9-ybYOVGzirty6Uw@mail.gmail.com>
In-Reply-To: <CALbNGRQnxLXFXoSkPxWnFZJHWWdDvVP_=i9-ybYOVGzirty6Uw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Fri, 20 Sep 2019 03:14:04 +0200
Message-ID: <CALbNGRSp+UH2gaBe5QdUTU4R4kui4ny8TbVnqEt442-0pA8onQ@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, Adrian Bunk <bunk@stusta.de>
Subject: Re: [warrior][PATCH 0/4] vlc adjustments
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
X-List-Received-Date: Fri, 20 Sep 2019 01:14:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 30, 2019 at 10:51 AM Andreas M=C3=BCller <schnitzeltony@gmail.c=
om> wrote:
>
> On Thu, Aug 29, 2019 at 4:16 PM akuster808 <akuster808@gmail.com> wrote:
> > > Ping
> >
> > in stable/warrior-nmut for testing.
> >
> Thanks
>
Patch 3 was applied / 1,2,4 not. Shall I resend or is there a reason
not to apply them in warrior?

Andreas

