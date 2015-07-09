Return-Path: <dev@codyps.com>
Received: from mail-ig0-f177.google.com (mail-ig0-f177.google.com
	[209.85.213.177])
	by mail.openembedded.org (Postfix) with ESMTP id B263E73223
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Jul 2015 16:12:28 +0000 (UTC)
Received: by iggp10 with SMTP id p10so17350573igg.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Jul 2015 09:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=codyps.com; s=google;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=GhgHm41/uXyV1tXKEFh5BIS6KChUtWxfb2HVtAYeaqo=;
	b=df6GwMuZF2JI0WczUDfW4AdgJaH5o8ZCW22EPllWoEDYaSzozwP2/45jBKVVpv/j89
	Wfqf/DqOKJ8rpfgYPm10tIg7JKO5gb7L2eeWiF3bx9ps1WE46wD7W8nBYUQfvQCAfkeY
	SIsmvvyGkVEf9HCTOSM94A93c6A8x8+61PZC0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=GhgHm41/uXyV1tXKEFh5BIS6KChUtWxfb2HVtAYeaqo=;
	b=So/F5UEg27XmEF70/pKumF7yDEgZ3PXmt5Sh6RUQXD4YkRP3g+d+Pa3QuVJIfOXo5p
	9Aa2Fqx5AgYgF33DiCugvATPstxTAWlxrklHbakBMG9HAU4GIIGbmd9opyR/veF5LTtd
	n5/YbVMsAlqSEoIov0g+NkjptAmAvrMJs0iWIKaFWOwX3z4pFYUAXrBPRJcwIIXuRJos
	hVx8v/dPAYSw9/xVf8W/gMiiSzTKTnGNots0GqxTr2TefN9U3ttmykRrLEYPVl+hSXuu
	JaWefG6MqZgPIjEPeEPv+7sGQfP9IBrZ0W+n83x0qkNMJK5DBLtTZa3IV74e9FkxfsVs
	6XuA==
X-Gm-Message-State: ALoCoQl89t2EDDTTSx1VOZw3bJjiKXvEha+hw5IxiRegOTd7DUwBnlGlSshppcE9bE9xCT09dbDL
MIME-Version: 1.0
X-Received: by 10.50.176.164 with SMTP id cj4mr824415igc.55.1436458348460;
	Thu, 09 Jul 2015 09:12:28 -0700 (PDT)
Received: by 10.36.197.195 with HTTP; Thu, 9 Jul 2015 09:12:28 -0700 (PDT)
X-Originating-IP: [96.237.165.28]
In-Reply-To: <1436458007-5741-1-git-send-email-dev@codyps.com>
References: <1436458007-5741-1-git-send-email-dev@codyps.com>
Date: Thu, 9 Jul 2015 12:12:28 -0400
Message-ID: <CAPoQQ-316zap+mbhkhjWsHiYxWC-ahYW-=fvqOCwsTBj45_wEw@mail.gmail.com>
From: Cody P Schafer <dev@codyps.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-qt5][PATCH] qttools: fix cmake usage of linguist tools
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
X-List-Received-Date: Thu, 09 Jul 2015 16:12:28 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jul 9, 2015 at 12:06 PM, Cody P Schafer <dev@codyps.com> wrote:
> Without this, Qt5LinguistTools/Qt5LinguistToolsConfig.cmake would
> attempt to locate lrelease and lupdate under prefix, even while we were
> cross-compiling and prefix points at the native system's root dirs.
>
> Signed-off-by: Cody P Schafer <dev@codyps.com>
> ---
>  recipes-qt/qt5/qttools-native_git.bb               |  5 +++-
>  ...ols-cmake-allow-overriding-the-location-f.patch | 30 ++++++++++++++++++++++
>  recipes-qt/qt5/qttools_git.bb                      |  1 +
>  3 files changed, 35 insertions(+), 1 deletion(-)
>  create mode 100644 recipes-qt/qt5/qttools/0004-linguist-tools-cmake-allow-overriding-the-location-f.patch

On second thought, I'm not quite sure this is the right solution.

It appears the core of the issue is that cmake_qt5 is pulling in the
Qt5LinguistTools cmake from the target sysroot, when it should really
be using the native sysroot.

Does anyone have pointers on the "right" way to handle cmake files and
cross compilation?

