Return-Path: <marek.belisko@gmail.com>
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
	[209.85.208.42])
	by mail.openembedded.org (Postfix) with ESMTP id 0AAB060213
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Feb 2020 14:45:38 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id r21so595909edq.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Feb 2020 06:45:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=oGvwujMnCckW0GYUsk8JWQtkUtCxEuHAe2oyAwuJUtA=;
	b=OR5moot1DrS5loSfXfLV3YyqPzn5Crlw0vNm9hyyQp0i9pfQren8L/7nWTZu3rzWO8
	ikZ99Aiu1ffcyy5wSNQzEwVxW6RwR14oJ3F73lztI9tbUIGZaVin3OEZzD9yzyEa+lsY
	XQJwDYWDyoYuaFCJa5m5/r5SrWWCgaI7B4IICjIUDihO4tUrnK+qQHr7rEyWX0pDqQpJ
	uWYUHXWXQ0P2wJ3t0zgKPvJISP0k/atZ2RYkh/9nozmNyBIQWxhlJJO7+YSU1ltTzugq
	Gz+5HV8C9cpNtoYvVdW66aRj3mRdClD4/fzsKCuHGg2GPEmnog5VzeAA58xKYlRX+Ddh
	XbPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=oGvwujMnCckW0GYUsk8JWQtkUtCxEuHAe2oyAwuJUtA=;
	b=gis7TtGsqxJzDQE1KTWrKMKysOhu4nnAlZlsd3vLCCWrytVVSzB5eu6KQ+s0NePjvz
	oRuNxqLb8O0gwKfEAa1aLBlvmqokl11YARJZLcANCoxebqJ5WTKYGfrvuuGJZK+lAUL3
	j87487ZXGSIawUE/SZXOwPPdUQf7om3xwfMzx/iRapEjbIr3gmKJYSkuXE9nAhHxJfW0
	7zQllmBTk5Mzn/6jD8r6hJH9m1bvYj4jzUeLj9k8cmNsxxsceFMo5Eo+F1DbOZvctmq5
	sX5s8/KCRsoLP2TmVcPyjJYdpxpAYgdh+eLmu9ip+SimLPMvoYu0WRyGh2nFpxGou7X4
	vBdQ==
X-Gm-Message-State: APjAAAU3lw9FHW30z1vf0v0qfKKf64Mdm416SfEnJLsWPUzfGXjPGZZq
	g0Suv2OnswgJdJ9WLeaXVWhjmvefj6DCswuSE+FlUI2g
X-Google-Smtp-Source: APXvYqxISl9H4hC+qfg0zHSNHipcRX3k/O6BWwhBkCUuZwrfUwIVV4HvB6vIt2DIbbmyPhFCoPX40Av/ESRfm8HrcH0=
X-Received: by 2002:a17:906:4749:: with SMTP id
	j9mr1503275ejs.132.1581345939438; 
	Mon, 10 Feb 2020 06:45:39 -0800 (PST)
MIME-Version: 1.0
From: Belisko Marek <marek.belisko@gmail.com>
Date: Mon, 10 Feb 2020 14:45:29 +0100
Message-ID: <CAAfyv35kaGL7fpLNQGG9WtwD8qZTnxmhU8a-J75nzT6GdAzR+w@mail.gmail.com>
To: OpenEmbedded Development mailing list
	<openembedded-devel@lists.openembedded.org>, 
	Otavio Salvador <otavio.salvador@gmail.com>
Subject: libusbgx functionfs mount
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
X-List-Received-Date: Mon, 10 Feb 2020 14:45:39 -0000
Content-Type: text/plain; charset="UTF-8"

Hello,

I'm trying to add support for composite gadgets using
configfs/functionfs. I discovered that there already exist recipe for
config/start gadget in libusbgx and libusbx-config. I have run it on
my platform (with added some default scheme) and only issue I see is
that libcomposite should be probed before running gadget-start script.

I'm bit puzzled how to start then my gadget code (e.g. gadget-ffs) and
who will mount functionfs nodes? Are there any other recipes
available? I found useful this [0] but seems to be bit different what
is achieved in current oe.

[0] - https://www.collabora.com/news-and-blog/blog/2019/03/27/modern-usb-gadget-on-linux-and-how-to-integrate-it-with-systemd-part-2/

Thanks a lot.

BR,

marek

