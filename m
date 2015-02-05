Return-Path: <danismostlikely@gmail.com>
Received: from mail-qc0-f174.google.com (mail-qc0-f174.google.com
	[209.85.216.174])
	by mail.openembedded.org (Postfix) with ESMTP id A62D760017
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Feb 2015 16:10:03 +0000 (UTC)
Received: by mail-qc0-f174.google.com with SMTP id s11so7103504qcv.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Feb 2015 08:10:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=c0MySCYh/P8evhN1dOfqwgHY38osa82eqcKdoQLCJYk=;
	b=UruS5zgp+kEg2CqCY6FE03Vm4HiKl1zyPzpGxX1Sy8M3CUme5yrhFcBXPH1aiuFOox
	CCcJrofOvfcWlm7PWCZUVH27VOx7G+KR5QiXo8OqI9hB6MCeH28P+hfRp27YSaZOX8Bo
	d+52XKpMNK/yBrak1+P1891vEuuM8vvEtNxw+AA781J3kua8ERJb/9oVfW+buZMSExut
	sXofXBtg/kt/K079xUNuonEnRt4ntU6qY//2AHKHLn9h20WZqVQsJG5QFTSKj+YWP5wl
	b0jLCayAfP/EcDv2yLor8RChfjFjxsKO62k9kxfFnWkSm/I9sTeYxzL49zcAl7frjCb5
	wbrg==
MIME-Version: 1.0
X-Received: by 10.140.30.7 with SMTP id c7mr9180542qgc.48.1423152605006; Thu,
	05 Feb 2015 08:10:05 -0800 (PST)
Received: by 10.96.30.35 with HTTP; Thu, 5 Feb 2015 08:10:04 -0800 (PST)
In-Reply-To: <CAP71WjxPCVC6BcdmrDUz0HJ36Uw-4P-a4skKEFOZtudE2PWSDg@mail.gmail.com>
References: <1423081763-2905-1-git-send-email-danismostlikely@gmail.com>
	<1423081763-2905-4-git-send-email-danismostlikely@gmail.com>
	<CAP71WjxPCVC6BcdmrDUz0HJ36Uw-4P-a4skKEFOZtudE2PWSDg@mail.gmail.com>
Date: Thu, 5 Feb 2015 10:10:04 -0600
Message-ID: <CACS+7ZQ0xqDt9DoWAdJ94V2xMiMuoQJcCw2ciKJF+r=_zSQAYg@mail.gmail.com>
From: Dan McGregor <danismostlikely@gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 3/5] emacs: Un-blacklist, seems to work fine with new qemu
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
X-List-Received-Date: Thu, 05 Feb 2015 16:10:06 -0000
Content-Type: text/plain; charset=UTF-8

On 5 February 2015 at 07:43, Nicolas Dechesne
<nicolas.dechesne@linaro.org> wrote:
> On Wed, Feb 4, 2015 at 9:29 PM, Dan McGregor <danismostlikely@gmail.com> wrote:
>>
>> I've only tested the build with armv7 and x86, but the build
>> doesn't segfault anymore. The last time this was tested was
>> with qemu 1.5, we're now using 2.1.
>>
>> While here, don't copy stuff from the sysroot into the qemu tree
>> just use the sysroot itself.
>
>
> I tried this patch, and I was able to build and install emacs package,
> on an armv7 board, using master branch as of today. emacs seems to be
> working fine under X11 here, however when I run it from a console
> without X11 (over ssh, or on the serial console), emacs would start,
> but I am not able to use it. keyboard is no working from within the
> application. ctrl+z isn't working as well, so I need to manually kill
> the process.
>
> i know the emacs build process isn't straightforward, and maybe we aim
> to support only emacs + X11 with our recipe.. i am not sure..
>
> have you tried to use emacs without X11?
>

In my testing I explicitly disabled x11 in PACKAGECONFIG. I suspect
there may be something broken in its X11 support, maybe I should
remove x11 from the default PACKAGECONFIG set?

