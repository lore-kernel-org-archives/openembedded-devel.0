Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vk0-f66.google.com (mail-vk0-f66.google.com
	[209.85.213.66])
	by mail.openembedded.org (Postfix) with ESMTP id 6C23770101
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Mar 2016 13:59:16 +0000 (UTC)
Received: by mail-vk0-f66.google.com with SMTP id e185so16760932vkb.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Mar 2016 06:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to; 
	bh=ttUwFaiWZgUNUPU1+cOfNofkyv9s9M0z0dnuOYpSuyE=;
	b=N3/R6O8gNm0eiFl7XaejnlC/V2D3n3yvQUOv2rNXGSqm2dwdMLuj2jBZypa2HSf7aQ
	v/xtSTPcY6iTScxVx8ubyMiiDr/mPMgg0HKHDROzcDu0WVt1yD7L0bIzqnk6Qx7LWdmQ
	JUrnpE1hp+u8kQNRkaEnwjd26obzNiI2Id79LpWM6cR36spbhSf3b+u15USZaUbz3a1E
	ijqR972PNYtmzu5fHhzrPZBahZZYc6KWh9C3fELxPddmKS/dB7cHMCquyCbl9LobhOdh
	Dc+uR/E+i65GlcZQBcytfBDEeLFDHf0w93UT6TcPGk0iTvBAQ26JM4TUDfl5pZ4dIYnA
	Bnxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to;
	bh=ttUwFaiWZgUNUPU1+cOfNofkyv9s9M0z0dnuOYpSuyE=;
	b=K1pfwl0YDzrPm0WEvGRp7RhwXhny5AR+8k8erteUmOZs27OXzt85V+dYfW8vij9SMd
	0wvatbZsb5felpmlglMdJbdCy3ikj8Gat+JSeIfMWD1mWSP/ozWq1oUHYqkbAKXvVcMm
	LEtA6Qpri49WIIyMjWfTkVG5OJ+YepOP2pozwi29xAe6lNCysSMkMkbhUotIajeqwHTv
	qYxFR+Ms4CMJC09PwCqA59KmQBOxjkkpc8NIPhCBXfrp4Ze/uzi/9Nd62+8MfFvAHA8U
	q4Fi+j4gCpkUJoEEfoHTWzwRXFSfr6Qpz/fWHfqRSoDLbVQsaxexMSItWLc/LdCqWcdD
	JleA==
X-Gm-Message-State: AD7BkJKrxZI/vaB7BIrbjMNxA1Gq+TMhOEZoFUCzphTuJHSmE7kWzHQr80AIuHb76oebDUmEXKBCKheHEPoI/w==
MIME-Version: 1.0
X-Received: by 10.31.129.11 with SMTP id c11mr28082104vkd.52.1458568756319;
	Mon, 21 Mar 2016 06:59:16 -0700 (PDT)
Received: by 10.159.35.45 with HTTP; Mon, 21 Mar 2016 06:59:16 -0700 (PDT)
In-Reply-To: <20160321131020.GC2562@jama>
References: <1458166402-10786-1-git-send-email-schnitzeltony@googlemail.com>
	<51386.10.252.7.138.1458328003.squirrel@linux.intel.com>
	<56EFEC56.3090406@linux.intel.com> <20160321131020.GC2562@jama>
Date: Mon, 21 Mar 2016 14:59:16 +0100
Message-ID: <CALbNGRSY6JQCJwVfUko549Tb6FsvqP-dit0hywxKha3=q-M7Cw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 1/2] gnome-bluetooth: fix compile
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
X-List-Received-Date: Mon, 21 Mar 2016 13:59:19 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Mar 21, 2016 at 2:10 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Mon, Mar 21, 2016 at 02:43:02PM +0200, Alexander Kanavin wrote:
>> On 03/18/2016 09:06 PM, alexander.kanavin@linux.intel.com wrote:
>> >> fixes error series starting with
>> >> | Caught exception: <type 'exceptions.TypeError'> TypeError('expected a
>> >> string or other character buffer object',)
>> >> | >
>> >> /home/superandy/tmp/oe-core-glibc/sysroots/x86_64-linux/usr/lib/python2.7/distutils/sysconfig.py(22)<module>()
>> >> | -> PREFIX = os.path.normpath(sys.prefix).replace(
>> >> os.getenv("BUILD_SYS"), os.getenv("HOST_SYS") )
>> >
>> > Both this patch and the second one should be replaced with a patch that
>> > simply adds
>> >
>> > inherit gobject-introspection
>> >
>> > to the recipe. For some reason I forgot to do that in my g-i fixes patchset.
>>
>> Martin, can you drop these patches from master-next please? Just want to
>> make sure they don't make it to the master branch.
>
> After someone sends the patch with the inherit, then yes.
>
I don't think I can send something till next week - am drowning on WIP - sorry

Andreas

