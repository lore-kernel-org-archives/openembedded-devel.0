Return-Path: <danismostlikely@gmail.com>
Received: from mail-vk0-f43.google.com (mail-vk0-f43.google.com
	[209.85.213.43])
	by mail.openembedded.org (Postfix) with ESMTP id D4F7B73174
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jul 2016 04:52:07 +0000 (UTC)
Received: by mail-vk0-f43.google.com with SMTP id o63so6362932vkg.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jul 2016 21:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=K7+c3Yt6z7BjUq+XAvkXrjmK6YwdixMof2aJdblznIY=;
	b=yWj8XU7hXUoT5Bvfkt7x7rE252Ef+3KYcNRTFyqWYSAnT4qzGPQzeE/sG+f/FZKhdj
	rvTBe1sAoyb9SnQ5CNbZGbsXpPNB9VGIA9B6/SjZmCcUitCM7ufJhe4OJXbDrwReERh4
	6Ovx79PdMYj3lKB1dX3yoXOd1XhFfL0W/pC5KKzJpDQpXpeuafw58Svst0QSq7A0K0+C
	oXAnIT6l7pIiDsV3920t/wOnhWNPN45IWXaelhT6ZVi+HAMS7/ghyF6uFGeVClxmiQpW
	skpLrGSS6CWlW1UyKAJ0lgmIavhm4VwtYYsavnCdpRrsLEkJ4MDmJzyQSqvTJ5HeiJKp
	sQLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=K7+c3Yt6z7BjUq+XAvkXrjmK6YwdixMof2aJdblznIY=;
	b=dKlCzQL9ahjWJUqEfQoTEPHW8hkqWBhqGbUwRXQLlaZP0vVwB/b0bsiq4mJXbwHMWI
	g0/FXD7+H71Wumq++EyNlxi6u+RB0yKhfxJx+pHfqafsk83iFFedPoGY/uZFqcrsEpf2
	V3m8EK4yc1gWsSA2KF9ze480bhVfpTeZYxnAkZssEwoO1OOJhp1TSdHw1Bb2mPRDl+ZO
	kq5mZssBvWcB995dxxbRmOo8RF/AjWWQ5cMbXXwzB35ix0mbLgdvSeu1ulTvz069fr73
	aLakwNAcXYJveVN/jF+khdkk7V2Z7FI6yHKuFpRSblTWhhS9jZEtv7EWnqLVUAqY/0RO
	C2Ng==
X-Gm-Message-State: ALyK8tIABDetPRME22F2vJ72tQQf4zzTS+onprHym1F0hR9nNCPq3R39rplxHWnC1GTLJHbzFOaC+uJqGQSbcw==
MIME-Version: 1.0
X-Received: by 10.159.54.143 with SMTP id p15mr127944uap.148.1468299127654;
	Mon, 11 Jul 2016 21:52:07 -0700 (PDT)
Received: by 10.103.51.77 with HTTP; Mon, 11 Jul 2016 21:52:07 -0700 (PDT)
Received: by 10.103.51.77 with HTTP; Mon, 11 Jul 2016 21:52:07 -0700 (PDT)
In-Reply-To: <CAP9ODKp7eCBu70Aj0M1dT8qPrJK2gnjKD-iVqL58q7Fy7qPTnA@mail.gmail.com>
References: <fd5cee43db0bd882f662d5cd2f3d0c34@xmsnet.nl>
	<CAP9ODKp7eCBu70Aj0M1dT8qPrJK2gnjKD-iVqL58q7Fy7qPTnA@mail.gmail.com>
Date: Mon, 11 Jul 2016 22:52:07 -0600
Message-ID: <CACS+7ZSfFsqdEc32rdFDE+P=yzKeRauqc1gjUvFrmrnUwOAsdQ@mail.gmail.com>
From: Dan McGregor <danismostlikely@gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: daniel.mcgregor@vecima.com, Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-java] gcc6 support breaks build for gcc < 6
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
X-List-Received-Date: Tue, 12 Jul 2016 04:52:08 -0000
Content-Type: text/plain; charset=UTF-8

On 11 Jul 2016 7:19 a.m., "Otavio Salvador" <
otavio.salvador@ossystems.com.br> wrote:
>
> Hello Dobbe,
>
> (Added Khem and Fabio on Cc)
>
> On Mon, Jul 11, 2016 at 8:37 AM, Winfried <winfried_mb2@xmsnet.nl> wrote:
> > Commit  33ddb28a6428b02ddcc82d1954ecf27cd426fbb5 (openjdk-8: make GCC6
> > happy) adds gcc option -fno-lifetime-dse, which was added in gcc6. This
> > breaks the compilation of openjdk-native on hosts where gcc4 or gcc5 is
the
> > default compiler.
> >
> > If this is intentional, I think the README file should mention that
> > meta-java requires gcc6. Better would be to add the '-fno-lifetime-dse'
> > option only if gcc >= 6 is used for native compilation (if that is
> > possible).
>
> This is a non-desired side effect of the patch. Daniel, could you take
> a look on this?

Yep. I'll take a look in the morning.

>
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

