Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id 97F1273905
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Aug 2015 03:31:35 +0000 (UTC)
Received: by ioii16 with SMTP id i16so69257324ioi.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Aug 2015 20:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=mxAK9dlEABiFhpkJ/pNMIt598IPp5ORaxIP8GsQEvK8=;
	b=t2aPBjPGhIFF2PI8VEPljAvYtUtKQCQYDIQyThs8Uz5yHAARqzdThkIsGY2SlREvUY
	CpWc0daDMdxdCe3ino/weZSLndpQt9wiVMlRrdK65+ovS77TLMt0vKNZ8srEEZlz7ZMP
	iB/a8dwRwN4MPb+UxLzv4oXKh3cBJ+usFMo73cU/Ro8GL+YuRQ1d6tekvVxAHVASy16G
	c8k88S6LemNPb94eCKeLAD2vW4mMK/lkhlMzuX+EQJ+C52xfasjWISLouMAOLpZ8hBFC
	sRIlaN4XAI0sk5yiywgwiifLEC7vWyQueLyQYh7dA6z/HubXV6yzzKAzq/g6JNcYdRJa
	FleQ==
X-Received: by 10.107.34.194 with SMTP id i185mr13168916ioi.49.1438831896380; 
	Wed, 05 Aug 2015 20:31:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.38.79 with HTTP; Wed, 5 Aug 2015 20:31:07 -0700 (PDT)
In-Reply-To: <CAMKF1soyUm7RgKjhyCF3aLre1J9q6oEQSJ06QOi+7cnpiC5OGw@mail.gmail.com>
References: <1429280204-27191-3-git-send-email-Martin.Jansa@gmail.com>
	<1438628438-9452-1-git-send-email-Martin.Jansa@gmail.com>
	<1438628438-9452-2-git-send-email-Martin.Jansa@gmail.com>
	<CAMKF1sqPdo2ByELw+pCkVPGtYHRXVJAWEo8d3tONXtKcyJmu3g@mail.gmail.com>
	<20150805123704.GA2452@jama>
	<CAMKF1soyUm7RgKjhyCF3aLre1J9q6oEQSJ06QOi+7cnpiC5OGw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 5 Aug 2015 20:31:07 -0700
Message-ID: <CAMKF1srVVT1SHf+9qh8eW=bJ+cVwde5eaX8A1ftFo_VQ2A3S-Q@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH 2/2] qt5-plugin-generic-vboxtouch: add -Wno-narrowing to fix build with gcc-5.2
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
X-List-Received-Date: Thu, 06 Aug 2015 03:31:38 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Aug 5, 2015 at 8:30 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Wed, Aug 5, 2015 at 5:37 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
>> On Tue, Aug 04, 2015 at 04:05:26PM -0700, Khem Raj wrote:
>>> On Mon, Aug 3, 2015 at 12:00 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
>>> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>>> > ---
>>> >  recipes-qt/qt5/qt5-plugin-generic-vboxtouch_git.bb | 7 +++++--
>>> >  1 file changed, 5 insertions(+), 2 deletions(-)
>>> >
>>> > diff --git a/recipes-qt/qt5/qt5-plugin-generic-vboxtouch_git.bb b/recipes-qt/qt5/qt5-plugin-generic-vboxtouch_git.bb
>>> > index 5352d15..2676bdd 100644
>>> > --- a/recipes-qt/qt5/qt5-plugin-generic-vboxtouch_git.bb
>>> > +++ b/recipes-qt/qt5/qt5-plugin-generic-vboxtouch_git.bb
>>> > @@ -9,12 +9,15 @@ LIC_FILES_CHKSUM = " \
>>> >      file://evdevmousehandler.cpp;beginline=1;endline=40;md5=9081062f6e7f74b6e62ad7ecee4a71be \
>>> >  "
>>> >
>>> > -PV = "1.0+gitr${SRCPV}"
>>> > +PV = "1.1.3+gitr${SRCPV}"
>>> >
>>> >  DEPENDS = "qtbase"
>>> >
>>> > +# Needed with gcc-5.2 https://gcc.gnu.org/bugzilla/show_bug.cgi?id=65801
>>>
>>> this comment it wrong. It should have said needed with gcc5 < 5.2
>>>
>>> > +CXXFLAGS += "-Wno-narrowing"
>>>
>>> we now have 5.2 in OE-Core and its fixed in 5.2, Can you try to remove it ?
>>
>> I wrote this change, because it was failing with gcc-5.2 (I don't
>> remember if it was failing with 5.1 as well).
>
> in that case then you are not encountering the gcc bug mentioned in
> comment its something else.
> because the bug mentioned there is fixed in 5.2 and also a followup
> bug https://gcc.gnu.org/bugzilla/show_bug.cgi?id=65801

I meant to type https://gcc.gnu.org/bugzilla/show_bug.cgi?id=66007

> which is also fixed.
> Can you send preprocessed source for the file in question ?

