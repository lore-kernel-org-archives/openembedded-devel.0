Return-Path: <jacob.kroon@gmail.com>
Received: from mail-la0-f51.google.com (mail-la0-f51.google.com
	[209.85.215.51])
	by mail.openembedded.org (Postfix) with ESMTP id 61CD06B89F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Feb 2014 21:31:25 +0000 (UTC)
Received: by mail-la0-f51.google.com with SMTP id c6so2810528lan.10
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Feb 2014 13:31:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=htFvCKXKrJJXwiijcCXbWsKvZz1iH03waAAw8NYr1Fo=;
	b=qLAvpwDrJHddLZ8C1BnniII3lAZjtA+KCd/fGsiAE1WpJsls3uwq26pauElmBmUiI8
	MVOJLdJXenSScQVvohu6ozvv/6IKRvWKSMatIHgs60zzuYOk9uC3tXR+G+AXADjqh9OS
	RfkCm6SGXMt0vnAb7F9ql6+E6R2w0Ybst+iOGK0KJAsPpCdx9kq5+4m4APol09dsvIYy
	+s52oL1JAhvW4t3b+LADtRft6YzfXp0H2pk5NKTRTBPgxhrtmBBx+8VzQQyI4eyFM46/
	R/1mHxwBthkPUXwevoO+Ylg0FgbUzDY49pgnQaQj6nZFnnU/PkILh7Vzk3jaGv+SMnu3
	1eDw==
MIME-Version: 1.0
X-Received: by 10.152.27.193 with SMTP id v1mr5601415lag.4.1393018285553; Fri,
	21 Feb 2014 13:31:25 -0800 (PST)
Received: by 10.112.53.35 with HTTP; Fri, 21 Feb 2014 13:31:25 -0800 (PST)
In-Reply-To: <CAP9ODKpgFR1uHe97v4zUBThoZfk1wRVdFAq=zzXFy8HNWdqVfA@mail.gmail.com>
References: <1392411754-10608-1-git-send-email-otavio@ossystems.com.br>
	<1392411754-10608-2-git-send-email-otavio@ossystems.com.br>
	<20140217173620.GP22890@denix.org>
	<CAP9ODKpgFR1uHe97v4zUBThoZfk1wRVdFAq=zzXFy8HNWdqVfA@mail.gmail.com>
Date: Fri, 21 Feb 2014 22:31:25 +0100
Message-ID: <CAPbeDCkHsJcqFVDuHP64CWr3+aEz8vypnu2ZcqvrcL-4C27OzQ@mail.gmail.com>
From: Jacob Kroon <jacob.kroon@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-qt5][PATCH 2/2] nativesdk-qtbase.inc: Remove unused contents
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
X-List-Received-Date: Fri, 21 Feb 2014 21:31:29 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Feb 17, 2014 at 6:45 PM, Otavio Salvador <otavio@ossystems.com.br>wrote:

> On Mon, Feb 17, 2014 at 2:36 PM, Denys Dmytriyenko <denis@denix.org>
> wrote:
> > On Fri, Feb 14, 2014 at 07:02:34PM -0200, Otavio Salvador wrote:
> >> Fixes:
> >>
> >> ERROR: QA Issue: nativesdk-qtbase: Files/directories were installed but
> not shipped
> >>   /opt/oel/13.0+snapshot/sysroots/i686-oelsdk-linux/usr/lib
> >>   /opt/oel/13.0+snapshot/sysroots/i686-oelsdk-linux/usr/include
> >>   /opt/oel/13.0+snapshot/sysroots/i686-oelsdk-linux/usr/share
> >>
> /opt/oel/13.0+snapshot/sysroots/i686-oelsdk-linux/usr/lib/libQt5Test.so
> >>
> /opt/oel/13.0+snapshot/sysroots/i686-oelsdk-linux/usr/lib/libQt5Network.so
> >>   ...
> >>
> >> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> >
> > Acked-by: Denys Dmytriyenko <denys@ti.com>
>
> I applied it and found it broke the build afterwards. I fixed this one
> (will send the patch in some minutes) but this uncovered another issue
> I am working on now.
>
> I may be wrong, but I think

7d8f8d6b5a00af7a212cce41350f4e1c5989aabd
or
8da5017712a7ddcb8488e095b9aa03b0273f23e9

screws up the package name for nativesdk-qtbase-tools. On my system now, no
nativesdk-qtbase-tools ipk is created, instead the "moc" program is placed
in nativesdk-libqt5core5 ipk.

Adding

DEBIAN_NOAUTONAME_${PN}-tools = "1"

in nativesdk-qtbase.inc restores the created ipk package name to
"nativesdk-qtbase-tools".

  -- Jacob

