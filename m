Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f47.google.com (mail-yh0-f47.google.com
	[209.85.213.47])
	by mail.openembedded.org (Postfix) with ESMTP id C6D3D6A9D4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Oct 2014 22:04:52 +0000 (UTC)
Received: by mail-yh0-f47.google.com with SMTP id c41so6060yho.20
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Oct 2014 15:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=HV2TtgDcsX3WA44Cy/grr2bpRL8rNogFX1UN1Vonr90=;
	b=JG2bSgBJVriMqYi+4o3J7IMKu2ta9seuM3P5SO8nigbi+MQL/mwgk2TYDsxwnyvbYk
	o5YDN7FAIy1Z1MQiathqoMNEKXUTWaPqwkfIc11S4B/kTaYccdVrqmBe1yc232+I2gme
	bvjk0Geh61ihVc7b8DLAlIWa4tRPbpzEde58Wc43j0um2Je6kJPw1ibGQfuRBsK6EspN
	swQipttRkBxYT+uux7nbbOWJDd3s1v/lK1quCrDkzcYjdWfDl73HtUjkLe+HrY7cIjnf
	RD4FGFfvD/NHtVSygf70S0H3KFRhPVs6I45LMcfKlrb2luC0YXD+QBsG1NNnHxPxtS82
	ID4g==
MIME-Version: 1.0
X-Received: by 10.236.30.65 with SMTP id j41mr7172178yha.105.1413324293289;
	Tue, 14 Oct 2014 15:04:53 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.172.8 with HTTP; Tue, 14 Oct 2014 15:04:53 -0700 (PDT)
In-Reply-To: <20141014213356.GM3000@jama>
References: <1413130443-11407-1-git-send-email-akuster808@gmail.com>
	<20141012220618.GD3000@jama> <20141014213356.GM3000@jama>
Date: Tue, 14 Oct 2014 19:04:53 -0300
X-Google-Sender-Auth: Wz1KV6CoDJA7Y8isDhPiYyy1GAo
Message-ID: <CAP9ODKrjqDdV1ka1kAVs77_EGCoF_-W-RC3ZVsEJtkDOX2=7rA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [dizzy][PATCH] update maintainer info in README's for dizzy
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
X-List-Received-Date: Tue, 14 Oct 2014 22:04:58 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Oct 14, 2014 at 6:33 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Mon, Oct 13, 2014 at 12:06:18AM +0200, Martin Jansa wrote:
>> On Sun, Oct 12, 2014 at 09:14:03AM -0700, Armin Kuster wrote:
>> > Signed-off-by: Armin Kuster <akuster808@gmail.com>
>> > ---
>> >  meta-efl/README             | 14 ++++++++++----
>> >  meta-filesystems/README     | 14 ++++++++++----
>> >  meta-gnome/README           | 14 ++++++++++----
>> >  meta-gpe/README             | 14 ++++++++++----
>> >  meta-initramfs/README       | 12 +++++++++---
>> >  meta-multimedia/README      | 13 +++++++++----
>> >  meta-networking/MAINTAINERS | 10 ++++++++--
>> >  meta-networking/README      |  6 +++---
>> >  meta-oe/README              | 12 +++++++++---
>> >  meta-perl/README            | 12 +++++++++---
>> >  meta-ruby/README            | 14 ++++++++++----
>> >  meta-systemd/README         | 14 ++++++++++----
>> >  meta-webserver/README       | 11 ++++++++---
>> >  meta-xfce/README            | 14 ++++++++++----
>> >  toolchain-layer/README      | 11 ++++++++---
>> >  15 files changed, 133 insertions(+), 52 deletions(-)
>>
>> Please add update for meta-python/README.
>
> I've squashed your separate meta-python change into this one. I'll
> create the branch after 10 more QA issues are fixed :).
>
> Ideally build-deps QA issues, but other types count too.

Sorry Martin but I don't see why the wait. The fixes are important
sure but we will backport them as always so we can make the branch and
easy people setup of their manifests, git submodules, scripts or
whatever people use for products updating for dizzy.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

