Return-Path: <samuli.piippo@gmail.com>
Received: from mail-it0-f46.google.com (mail-it0-f46.google.com
	[209.85.214.46])
	by mail.openembedded.org (Postfix) with ESMTP id 740EC78D67
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jul 2018 10:23:06 +0000 (UTC)
Received: by mail-it0-f46.google.com with SMTP id d16-v6so8908795itj.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jul 2018 03:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=wJ37tIBjT2NQXNmaIK13nGskt3DuRniEDo9ANO9btfU=;
	b=gUBO3awp+gdxFDhKqg23eehS805SN+3u7YyKzyxnq/5AswwP7BqU4UF/g3/KzZSxT6
	r7u4PMLFzMqE2yXpUbo4LDlHxW7L2UKCYZGQScO7AvEB72gnMD8Ny+4PdlLUL/bO4SRC
	gOjo4EsrcfiXRewnrdC9MdsPfkonoTGHTzTtqElDJuXR+rQq+EDpHurmvDWexZcPuinG
	kRc+RdJFVkH70H2XDxoyNcZiQURE6iMsdOBdOkST41Vq99cetasgx+SIoLUQeeliDgDb
	39CQPvKSy30MUaIUmSOewfDBxjK3YO1kVfQmnRqm2FpnyLjcm4jqWPUBWAEw2DiDKIGF
	2GVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=wJ37tIBjT2NQXNmaIK13nGskt3DuRniEDo9ANO9btfU=;
	b=OiT7Ew2/IQv3faGG44qA782fe9K2Eu7gCRi0f0L9Vx7nzTGwehJx7SUTZvni5XojV5
	N3ZifSpYvKkPiA/Ynmq2h6pbT0l5SoW01MWeuA4NEPgCLXWnZyAuWTNs1J7BZn+7Y6Hs
	kTAcc/0okNjzEniYlQFBxJYHgvFpu06NE7oYWIBc0RE2fQsb/4GIN5bGr1c7M1o+aRhF
	kJdhfTZAgNA6mNG2EZoBgJ0QYzZBYULQLk016Kdjg9ocExkTs1XM7ugLVUGdPIz5LPVW
	UCvFK0Xs7gr7XXqCMSSK8vX8n/y3uinvNESQJ8L7+zWRzHuCNa1y8pa1ScTp1fRUoHE7
	DW2w==
X-Gm-Message-State: AOUpUlEF+ZOQ1zRCUKIvpJYhEpDzLgG+ELIrJOo6puqw8sDQjKcB/bOB
	O/VmHBzsMJz2Yhz8xdazuV87pCbzEZXLMnHpXNU=
X-Google-Smtp-Source: AAOMgpdvRfCaBtBvZ21FWelgSSnxbbrc3OeG7ZNkgIhuYzQ2QT2U1oi6h2megRzKPl2rzyE0yarUChJmFRDc8edF2Bo=
X-Received: by 2002:a24:764d:: with SMTP id
	z74-v6mr13905482itb.34.1532946187365; 
	Mon, 30 Jul 2018 03:23:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a6b:c6c2:0:0:0:0:0 with HTTP; Mon, 30 Jul 2018 03:23:06
	-0700 (PDT)
In-Reply-To: <CA+chaQd=R5R4u6RQcLi0B+xCPRxa-Y3K0ytKCMY5d-R=4dXACw@mail.gmail.com>
References: <1519987524-4045-1-git-send-email-mikko.gronoff@qt.io>
	<CA+chaQdsMvcCGbvZmp50eeOtuAm1LjTKwB=oQ7taMZuJn9j_tQ@mail.gmail.com>
	<CA+chaQd=R5R4u6RQcLi0B+xCPRxa-Y3K0ytKCMY5d-R=4dXACw@mail.gmail.com>
From: Samuli Piippo <samuli.piippo@gmail.com>
Date: Mon, 30 Jul 2018 13:23:06 +0300
Message-ID: <CABXoSoXGNM1JT6aNKGpmJtxHVnrgbXXUWGHqJGqJhxhu1-KLFQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH] Change default SRC_URI from github.com to code.qt.io
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
X-List-Received-Date: Mon, 30 Jul 2018 10:23:06 -0000
Content-Type: text/plain; charset="UTF-8"

Have you been using codereview.qt-project.org as the QT_GIT previously?
refs/changes/* are gerrit and CI specific refs and are never be
mirrored to github or code.qt.io

-samuli

On 28 July 2018 at 03:03, Martin Jansa <martin.jansa@gmail.com> wrote:
> In the end it took 60 hours for qtbase, 10 hours for qtdeclarative..
>
> On Fri, Jul 27, 2018 at 9:21 AM Martin Jansa <martin.jansa@gmail.com> wrote:
>
>> One disadvantage of this is that fetching from code.qt.io seems to be
>> significantly slower than from github.com.
>>
>> One extreme case is just running in one of my old build dirs, where the
>> checkout from code.qt.io wasn't updated on premirror for quite long time
>> and now the do_fetch of qtbase is already running for 43 hours..
>>
>> Most of the time it's removing various refs from gerrit reviews:
>> $ tail
>> work/x86_64-linux/qtbase-native/5.9.6+gitAUTOINC+9c50112304-r0/temp/log.do_fetch
>>  x [deleted]         (none)     -> refs/changes/83/75483/6
>>  x [deleted]         (none)     -> refs/changes/83/75783/1
>>  x [deleted]         (none)     -> refs/changes/83/75783/2
>>  x [deleted]         (none)     -> refs/changes/83/75783/3
>>  x [deleted]         (none)     -> refs/changes/83/75783/4
>>  x [deleted]         (none)     -> refs/changes/83/75783/5
>>  x [deleted]         (none)     -> refs/changes/83/75783/6
>>  x [deleted]         (none)     -> refs/changes/83/7583/1
>>  x [deleted]         (none)     -> refs/changes/83/76183/1
>>  x [deleted]         (none)     -> refs/changes/83/76183/2
>>
>> and there is a lot of them:
>> $ grep -c deleted
>> work/x86_64-linux/qtbase-native/5.9.6+gitAUTOINC+9c50112304-r0/temp/log.do_fetch
>> 81174
>>
>> $ grep -c deleted.*refs/changes
>> work/x86_64-linux/qtbase-native/5.9.6+gitAUTOINC+9c50112304-r0/temp/log.do_fetch
>> 63253
>>
>> $ grep -c deleted.*refs/builds
>> work/x86_64-linux/qtbase-native/5.9.6+gitAUTOINC+9c50112304-r0/temp/log.do_fetch
>> 17921
>>
>> Yes it might be faster to delete the archive from premirror and do clone
>> from scratch, but other developers wouldn't know what to do with local
>> downloads directory.
>>
>> On Fri, Mar 2, 2018 at 5:19 PM Mikko Gronoff <mikko.gronoff@qt.io> wrote:
>>
>>> There have been issues in the past with github qt mirror being out of
>>> sync with code.qt.io for certain module repos. Right now there's been a
>>> several days long break in update cycle for seemingly all the qt
>>> modules where content has not been pushed to the github mirror. Change
>>> the default SRC_URI to the more reliable code.qt.io.
>>>
>>> Change-Id: Ic7d3b9a82ef0ae502e99a8516ef78ca09250fd1e
>>> Signed-off-by: Mikko Gronoff <mikko.gronoff@qt.io>
>>> Reviewed-by: Samuli Piippo <samuli.piippo@qt.io>
>>> ---
>>>  conf/layer.conf                              | 4 ++--
>>>  recipes-qt/examples/qt5everywheredemo_1.0.bb | 3 ++-
>>>  2 files changed, 4 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/conf/layer.conf b/conf/layer.conf
>>> index 7751ce2..f540710 100644
>>> --- a/conf/layer.conf
>>> +++ b/conf/layer.conf
>>> @@ -33,7 +33,7 @@ LICENSE_PATH += "${LAYERDIR}/licenses"
>>>
>>>  IMAGE_FEATURES[validitems] += "qtcreator-debug"
>>>
>>> -QT_GIT ?= "git://github.com/qt"
>>> -QT_LABS_GIT ?= "git://github.com/qt-labs"
>>> +QT_GIT_PROJECT ?= "qt"
>>> +QT_GIT ?= "git://code.qt.io/${QT_GIT_PROJECT}
>>> <http://code.qt.io/$%7BQT_GIT_PROJECT%7D>"
>>>  QT_GIT_PROTOCOL ?= "git"
>>>  QT_EDITION ?= "opensource"
>>> diff --git a/recipes-qt/examples/qt5everywheredemo_1.0.bb
>>> b/recipes-qt/examples/qt5everywheredemo_1.0.bb
>>> index dfbe4ae..36d57f1 100644
>>> --- a/recipes-qt/examples/qt5everywheredemo_1.0.bb
>>> +++ b/recipes-qt/examples/qt5everywheredemo_1.0.bb
>>> @@ -7,7 +7,8 @@ LIC_FILES_CHKSUM =
>>> "file://qml/QtDemo/main.qml;endline=39;md5=7d80863906a4bc8ffc
>>>  DEPENDS = "qtdeclarative qtxmlpatterns qtgraphicaleffects qtsvg
>>> qtmultimedia"
>>>
>>>  SRCREV = "35d72a2eba7456a2efc5eb8b77afbc00f69ba0ac"
>>> -SRC_URI = "${QT_LABS_GIT}/qt-labs-qt5-everywhere-demo"
>>> +QT_GIT_PROJECT = "qt-labs"
>>> +SRC_URI = "${QT_GIT}/qt5-everywhere-demo"
>>>
>>>  S = "${WORKDIR}/git/QtDemo"
>>>
>>> --
>>> 2.7.4
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>>
>>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

