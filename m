Return-Path: <Florin.Sarbu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 852756F378
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Mar 2014 10:45:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s26AjU4p003179
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 6 Mar 2014 02:45:30 -0800 (PST)
Received: from localhost.localdomain (128.224.170.197) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.169.1; Thu, 6 Mar 2014 02:45:30 -0800
Message-ID: <531851C9.90607@windriver.com>
Date: Thu, 6 Mar 2014 12:45:29 +0200
From: Florin Sarbu <florin.sarbu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1393948468-19612-1-git-send-email-florin.sarbu@windriver.com>	<20140305182334.GB26981@jama>
	<53176E96.8050806@windriver.com> <20140305192603.GC26981@jama>
In-Reply-To: <20140305192603.GC26981@jama>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-qt5][dora][PATCH] Fix Project ERROR: Module v8 has no public API. make[1]:
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
X-List-Received-Date: Thu, 06 Mar 2014 10:45:30 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit


On 03/05/2014 09:26 PM, Martin Jansa wrote:
> On Wed, Mar 05, 2014 at 08:36:06PM +0200, Florin Sarbu wrote:
>> Sorry, I'm not following what you want me to do now. Send another commit
>> up for review, this time with
>>
>> 7327781083aea593b4911b6da7105e4984e28c68
>>
>> cherry-pick'ed?
> Yes, because you added the fix.missing.v8.public.api.patch file only to
> qtwayland-5.1.0+git but included it in SRC_URI in qtwayland.inc so
> also for qtwayland_git which will now fail in do_fetch.
>
> Also mine commit has better commit message and commits to "release"
> branches should be cherry-picks from master where possible.
Your commit does not apply on the dora branch. So I will send another 
one that does not break the _git.bb recipe and change the commit message.

Florin
>
>> On 03/05/2014 08:23 PM, Martin Jansa wrote:
>>> On Tue, Mar 04, 2014 at 05:54:28PM +0200, Florin Sarbu wrote:
>>>> From: "florin.sarbu" <florin.sarbu@windriver.com>
>>> Cherry-pick 7327781083aea593b4911b6da7105e4984e28c68 from meta-qt5/master
>>>
>>> Your version is breaking recipes-qt/qt5/qtwayland_git.bb recipe I guess.
>>>
>>>> Cherry-picked from:
>>>> https://github.com/kvahlman/qtwayland/commit/b455f5acaec811b70ae3eb896c08a634909cb9d1
>>>>
>>>> Signed-off-by: Florin Sarbu <florin.sarbu@windriver.com>
>>>> ---
>>>>    .../fix.missing.v8.public.api.patch                | 30 ++++++++++++++++++++++
>>>>    recipes-qt/qt5/qtwayland.inc                       |  1 +
>>>>    2 files changed, 31 insertions(+)
>>>>    create mode 100644 recipes-qt/qt5/qtwayland-5.1.0+git/fix.missing.v8.public.api.patch
>>>>
>>>> diff --git a/recipes-qt/qt5/qtwayland-5.1.0+git/fix.missing.v8.public.api.patch b/recipes-qt/qt5/qtwayland-5.1.0+git/fix.missing.v8.public.api.patch
>>>> new file mode 100644
>>>> index 0000000..6bbbaa1
>>>> --- /dev/null
>>>> +++ b/recipes-qt/qt5/qtwayland-5.1.0+git/fix.missing.v8.public.api.patch
>>>> @@ -0,0 +1,30 @@
>>>> +From b455f5acaec811b70ae3eb896c08a634909cb9d1 Mon Sep 17 00:00:00 2001
>>>> +From: Carsten Munk <carsten.munk@jollamobile.com>
>>>> +Date: Wed, 17 Jul 2013 07:28:04 +0000
>>>> +Subject: [PATCH] Fix Project ERROR: Module v8 has no public API. make[1]: ***
>>>> + [sub-qml-compositor-make_first] Error 3
>>>> +
>>>> +Cherry-picked from:
>>>> +https://github.com/kvahlman/qtwayland/commit/b455f5acaec811b70ae3eb896c08a634909cb9d1
>>>> +
>>>> +Signed-off-by: Carsten Munk <carsten.munk@jollamobile.com>
>>>> +---
>>>> + qtwayland/examples/qml-compositor/qml-compositor.pro | 2 +-
>>>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>>>> +
>>>> +diff --git a/examples/qml-compositor/qml-compositor.pro b/examples/qml-compositor/qml-compositor.pro
>>>> +index 0bc0b02..e397002 100644
>>>> +--- a/examples/qml-compositor/qml-compositor.pro
>>>> ++++ b/examples/qml-compositor/qml-compositor.pro
>>>> +@@ -2,7 +2,7 @@ DEFINES += QT_COMPOSITOR_QUICK
>>>> +
>>>> + LIBS += -L ../../lib
>>>> +
>>>> +-QT += quick qml v8
>>>> ++QT += quick qml
>>>> + QT += quick-private
>>>> +
>>>> + QT += compositor
>>>> +--
>>>> +1.8.4
>>>> +
>>>> diff --git a/recipes-qt/qt5/qtwayland.inc b/recipes-qt/qt5/qtwayland.inc
>>>> index 40dd803..2d5d6af 100644
>>>> --- a/recipes-qt/qt5/qtwayland.inc
>>>> +++ b/recipes-qt/qt5/qtwayland.inc
>>>> @@ -17,6 +17,7 @@ SRC_URI += " \
>>>>        file://0001-xcbcommon-should-not-be-a-mandatory-dependency.patch \
>>>>        file://0002-Temporarily-patching-this-out-as-Qt5.0.0-does-not-ha.patch \
>>>>        file://0003-eglCreateImageKHR-requires-the-context-to-be-NULL.patch \
>>>> +    file://fix.missing.v8.public.api.patch \
>>>>    "
>>>>    
>>>>    QT_WAYLAND_CONFIG ?= "wayland-compositor"
>>>> -- 
>>>> 1.8.3.1
>>>>
>>>> _______________________________________________
>>>> Openembedded-devel mailing list
>>>> Openembedded-devel@lists.openembedded.org
>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>>
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


