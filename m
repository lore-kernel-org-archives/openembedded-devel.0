Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f51.google.com (mail-yh0-f51.google.com
	[209.85.213.51])
	by mail.openembedded.org (Postfix) with ESMTP id E7E4E6E8A6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Feb 2014 14:58:39 +0000 (UTC)
Received: by mail-yh0-f51.google.com with SMTP id t59so15440214yho.38
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Feb 2014 06:58:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=HNNQfk9Q7+M/pnFBe/zEyAw2b7z6pT8aTBpJQFzP/Dc=;
	b=ne14XW3yzX/Po5lQ+aHIQ6pV4Qt19lMz6iK0HPgccCbOJvfGsxJOJmKSfvrpXABJiQ
	AR/ydS/DjFNYqJRuniddQKttSLHdQjNz6UxG7O7WWv+ZM8aUJeEW4+p1LJKLecfIuWDV
	DOc/Pn2Az9A9NMPbFwagGDCJMjaHetN4aqYndN57NTP+KyaFktGKZKmQIA+Fr4I17Q5O
	wsI1nyN5TfeyyUhHq6pwrpufAGmpmvVOHMuJA0OXvHzhose6FIxa59T6Sg53+sJgmamn
	WLTeHD1OldWSRWI/DmNuBNj2Sb6/WpOEk6M8MpQ32jehwOYnHNJK4OqS439QgmQllQBN
	rzlA==
MIME-Version: 1.0
X-Received: by 10.236.5.174 with SMTP id 34mr24132789yhl.48.1392735520025;
	Tue, 18 Feb 2014 06:58:40 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.217.136 with HTTP; Tue, 18 Feb 2014 06:58:39 -0800 (PST)
In-Reply-To: <1392671102-13391-1-git-send-email-denis@denix.org>
References: <1392671102-13391-1-git-send-email-denis@denix.org>
Date: Tue, 18 Feb 2014 11:58:39 -0300
X-Google-Sender-Auth: m9xo9ftdduJWj_bQTdaZ_BxFQMc
Message-ID: <CAP9ODKoDMk-DCZ54Rky=9pjXBB5eYoMYPPoE7JyxmpmmOgx_gQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: Re: [PATCH] nativesdk-qtbase: do qmake replacement in ${D} instead of ${B}
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
X-List-Received-Date: Tue, 18 Feb 2014 14:58:40 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello Denys,

On Mon, Feb 17, 2014 at 6:05 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> From: Denys Dmytriyenko <denys@ti.com>
>
> This way we don't mangle ${B} and can repeat do_install if necessary. And
> previously it would require running do_compile again to restore the proper
> state of ${B}.
>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>

This seems to not work as expected.

| make[1]: Leaving directory
`.../yocto/build/tmp/work/i686-nativesdk-oelsdk-linux/nativesdk-qtbase/5.2.0-r0/build/src'
| install: cannot stat
`.../yocto/build/tmp/work/i686-nativesdk-oelsdk-linux/nativesdk-qtbase/5.2.0-r0/build/bin/qmake-real':
No such file or directory

This happens when we have a work dir populated. So as do_compile hash
will match we need to bump the PR to ensure a full rebuild.

Another issue:

ERROR: QA Issue: nativesdk-qtbase: Files/directories were installed
but not shipped
  /opt/oel/13.0+snapshot/sysroots/i686-oelsdk-linux/usr/bin/qmake
  /opt/oel/13.0+snapshot/sysroots/i686-oelsdk-linux/usr/bin/.debug
  /opt/oel/13.0+snapshot/sysroots/i686-oelsdk-linux/usr/bin/.debug/qmake

You should install it at OE_QMAKE_PATH_QT_BINS so we can have multiple
Qt toolchains in same SDK.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

