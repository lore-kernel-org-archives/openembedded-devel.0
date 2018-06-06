Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id D3AFE74BBC
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Jun 2018 17:20:29 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id y89-v6so7163051qtd.10
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Jun 2018 10:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=bTh2lfX2lZJtNfeIT9KKwzEZ9+W5Ny3jTy9AwPIfhJo=;
	b=KIyIQfCxm3+xsDToSIv4RNS8RcxcIDNALs0V80TeX7eLoxVzYVFcta4+l+4iE9lvpx
	v+NPe1wz7dhuaDDB6ryVesIW63yF0e0/bylDOvrIErtJ83dYMHarVhFDn+voxvoAmWgW
	QNBX4Z6WJ/xaAYKmQz83P4lV4sj27c5e6vbgrixegSC9VbMxJqPHP0RfKf6e2h/qHAPv
	8XfFjarcejVp345wG5rSlvSi9ss24rRtVWykIiZJeCTowR6rZbaEnMYebfLKUL5neYmO
	9tU5u1LH9OPwq8ilUFnETePmGoeLZN515rrT4aRSfIlNgoMEE0txcXfmMYBrI05nPqVV
	Wlaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=bTh2lfX2lZJtNfeIT9KKwzEZ9+W5Ny3jTy9AwPIfhJo=;
	b=NhxhjQ24C7a4bBWn+UH8wNduFBjoplhSAak3HLvZI2R/QSXwQ6efeWvvyyuxPhDVwS
	pRk/+0D1OHP6jkJ0Pmxg6Xu6Ru5CvuMCZZwd5WH9IUoPWXUIDTns81G9H73t/kh5mxJu
	2E5vGUvBCci0kVz7K7TndV/i+x3Vq/GP0kZBQrrxbrUTwePdByqXm5W6N/RWNLwcdF3B
	+sS7x5Vvkk8hFL2S9fJg6ViuEn1oIIUAPDWfurUfj2hJgNv6GhkhGdQZd4CFXhEdUjar
	ujP1557aHNZ4N1+1kJfjPR6sRLf+LTsc6i5BuJmSgHdLZsHShZxOyo/r0c69ALmI7PDT
	/MZg==
X-Gm-Message-State: APt69E0IAW+vIUSxt5w8TqMMsFz27QiJKQpiz3ESMkDrRR8ZnRehjiFY
	jsBT3yDK4fVhcYV26jvPlzNPz2Dnq3uvgnFV+2Y=
X-Google-Smtp-Source: ADUXVKKpSsd1xVHmyNJrNTJ6MIPNstnrxXL3L7tKfM5AAF96lXa+GjjVNpFA2FwDzC0+fEii/mNy9ojyco2NhVRXrr8=
X-Received: by 2002:aed:23e7:: with SMTP id
	k36-v6mr3816881qtc.20.1528305630655; 
	Wed, 06 Jun 2018 10:20:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a0c:e486:0:0:0:0:0 with HTTP;
	Wed, 6 Jun 2018 10:20:00 -0700 (PDT)
In-Reply-To: <CA+chaQcz=Ckh2=zSUBi969N-v7dJG-K2F1OXLxtnG8JLUahXYQ@mail.gmail.com>
References: <20180604223911.14561-1-schnitzeltony@gmail.com>
	<CALbNGRSg8kYPO6x_jgXtK9Gi1gQDX7v4KbpTWVaWAQCEc=NXSg@mail.gmail.com>
	<CA+chaQcz=Ckh2=zSUBi969N-v7dJG-K2F1OXLxtnG8JLUahXYQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 6 Jun 2018 10:20:00 -0700
Message-ID: <CAMKF1so+ux5C6v3x_uBqiF1PjrjuYBtT7ViayqMez-oS6SbwLA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH] qtwebkit: do not skip build - use cmake as build system
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
X-List-Received-Date: Wed, 06 Jun 2018 17:20:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 6, 2018 at 10:13 AM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> Thanks Andreas for taking care of this, I was planing to look at it later
> and then I forgot about it when I wanted to push first 5.11 recipes.
>
> With gcc8 I see small issue:
> http://errors.yoctoproject.org/Errors/Details/179245/
>
> In fedora they just added -fpermissive in:
> https://bugzilla.redhat.com/show_bug.cgi?id=3D1582954
>
> Are you interested in fixing it properly? I don't use qtwebkit
> anywhere (switched
> to qtwebengine long time ago), so I don't mind adding -fpermissive as wel=
l.
>

IMO adding -fpermissive is acceptable for this package, its on a lifeline a=
nyway

> On Tue, Jun 5, 2018 at 1:23 AM Andreas M=C3=BCller <schnitzeltony@gmail.c=
om>
> wrote:
>
>> On Tue, Jun 5, 2018 at 12:39 AM, Andreas M=C3=BCller <schnitzeltony@gmai=
l.com>
>> wrote:
>> > log.do_configure says:
>> >
>> > | The WebKit build was disabled for the following reasons:
>> > |     * cross-compilation of QtWebKit with qmake is not supported yet
>> > |    * Missing cmake from PATH
>> > |    * Using cmake version , but at least cmake 2.8.12 is required to
>> build QtWebKit.
>> >
>> > and build was finished without errors (but surprisingly fast). Looking
>> into
>> > qtwebkit, it seems they have changed to cmake build system and
>> Webkit.pro is
>> > just a wrapper for preparing and running cmake.
>> >
>> > For the transition the packageconfigs were translated as close as
>> possible.
>> > 'libxcomposite' and 'libxrender' were merged to 'x11' - there is only =
one
>> > option 'ENABLE_X11_TARGET' available for both.
>> >
>> > Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
>> > ---
>> >  .../0001-Do-not-skip-build-for-cross-compile.patch | 31 +++++++++++++
>> >  recipes-qt/qt5/qtwebkit_git.bb                     | 51
>> ++++++++++------------
>> >  2 files changed, 54 insertions(+), 28 deletions(-)
>> >  create mode 100644
>> recipes-qt/qt5/qtwebkit/0001-Do-not-skip-build-for-cross-compile.patch
>> >
>> Cannot see (yet) what's wrong with this patch but now qtquick1 fails wit=
h:
>>
>> | error: QGraphicsWebView: No such file or directory
>>
>> Andreas
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

