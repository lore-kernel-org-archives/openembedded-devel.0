Return-Path: <net147@gmail.com>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id 4118F65CF5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 25 Oct 2014 03:50:13 +0000 (UTC)
Received: by mail-pa0-f46.google.com with SMTP id lf10so584842pab.33
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Oct 2014 20:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type;
	bh=SrGyFk3Vk+rrpdEY03QaeUs4dE2IfwPoVeclLMUOnok=;
	b=ksIrg6WyliWgrogfvwDLbwDJDMcs1xeZ4MPT5PG26FgEsmJTs6XM5RQVLfFgl1+DsO
	lVnwcaIvIpMpM85R46BrzWhxjDOrRQrEUBLuiMKD9XJU5dEUt6uFeahIfYW7QnjO4MIe
	4683aqTPcHMGMNMyk2+nNcb4WyG0tRrKqJm6JnNK0TU9Q/9jAE4iAoMZn7T6nK+DoC0L
	6C/zVF2mDYTXmhJIgRAmRqjWZRqUbBfBXGGeXzntTcCuwNsbpy2tSWBeQhbNaLkpxklY
	RyLEremxakUDIn22aT6CfEmCMoULwh+r8bIt78Pyd0iQ7qftLx1X8KZxD2VEbbKk0QlG
	USuQ==
X-Received: by 10.68.65.7 with SMTP id t7mr8905234pbs.1.1414209014359;
	Fri, 24 Oct 2014 20:50:14 -0700 (PDT)
Received: from [192.168.0.2] (60-242-179-244.static.tpgi.com.au.
	[60.242.179.244])
	by mx.google.com with ESMTPSA id dk5sm5046607pbc.61.2014.10.24.20.50.12
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 24 Oct 2014 20:50:13 -0700 (PDT)
Message-ID: <544B1DEC.80103@gmail.com>
Date: Sat, 25 Oct 2014 14:50:04 +1100
From: Jonathan Liu <net147@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1413434645-13943-1-git-send-email-net147@gmail.com>	<20141018090624.GC2437@jama>
	<20141018111721.GH2437@jama>	<CANwerB3D1ehK9e_FxYjnNmJZR47_Ae5fpNgjqx3Fcub4_8BC=g@mail.gmail.com>
	<20141021093428.GD2455@jama>
In-Reply-To: <20141021093428.GD2455@jama>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-qt5][PATCH] qtwebengine: backport patches to fix ARM build failures
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
X-List-Received-Date: Sat, 25 Oct 2014 03:50:16 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 21/10/2014 8:34 PM, Martin Jansa wrote:
> On Mon, Oct 20, 2014 at 12:37:21PM +1100, Jonathan Liu wrote:
>> On 18 October 2014 22:17, Martin Jansa <martin.jansa@gmail.com> wrote:
>>> On Sat, Oct 18, 2014 at 11:06:24AM +0200, Martin Jansa wrote:
>>>> On Thu, Oct 16, 2014 at 03:44:05PM +1100, Jonathan Liu wrote:
>>>>> Signed-off-by: Jonathan Liu <net147@gmail.com>
>>>>> ---
>>>>>   ...ix-ARM-NEON-detection-for-mfpu-neon-vfpv4.patch | 30 +++++++++++++++++++
>>>>>   ...QMAKE_CC-when-extracting-C-compiler-flags.patch | 34 ++++++++++++++++++++++
>>>>>   recipes-qt/qt5/qtwebengine_5.3.2+git.bb            |  2 ++
>>>>>   recipes-qt/qt5/qtwebengine_git.bb                  |  2 ++
>>>>>   4 files changed, 68 insertions(+)
>>>>>   create mode 100644 recipes-qt/qt5/qtwebengine/0001-Fix-ARM-NEON-detection-for-mfpu-neon-vfpv4.patch
>>>>>   create mode 100644 recipes-qt/qt5/qtwebengine/0002-Include-QMAKE_CC-when-extracting-C-compiler-flags.patch
>>>> This seems to break qemuarm build:
>>>>
>>>> | No external chromium sources were found, falling back to /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/qtwebengine/5.3.2-r0/git/sr
>>>> c/3rdparty/chromium
>>>> | Using extra options found in /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/qtwebengine/5.3.2-r0/git/src/core/qmake_extras.gypi
>>>> | Using extra options found in /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/qtwebengine/5.3.2-r0/git/src/core/qtwebengine_extras.gy
>>>> pi
>>>> | Updating projects from gyp files...
>>>> | gyp: name 'arm_tune' is not defined while evaluating condition 'arm_tune!=""' in /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/qtw
>>>> ebengine/5.3.2-r0/git/src/core/core.gyp
>>>> | Project ERROR: -- running gyp_qtwebengine failed --
>>>> | WARNING: exit code 3 from a shell command.
>>>> | ERROR: Function failed: do_configure (log file is located at /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/qtwebengine/5.3.2-r0/te
>>>> mp/log.do_configure.30039)
>>>> NOTE: recipe qtwebengine-5.3.2-r0: task do_configure: Failed
>>> Probably fixed in
>>>
>>> commit 1cbb91b4a06d6e6626c5345d5a9d7d0fbe9e1bbb
>>> Author: Andras Becsi <andras.becsi@digia.com>
>>> Date:   Thu Sep 18 18:22:37 2014 +0200
>>>
>>>      Set arm_tune to empty string if mtune flag is not set by toolchain
>>>
>>> which needs to be backported to qtwebengine_5.3.2+git.bb
>>>
>>> Please re-test and re-send, I'm upgrading _git recipes to 5.4-beta in
>>> the mean time so the backport won't be needed in qtwebengine_git.bb.
>> Backport of the arm_tune patch looks good to me.
>>
>> Signed-off-by: Jonathan Liu <net147@gmail.com>
>>
>> Does it resolve the qemuarm build failure for you?
> Unfortunately not completely, now it's arm_fpu:
>
> | Updating projects from gyp files...
> | gyp: name 'arm_fpu' is not defined while evaluating condition 'arm_fpu!=""' in /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/qtwebengine/5.3.2-r0/git/src/core/core.gyp
> | Project ERROR: -- running gyp_qtwebengine failed --
> | WARNING: exit code 3 from a shell command.
>
>
>
ARMv5 (qemuarm) doesn't seem to be supported by chromium. I have sent a 
patch whitelisting supported architectures.

Regards,
Jonathan

