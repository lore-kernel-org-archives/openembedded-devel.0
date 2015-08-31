Return-Path: <armccurdy@gmail.com>
Received: from mail-oi0-f49.google.com (mail-oi0-f49.google.com
	[209.85.218.49])
	by mail.openembedded.org (Postfix) with ESMTP id 33EBF74197
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Aug 2015 19:50:25 +0000 (UTC)
Received: by oibi18 with SMTP id i18so65461444oib.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Aug 2015 12:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=h3LiMVpax31zLjSS/Slf7i7TBZ/hdkGfHCZ4ZoGDDaQ=;
	b=nuJPZxHlaejp4iQ5kvHuPZVSCFynKFjhMh4E+TLruF8SlnbQCzBFKBW/KwutWuVyIv
	r1l18K6sG71Pi7coivnasZG/GK/CgI/qv4RFMhFs/XYOgZXEsFVNXKlBxU3gYtOoAVbD
	FZutWY0hHgRYH0Zy+W1nC0T6ab4Ejo622SdDD5hOWS8HxH6MJznbY1ZBB/dJ0lk6+XE2
	Y4qYOrXBVf0r5dZMH3x1NZDX0q5HaKYSUCECjp2fg/e5JubuHYO6y+qHkT6KNwxJOqWc
	1G0RZeu+6sO5971LtJ9DFkRnXpvsIICquHvjqghLIo02YwrqFCFwe+6IzRRELVqOHb/0
	HHqQ==
MIME-Version: 1.0
X-Received: by 10.202.241.6 with SMTP id p6mr13951263oih.1.1441050625762; Mon,
	31 Aug 2015 12:50:25 -0700 (PDT)
Received: by 10.202.6.72 with HTTP; Mon, 31 Aug 2015 12:50:25 -0700 (PDT)
In-Reply-To: <20150831193550.GG2465@jama>
References: <1436147494-44348-1-git-send-email-leimaohui@cn.fujitsu.com>
	<20150831175844.GD2465@jama>
	<CAJ86T=VFZXxLnoMQ7_xv3SZiqYrwwmKmTwss+0o+T=wk3ywi_Q@mail.gmail.com>
	<20150831193550.GG2465@jama>
Date: Mon, 31 Aug 2015 12:50:25 -0700
Message-ID: <CAJ86T=WBP0feqhfZyj95NKtu6t44WsShZXqbh+KgBV=8PHAFcA@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Mon, 31 Aug 2015 19:50:28 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Aug 31, 2015 at 12:35 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Mon, Aug 31, 2015 at 12:11:01PM -0700, Andre McCurdy wrote:
>> On Mon, Aug 31, 2015 at 10:58 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
>> > On Mon, Jul 06, 2015 at 09:51:34AM +0800, Lei Maohui wrote:
>> >> In oe-core,the parted is GPLv3,so add parted-1.8.6 which is not GPLv3.
>> >>
>> >> Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
>> >> ---
>> >>  .../parted-1.8.6/1000parted-1.8.6-warnings1.patch  | 11 ++++
>> >>  .../1001parted-1.8.6-notransname1.patch            | 39 ++++++++++++++
>> >>  .../1002parted-1.8.6-off-by-one1.patch             | 25 +++++++++
>> >>  .../1003parted-1.8.6-primary-boundary1.patch       | 12 +++++
>> >>  .../parted-1.8.6/1004parted-1.8.6-xvd1.patch       | 50 +++++++++++++++++
>> >>  .../1005parted-1.8.6-devmapper-header1.patch       | 13 +++++
>> >>  .../parted/parted-1.8.6/7000no_effect_macro1.patch | 11 ++++
>> >>  .../parted/parted-1.8.6/ui.c-fix-build-error.patch | 26 +++++++++
>> >>  meta-oe/recipes-extended/parted/parted_1.8.6.bb    | 62 ++++++++++++++++++++++
>> >>  9 files changed, 249 insertions(+)
>> >>  create mode 100644 meta-oe/recipes-extended/parted/parted-1.8.6/1000parted-1.8.6-warnings1.patch
>> >>  create mode 100644 meta-oe/recipes-extended/parted/parted-1.8.6/1001parted-1.8.6-notransname1.patch
>> >>  create mode 100644 meta-oe/recipes-extended/parted/parted-1.8.6/1002parted-1.8.6-off-by-one1.patch
>> >>  create mode 100644 meta-oe/recipes-extended/parted/parted-1.8.6/1003parted-1.8.6-primary-boundary1.patch
>> >>  create mode 100644 meta-oe/recipes-extended/parted/parted-1.8.6/1004parted-1.8.6-xvd1.patch
>> >>  create mode 100644 meta-oe/recipes-extended/parted/parted-1.8.6/1005parted-1.8.6-devmapper-header1.patch
>> >>  create mode 100644 meta-oe/recipes-extended/parted/parted-1.8.6/7000no_effect_macro1.patch
>> >>  create mode 100644 meta-oe/recipes-extended/parted/parted-1.8.6/ui.c-fix-build-error.patch
>> >>  create mode 100644 meta-oe/recipes-extended/parted/parted_1.8.6.bb
>> >
>> > I cannot take this to meta-oe, because as soon as it's added there it
>> > will be used by all DISTROs even those who don't mind having GPLv3
>> > version.
>> >
>> > Everybody would need to define PREFERRED_VERSION, because
>> > DEFAULT_PREFERENCE is useless across different layers :/
>> > https://bugzilla.yoctoproject.org/show_bug.cgi?id=2964
>> >
>> > So this either has to be introduced in oe-core or in completely separate
>> > layer which would be included only by those who cannot use GPLv3.
>>
>> Third option would be to reduce the priority of meta-oe to be lower
>> than oe-core.
>>
>> That seems logical regardless of any GPLv3 discussion - since meta-oe
>> "fills in the gaps" in oe-core, if something _is_ present in oe-core
>> then it probably should be the default version.
>
> Except when this additional stuff requires some changes in recipes
> already available in oe-core, that's why meta-oe has higher priority.
>

Do you have an example?

