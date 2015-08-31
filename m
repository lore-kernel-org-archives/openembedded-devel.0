Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id A3C8F74197
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Aug 2015 19:38:22 +0000 (UTC)
Received: by iod35 with SMTP id 35so40554211iod.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Aug 2015 12:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=dYScybXaCgbl2uLhAMlsy3zTS1dhD4uIjrrBnaa+HiQ=;
	b=iSvO/Zo2oMrLKEZSCgL3xAPYInpDhZebKPIWoeTf4D+tQ0vZQpPlWDQggscq2autB4
	JJx6RcaO/XW9BkJg7PvImQTaMEgL4mFDWYMIJf+aOQKehpXmZterpxvsweUZ6LTm59Yq
	rBhrRgXKYLHtwKmJ8qHhiqJDgi5NIWlY5uOHjCdU9pC8bFvpApvcn/PqcxSz1Xiws/TB
	hMo8fjaFDG1W/z505+1o1YMFMuLWOQVhu9t3CclqvP3ZVc7ZCARwjlu0g5QbLU6OXyt5
	TR6IuXXmub6u7RLh6nkzqEEl9iyEdnLUVj2S8+dPwZdS7vUAMOUf8TG2hJKlL1WDf009
	+j5g==
MIME-Version: 1.0
X-Received: by 10.107.47.7 with SMTP id j7mr24291089ioo.99.1441049902792; Mon,
	31 Aug 2015 12:38:22 -0700 (PDT)
Received: by 10.36.98.5 with HTTP; Mon, 31 Aug 2015 12:38:22 -0700 (PDT)
In-Reply-To: <CAJ86T=VFZXxLnoMQ7_xv3SZiqYrwwmKmTwss+0o+T=wk3ywi_Q@mail.gmail.com>
References: <1436147494-44348-1-git-send-email-leimaohui@cn.fujitsu.com>
	<20150831175844.GD2465@jama>
	<CAJ86T=VFZXxLnoMQ7_xv3SZiqYrwwmKmTwss+0o+T=wk3ywi_Q@mail.gmail.com>
Date: Mon, 31 Aug 2015 21:38:22 +0200
Message-ID: <CALbNGRQ_gWV_j01cwQCnCem7MNY_=tD55MJ8hsW_dLwfcFVByA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] parted_1.8.6.bb: add parted that not GPLv3
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
X-List-Received-Date: Mon, 31 Aug 2015 19:38:24 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Aug 31, 2015 at 9:11 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> On Mon, Aug 31, 2015 at 10:58 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
>> On Mon, Jul 06, 2015 at 09:51:34AM +0800, Lei Maohui wrote:
>>> In oe-core,the parted is GPLv3,so add parted-1.8.6 which is not GPLv3.
>>>
>>> Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
>>> ---
>>>  .../parted-1.8.6/1000parted-1.8.6-warnings1.patch  | 11 ++++
>>>  .../1001parted-1.8.6-notransname1.patch            | 39 ++++++++++++++
>>>  .../1002parted-1.8.6-off-by-one1.patch             | 25 +++++++++
>>>  .../1003parted-1.8.6-primary-boundary1.patch       | 12 +++++
>>>  .../parted-1.8.6/1004parted-1.8.6-xvd1.patch       | 50 +++++++++++++++++
>>>  .../1005parted-1.8.6-devmapper-header1.patch       | 13 +++++
>>>  .../parted/parted-1.8.6/7000no_effect_macro1.patch | 11 ++++
>>>  .../parted/parted-1.8.6/ui.c-fix-build-error.patch | 26 +++++++++
>>>  meta-oe/recipes-extended/parted/parted_1.8.6.bb    | 62 ++++++++++++++++++++++
>>>  9 files changed, 249 insertions(+)
>>>  create mode 100644 meta-oe/recipes-extended/parted/parted-1.8.6/1000parted-1.8.6-warnings1.patch
>>>  create mode 100644 meta-oe/recipes-extended/parted/parted-1.8.6/1001parted-1.8.6-notransname1.patch
>>>  create mode 100644 meta-oe/recipes-extended/parted/parted-1.8.6/1002parted-1.8.6-off-by-one1.patch
>>>  create mode 100644 meta-oe/recipes-extended/parted/parted-1.8.6/1003parted-1.8.6-primary-boundary1.patch
>>>  create mode 100644 meta-oe/recipes-extended/parted/parted-1.8.6/1004parted-1.8.6-xvd1.patch
>>>  create mode 100644 meta-oe/recipes-extended/parted/parted-1.8.6/1005parted-1.8.6-devmapper-header1.patch
>>>  create mode 100644 meta-oe/recipes-extended/parted/parted-1.8.6/7000no_effect_macro1.patch
>>>  create mode 100644 meta-oe/recipes-extended/parted/parted-1.8.6/ui.c-fix-build-error.patch
>>>  create mode 100644 meta-oe/recipes-extended/parted/parted_1.8.6.bb
>>
>> I cannot take this to meta-oe, because as soon as it's added there it
>> will be used by all DISTROs even those who don't mind having GPLv3
>> version.
>>
>> Everybody would need to define PREFERRED_VERSION, because
>> DEFAULT_PREFERENCE is useless across different layers :/
>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=2964
>>
>> So this either has to be introduced in oe-core or in completely separate
>> layer which would be included only by those who cannot use GPLv3.
>
> Third option would be to reduce the priority of meta-oe to be lower
> than oe-core.
>
> That seems logical regardless of any GPLv3 discussion - since meta-oe
> "fills in the gaps" in oe-core, if something _is_ present in oe-core
> then it probably should be the default version.
>
This scares me: to get a recipe in with old version not supporting
modern file systems you want to change meta-oe's layer priority
risiking unknown issues. I wonder how far the GPLv3 avoidance hype
takes us...

Andreas

