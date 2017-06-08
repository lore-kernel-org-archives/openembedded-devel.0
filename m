Return-Path: <martin.jansa@gmail.com>
Received: from mail-yb0-f169.google.com (mail-yb0-f169.google.com
	[209.85.213.169])
	by mail.openembedded.org (Postfix) with ESMTP id 7F7C478295
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Jun 2017 19:50:19 +0000 (UTC)
Received: by mail-yb0-f169.google.com with SMTP id o9so11776083yba.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Jun 2017 12:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=f2go74LhcZy6+TwDtecV2g9TxRyDRLV2h9ykDq9NUOI=;
	b=Ax0qPKSP6bIXCEG2zZ0ojSuRda5PawL4qUZP6sZjIGKE0XOXRNHrTznq1+6PlzS6ZB
	aZe53R0ZCxvMSTejBipHIXGBkmcC6YLVailzq7M7YTHXoS/wdrGt+c08iOcVqN99K2Dm
	rwqBhAx+JYMR0sRHjDs17MnzKiKnp2zWqT266SxdZNoX1Lm2Mn+0uYuwfbW0TUU1ASlp
	/KI/2Vuaquq+rjs248iTfjPAdwqeO7AWZfCxAFW4aoA4bMjN7tHe1VyXChXhLH2w8sHK
	V3PlQc15oOkG98LTycUVe22XlcRQm2MrEJ5YaZv65scyllRFuJc78ikU2SZt/yK2zCoQ
	LYng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=f2go74LhcZy6+TwDtecV2g9TxRyDRLV2h9ykDq9NUOI=;
	b=pU5W/PTsV2jBCZu15zVP99RQuH6pjv0nHCB+T3beNK5yUaWpw7DrCNc5+NxHZFXOIx
	tFDLpg2kgsJ+Gz9cKWb8+5P4HU0XEKchqNy0XpE+GaobJmaE9aJKRaSb/Zna27Be4rmT
	6+JTHxW8q1/mZRbHuj3USm2tqcs/jIb+UX9k3wvkJ+nV60rFzoWfOvJQRSocCEo3GuW1
	rnIhy87wnW+A4myL/x1mOEqL4KNpLiNKRnt7Xhf1bhufq/nt3O2x/WnyF3hGuHu/oLxx
	oq9ZhAhIYD+kB6fhMm6Luigk4rAkNnxEYjkvOVpBQaqw5Q4WdD2NzXNlgHbaHW+ER7Lq
	1W2w==
X-Gm-Message-State: AODbwcDp+ttF/zmuSQeEMx3uEDJCLkcx2AURpl12doEn1acBPDxEBTsA
	OTmpoG3tcWliflHbVAp3WHtPw6Fp6A==
X-Received: by 10.37.164.199 with SMTP id g65mr11779431ybi.147.1496951420517; 
	Thu, 08 Jun 2017 12:50:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.181.204 with HTTP; Thu, 8 Jun 2017 12:50:20 -0700 (PDT)
In-Reply-To: <CA+chaQe9JFMTrZ8HcOPyVqj7VDvg4N_8VKGRf3X3vDuwC37f8w@mail.gmail.com>
References: <1496925018-5300-1-git-send-email-samuli.piippo@qt.io>
	<91dc3ff5-ad3a-ff4c-163a-4b82bb721422@gmail.com>
	<CA+chaQe9JFMTrZ8HcOPyVqj7VDvg4N_8VKGRf3X3vDuwC37f8w@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 8 Jun 2017 21:50:20 +0200
Message-ID: <CA+chaQe=8hRDdymjoqn0wRo03XUF0cTdvNiLQTUuvqzLsL2Q2w@mail.gmail.com>
To: Samuli Piippo <samuli.piippo@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH v3] Upgrade to Qt 5.9.0
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
X-List-Received-Date: Thu, 08 Jun 2017 19:50:19 -0000
Content-Type: text/plain; charset="UTF-8"

Still passes incorrect -m32 when building host tools on 64bit when the
target is 32bit e.g. qemux86

http://errors.yoctoproject.org/Errors/Details/144181/

On Thu, Jun 8, 2017 at 2:53 PM, Martin Jansa <martin.jansa@gmail.com> wrote:

> Thanks, will include v3 in next build.
>
> Full report with v2 included:
> http://lists.openembedded.org/pipermail/openembedded-devel/
> 2017-June/113073.html
>
> There is another issue in qtwebview, which should have the same
> restriction as qtwebengine otherwise for qemuarm it causes:
>
>     * ERROR: Nothing PROVIDES 'qtwebengine' (but /home/jenkins/oe/world/shr-core/meta-qt5/recipes-qt/qt5/qtwebview_git.bb DEPENDS on or otherwise requires it)
>     * ERROR: qtwebengine was skipped: incompatible with machine qemuarm (not in COMPATIBLE_MACHINE)
>     * ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
>
>
>
> On Thu, Jun 8, 2017 at 2:47 PM, Samuli Piippo <samuli.piippo@gmail.com>
> wrote:
>
>> Patch updated to fix build issues with qtlocation and qtremoteobjects
>>
>> On 08.06.2017 15:30, Samuli Piippo wrote:
>>
>>> * adapt QtWebEngine recipe to use GN instead of GYP
>>> * add QtRemoteObjects and QtWebView as a new Qt modules
>>> * update available QtBase configure arguments
>>> * remove obsolete patches
>>> * patch all .pc files to remove build paths
>>> * include generated QML cache files in packages
>>> * the patch "configure paths for target qmake properly" could not
>>>    be applied anymore and support must be done differently
>>>
>>> * QtWebEngine now requires gcc-multilib to be installed
>>>    on the host system
>>>
>>> Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
>>> ---
>>>
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>
>

