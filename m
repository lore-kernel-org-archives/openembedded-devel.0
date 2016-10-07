Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vk0-f68.google.com (mail-vk0-f68.google.com
	[209.85.213.68])
	by mail.openembedded.org (Postfix) with ESMTP id 09E5A6FFD7
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Oct 2016 23:05:35 +0000 (UTC)
Received: by mail-vk0-f68.google.com with SMTP id b186so2391128vkb.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Oct 2016 16:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=Jlphu2acLkYeyk/Xkqqat3PQstMdPLAU3erw1UNNIYg=;
	b=YfU9Q/jEQRkQyos1vwAavBE4xZK1qK/HHvPDgt+FF7Lyf26RTRuhpsn10Xj4BpUHcu
	6iNHn1rw6j5IOZY0QRvqYgKqPBaTnUm7BY0JBuLAYPoCK7r4LMYafwMOsDClzYiIv5hW
	36k87eNHBNPZO3D4/Ic+D3dZVns/I7mbO1/3Y/MdKJ03bmo3Nv54lG/WpNkYVKuu9viA
	ev+ejxfV3i8VBH0hxWZBa1Q8057ArgIu0838pR3sI4U/4ozgz1EjhIXFD72K31EoJtSM
	rtFZs+hDQXqzHGgstIFGWn51M2TWjcLP5R4kZoq2aSjhajHbUyRPF7y4qDiy2L0YS0CB
	IoQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-transfer-encoding;
	bh=Jlphu2acLkYeyk/Xkqqat3PQstMdPLAU3erw1UNNIYg=;
	b=GMfBfsCv+GFB8zKwcguTRew1QjkyMhDAj97luV6YxW/6qEwIFBQjzWN1DBKkPkSVjk
	XQharI9Wc55Vsk6mttt2c6YTFXr0bGKimTnD/ZhqjWSfcUTqGlOFiz0fOHElBa8/CX7l
	aoAqpfHndSwI8eqydKkXef92AhTetbbO47kXylaSlQ2XkfN9CuF3LLWQ17FrEPsr12ji
	9coz3Q+nCWPP3lhuYQgwnOrbk1CwKQ43QvfGWogt2E6i4HXDfDm14IqFC4XSNdjLkBGQ
	qgQKfnsN67ptVxYR61fxD5TQ7s6MpmZR9gyMTRCVXkdxj86nzuXq50kQ8LBSNW22zuUc
	f44Q==
X-Gm-Message-State: AA6/9RlyLhHXn8mcm2QyK4pql6VmNjs3WxbKGwU77d1OYvRT9FdXkGjxHxZ+4HFqh9vj4AqRSUrarYf8WCcpiw==
X-Received: by 10.31.206.198 with SMTP id e189mr4275231vkg.51.1475881536128;
	Fri, 07 Oct 2016 16:05:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.65.130 with HTTP; Fri, 7 Oct 2016 16:05:35 -0700 (PDT)
In-Reply-To: <22CD53EF-6069-450F-8F54-A5A6FB0FF71D@gmail.com>
References: <1475831964-1993-1-git-send-email-schnitzeltony@googlemail.com>
	<1475831964-1993-2-git-send-email-schnitzeltony@googlemail.com>
	<E5E0F819-27C7-4FFD-9639-39BF2B9BE459@gmail.com>
	<CALbNGRRL2t1anoyHUMtBdWx8+7OkP=GkkdVDYH_Bne6+c7DAXg@mail.gmail.com>
	<22CD53EF-6069-450F-8F54-A5A6FB0FF71D@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Sat, 8 Oct 2016 01:05:35 +0200
Message-ID: <CALbNGRQ+HPvR9qkFLQNeOMsOTBCycfOjB0EpQk7B2TXoAwVxaQ@mail.gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 2/5] jack: remove portaudio PACKAGECONFIG
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
X-List-Received-Date: Fri, 07 Oct 2016 23:05:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 8, 2016 at 12:12 AM, Khem Raj <raj.khem@gmail.com> wrote:
>
>> On Oct 7, 2016, at 9:23 AM, Andreas M=C3=BCller <schnitzeltony@googlemai=
l.com> wrote:
>>
>> On Fri, Oct 7, 2016 at 5:14 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>>
>>>> On Oct 7, 2016, at 2:19 AM, Andreas M=C3=BCller <schnitzeltony@googlem=
ail.com> wrote:
>>>>
>>>> portaudio backend is only available for windows builds - see README (a=
nd if set
>>>> it would cause a cyclic dependency with portaudio's jack PACKAGECONFIG=
)
>>>
>>> should be unconditionally keep =E2=80=94portaudio=3Dno ?
>> As long as we are not building for windows: No
>
> does it default to no ? may be its better to be explicit
Maybe - I'll prepare V2.

Andreas

