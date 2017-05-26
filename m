Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 340D878229
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 May 2017 00:28:45 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id k15so344006wmh.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 May 2017 17:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=GWH+dUmsQGWWn7htBh407AiU0Mmb5nqg5Bltj9hbV0Y=;
	b=Z+VtMueSmqHhtQtqrIFauL8+2uVqCeMqnslPdgtHxwqQF0DKQUmILcKYRh8zVxcerB
	UJ3gLixY5Q5RaIPOTUHvg7VOhSKgr05QoDntN8NqAeJiwltBGiiTSNVi8qA0YHzkhH8/
	7LaJa0sJWG7PgjWDAQkV0ZJlep8zV2VJp/9gJsVHHv8KBLL99k2/L+egUErJx1pSoiwB
	GEfGi6wFV2qpFW3b/FaDXbjv0QHtfKHy4jzi1DXP2im8wf7TZUW1ncMiAwdQZALJIMMC
	wiySmaJrt5SSRRXYJRX0FPVPmUQ9PkSWqMuCwHIvWBlheGZ4ROFxMp4p9edB3WjY/8Ws
	Uaog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=GWH+dUmsQGWWn7htBh407AiU0Mmb5nqg5Bltj9hbV0Y=;
	b=S+1E80OslArJjjxCMAPLjJburAapsH5Z6T+Ui7AioIGJ66G4EBZI8xi98PVtETdbnL
	Ce9wn2VcGVifhuRH57+kqpRSY9oTB+uTfO5xlGqu3j2tqMZZg9abQf45hzpONrwdDlt1
	SbkmG4Oo5FBr9WlsxS1j3eoWGdBhg1fXBgXvk0EbN19T43ppiGbh63rk3DovfNBPZqVV
	G9aT6nHacrW626V2UGcyj3AUbGmCMhfdouHmAPgt1GdlehIgnwRBg/z0ywZIRrNjRwmZ
	chlkA3XwQX6uODYSJYidarH+p0RmyXj9aMBAdsDASe0+Ro40nllcFpe1RAJXvxeRvubr
	Q2tA==
X-Gm-Message-State: AODbwcCCSmF3fiPKBvBcpg1PmHmkkxOLNyjhyEqcepq+forinlpGkISl
	fgzaa91FJySVjmB4i/k=
X-Received: by 10.28.154.133 with SMTP id c127mr150700wme.42.1495758526875;
	Thu, 25 May 2017 17:28:46 -0700 (PDT)
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com.
	[74.125.82.46]) by smtp.gmail.com with ESMTPSA id
	b93sm12195405wrd.29.2017.05.25.17.28.45
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 25 May 2017 17:28:45 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-wm0-f46.google.com with SMTP id e127so2064794wmg.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 May 2017 17:28:45 -0700 (PDT)
X-Received: by 10.223.163.137 with SMTP id l9mr24491706wrb.128.1495758525523; 
	Thu, 25 May 2017 17:28:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.236.75 with HTTP; Thu, 25 May 2017 17:28:43 -0700 (PDT)
Received: by 10.28.236.75 with HTTP; Thu, 25 May 2017 17:28:43 -0700 (PDT)
In-Reply-To: <a91bb6aa-e8ae-0164-725d-b1a4d1a14224@zonque.org>
References: <a884c6ab-8723-d322-30ec-52a67573ac28@zonque.org>
	<CAP9ODKpZ+45VOfj-OwhHsCxi+ku5ZfQrGJSsAtgMP41UZi_waQ@mail.gmail.com>
	<a91bb6aa-e8ae-0164-725d-b1a4d1a14224@zonque.org>
Date: Thu, 25 May 2017 21:28:43 -0300
X-Gmail-Original-Message-ID: <CAP9ODKpq9x0dzikkp5K9dmL7nj-uTfpNhuGgMpySOGpn+2UjtA@mail.gmail.com>
Message-ID: <CAP9ODKpq9x0dzikkp5K9dmL7nj-uTfpNhuGgMpySOGpn+2UjtA@mail.gmail.com>
To: Daniel Mack <daniel@zonque.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5] Support for v4l cameras in QtWebEngine
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
X-List-Received-Date: Fri, 26 May 2017 00:28:46 -0000
Content-Type: text/plain; charset="UTF-8"

Em 23 de mai de 2017 1:51 AM, "Daniel Mack" <daniel@zonque.org> escreveu:

On 05/23/2017 03:30 AM, Otavio Salvador wrote:
> On Mon, May 22, 2017 at 2:00 PM, Daniel Mack <daniel@zonque.org> wrote:
>> Is anyone aware of any specific requirements or PACKAGECONFIG settings
>> needed to add V4L support to web applications running inside a
>> QtWebEngine widget?
>
> The webrtc support is disabled for embedded-linux profile. I did not
> look further on it yet.

I see, thanks for the pointer! What would be the best way to enable it?
Could we override GYP_CONFIG setting through new PACKAGECONFIG
directives in qtwebengine_git.bb? I'd also like to enable plugins, for
instance.

Then again, where is this embedded_linux.pri profile actually selected
in the Yocto builds?


We didn't finish the changes, but we were patching the source to enable it.

