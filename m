Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ig0-f179.google.com (mail-ig0-f179.google.com
	[209.85.213.179])
	by mail.openembedded.org (Postfix) with ESMTP id 5DC5773BB4
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Jul 2015 13:57:38 +0000 (UTC)
Received: by igh16 with SMTP id 16so52801927igh.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Jul 2015 06:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=WNrEjPKW7bo3Cv5Qvx+wgCbZ0rWY1u8LL72f+FfUP+Y=;
	b=JK2GUVwUmbm96cCTVheLdZr2Qhjmmy/ic/Za5uodR4FFWh8GA1FKxDe/sFeVXQIe+K
	p5sDAHho+m4+Dt8v+1MqLqc98A0v9iLd1M5jMVZtel1OozEkbV5Y/Rm5Nmyxv29GlaVl
	1cyZifAPLMnx/DvH14ogSaLKejZe0LibavIz1ndn/98jQ/34SwMzj7qjsWGN3JtkFrXu
	rX/TAeD8kotVzMll7FwO8lM1ULwfS25+wDUUePZM4NQagSr8W9W9Fzj545twMmUPGeUk
	57/hZ19rqTRzuJD6ElWubiK5Y/VkCb+r/8K6JtD/PkG6py0fsmcpkHM00plBAyE4zbMP
	WbcQ==
MIME-Version: 1.0
X-Received: by 10.43.40.130 with SMTP id tq2mr43841120icb.46.1436277458715;
	Tue, 07 Jul 2015 06:57:38 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.36.218.7 with HTTP; Tue, 7 Jul 2015 06:57:38 -0700 (PDT)
In-Reply-To: <556EA59A.8010007@skidata.com>
References: <556EA59A.8010007@skidata.com>
Date: Tue, 7 Jul 2015 10:57:38 -0300
X-Google-Sender-Auth: khI0Q45oW0UR9rScDgWhBPc-Nxo
Message-ID: <CAP9ODKpB0A9JZbWdS80Dq2bNX1VG5e3PKTpSpCvdvCrwD4965g@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-java][PATCH] openjdk-7: 75b13-2.5.4: fix xawt build
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
X-List-Received-Date: Tue, 07 Jul 2015 13:57:39 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jun 3, 2015 at 3:58 AM, Richard Leitner
<richard.leitner@skidata.com> wrote:
> The icedtea-jdk-nio-use-host-cc.patch disabled the build of xawt.
> Therefore all awt based java application which were run on X11 failed
> starting the GUI with an java.awt.HeadlessException.
>
> This patch enables xawt again by adapting
> icedtea-jdk-nio-use-host-cc.patch.
>
> Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
> ---
> This patch was only tested with yocto-1.6.3 (daisy) on an armv7a
> cortexa9 with vfpv3d16. Please test it on further platforms!
>
> This is my first patch to this mailinglist so hopefully I got everything
> right. If not please give me some feedback on what to improve for the
> next one ;-)
> ---

Sorry for the long time to get to this patch. I would like to ask if
you could run a test in master so we avoid surprises. If you confirm
it works I am fine in commiting it.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

