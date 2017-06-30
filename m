Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ua0-f174.google.com (mail-ua0-f174.google.com
	[209.85.217.174])
	by mail.openembedded.org (Postfix) with ESMTP id 9C8B2780ED
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jun 2017 11:43:45 +0000 (UTC)
Received: by mail-ua0-f174.google.com with SMTP id j53so73846783uaa.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jun 2017 04:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=6gqYvnq8knYhqm25BYrDMufk8/Fmzo+f1Jn3gyug1As=;
	b=ES8Ag976TvdiIUaUA6FHMm8H5pswH32gAc8aC+suzeFAdOAusyXbYGOg3XCUbP4pSn
	E/yO3+mrUbrc3kn0tF3p1ZS+BrLZOlSxtbj3PM2+l4SAEuYUuHBq9nWI1ZK1rg8Y2T7S
	JdbklrgbGymP8L5Qt/pPns9rJk5+TQpDhc728UVQ7diy+OubH83HD7lwxdhswkfdDgpk
	0mqb0sHp4bsqZ2VoOAfix/3ONlbhqFWS5+CIKEP/LHwa2CGWNgwgj3KsnCgUkiK//PS2
	J+YdSi6czHMwzXxVnWlz/qjzMtUrJI9OSbBB9HgXpfuk2FISYPa9hASSki5Nevvq6p0M
	FJNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=6gqYvnq8knYhqm25BYrDMufk8/Fmzo+f1Jn3gyug1As=;
	b=V466RAmGKbiB6sFI6WrBvlvPhGLxII+9gJZLC0yZRPiDo5ATC4+GQ7g14mby4gxRMm
	/AZ2ux0oOQu1nUAXTIiRpxierEvyHNoLLshICMjCXRfyCOJ5vzChEK4Vm1y1rnuxEaEo
	NTbGq6KPTj9YV9bh4+oH+KyzkMEW/F4Qo+7Gr6sFcFbJXfUywZUdffXPOXNMckiPxuIe
	p6p55Rt+TqqpryOthbnKVhY1oN9MNJvme3Pkt4ExT4xFRa4w+At8haQFVqFcZLtEHDfM
	EE3FfH1ohUZIM3qJrqncjgiHUVvS/A86dyFBtmxoZ5JfVs0bizYxsm+FbibZ+0zuAMNN
	MxrA==
X-Gm-Message-State: AKS2vOx3afav9+11rXKFgOlKQP/v/A5gGnO9Gu6HNJtk4Z6zGVGDnAfz
	oGu2bbX40Yta7iq2ZRn9f6pl+FiyYA==
X-Received: by 10.176.9.222 with SMTP id e30mr12946003uah.52.1498823026567;
	Fri, 30 Jun 2017 04:43:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.77.72 with HTTP; Fri, 30 Jun 2017 04:43:46 -0700 (PDT)
In-Reply-To: <CAHUNapTJJfR8R7aUvuJDOV+KbcpkRb_dGEFO=k2a9Y+OQye3rA@mail.gmail.com>
References: <1496925018-5300-1-git-send-email-samuli.piippo@qt.io>
	<91dc3ff5-ad3a-ff4c-163a-4b82bb721422@gmail.com>
	<CA+chaQe9JFMTrZ8HcOPyVqj7VDvg4N_8VKGRf3X3vDuwC37f8w@mail.gmail.com>
	<CA+chaQe=8hRDdymjoqn0wRo03XUF0cTdvNiLQTUuvqzLsL2Q2w@mail.gmail.com>
	<CABXoSoWZBLfn4K2DcHED90U3Bvcj8GRLX9Qa5XL844hZB0+Tzg@mail.gmail.com>
	<CA+chaQc8V+tVZ4g+B7CAeR49wbDgs4+Uo+B++8ieKgG8HA4Zig@mail.gmail.com>
	<CAHUNapTL=U_t4EwTKkQ8B8A7j+=WKCU64u_MFeioB0yv_VfACA@mail.gmail.com>
	<20170622193547.GT28053@denix.org>
	<CAHUNapTJJfR8R7aUvuJDOV+KbcpkRb_dGEFO=k2a9Y+OQye3rA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Fri, 30 Jun 2017 13:43:46 +0200
Message-ID: <CALbNGRSx+DxNwt52kik9+_Adm-2vWaqHMHf2WJMYk=dcHzxZmw@mail.gmail.com>
To: Trevor Woerner <twoerner@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH v3] Upgrade to Qt 5.9.0
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
X-List-Received-Date: Fri, 30 Jun 2017 11:43:45 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Jun 23, 2017 at 2:58 AM, Trevor Woerner <twoerner@gmail.com> wrote:
> On Thu, Jun 22, 2017 at 3:35 PM, Denys Dmytriyenko <denis@denix.org> wrote:
>> On Thu, Jun 15, 2017 at 01:25:12AM -0400, Trevor Woerner wrote:
>>> On Fri, Jun 9, 2017 at 4:16 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
>>> > Then why does it work for chromium which used to have the same issue?
>>>
>>> https://github.com/OSSystems/meta-browser/blob/master/recipes-browser/chromium/chromium/chromium/m32.patch
>>
>> Hmm, I'm wondering who comes up with such nonsense upstream that we have to
>> patch it out? Is it due to laziness or are there some real limitations?
>
> Unfortunately genius and insanity are virtually indistinguishable from
> each other ;-)
> --
Is anybody still working on Qt5.9 (or better on 5.9.1 which just
arrived)? I want to avoid double efforts fixing qtwebengine/gcc7 on
5.8 or creating patches for 5.9.1 based on this series.

Andreas

