Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f176.google.com (mail-ob0-f176.google.com
	[209.85.214.176])
	by mail.openembedded.org (Postfix) with ESMTP id 9223476EA4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Aug 2015 20:02:45 +0000 (UTC)
Received: by obcbp4 with SMTP id bp4so29878971obc.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Aug 2015 13:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=UqX1G8qyfbu74ctvNneC6c3DCi5bHv+bcoQ9Lrh3clc=;
	b=vZ1qsEbXuZsZK0LMFPT1kbMhX+cHAmgx1LeZaXoIq09UkINagxlbZevYbc+2nGBHM/
	GhbAR2Bu3WiwbbVtIVGRGAk+ld4ZNXz2GF9HyUtFXrMTUZQPWNRks6x7k37wCH0DyDdF
	em2taWAsbJUDAWQGbdHIptXdCUa1yW3qQCaEnYS1OKTnTlnseKNH2+jqbzfkVLO43Qj9
	txtqUaH4u5ctrf9BKuuvp8TMCoOi0csHocBiBFoEVamGnM//CBAmbUrAXKqYLIv7DE3K
	SgbtEgi2cAHXlJ+yvA1oQa8b7qvl1MR5iThbV0+KwX3zmdBhjPaxIw3z+cK4N8NH7FWW
	3Jyw==
MIME-Version: 1.0
X-Received: by 10.182.204.35 with SMTP id kv3mr15554122obc.58.1441051365309;
	Mon, 31 Aug 2015 13:02:45 -0700 (PDT)
Received: by 10.202.6.72 with HTTP; Mon, 31 Aug 2015 13:02:45 -0700 (PDT)
In-Reply-To: <CALbNGRQ_gWV_j01cwQCnCem7MNY_=tD55MJ8hsW_dLwfcFVByA@mail.gmail.com>
References: <1436147494-44348-1-git-send-email-leimaohui@cn.fujitsu.com>
	<20150831175844.GD2465@jama>
	<CAJ86T=VFZXxLnoMQ7_xv3SZiqYrwwmKmTwss+0o+T=wk3ywi_Q@mail.gmail.com>
	<CALbNGRQ_gWV_j01cwQCnCem7MNY_=tD55MJ8hsW_dLwfcFVByA@mail.gmail.com>
Date: Mon, 31 Aug 2015 13:02:45 -0700
Message-ID: <CAJ86T=Wxf6PN+csum6CeyiC_keZtzG69VSQ8YFsA_x2kQh5zcw@mail.gmail.com>
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
X-List-Received-Date: Mon, 31 Aug 2015 20:02:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2015 at 12:38 PM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> On Mon, Aug 31, 2015 at 9:11 PM, Andre McCurdy <armccurdy@gmail.com> wrot=
e:
>> On Mon, Aug 31, 2015 at 10:58 AM, Martin Jansa <martin.jansa@gmail.com> =
wrote:
>>> On Mon, Jul 06, 2015 at 09:51:34AM +0800, Lei Maohui wrote:
>>>> In oe-core,the parted is GPLv3,so add parted-1.8.6 which is not GPLv3.
>>>>
>>>> Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
>>>> ---
>>>>  .../parted-1.8.6/1000parted-1.8.6-warnings1.patch  | 11 ++++
>>>>  .../1001parted-1.8.6-notransname1.patch            | 39 +++++++++++++=
+
>>>>  .../1002parted-1.8.6-off-by-one1.patch             | 25 +++++++++
>>>>  .../1003parted-1.8.6-primary-boundary1.patch       | 12 +++++
>>>>  .../parted-1.8.6/1004parted-1.8.6-xvd1.patch       | 50 +++++++++++++=
++++
>>>>  .../1005parted-1.8.6-devmapper-header1.patch       | 13 +++++
>>>>  .../parted/parted-1.8.6/7000no_effect_macro1.patch | 11 ++++
>>>>  .../parted/parted-1.8.6/ui.c-fix-build-error.patch | 26 +++++++++
>>>>  meta-oe/recipes-extended/parted/parted_1.8.6.bb    | 62 +++++++++++++=
+++++++++
>>>>  9 files changed, 249 insertions(+)
>>>>  create mode 100644 meta-oe/recipes-extended/parted/parted-1.8.6/1000p=
arted-1.8.6-warnings1.patch
>>>>  create mode 100644 meta-oe/recipes-extended/parted/parted-1.8.6/1001p=
arted-1.8.6-notransname1.patch
>>>>  create mode 100644 meta-oe/recipes-extended/parted/parted-1.8.6/1002p=
arted-1.8.6-off-by-one1.patch
>>>>  create mode 100644 meta-oe/recipes-extended/parted/parted-1.8.6/1003p=
arted-1.8.6-primary-boundary1.patch
>>>>  create mode 100644 meta-oe/recipes-extended/parted/parted-1.8.6/1004p=
arted-1.8.6-xvd1.patch
>>>>  create mode 100644 meta-oe/recipes-extended/parted/parted-1.8.6/1005p=
arted-1.8.6-devmapper-header1.patch
>>>>  create mode 100644 meta-oe/recipes-extended/parted/parted-1.8.6/7000n=
o_effect_macro1.patch
>>>>  create mode 100644 meta-oe/recipes-extended/parted/parted-1.8.6/ui.c-=
fix-build-error.patch
>>>>  create mode 100644 meta-oe/recipes-extended/parted/parted_1.8.6.bb
>>>
>>> I cannot take this to meta-oe, because as soon as it's added there it
>>> will be used by all DISTROs even those who don't mind having GPLv3
>>> version.
>>>
>>> Everybody would need to define PREFERRED_VERSION, because
>>> DEFAULT_PREFERENCE is useless across different layers :/
>>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D2964
>>>
>>> So this either has to be introduced in oe-core or in completely separat=
e
>>> layer which would be included only by those who cannot use GPLv3.
>>
>> Third option would be to reduce the priority of meta-oe to be lower
>> than oe-core.
>>
>> That seems logical regardless of any GPLv3 discussion - since meta-oe
>> "fills in the gaps" in oe-core, if something _is_ present in oe-core
>> then it probably should be the default version.
>>
> This scares me: to get a recipe in with old version not supporting
> modern file systems you want to change meta-oe's layer priority
> risiking unknown issues. I wonder how far the GPLv3 avoidance hype
> takes us...

No, if you read the various threads, my preference is to have the
GPLv2 parted recipe in oe-core. That option has been shot down though
and the general consensus seems to be that the older version of parted
is too buggy to be included anywhere in OE. That topic seems to be
closed.

Trying to understand why meta-oe needs a higher priority than oe-core
is a separate topic. If the priorities were changed it would allow
older (and newer) versions of oe-core recipes to safely live in
meta-oe. That would help non-GPLv3 versions of GPLv3 packages, but it
might be useful in other cases too.


> Andreas
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

