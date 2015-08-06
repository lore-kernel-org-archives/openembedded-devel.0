Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id 9DA6C73905
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Aug 2015 03:30:47 +0000 (UTC)
Received: by iodb91 with SMTP id b91so9092245iod.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Aug 2015 20:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=5J8kIIltFAyACRbZ+r1MlXrBTdM7eFlzM3u95kWlSoQ=;
	b=0kIoGtueqgoqbe3p7J5UsBb7YR4rvKQIQ42dsIw4bLpPrQc2Lkhl/qgMNEHCzUHtY3
	eFqBKnmF4kK9qtSTt4HBAscP1WWG3YPg/c1B80A9Xbr1SbC6Fv0qyjNnIxXMDuhyAlK+
	P9OyYs8KIn4D1L36LqS0NSsg1Vmrc+7o4WnWYydodVPO02G8fQJW+ylDLT+bGDjKcIgL
	5jASu2N6g4DzF4Iv0iDaqj94fjV1bsxQWEZlOS527/PA2RNrzWcaf2MwY5rjbi3VvwIm
	Bt0HlxL+YkubPTi6uOhp42832p/htumLYmxtXXYKnyYlPFpgOQtp79m+v/PB4H0wPDWq
	sJfg==
X-Received: by 10.107.168.145 with SMTP id e17mr13512903ioj.112.1438831847234; 
	Wed, 05 Aug 2015 20:30:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.38.79 with HTTP; Wed, 5 Aug 2015 20:30:17 -0700 (PDT)
In-Reply-To: <20150805123704.GA2452@jama>
References: <1429280204-27191-3-git-send-email-Martin.Jansa@gmail.com>
	<1438628438-9452-1-git-send-email-Martin.Jansa@gmail.com>
	<1438628438-9452-2-git-send-email-Martin.Jansa@gmail.com>
	<CAMKF1sqPdo2ByELw+pCkVPGtYHRXVJAWEo8d3tONXtKcyJmu3g@mail.gmail.com>
	<20150805123704.GA2452@jama>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 5 Aug 2015 20:30:17 -0700
Message-ID: <CAMKF1soyUm7RgKjhyCF3aLre1J9q6oEQSJ06QOi+7cnpiC5OGw@mail.gmail.com>
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
X-List-Received-Date: Thu, 06 Aug 2015 03:30:47 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Aug 5, 2015 at 5:37 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Tue, Aug 04, 2015 at 04:05:26PM -0700, Khem Raj wrote:
>> On Mon, Aug 3, 2015 at 12:00 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
>> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>> > ---
>> >  recipes-qt/qt5/qt5-plugin-generic-vboxtouch_git.bb | 7 +++++--
>> >  1 file changed, 5 insertions(+), 2 deletions(-)
>> >
>> > diff --git a/recipes-qt/qt5/qt5-plugin-generic-vboxtouch_git.bb b/recipes-qt/qt5/qt5-plugin-generic-vboxtouch_git.bb
>> > index 5352d15..2676bdd 100644
>> > --- a/recipes-qt/qt5/qt5-plugin-generic-vboxtouch_git.bb
>> > +++ b/recipes-qt/qt5/qt5-plugin-generic-vboxtouch_git.bb
>> > @@ -9,12 +9,15 @@ LIC_FILES_CHKSUM = " \
>> >      file://evdevmousehandler.cpp;beginline=1;endline=40;md5=9081062f6e7f74b6e62ad7ecee4a71be \
>> >  "
>> >
>> > -PV = "1.0+gitr${SRCPV}"
>> > +PV = "1.1.3+gitr${SRCPV}"
>> >
>> >  DEPENDS = "qtbase"
>> >
>> > +# Needed with gcc-5.2 https://gcc.gnu.org/bugzilla/show_bug.cgi?id=65801
>>
>> this comment it wrong. It should have said needed with gcc5 < 5.2
>>
>> > +CXXFLAGS += "-Wno-narrowing"
>>
>> we now have 5.2 in OE-Core and its fixed in 5.2, Can you try to remove it ?
>
> I wrote this change, because it was failing with gcc-5.2 (I don't
> remember if it was failing with 5.1 as well).

in that case then you are not encountering the gcc bug mentioned in
comment its something else.
because the bug mentioned there is fixed in 5.2 and also a followup
bug https://gcc.gnu.org/bugzilla/show_bug.cgi?id=65801
which is also fixed.
Can you send preprocessed source for the file in question ?

