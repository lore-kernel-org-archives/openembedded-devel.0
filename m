Return-Path: <adam.yh.lee@gmail.com>
Received: from mail-yw0-f175.google.com (mail-yw0-f175.google.com
	[209.85.161.175])
	by mail.openembedded.org (Postfix) with ESMTP id 8108B78AAD
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Mar 2018 20:28:04 +0000 (UTC)
Received: by mail-yw0-f175.google.com with SMTP id u84so7416590ywg.9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Mar 2018 12:28:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=SkhgOXmRPsxTu7d2bteRIY58X4VVHsZoqjWEzgz1b/c=;
	b=JBmycggruRAh3ugIJR9KvceWhUKJPYw0WcwvrMVuwkbEZIAone2iFIm62B/nCeAQvd
	VexJt897rOmlMkMBwFaegDFVyJs90yP6838vEiWl3gp1ZP5Ndhs+w7OYIQ3kgObpBmg2
	Wi8IAQEggf/CL8eBRK0Bipm+3A7rcnu6BoJxry17/gMntp+rHjSWPnxcUoe6J1OLNaE+
	5sdhcLrRo3Hnol9Q9/JoAtkqIcxI5Yzk3e8OtIM9W41kzWFvD0YElolSfp1mGyBBVRFz
	JH7sG2LDoaN6c9ODVOkC5ZPmqkX9io7YCNe5a6YfUW+itPxDal/O862er6+KYP7Ls4EQ
	VFXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=SkhgOXmRPsxTu7d2bteRIY58X4VVHsZoqjWEzgz1b/c=;
	b=F3wH1pSmYvJtwI5JtD1b+4/s4nzM9AJl0jn7V3+ZTQjkKR65Ac4pR8SdklNJvkTauW
	VK0Ioz6DX5tgjvvqK0bTtH2iadGek/EQH8edp8NXOJ+jmIUEH6Uph8zGeC4zt89Zlx34
	J98iqhuz5EY831W0vnYNelj8ekxVWLqJiH1+b5wyRpFfqxQ5oWgk39qMpAfu1aQUF47f
	RHCUE9nEwC7ZloJSKhxTzf5otzlt7XU97YP9LOH6jyaJnLPp1eU8cLXoID0cuPF5NtBi
	hLlc4IweyJl52bfGz8CtlooxEUlLGwdZq+17M7pF/1GNneYHQ2a7tDLyMlmiZ/J/MwN9
	nnJw==
X-Gm-Message-State: AElRT7GxLIB3EQ12Je5iWuw84R1lOPEk2KH3RLEoVwT/PCTX1g6yaCAQ
	ZBC50dQF4Welr0vUp1D03AdeWr4JQXv2KgkLP2g=
X-Google-Smtp-Source: AG47ELtsUEH61/vFDhT9pn3XqqOKFI24ZIn6XXYByHPlckzzJ25pc7gxvGjieWbCazQQyQYor6aGMQtZcgWqI6WVaIk=
X-Received: by 10.129.73.80 with SMTP id w77mr13275019ywa.421.1520368085125;
	Tue, 06 Mar 2018 12:28:05 -0800 (PST)
MIME-Version: 1.0
References: <CAFeBWL6QUQZR-+YyMta6Nfu0qiDnCYoWqRQqRphgLnMQn2KF7w@mail.gmail.com>
In-Reply-To: <CAFeBWL6QUQZR-+YyMta6Nfu0qiDnCYoWqRQqRphgLnMQn2KF7w@mail.gmail.com>
From: Adam Lee <adam.yh.lee@gmail.com>
Date: Tue, 06 Mar 2018 20:27:54 +0000
Message-ID: <CAFeBWL4Zg_sS-AHbWMYc6GW16W7m0cgENE9iZUJ0nzwuBxzdDw@mail.gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-qt5] Has anyone been able to run minimal-qml (or any Wayland) example?
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
X-List-Received-Date: Tue, 06 Mar 2018 20:28:04 -0000
Content-Type: text/plain; charset="UTF-8"

Perhaps QT Wayland Compositor needs to be backed by a backend that supports
underlying graphics driver.
Such thing exists for i.Mx6 Vivante [1], but not for AM57xx EVM.

[1] http://blog.qt.io/blog/2015/11/17/embedded-linux-news-in-qt-5-6/

On Tue, Mar 6, 2018 at 12:23 PM Adam Lee <adam.yh.lee@gmail.com> wrote:

> I'd like to try out a Wayland example [1]. It can be found in
> "/usr/share/qt5/examples/wayland".
> Unfortunately I have not been able to run it on Rocko with AM57xx EVM from
> TI.
> Has anyone successfully ran this example application at all..? I just want
> to be sure that there is a working example somewhere out there.
>
> [1] https://doc.qt.io/qt-5.10/qtwaylandcompositor-examples.html
>

