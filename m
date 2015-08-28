Return-Path: <net147@gmail.com>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id 1ECBF60043
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Aug 2015 08:46:04 +0000 (UTC)
Received: by padfo6 with SMTP id fo6so17349075pad.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Aug 2015 01:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=XBMt7GwaZqqZDwTEbj1gDF8The2AmdKBzQoIM8P6V6k=;
	b=oofrRx0myVN5gwF+jR6P1SfemeUEVbVS3J7Nq2Zqr4vq0ZeQGRpAoGCU9vtffRA4i1
	561MNSL19LLfpehZKQ+GySwhny/O9Imy/qmW6wkOvdrcSVF8RC5UM2ncIjTDetqTGq8X
	yT2xdTm58YpMqedGD1UZy4CfcnmlGnPQUhcVcZmp0FIa1GHLnAo3G4/GI7lMhDbuXAM6
	m6QQLbnWqEwSibm0i7wvBLL1STtbVxQ9cX1jclZIiQSXkFRnidWFDwq7Ydmn2MURZUWj
	s2c4N4u9+VUfUbPf6JNS58lbiv9Zg08xXNbz876M4xgjaX19xfOAZkyZRUv4US498nOM
	tkKw==
MIME-Version: 1.0
X-Received: by 10.66.159.197 with SMTP id xe5mr14190570pab.32.1440751564634;
	Fri, 28 Aug 2015 01:46:04 -0700 (PDT)
Received: by 10.66.80.131 with HTTP; Fri, 28 Aug 2015 01:46:04 -0700 (PDT)
In-Reply-To: <D4C07404-5127-46A0-867F-D21F90BBFDA7@gmail.com>
References: <1440332209-8802-1-git-send-email-net147@gmail.com>
	<20150827141522.GP26375@denix.org>
	<D4C07404-5127-46A0-867F-D21F90BBFDA7@gmail.com>
Date: Fri, 28 Aug 2015 18:46:04 +1000
Message-ID: <CANwerB1W1iqe72aV2Y4CvytbrE15JnM8ktWgoBTDWhB7w0CgXA@mail.gmail.com>
From: Jonathan Liu <net147@gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH] qtbase: replace host paths with qmake built-in properties in qconfig.pri
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
X-List-Received-Date: Fri, 28 Aug 2015 08:46:06 -0000
Content-Type: text/plain; charset=UTF-8

Hi Khem,

On 28 August 2015 at 15:57, Khem Raj <raj.khem@gmail.com> wrote:
> Denys
>
> I have posted an incremental fix, here
> https://github.com/meta-qt5/meta-qt5/commit/a0a5002ed4bfcce50d6462897c4701246061581a
>
> Jonathan
>
> Can you see if it still fixes the usecase that you originally were trying to fix ?

Your patch misses some host paths that aren't in
${STAGING_DIR_HOST}/usr (referred to as ${STAGING_EXECPREFIXDIR} in
your patch):
${STAGING_DIR_HOST}/lib
${STAGING_DIR_HOST}

You can change the following in your patch:
-e 's| ${STAGING_EXECPREFIXDIR}| $$[QT_INSTALL_PREFIX]|g' \

To:
-e 's| ${STAGING_DIR_HOST}| $$[QT_SYSROOT]|g' \

So that it covers the host paths missed by sed.

Regards,
Jonathan

>
>> On Aug 27, 2015, at 7:15 AM, Denys Dmytriyenko <denis@denix.org> wrote:
>>
>> This seems to cause a build issue in qtwebkit and qtwebengine as well.
>>
>> It manifests in not being able to find glib.h or gio/gio.h headers.
>>
>> Khem, Martin and I are still discussing this on IRC, but I propose to revert
>> this commit until it's tested better for all modules.
>>
>> --
>> Denys
>>
>>
>> On Sun, Aug 23, 2015 at 10:16:49PM +1000, Jonathan Liu wrote:
>>> This avoids qconfig.pri in the Qt SDK incorrectly including paths from
>>> the build host that may not exist on the SDK host. As the paths are
>>> now correct, qmake can correctly detect system include paths and use
>>> -isystem instead of -I for Qt's include directories which allows the
>>> suppression of warnings from library headers when building Qt
>>> applications.
>>>
>>> Signed-off-by: Jonathan Liu <net147@gmail.com>
>>> ---
>>> recipes-qt/qt5/qtbase_git.bb | 5 +++++
>>> 1 file changed, 5 insertions(+)
>>>
>>> diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
>>> index ae63150..324a115 100644
>>> --- a/recipes-qt/qt5/qtbase_git.bb
>>> +++ b/recipes-qt/qt5/qtbase_git.bb
>>> @@ -234,6 +234,11 @@ do_install_append() {
>>>     # Remove macx-ios-clang directory because /usr/lib/qt5/mkspecs/macx-ios-clang/rename_main.sh:#!/bin/bash
>>>     # triggers QA Issue: qtbase-mkspecs requires /bin/bash, but no providers in its RDEPENDS [file-rdeps]
>>>     rm -rf ${D}/${OE_QMAKE_PATH_QT_ARCHDATA}/mkspecs/macx-ios-clang
>>> +
>>> +    # Replace host paths with qmake built-in properties
>>> +    sed -i -e 's| ${STAGING_DIR_NATIVE}| $$[QT_HOST_PREFIX]|g' \
>>> +        -e 's| ${STAGING_DIR_HOST}| $$[QT_INSTALL_PREFIX]|g' \
>>> +        ${D}/${OE_QMAKE_PATH_QT_ARCHDATA}/mkspecs/qconfig.pri
>>> }
>>>
>>> PACKAGES =. " \
>>> --
>>> 2.5.0
>>>
>>> --

