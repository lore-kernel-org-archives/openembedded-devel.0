Return-Path: <dev@codyps.com>
Received: from mail-ie0-f178.google.com (mail-ie0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id E7258607A4
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Jul 2015 17:44:03 +0000 (UTC)
Received: by iecuq6 with SMTP id uq6so181481554iec.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Jul 2015 10:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=codyps.com; s=google;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=ghvKJK6Luqhc3iUk7ncR4qEEY9GJyVw1wQkToTaJF+A=;
	b=SWee6gGgjzsvcxEEtq2JTacZDO8jUEZU+oNbP9iict7mvVeoTz3uOnCORbgLiFu0gx
	sRshfn5w82nh38sfoxDVuQnXEL12QzSA6mXGKegp/8QCwvIPcHw37HEPbIzN2oX4VmD+
	CmGeeCp7I0iFSViyWRaEBhyJAfJhIA+0nedvw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=ghvKJK6Luqhc3iUk7ncR4qEEY9GJyVw1wQkToTaJF+A=;
	b=R4cvVoG98tnHnJWZClzgS05R1gv2K24A/ZRDgJ6T/WyvXAmj8Id2/XnY/My2xKFWwG
	gccsd3yScORhqSkuUeSvcT4wqt2NZlSfaROBQ2QReQ/f4Bq/dGkrjYOq0qGIwrfQlsHG
	htoxGyinP1ZLdweJxVI3doxWhvlItCHjFGtsxqO/b9BUqdRZOWnlaSWRzGLEXDq8AjQP
	Hfp2sT6bZKRz/bmxyHD19cvPBAEBBS6bVi2MNPi7nY/JEcCzFhpJh0kjYDu0qRk+PlHE
	2yfop7E/Fetz82yZo4IRYzcxQUtpgRRJIz3RSZmohb1mn2UHCIGNPFkKaV4vxNne9PPK
	hzHA==
X-Gm-Message-State: ALoCoQmfPvTpfzAnS97fMmCgsZ/q/gCeCoMOtdnR5PbuJrXenmlcjZGZ1MrWGh/eIVOEt0UaumIn
MIME-Version: 1.0
X-Received: by 10.107.3.33 with SMTP id 33mr923002iod.132.1436463843609; Thu,
	09 Jul 2015 10:44:03 -0700 (PDT)
Received: by 10.36.197.195 with HTTP; Thu, 9 Jul 2015 10:44:03 -0700 (PDT)
X-Originating-IP: [96.237.165.28]
In-Reply-To: <CAPoQQ-316zap+mbhkhjWsHiYxWC-ahYW-=fvqOCwsTBj45_wEw@mail.gmail.com>
References: <1436458007-5741-1-git-send-email-dev@codyps.com>
	<CAPoQQ-316zap+mbhkhjWsHiYxWC-ahYW-=fvqOCwsTBj45_wEw@mail.gmail.com>
Date: Thu, 9 Jul 2015 13:44:03 -0400
Message-ID: <CAPoQQ-11YNuHs6ncf0m70M5kqQ81ynpXN7-vc1XSt-C++A4GUQ@mail.gmail.com>
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
X-List-Received-Date: Thu, 09 Jul 2015 17:44:06 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jul 9, 2015 at 12:12 PM, Cody P Schafer <dev@codyps.com> wrote:
> On Thu, Jul 9, 2015 at 12:06 PM, Cody P Schafer <dev@codyps.com> wrote:
>> Without this, Qt5LinguistTools/Qt5LinguistToolsConfig.cmake would
>> attempt to locate lrelease and lupdate under prefix, even while we were
>> cross-compiling and prefix points at the native system's root dirs.
>>
>> Signed-off-by: Cody P Schafer <dev@codyps.com>
>> ---
>>  recipes-qt/qt5/qttools-native_git.bb               |  5 +++-
>>  ...ols-cmake-allow-overriding-the-location-f.patch | 30 ++++++++++++++++++++++
>>  recipes-qt/qt5/qttools_git.bb                      |  1 +
>>  3 files changed, 35 insertions(+), 1 deletion(-)
>>  create mode 100644 recipes-qt/qt5/qttools/0004-linguist-tools-cmake-allow-overriding-the-location-f.patch
>
> On second thought, I'm not quite sure this is the right solution.
>
> It appears the core of the issue is that cmake_qt5 is pulling in the
> Qt5LinguistTools cmake from the target sysroot, when it should really
> be using the native sysroot.
>
> Does anyone have pointers on the "right" way to handle cmake files and
> cross compilation?

After a bit more digging, it appears the issue I'm having is that
sometimes the .cmake in the native sysroot is used, and sometimes the
.cmake in the target (beaglebone, in my case) sysroot is used.

And the beaglebone one doesn't work (probably expected).

And this patch doesn't actually work: my build appears to have only
succeeded due to selecting the functional cmake file.

