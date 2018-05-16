Return-Path: <timothy.godfrey@gmail.com>
Received: from mail-wr0-f172.google.com (mail-wr0-f172.google.com
	[209.85.128.172])
	by mail.openembedded.org (Postfix) with ESMTP id 281E9748B0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 May 2018 00:39:21 +0000 (UTC)
Received: by mail-wr0-f172.google.com with SMTP id v5-v6so1914072wrf.9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 May 2018 17:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=IKCEKNcHUQNZtm27c2TvaVhBKFzSxxBAmfAH9oowk3c=;
	b=Sgf6XTiXri4hLRRofe8D/WGzawKUxmy4FHYPGZzb9Ir/uSBB77wYSiRkHiVYEbNPR/
	dz0bMXAX7m1Iunw6wUhabanLkgBscMdiO41KfS8Xpn743LXUAVf9Uy+XKKZsmzY1/B8t
	v7dFlirzM29gPgCLbnMPm0BzLIk+SsfHE4oxZB6py8v/6LYizrGcQ4wHkofvLII0TzE8
	qPnoBeA09Zx41KuhfXjtkfJrwBmlQZNSyxLi5P8+1BH6CB4wHwr2t27ThWeZcasRkFTZ
	2AlJ2Z47L9QFm5sJFDu0j9h63em+ZL97U/MxWCvMLqDg1MyK/Ji16V33XUrRuE1py09c
	cnlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=IKCEKNcHUQNZtm27c2TvaVhBKFzSxxBAmfAH9oowk3c=;
	b=nIDhZ8+xy3fHOSl2Y2dyfr8r/WB9gXAOKu5T/SNyKqxnTgNUNMRTOp1J0E+6EwikW7
	bQ2hp4KeTh4xV7zIHRViEHaHl3Jp0SNq5CD63l002pxcCab3eWQZ6H0Pj5LjZnpTvg2s
	HDV9p/HDZRQZOdrpnf9I8kXfYm8Ai9b6413sbDWROjDc/AJtfoVTssVRnQxonKoKBYCA
	yDKb441J0SU8fB8+yCV0/FHqGCkdXIoNcgQsqUpS+vBTq/hlxh+WezON8FdkM42Y3ka/
	xKoBnduLZLRdwKwU0Kco5KiYFhfuH1aYPjJetBLCxJiR3/PzoFlmvEJSTMJAiF4d/a3Q
	YT0A==
X-Gm-Message-State: ALKqPwdWu3N7dhkdJwA7bKqnjlhQ2dCA1DbtVdekNbw60YwDl0gZXaKT
	mobnHk+GeZ7UFt31s5MW7v1KIai0yY2bkHxtzQ==
X-Google-Smtp-Source: AB8JxZqcALM7j6vG/975DufAW3+VixfHL15+ABGWu5U67LgH9BQAZkeHi6oPS/sRvOu4EEnBE+i31IPMUxil+Bh/Wro=
X-Received: by 2002:adf:93e5:: with SMTP id
	92-v6mr12108673wrp.230.1526431162213; 
	Tue, 15 May 2018 17:39:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.65.6 with HTTP; Tue, 15 May 2018 17:39:21 -0700 (PDT)
From: Tim Godfrey <timothy.godfrey@gmail.com>
Date: Wed, 16 May 2018 10:39:21 +1000
Message-ID: <CAHb6uwdRHfmg+SL7+J+sQR6miuL97AXd=2k_sL+ShE+rzYO+pw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: qtwebkit_git.bb recipe
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
X-List-Received-Date: Wed, 16 May 2018 00:39:22 -0000
Content-Type: text/plain; charset="UTF-8"

Hello!

I am working on building the Qt5 SDK for a target machine, and came across
a problem trying to get qtwebkit to build. The qtwebkit recipe would fail
because of a file/path not found error returned by sed, from lines 75 to 79
of qtwebkit_git.bb:

do_install_append() {
    # Remove paths to workdir, qtwebkit is dead now, so I won't spend extra
time trying to prevent this
    # from some .prl or .prf file like for other modules
    sed -i 's@-Wl,-no-whole-archive -L${B}[^ ]* @ @g'
${D}${libdir}/pkgconfig/Qt5WebKit.pc
 }

When the author says, 'qtwebkit is dead now', are they referring to the API
or a build process? If they are referring to the API, shouldn't qtwebkit be
replaced by qtwebengine in other files like create_qt5.py and the
qt5-creator recipes? One solution to the problem might be to migrate to
qtwebengine as the default. Is this the intended direction?

I am inferring that some users might still prefer to build Qt5 with
qtwebkit instead of qtwebengine, and that the qtwebkit is possibly still
needed. Accordingly, a second solution might be to fix the qtwebkit recipe.
I can remove the error by removing the problematic do_install_append, but
what problem is the sed command solving, and what is its intended function?
Is it still necessary?

All input warmly received, thanks!
Tim

