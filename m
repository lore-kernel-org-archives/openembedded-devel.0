Return-Path: <jacob.kroon@gmail.com>
Received: from mail-la0-f42.google.com (mail-la0-f42.google.com
	[209.85.215.42])
	by mail.openembedded.org (Postfix) with ESMTP id 129A26EB1A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Feb 2014 21:56:45 +0000 (UTC)
Received: by mail-la0-f42.google.com with SMTP id hr17so1011545lab.15
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Feb 2014 13:56:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=y5a4B8FuN6Y5hrGw5BMJSaqSwJ1DJCqYAJn/OUeflBY=;
	b=esCP0/Tq7szFsqY4ByuubhDfwQ8a5oKhGD0An/BOJOV6+NJ5R2v+jHb34+8YV8fq1b
	0MlyBOD2RfacnQg+trhxkJcUlW5aa9ZVibO97zxWDsnqGoehwVNhUt8ibARtdFLVlpML
	Q/b/iSxiwy2K7QYs/9pODn2VvN5iE9uBgqeY6nIPrjCkxhWuer53L6Z1nxflNPfC2h58
	2U2Oa7H9XNhCrLr89HUw5yCs6fIt1F/tU2RLO5gTeDBbDLtVV5aFdnrCXMg0FjWZke6G
	Re2yDrwsdxglhKi9aChx4RFKS8bhabDPi6kdpTcRyUrr0Eyh5uVNsOXqXk5koLZdCUJA
	3Uag==
MIME-Version: 1.0
X-Received: by 10.112.142.40 with SMTP id rt8mr5280487lbb.52.1393019805815;
	Fri, 21 Feb 2014 13:56:45 -0800 (PST)
Received: by 10.112.53.35 with HTTP; Fri, 21 Feb 2014 13:56:45 -0800 (PST)
In-Reply-To: <CAP9ODKpsHoUaqB+uqu9vTx7YA8aNgOxtMFrJuHM4r8OonFo7JQ@mail.gmail.com>
References: <1392411754-10608-1-git-send-email-otavio@ossystems.com.br>
	<1392411754-10608-2-git-send-email-otavio@ossystems.com.br>
	<20140217173620.GP22890@denix.org>
	<CAP9ODKpgFR1uHe97v4zUBThoZfk1wRVdFAq=zzXFy8HNWdqVfA@mail.gmail.com>
	<CAPbeDCkHsJcqFVDuHP64CWr3+aEz8vypnu2ZcqvrcL-4C27OzQ@mail.gmail.com>
	<CAP9ODKpsHoUaqB+uqu9vTx7YA8aNgOxtMFrJuHM4r8OonFo7JQ@mail.gmail.com>
Date: Fri, 21 Feb 2014 22:56:45 +0100
Message-ID: <CAPbeDCmbnZgkHSbUvz6iXSozUOCTmy7ntjnzoQz3uY9uVCZMbQ@mail.gmail.com>
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
X-List-Received-Date: Fri, 21 Feb 2014 21:56:46 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Feb 21, 2014 at 10:46 PM, Otavio Salvador
<otavio@ossystems.com.br>wrote:

> Hello Jacob,
>
> On Fri, Feb 21, 2014 at 6:31 PM, Jacob Kroon <jacob.kroon@gmail.com>
> wrote:
> > On Mon, Feb 17, 2014 at 6:45 PM, Otavio Salvador <
> otavio@ossystems.com.br>wrote:
> >
> >> On Mon, Feb 17, 2014 at 2:36 PM, Denys Dmytriyenko <denis@denix.org>
> >> wrote:
> >> > On Fri, Feb 14, 2014 at 07:02:34PM -0200, Otavio Salvador wrote:
> >> >> Fixes:
> >> >>
> >> >> ERROR: QA Issue: nativesdk-qtbase: Files/directories were installed
> but
> >> not shipped
> >> >>   /opt/oel/13.0+snapshot/sysroots/i686-oelsdk-linux/usr/lib
> >> >>   /opt/oel/13.0+snapshot/sysroots/i686-oelsdk-linux/usr/include
> >> >>   /opt/oel/13.0+snapshot/sysroots/i686-oelsdk-linux/usr/share
> >> >>
> >> /opt/oel/13.0+snapshot/sysroots/i686-oelsdk-linux/usr/lib/libQt5Test.so
> >> >>
> >>
> /opt/oel/13.0+snapshot/sysroots/i686-oelsdk-linux/usr/lib/libQt5Network.so
> >> >>   ...
> >> >>
> >> >> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> >> >
> >> > Acked-by: Denys Dmytriyenko <denys@ti.com>
> >>
> >> I applied it and found it broke the build afterwards. I fixed this one
> >> (will send the patch in some minutes) but this uncovered another issue
> >> I am working on now.
> >>
> >> I may be wrong, but I think
> >
> > 7d8f8d6b5a00af7a212cce41350f4e1c5989aabd
> > or
> > 8da5017712a7ddcb8488e095b9aa03b0273f23e9
> >
> > screws up the package name for nativesdk-qtbase-tools. On my system now,
> no
> > nativesdk-qtbase-tools ipk is created, instead the "moc" program is
> placed
> > in nativesdk-libqt5core5 ipk.
> >
> > Adding
> >
> > DEBIAN_NOAUTONAME_${PN}-tools = "1"
> >
> > in nativesdk-qtbase.inc restores the created ipk package name to
> > "nativesdk-qtbase-tools".
>
> Indeed; are you going to send a patch for it or want me to handle this?
>
>
Sure, I can send a patch, I just wasn't sure wether this fix was correct or
not.

  -- Jacob

