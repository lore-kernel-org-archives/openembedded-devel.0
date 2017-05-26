Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 7CCFD719BD
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 May 2017 11:07:29 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id g15so3395966wmc.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 May 2017 04:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=k7UKufYnDgQ+2kvmfHNEyvZfwIzO0D8Kfb54lgj81kA=;
	b=Krwqwg7BejNuy/R3Xy7Em82IQ2IQByvYd9deHP05E3oJSlt6646W26Yp9VF2jzJttj
	wY24AeaG/bBnEyLLSsYGMMZAde8WJQJ21neshyJ+5hHAA9Df5AMzuyhSzCTtG5EE6Ocm
	IGma4Jb5OhmmnpHLNprgundv//Uz4hmPQGXN1ltkFPw71CuY7Rma7ifCKnfW0CVPYc2c
	1EJaWccrFcGQO0vfY37GGlvX1TOLw6UB2DvT961jpBXBwlhqHgn8KXTjgLrpLJXQlWIp
	xLy7KWEekjC+zkFs9Qv3cgvrNEmvDb4+jVr3kdQ5FGhQNtP5SusYTPmE+FXyVoAFEdbr
	sPfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=k7UKufYnDgQ+2kvmfHNEyvZfwIzO0D8Kfb54lgj81kA=;
	b=lz9UXa9k0fnVOc370do/I1SZtxZysAJJ16y6HwQBNEdwayZYxRsJdILz8qDZqfO2mQ
	eD/HASRskFLPlOgo5WxEbeYU/C7jfh6hNdb7AIz4dcJCNPe8V0Xgu0+e/NE+FSLCWDxo
	m2ClyCCxThy72HgKmgCXX5XDuOLvhEO6nEkrU72hcH65raUAjurjeKph9H8Vjp4gVbCq
	FIydMUTIoQaGD+Duv5e5mLLQmOVn7AOFMM7xVbORgFty0nh5sHkIkvp4cM7VcYoRT6W+
	1UTuLO4y8id2qlGwebupo9B9sVgmhOW/Tk8RFmS7OePlsFkUo15DOYhrrHRU4orcXZHT
	vV/w==
X-Gm-Message-State: AODbwcBWFkHAjgLgoJ+TYqHIVZY2GTgZS//IION5lXorYNEDKWBCy0Uw
	m50Q9wVv8qEFaKwV/h0=
X-Received: by 10.28.133.78 with SMTP id h75mr14235272wmd.81.1495796850001;
	Fri, 26 May 2017 04:07:30 -0700 (PDT)
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com.
	[74.125.82.44]) by smtp.gmail.com with ESMTPSA id
	x133sm12703060wme.0.2017.05.26.04.07.28
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 26 May 2017 04:07:29 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-wm0-f44.google.com with SMTP id e127so18058159wmg.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 May 2017 04:07:28 -0700 (PDT)
X-Received: by 10.223.145.75 with SMTP id j69mr1166302wrj.23.1495796848764;
	Fri, 26 May 2017 04:07:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.236.75 with HTTP; Fri, 26 May 2017 04:07:27 -0700 (PDT)
Received: by 10.28.236.75 with HTTP; Fri, 26 May 2017 04:07:27 -0700 (PDT)
In-Reply-To: <ae24ce37-b35a-adbd-addc-fd96450366a3@zonque.org>
References: <a884c6ab-8723-d322-30ec-52a67573ac28@zonque.org>
	<CAP9ODKpZ+45VOfj-OwhHsCxi+ku5ZfQrGJSsAtgMP41UZi_waQ@mail.gmail.com>
	<a91bb6aa-e8ae-0164-725d-b1a4d1a14224@zonque.org>
	<CAP9ODKpq9x0dzikkp5K9dmL7nj-uTfpNhuGgMpySOGpn+2UjtA@mail.gmail.com>
	<ae24ce37-b35a-adbd-addc-fd96450366a3@zonque.org>
Date: Fri, 26 May 2017 08:07:27 -0300
X-Gmail-Original-Message-ID: <CAP9ODKqFGnokwZ4nZFfY6SmUEVjcV6t6hdrn520DkHS+o-75Gw@mail.gmail.com>
Message-ID: <CAP9ODKqFGnokwZ4nZFfY6SmUEVjcV6t6hdrn520DkHS+o-75Gw@mail.gmail.com>
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
X-List-Received-Date: Fri, 26 May 2017 11:07:30 -0000
Content-Type: text/plain; charset="UTF-8"

Em 26 de mai de 2017 2:47 AM, "Daniel Mack" <daniel@zonque.org> escreveu:

On 05/26/2017 02:28 AM, Otavio Salvador wrote:
> Em 23 de mai de 2017 1:51 AM, "Daniel Mack" <daniel@zonque.org
> <mailto:daniel@zonque.org>> escreveu:
>
>     On 05/23/2017 03:30 AM, Otavio Salvador wrote:
>     > On Mon, May 22, 2017 at 2:00 PM, Daniel Mack <daniel@zonque.org
>     <mailto:daniel@zonque.org>> wrote:
>     >> Is anyone aware of any specific requirements or PACKAGECONFIG
>     settings
>     >> needed to add V4L support to web applications running inside a
>     >> QtWebEngine widget?
>     >
>     > The webrtc support is disabled for embedded-linux profile. I did not
>     > look further on it yet.
>
>     I see, thanks for the pointer! What would be the best way to enable
it?
>     Could we override GYP_CONFIG setting through new PACKAGECONFIG
>     directives in qtwebengine_git.bb <http://qtwebengine_git.bb>? I'd
>     also like to enable plugins, for
>     instance.
>
>     Then again, where is this embedded_linux.pri profile actually selected
>     in the Yocto builds?
>
>
> We didn't finish the changes, but we were patching the source to enable
it.

Okay, just to make sure I understand correctly: you have some sort of
sed-like logic somewhere in your recipes that patches 'enable_webrtc=1'
into embedded_linux.pri before building?


No, we did a patch file for it. It is not working yet but we got moved to
something else and this has been in hold since then.

