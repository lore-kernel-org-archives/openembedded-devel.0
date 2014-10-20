Return-Path: <net147@gmail.com>
Received: from mail-qc0-f176.google.com (mail-qc0-f176.google.com
	[209.85.216.176])
	by mail.openembedded.org (Postfix) with ESMTP id 86A5065C85
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Oct 2014 01:37:21 +0000 (UTC)
Received: by mail-qc0-f176.google.com with SMTP id r5so2953464qcx.7
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Oct 2014 18:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=yXB8FaLEsZqSVIp2smeF6qOMDZx2zWVpKlChuY/3ihg=;
	b=q/aAbBs8z8YJOMTR0z80zqCqQb8fIFZ5H8/L8n9RkQNc9hADCzZKpkWfHIxWfR1FQX
	einm+MjixiUQGF8W6EPHizH3XmfHXhznOmAZs5u7eWRva/vNUZPG+R2tReE0WRmXWIKP
	rl4G7G5QtYLKyoX2Ef5P7nFwfJ+JUKoov0tp+4PaAoO6gpzJrjPQeEc0J7IVpCBn9Af5
	rpLj5ljylDD1JLBZpSX1utBbjNvpzN8vvmVtx6DCUmhgGdB0FeZ25e4Byn/hbbqoxilB
	vH7bHchbs9VfNGHt6g0LqC2aMEHL3Wd5iwT1ezPyhsEVFA3rC6QFlZIZSyYhtfw8ilfd
	33tg==
MIME-Version: 1.0
X-Received: by 10.224.87.138 with SMTP id w10mr6834845qal.95.1413769041866;
	Sun, 19 Oct 2014 18:37:21 -0700 (PDT)
Received: by 10.96.4.133 with HTTP; Sun, 19 Oct 2014 18:37:21 -0700 (PDT)
In-Reply-To: <20141018111721.GH2437@jama>
References: <1413434645-13943-1-git-send-email-net147@gmail.com>
	<20141018090624.GC2437@jama> <20141018111721.GH2437@jama>
Date: Mon, 20 Oct 2014 12:37:21 +1100
Message-ID: <CANwerB3D1ehK9e_FxYjnNmJZR47_Ae5fpNgjqx3Fcub4_8BC=g@mail.gmail.com>
From: Jonathan Liu <net147@gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Mon, 20 Oct 2014 01:37:24 -0000
Content-Type: text/plain; charset=UTF-8

On 18 October 2014 22:17, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Sat, Oct 18, 2014 at 11:06:24AM +0200, Martin Jansa wrote:
>> On Thu, Oct 16, 2014 at 03:44:05PM +1100, Jonathan Liu wrote:
>> > Signed-off-by: Jonathan Liu <net147@gmail.com>
>> > ---
>> >  ...ix-ARM-NEON-detection-for-mfpu-neon-vfpv4.patch | 30 +++++++++++++++++++
>> >  ...QMAKE_CC-when-extracting-C-compiler-flags.patch | 34 ++++++++++++++++++++++
>> >  recipes-qt/qt5/qtwebengine_5.3.2+git.bb            |  2 ++
>> >  recipes-qt/qt5/qtwebengine_git.bb                  |  2 ++
>> >  4 files changed, 68 insertions(+)
>> >  create mode 100644 recipes-qt/qt5/qtwebengine/0001-Fix-ARM-NEON-detection-for-mfpu-neon-vfpv4.patch
>> >  create mode 100644 recipes-qt/qt5/qtwebengine/0002-Include-QMAKE_CC-when-extracting-C-compiler-flags.patch
>>
>> This seems to break qemuarm build:
>>
>> | No external chromium sources were found, falling back to /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/qtwebengine/5.3.2-r0/git/sr
>> c/3rdparty/chromium
>> | Using extra options found in /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/qtwebengine/5.3.2-r0/git/src/core/qmake_extras.gypi
>> | Using extra options found in /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/qtwebengine/5.3.2-r0/git/src/core/qtwebengine_extras.gy
>> pi
>> | Updating projects from gyp files...
>> | gyp: name 'arm_tune' is not defined while evaluating condition 'arm_tune!=""' in /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/qtw
>> ebengine/5.3.2-r0/git/src/core/core.gyp
>> | Project ERROR: -- running gyp_qtwebengine failed --
>> | WARNING: exit code 3 from a shell command.
>> | ERROR: Function failed: do_configure (log file is located at /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/qtwebengine/5.3.2-r0/te
>> mp/log.do_configure.30039)
>> NOTE: recipe qtwebengine-5.3.2-r0: task do_configure: Failed
>
> Probably fixed in
>
> commit 1cbb91b4a06d6e6626c5345d5a9d7d0fbe9e1bbb
> Author: Andras Becsi <andras.becsi@digia.com>
> Date:   Thu Sep 18 18:22:37 2014 +0200
>
>     Set arm_tune to empty string if mtune flag is not set by toolchain
>
> which needs to be backported to qtwebengine_5.3.2+git.bb
>
> Please re-test and re-send, I'm upgrading _git recipes to 5.4-beta in
> the mean time so the backport won't be needed in qtwebengine_git.bb.

Backport of the arm_tune patch looks good to me.

Signed-off-by: Jonathan Liu <net147@gmail.com>

Does it resolve the qemuarm build failure for you?

Regards,
Jonathan

