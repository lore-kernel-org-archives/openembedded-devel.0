Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com
	[209.85.210.51])
	by mail.openembedded.org (Postfix) with ESMTP id 6AEC76011A
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Dec 2018 10:48:47 +0000 (UTC)
Received: by mail-ot1-f51.google.com with SMTP id 81so14744261otj.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Dec 2018 02:48:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=RpdhoLH7qQJZIodx0wF6zOV7xd0urGDKNqiF/QRoR6o=;
	b=gSW+/sSmwoA5rOGjzf/cujzp3DXd8Yz67NMzIWsM8nI2A10hHahhR0oqI8HBNPB+MX
	Q4hTMeqs765xIPNu1zOovDKrEj6EZXyKnGA4mPZW4AVeQbgqKsZi/h7fQhF7+i6t4qA2
	GDq1LbqNpQRt/k538d0Y2JYaM60Hga6tX6hlnJXJJY7ayc9P+5URDFcUi88IscE2+l2h
	Hu1vvB1+3oI7jR4Vx3Du6/lbJ9jSARVZy/6NlF4GwHVpa0MZvVupbiu2/PCTXbJQi2Kj
	JRTSK/bUvA/6ydeWHJ8sQE94QPvG1pA/hASc17/xNC+EbY3wR67qc0nMRQ+Y/dBfvAcF
	udKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=RpdhoLH7qQJZIodx0wF6zOV7xd0urGDKNqiF/QRoR6o=;
	b=Sj0GcYkPn7GZODjU+ERyqTQzYGXaUk5M+Kc3LjZGr1DoMr9ihQZBVS6+yujEyreavK
	Omby+leoz3cKSYcprs7njjNRoS9PvMAzTslu6T32jfDRR+32yG67tPce7kGxJcmicqln
	QW4+5XBQ1Ra0PLnQ860FQ+ZWUQskkg5VVNBhIZfiAp57S4p3gyorsZNTm7tZ/tm9n09Z
	avGd58YLDIz95iD8pZ0oR43pq7An1sgo8W6Jn0CZLthfh2ndax6FG5RGdCUcOWL31x7Q
	I/gT6Ol3jh/rw/7ImacEwTV+t21rqAWsNhyzhNZAgvt7OJAZiBnLpoP8DOX2PM1sBh75
	XPgg==
X-Gm-Message-State: AA+aEWZgoBN6j5M+A1GyRYiUaC5xFlfkpHLQ4sYDvXX1Ow1JRxmgXcBS
	Uzrgx6kqNilSW92YMqvq1Z0M5qPaRyUUG0FZs14=
X-Google-Smtp-Source: AFSGD/U7md5VD2VvTzDAZ2jbdWUZzsVLmjcZ4f/H8BZBL0D2g9JcMrPFb9Sate0UrQCArHOHvjsu/lj/rVzbp31lq0g=
X-Received: by 2002:a9d:2289:: with SMTP id y9mr13060785ota.326.1543920528472; 
	Tue, 04 Dec 2018 02:48:48 -0800 (PST)
MIME-Version: 1.0
References: <20181202191346.15104-1-raj.khem@gmail.com>
	<20181202191346.15104-3-raj.khem@gmail.com>
	<CANNYZj9g4mW=tk0fTYzK7rHes5GDVVgXtm2wNeE0eLoOOC3X7w@mail.gmail.com>
	<CAMKF1sqKgPCtQKHSM4s8b3W7n3kZW6nDjXAvquqaPBDDzJ4MKg@mail.gmail.com>
In-Reply-To: <CAMKF1sqKgPCtQKHSM4s8b3W7n3kZW6nDjXAvquqaPBDDzJ4MKg@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 4 Dec 2018 11:48:36 +0100
Message-ID: <CANNYZj-jdg_VzS=ZuTEuRzN0jDNx3DFdL0u8yrDF3Y3Sw5tPig@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 3/3] packagegroup-meta-oe.bb: Exclude from world builds
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
X-List-Received-Date: Tue, 04 Dec 2018 10:48:47 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, 3 Dec 2018 at 22:28, Khem Raj <raj.khem@gmail.com> wrote:
> > My patches fix this issue though, no need to exclude if you take them.
> >
>
> Am afraid they don't see
> http://jenkins.nas-admin.org/view/OE/job/oe_world_qemuarm/945/consoleFull

Right, mcelog recipe has:
COMPATIBLE_HOST = '(x86_64.*|i.86.*)-linux'

So packagegroup-meta-oe should probably be excluded from world, but
keep my patches as well, they do fix issues for those who would use it
explicitly.

Alex

