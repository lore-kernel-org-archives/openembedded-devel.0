Return-Path: <frieder.schrempf@exceet.de>
Received: from smtp.exceet.ch (smtp.exceet.ch [77.245.33.226])
	by mail.openembedded.org (Postfix) with ESMTP id E955C608B7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 07:18:29 +0000 (UTC)
Received: from [172.17.11.62] (80.149.173.67) by smtp.exceet.ch (172.24.58.3)
	with Microsoft SMTP Server (TLS) id 14.3.210.2;
	Mon, 20 Feb 2017 08:18:27 +0100
To: Martin Jansa <martin.jansa@gmail.com>
References: <CA+chaQd_O8+rQ10gRJqgXZt9zYdR7CowTKXD3trYPn-hXNZEhg@mail.gmail.com>
	<1487257558-3384-1-git-send-email-frieder.schrempf@exceet.de>
	<20170217201030.GB3276@jama>
From: Frieder Schrempf <frieder.schrempf@exceet.de>
Message-ID: <f4f19ad0-4861-24af-d5bc-eff2c54d384a@exceet.de>
Date: Mon, 20 Feb 2017 08:18:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <20170217201030.GB3276@jama>
X-Originating-IP: [80.149.173.67]
X-TM-AS-Product-Ver: SMEX-11.0.0.4255-8.100.1062-22896.005
X-TM-AS-Result: No--7.968000-5.000000-31
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-qt5][PATCH] qtbase-native: nativesdk-qtbase: remove patch that breaks mkspec setting for SDK
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
X-List-Received-Date: Mon, 20 Feb 2017 07:18:31 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 17.02.2017 21:10, Martin Jansa wrote:
> On Thu, Feb 16, 2017 at 04:05:58PM +0100, Frieder Schrempf wrote:
>> The patch 0008-configure-paths-for-target-qmake-properly.patch seems
>> to be intended for the target, not for native/nativesdk, as it breaks
>> the mkspec setting (sets linux-g++ instead of linux-oe-g++) by default.
>>
>> This issue is also described here:
>> https://github.com/graugans/meta-udoo/issues/20#issuecomment-261241783
>
> On which branch was this tested?
>
> It doesn't apply for master:
>
> OE @ ~/meta-qt5 $ pwam 137257
> 2017-02-17 21:07:37 URL:https://patchwork.openembedded.org/patch/137257/mbox/ [2388] -> "pw-am-137257.patch" [1]
> Applying: qtbase-native: nativesdk-qtbase: remove patch that breaks mkspec setting for SDK
> error: patch failed: recipes-qt/qt5/nativesdk-qtbase_git.bb:33
> error: recipes-qt/qt5/nativesdk-qtbase_git.bb: patch does not apply
> error: patch failed: recipes-qt/qt5/qtbase-native_git.bb:28
> error: recipes-qt/qt5/qtbase-native_git.bb: patch does not apply
> Patch failed at 0001 qtbase-native: nativesdk-qtbase: remove patch that breaks mkspec setting for SDK
> The copy of the patch that failed is found in: .git/rebase-apply/patch
> When you have resolved this problem, run "git am --continue".
> If you prefer to skip this patch, run "git am --skip" instead.
> To restore the original branch and stop patching, run "git am --abort".
>
> I've applied it manually for master, but next time please send patches rebased and tested on recent master.

Sorry, it was based on morty. I will remember to rebase and test on 
master next time.
>
>> Signed-off-by: Frieder Schrempf <frieder.schrempf@exceet.de>
>> ---
>>  recipes-qt/qt5/nativesdk-qtbase_git.bb | 1 -
>>  recipes-qt/qt5/qtbase-native_git.bb    | 1 -
>>  2 files changed, 2 deletions(-)
>>
>> diff --git a/recipes-qt/qt5/nativesdk-qtbase_git.bb b/recipes-qt/qt5/nativesdk-qtbase_git.bb
>> index 47e204b..e64c30e 100644
>> --- a/recipes-qt/qt5/nativesdk-qtbase_git.bb
>> +++ b/recipes-qt/qt5/nativesdk-qtbase_git.bb
>> @@ -33,7 +33,6 @@ SRC_URI += "\
>>      file://0005-configure-bump-path-length-from-256-to-512-character.patch \
>>      file://0006-QOpenGLPaintDevice-sub-area-support.patch \
>>      file://0007-linux-oe-g-Invert-conditional-for-defining-QT_SOCKLE.patch \
>> -    file://0008-configure-paths-for-target-qmake-properly.patch \
>>      file://0009-Reorder-EGL-libraries-from-pkgconfig-and-defaults.patch \
>>      file://0010-Pretend-Qt5-wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.patch \
>>  "
>> diff --git a/recipes-qt/qt5/qtbase-native_git.bb b/recipes-qt/qt5/qtbase-native_git.bb
>> index ec4a9b6..c6a847a 100644
>> --- a/recipes-qt/qt5/qtbase-native_git.bb
>> +++ b/recipes-qt/qt5/qtbase-native_git.bb
>> @@ -28,7 +28,6 @@ SRC_URI += "\
>>      file://0005-configure-bump-path-length-from-256-to-512-character.patch \
>>      file://0006-QOpenGLPaintDevice-sub-area-support.patch \
>>      file://0007-linux-oe-g-Invert-conditional-for-defining-QT_SOCKLE.patch \
>> -    file://0008-configure-paths-for-target-qmake-properly.patch \
>>      file://0009-Reorder-EGL-libraries-from-pkgconfig-and-defaults.patch \
>>      file://0010-Pretend-Qt5-wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.patch \
>>  "
>> --
>> 2.7.4
>>
>

