Return-Path: <philipjcraig@gmail.com>
Received: from mail-we0-f170.google.com (mail-we0-f170.google.com
	[74.125.82.170])
	by mail.openembedded.org (Postfix) with ESMTP id EFF766969C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Jun 2013 11:12:01 +0000 (UTC)
Received: by mail-we0-f170.google.com with SMTP id w57so5401292wes.15
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Jun 2013 04:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=jT+V/JhcmV3AKDYLxAKSoRk3j5NAcP5XM5tNFheya3o=;
	b=k17MQDWn9KHOCCSVBBOhLL0TEesDVvYKMNrdQC6SoVPuKnpxCgHZ5UbNFw90Dn3n+7
	Q/N93FTTn+IaLTUoAYD2rJ7jntYRWquMmmBTqwaNLrZEhPPqtsGDueefXihbOFahTPcG
	uzoZJYAdT9mTOFDm/UkQai31auP09sDedy9XSfuByhqMO6ABS99DCO3Ztb4y2djOctL9
	fX2ZxXUVIN4uKeh+aJRKsLKaQPRXZ+58LwLWkH0hK2dPSJBoyuIxEv9nFa5HdFU4kGTO
	knzYZzU33DmNJU5NDc0GNTTyDAPxQqV3XfjO7/z9xeVWuXa107YrHIKeIsfXduhq2xzR
	PJ9A==
MIME-Version: 1.0
X-Received: by 10.194.63.46 with SMTP id d14mr5424264wjs.81.1371726722697;
	Thu, 20 Jun 2013 04:12:02 -0700 (PDT)
Received: by 10.180.205.202 with HTTP; Thu, 20 Jun 2013 04:12:02 -0700 (PDT)
In-Reply-To: <137188331.qH2f3OD9K1@luxon>
References: <3389668.90m8Qn9G8H@luxon> <16136190.1I5tgHWYiU@luxon>
	<51B61BBB.1030508@herbrechtsmeier.net> <137188331.qH2f3OD9K1@luxon>
Date: Thu, 20 Jun 2013 21:12:02 +1000
Message-ID: <CAFpsybmYUbbGo4AWp-BonJdkiX5h7TpiK7n9=tfG1bAREfdjig@mail.gmail.com>
From: Philip Craig <philipjcraig@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-qt5] Problems with Qt5 and CMake
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
X-List-Received-Date: Thu, 20 Jun 2013 11:12:02 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 20 June 2013 20:06, Manuel Nickschas <manuel.nickschas@bmw-carit.de> wrote:
> This gave me the idea for an ugly workaround at least; I can overwrite the
> location in my project's CMakeLists.txt after processing
> find_package(Qt5Core). Or I could check if something like qtpaths.cmake
> exists in the source dir and include that conditionally at this point.
>
> To avoid Yocto-specific hacks ending up in the upstream repo, I think the
> best workaround for now would be to have my recipe patch the
> CMakeLists.txt to include a generated file that overwrites the locations.
>
> But this really should be properly fixed in meta-qt5, by modifying the
> relevant *Config.cmake files in such a way that the native tools are used
> when something is built by Bitbake (e.g. by setting some variable), and the
> target tools in case someone compiles manually on the target. We
> shouldn't force developers to have to include hackish workarounds in their
> own recipes, or worse, their upstream code. With the proliferation of Qt5 in
> the embedded space, and the fact that CMake is the de-facto build system
> for Qt-based things these days, it's a problem that will come up quite often
> in the future and deserves a global solution.

I'm having this exact problem trying to get qt-gstreamer to build in
OpenEmbedded.

Do you have a workaround yet that would apply to qt-gstreamer too?

