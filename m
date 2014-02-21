Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f46.google.com (mail-yh0-f46.google.com
	[209.85.213.46])
	by mail.openembedded.org (Postfix) with ESMTP id 392F46EE8A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Feb 2014 21:46:39 +0000 (UTC)
Received: by mail-yh0-f46.google.com with SMTP id v1so3076875yhn.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Feb 2014 13:46:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=CzE61zpgrBMTSrlSRP6HBYwy7FFzBxxoV01pZ6PWeJ4=;
	b=LoAbc9OmD24QMdezUYQAjqZtl0UzZMIPtn4s4BCZpHBZUFXHLRAOE8ezTzqa7f1N5X
	1hsVbqT0QBJieCS6wJ8I1hXWHUHKAvd7vZsxetkbT/e3ev2ppAdlSXvkd7uOTmn5iiB7
	ojZTiG1M0MWirL7qPeHGAdJifZuyvmeNMlyId/hnnoebPLowj7kdX3GfKn67nuG266GF
	JvuYDskxB3kSOzfcYc0UrmPYhPhbeQDlXk7pHk68Ts6fo1B61TsvmlD1xvly0rkmv3qx
	jnpFFITtA6PouvaMrH8KYRMkhpQbeR4uhp+DtHJZ4388iCsZeucqjFXoPB2twqiH73JY
	b2fQ==
MIME-Version: 1.0
X-Received: by 10.236.130.80 with SMTP id j56mr13960745yhi.155.1393019200301; 
	Fri, 21 Feb 2014 13:46:40 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.217.136 with HTTP; Fri, 21 Feb 2014 13:46:40 -0800 (PST)
In-Reply-To: <CAPbeDCkHsJcqFVDuHP64CWr3+aEz8vypnu2ZcqvrcL-4C27OzQ@mail.gmail.com>
References: <1392411754-10608-1-git-send-email-otavio@ossystems.com.br>
	<1392411754-10608-2-git-send-email-otavio@ossystems.com.br>
	<20140217173620.GP22890@denix.org>
	<CAP9ODKpgFR1uHe97v4zUBThoZfk1wRVdFAq=zzXFy8HNWdqVfA@mail.gmail.com>
	<CAPbeDCkHsJcqFVDuHP64CWr3+aEz8vypnu2ZcqvrcL-4C27OzQ@mail.gmail.com>
Date: Fri, 21 Feb 2014 18:46:40 -0300
X-Google-Sender-Auth: fZvgSr90B9vkJ1txAMUMUnPP6no
Message-ID: <CAP9ODKpsHoUaqB+uqu9vTx7YA8aNgOxtMFrJuHM4r8OonFo7JQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Fri, 21 Feb 2014 21:46:42 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello Jacob,

On Fri, Feb 21, 2014 at 6:31 PM, Jacob Kroon <jacob.kroon@gmail.com> wrote:
> On Mon, Feb 17, 2014 at 6:45 PM, Otavio Salvador <otavio@ossystems.com.br>wrote:
>
>> On Mon, Feb 17, 2014 at 2:36 PM, Denys Dmytriyenko <denis@denix.org>
>> wrote:
>> > On Fri, Feb 14, 2014 at 07:02:34PM -0200, Otavio Salvador wrote:
>> >> Fixes:
>> >>
>> >> ERROR: QA Issue: nativesdk-qtbase: Files/directories were installed but
>> not shipped
>> >>   /opt/oel/13.0+snapshot/sysroots/i686-oelsdk-linux/usr/lib
>> >>   /opt/oel/13.0+snapshot/sysroots/i686-oelsdk-linux/usr/include
>> >>   /opt/oel/13.0+snapshot/sysroots/i686-oelsdk-linux/usr/share
>> >>
>> /opt/oel/13.0+snapshot/sysroots/i686-oelsdk-linux/usr/lib/libQt5Test.so
>> >>
>> /opt/oel/13.0+snapshot/sysroots/i686-oelsdk-linux/usr/lib/libQt5Network.so
>> >>   ...
>> >>
>> >> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>> >
>> > Acked-by: Denys Dmytriyenko <denys@ti.com>
>>
>> I applied it and found it broke the build afterwards. I fixed this one
>> (will send the patch in some minutes) but this uncovered another issue
>> I am working on now.
>>
>> I may be wrong, but I think
>
> 7d8f8d6b5a00af7a212cce41350f4e1c5989aabd
> or
> 8da5017712a7ddcb8488e095b9aa03b0273f23e9
>
> screws up the package name for nativesdk-qtbase-tools. On my system now, no
> nativesdk-qtbase-tools ipk is created, instead the "moc" program is placed
> in nativesdk-libqt5core5 ipk.
>
> Adding
>
> DEBIAN_NOAUTONAME_${PN}-tools = "1"
>
> in nativesdk-qtbase.inc restores the created ipk package name to
> "nativesdk-qtbase-tools".

Indeed; are you going to send a patch for it or want me to handle this?

Regards,

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

