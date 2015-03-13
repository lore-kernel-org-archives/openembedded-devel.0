Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f175.google.com (mail-ob0-f175.google.com
	[209.85.214.175])
	by mail.openembedded.org (Postfix) with ESMTP id A8D5F6013D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Mar 2015 19:57:28 +0000 (UTC)
Received: by obcvb8 with SMTP id vb8so21968382obc.10
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Mar 2015 12:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=6PukHk0U0nJ14fIrNsZ5qEyyAoZIyBO1vWrdCgWonWw=;
	b=p+dLUMQaaLdekfjzxcMu7egqKrM1uZwWznLKpFEoHq6Z6x0XFuubuBhhYi7NJoutgx
	rNvcp/U03vNBMk9CsEs9JrMHlvFF37TNPyLjGBldnsMLNFlLbu30NrBcmiGAiqp8RS2M
	V68n4QtWW2u5MV5M8R+L3xH7uEIAvt16Gx3+PbUG/wFLwrluH4WYKMRKUFCifWLNBNSl
	onAPxOgKAntn5jFiHdwlQ0+csbKZFLIseo77jnfXbwQ3NjtE6o06y24pB1GbMsVWOsz/
	4kBn3FS4e1zeUValKgP9Ggt+wHhGR30cngegPC29Gyz+k6qzwW9MZH9c9NZ7WWLKUsLp
	ggUQ==
MIME-Version: 1.0
X-Received: by 10.202.48.87 with SMTP id w84mr36942872oiw.17.1426276649520;
	Fri, 13 Mar 2015 12:57:29 -0700 (PDT)
Received: by 10.202.217.69 with HTTP; Fri, 13 Mar 2015 12:57:29 -0700 (PDT)
In-Reply-To: <20150313135014.GB2345@jama>
References: <1426218641-28745-1-git-send-email-armccurdy@gmail.com>
	<20150313135014.GB2345@jama>
Date: Fri, 13 Mar 2015 12:57:29 -0700
Message-ID: <CAJ86T=WRk5YqXf7jfTiAW32DQFWCh3MYxYoqKKckE2UwNo-hHQ@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-qt5][PATCH] qt5: add QT_GIT to define git repo for Qt core components
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
X-List-Received-Date: Fri, 13 Mar 2015 19:57:31 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Mar 13, 2015 at 6:50 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Thu, Mar 12, 2015 at 08:50:41PM -0700, Andre McCurdy wrote:
>> Replace four duplicate git URIs with a single definition.
>
> Do you plan to override this location from somewhere else?

Yes, I think it's useful to have that option.

> It doesn't even cover qt5everywheredemo recipe so I don't think it's
> worth it in this form, maybe if you move it to layer.conf and apply it
> for qt5everywheredemo as well.

I'll send a version 2.

>
> Regards,
>
>> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>> ---
>>  recipes-qt/qt5/nativesdk-qtbase_git.bb | 2 +-
>>  recipes-qt/qt5/qt5-git.inc             | 4 +++-
>>  recipes-qt/qt5/qtbase-native_git.bb    | 2 +-
>>  recipes-qt/qt5/qtbase_git.bb           | 2 +-
>>  4 files changed, 6 insertions(+), 4 deletions(-)
>>
>> diff --git a/recipes-qt/qt5/nativesdk-qtbase_git.bb b/recipes-qt/qt5/nativesdk-qtbase_git.bb
>> index df80407..9832eee 100644
>> --- a/recipes-qt/qt5/nativesdk-qtbase_git.bb
>> +++ b/recipes-qt/qt5/nativesdk-qtbase_git.bb
>> @@ -5,7 +5,7 @@ require ${PN}.inc
>>  FILESEXTRAPATHS =. "${FILE_DIRNAME}/${BPN}-git:"
>>
>>  SRC_URI = "\
>> -    git://code.qt.io/qt/${QT_MODULE}.git;branch=${QT_MODULE_BRANCH} \
>> +    ${QT_GIT}/qt/${QT_MODULE}.git;branch=${QT_MODULE_BRANCH} \
>>  "
>>
>>  # common for qtbase-native, qtbase-nativesdk and qtbase
>> diff --git a/recipes-qt/qt5/qt5-git.inc b/recipes-qt/qt5/qt5-git.inc
>> index 84ddf49..a2d96a2 100644
>> --- a/recipes-qt/qt5/qt5-git.inc
>> +++ b/recipes-qt/qt5/qt5-git.inc
>> @@ -1,11 +1,13 @@
>>  # Copyright (C) 2012 O.S. Systems Software LTDA.
>>  # Copyright (C) 2013-2014 Martin Jansa <martin.jansa@gmail.com>
>>
>> +QT_GIT ?= "git://code.qt.io"
>> +
>>  QT_MODULE_BRANCH ?= "5.4"
>>
>>  # each module needs to define valid SRCREV
>>  SRC_URI += " \
>> -    git://code.qt.io/qt/${QT_MODULE}.git;branch=${QT_MODULE_BRANCH} \
>> +    ${QT_GIT}/qt/${QT_MODULE}.git;branch=${QT_MODULE_BRANCH} \
>>  "
>>
>>  S = "${WORKDIR}/git"
>> diff --git a/recipes-qt/qt5/qtbase-native_git.bb b/recipes-qt/qt5/qtbase-native_git.bb
>> index 5a308d4..e558ee6 100644
>> --- a/recipes-qt/qt5/qtbase-native_git.bb
>> +++ b/recipes-qt/qt5/qtbase-native_git.bb
>> @@ -2,7 +2,7 @@ require qt5-git.inc
>>  require ${PN}.inc
>>
>>  SRC_URI = "\
>> -    git://code.qt.io/qt/${QT_MODULE}.git;branch=${QT_MODULE_BRANCH} \
>> +    ${QT_GIT}/qt/${QT_MODULE}.git;branch=${QT_MODULE_BRANCH} \
>>  "
>>
>>  # common for qtbase-native, qtbase-nativesdk and qtbase
>> diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
>> index 549c92a..1be31ea 100644
>> --- a/recipes-qt/qt5/qtbase_git.bb
>> +++ b/recipes-qt/qt5/qtbase_git.bb
>> @@ -2,7 +2,7 @@ require qt5-git.inc
>>  require ${PN}.inc
>>
>>  SRC_URI = "\
>> -    git://code.qt.io/qt/${QT_MODULE}.git;branch=${QT_MODULE_BRANCH} \
>> +    ${QT_GIT}/qt/${QT_MODULE}.git;branch=${QT_MODULE_BRANCH} \
>>  "
>>
>>  # common for qtbase-native, qtbase-nativesdk and qtbase
>> --
>> 1.9.1
>>
>> --

