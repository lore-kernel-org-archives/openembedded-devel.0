Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f45.google.com (mail-yh0-f45.google.com
	[209.85.213.45])
	by mail.openembedded.org (Postfix) with ESMTP id 9C0836A9D4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Oct 2014 19:53:35 +0000 (UTC)
Received: by mail-yh0-f45.google.com with SMTP id b6so5501477yha.18
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Oct 2014 12:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=ynkFMbMAC+7ceMgxWWrKc5tkXpTdJAnT5b1gmmOBrTo=;
	b=mLKQgtAUXVyT1v4sYU++g5BDRYdbho8pbnS9xHv0ZTeMIi6eaUSU4lUMdLroL1VBnK
	FEVGuz8d4I/TqcrDhJLLx+QvLLJR7IFYFTDG94MqJgXxtyX6BpNwWsBJPcteo9FC8Jxg
	gsCLymjziGiYP7IAlDSJ3YDwkkiSHEdzCEpKOJbFGRjrKp9GGmEzcAfrY/EJX3K8DMWm
	ekWCxk4ZyWaR4jgwLim1bBqWwiPOMZuPZi3ixbHrEMTKBPAvMhkVmfrGZAq2qweSTKUi
	w+0tNOvrxrdAa3asRo8RBwPouG/CCgofN/yPG9A3V1T/9ndUIEd8Y/J1yMcz9qHjFh26
	iy7g==
MIME-Version: 1.0
X-Received: by 10.236.231.161 with SMTP id l31mr4478779yhq.104.1413316416658; 
	Tue, 14 Oct 2014 12:53:36 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.172.8 with HTTP; Tue, 14 Oct 2014 12:53:36 -0700 (PDT)
In-Reply-To: <1413199970-17377-1-git-send-email-dv@pseudoterminal.org>
References: <1413199970-17377-1-git-send-email-dv@pseudoterminal.org>
Date: Tue, 14 Oct 2014 16:53:36 -0300
X-Google-Sender-Auth: zwYl1_7FJN0fdYsvVq4ECpEuLvw
Message-ID: <CAP9ODKqBbpinBrcFSWkqTBSH_525NDizbGcRgmQdrC_zRvh9ZA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-browser][PATCH] chromium: Upgrade to version 38.0.2125.101
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
X-List-Received-Date: Tue, 14 Oct 2014 19:53:36 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Oct 13, 2014 at 8:32 AM, Carlos Rafael Giani
<dv@pseudoterminal.org> wrote:
> * Starting with this version, several cross compilation specific parts in
> the GYP files need to be disabled with both additional flags and an extra
> patch. Chromium 38 now includes clang specifics, which are enabled by
> default. Additional flags (-Dhost_clang=0 -Dclang=0) disable these.
> Furthermore, the GYP files now include default values for CC and CXX
> (https://codereview.chromium.org/414343003/patch/40001/50001), which
> could not be overridden with environment variables. A patch removes this.
>
> * ozone-wayland's Milestone-Harvest branch is the one to use for
> Chromium 38. It includes a patch that collides with another one that is
> already present in the chromium/ directly. Consequently, this other patch
> is now only used for X11 builds.
>
> * Only 00*.patch patch files from ozone-wayland are used, since
> the 10*.patch files cannot be applied cleanly and easily (and are not
> actually required for builds with this recipe, since another patch already
> takes care of the X11 linker flags removal).
>
> Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>

I applied this to master.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

