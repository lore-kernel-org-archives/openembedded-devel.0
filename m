Return-Path: <schnitzeltony@gmail.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id 489977F9B9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Nov 2019 20:49:09 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id x21so5154150ior.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Nov 2019 12:49:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=k+DhwRwl17sZLRcG+chEalS9GkMheJuvcp9uA7se0Zc=;
	b=dKPm36Vrpd09iue+J3sXfTLsrznQ8Ls59wxSNMR00ydLubskCRZ2s0p4OW1drjGz3K
	GOyYUN3jV48xNvb3ls+BsPgzI4//socQx6dTUjrlxOF5uhFQNbzhrJtBGTqbV7hr/eGN
	j4RDxX3UdLyZKd1yCI9PU79hVkLuAPcHU7SRIt5p6G3mfHq1iTcc2fiRx9rpQNwhF7Y4
	B+UtT87oFKkSmga/ELTY1kgDDG39Pi4cA9lwdNv85140GsgeEu+WgTJ4dPBQTKaUX9mU
	o8cixGfQUINgSMGtsAl7R88NtXUVo71YxJd9jtMohdcAGiTSJ7pwRAhJJ9CcJcStKN4J
	mKeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=k+DhwRwl17sZLRcG+chEalS9GkMheJuvcp9uA7se0Zc=;
	b=qmM5Z0W2oKF01cIWw7Yvb9T+FjJ8aoKaRNG61MaXKiO/9CXtjeEMtrZQ5Gf92pTnS5
	cRaOeR2jOwMrrrSRrgW2A53Ax6PULQ4mfMdn9yf66XwG6IW1E0F0PzLOqiHhNnAiKkb2
	fZZ4r3c89JF3J7UOt3ggND7hzgsbK7Y1H4QxEOyCVM2Oa8D16WxlZVPG4ZBFzpr3L5KY
	AksTJT6JLx+yTeU8EpG+VIptyp9bE09sxLiPqoqAVh2nC4Rcbiy3XwMof7i6fPnqlsrn
	Fi4yZ/o5jIwflnm/0IRa2vxGmYsOS7bD+CRzURo1baoc894Z8SKMSB/DB/vO2Kop7vho
	9Xkw==
X-Gm-Message-State: APjAAAXdDpUj0Kl9K8Lwg2AmhXDeLqI/O/VOMV3Y+pHvrZDUidlAHmq/
	Om12FuIt9yUuhXCSJHKClaFSTENTIyqBxt2YzI8=
X-Google-Smtp-Source: APXvYqxNzk4o1c1uN66XDCw9O2izHMRuHIkQXR+0jv49ffxTsv/YyEQtXf9MdMtawX8Hum/+y0ii+bb96QjFUeQ4pSQ=
X-Received: by 2002:a5d:9f55:: with SMTP id u21mr5353224iot.224.1574369350310; 
	Thu, 21 Nov 2019 12:49:10 -0800 (PST)
MIME-Version: 1.0
References: <20191121182410.2803533-1-raj.khem@gmail.com>
In-Reply-To: <20191121182410.2803533-1-raj.khem@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Thu, 21 Nov 2019 21:48:59 +0100
Message-ID: <CALbNGRQRuBvyA24+TagxbHPiEY-ALEBA9PMH4tCCG_Qj7oKN9A@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] nodejs: libatomic patch should be target specific
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
X-List-Received-Date: Thu, 21 Nov 2019 20:49:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 21, 2019 at 7:24 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> host usually are using gcc/x86_64/aarch64 and all of them have gcc which
> can support atomic intrinsics, but not all of them install libatomic by
> default e.g. centos-7, so asking for libatomic unconditionally may not
> work always
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
Fell over this today on Fedora  and had to install libatomic. So

Acked--by: Andreas M=C3=BCller <schnitzeltony@gmail.com>

