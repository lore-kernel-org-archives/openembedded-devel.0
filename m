Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id 8B334600B3
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Oct 2015 21:58:28 +0000 (UTC)
Received: by ioii196 with SMTP id i196so2201772ioi.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Oct 2015 14:58:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:content-type;
	bh=s89ykLP/22t7XrVjhkZ+JQBnMONyrk3pizwGnLj21m8=;
	b=ZuAzE6fqOuPlaCnHUE+Unf00518yukQwAoqdsC9eAPdFyAzcglWrfEjJgT3+xdJf2V
	m9eyFt3iqWi67DnjSReswZcc0KQWlrh/+wwsxDp7MXH/rHvCTxh2wxR28La5pBU1xhE/
	0sajp1OmRzMTZ1O19/7nOXp9uxujzCUVFF1Gn6aYWvqFGkaRPSGwX7ipAFB1gqviccWJ
	eLWaaUQru22woydVpyDyyaLwqYfuRbXUc2r2mFrkSqWRhBlGaHDnrBOPXH2iUMLLOKUk
	+E+BLxgnCzqtPaJN09qCGQ1yS9oWc/i3DYDUtEHgzJTh6uL8gsGtcmzKhMMAtqURNKGN
	SQrA==
X-Gm-Message-State: ALoCoQm15yYHFXSYJWyi37DfnJy8rWUFpOUQZiE1+XxdfQQYyUJE+n7XcjTacE6J8Abur0K9gie5
X-Received: by 10.107.12.94 with SMTP id w91mr35186118ioi.33.1444168708100;
	Tue, 06 Oct 2015 14:58:28 -0700 (PDT)
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com.
	[209.85.213.170])
	by smtp.gmail.com with ESMTPSA id 68sm13083083ioz.5.2015.10.06.14.58.25
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 06 Oct 2015 14:58:26 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by igcrk20 with SMTP id rk20so95824971igc.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Oct 2015 14:58:25 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.50.30.233 with SMTP id v9mr6110031igh.5.1444168705707; Tue,
	06 Oct 2015 14:58:25 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Tue, 6 Oct 2015 14:58:25 -0700 (PDT)
In-Reply-To: <1443950022-18541-1-git-send-email-manuel.bachmann@iot.bzh>
References: <1443950022-18541-1-git-send-email-manuel.bachmann@iot.bzh>
Date: Tue, 6 Oct 2015 18:58:25 -0300
Message-ID: <CAP9ODKo0weXR60NYM_SUMDd-jZTxTVyq4ki90V5PDoBNdVihdg@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH][meta-oe] freerdp: get out of "nonworking", fix build, improve
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
X-List-Received-Date: Tue, 06 Oct 2015 21:58:30 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Oct 4, 2015 at 6:13 AM, Manuel Bachmann <manuel.bachmann@iot.bzh> wrote:
> We make the "freerdp" recipe active again, fix the build
> by pulling a more recent version (the "stable" branches are
> buggy and useless), and fix ARM runtime with -fPIC.
>
> We can then :
> - make X11 non-mandatory ;
> - add support for Wayland ("wlfreerdp" client) ;
> - add support for DirectFB ("dfreerdp" client) ;
> - add support for GStreamer 1.0 ;
> - make "heavy" features such as pulseaudio, cups...
> non-mandatory.
>
> We really want to install the "winpr-makecert" tool to have
> TLS, but CMake does not position its RPATH cleanly, so let
> us have a custom patch for that until it gets sorted out.
>
> Signed-off-by: Manuel Bachmann <manuel.bachmann@iot.bzh>

I fully agree with the changes and those are very welcome. However, it
would be good if you could move from nonworking in one patch and do
the changes here in another patch.

Do you mind to rework it?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

