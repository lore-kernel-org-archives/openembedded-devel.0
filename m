Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P0AGx-0006Ii-7a
	for openembedded-devel@lists.openembedded.org;
	Mon, 27 Sep 2010 11:45:23 +0200
Received: by iwn2 with SMTP id 2so2819547iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Sep 2010 02:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=H+9ImBhV2U8/fBC7KmdVI/WW9yhheMh1CvJIj7CVnh4=;
	b=es1al5ryPUgfY+Bz7ZPQe3Wzg5tBNP+MriS8zBkQEXReDt3II/MD2IfyIlNzlew9ny
	pDojpmrfGkRBl4CncBff5TaiWx0CIjz2XJo9e509xLwvt0BWjH6TBHOgY6o30+YdeF9w
	irBJZBEWtbcCNzp5W80FIhB+fXN86KfOT5n1k=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=V+ZEfWGZSztWUCviEKyKtLhQdb6Lvn+PJHR3pkmULiPkbwsmkHYiYlr3B7rFMFyiqm
	1pRT8XDh1d9qtndgf0EoKGisZwlzelT6v/nxsvDEvMfQQkDKsj3JJy1UPfxW2XYwaSzt
	2BXQoSPfr2i+69xmARBXT10NX0LN7vSdR0XYc=
MIME-Version: 1.0
Received: by 10.231.157.135 with SMTP id b7mr8588267ibx.164.1285580708733;
	Mon, 27 Sep 2010 02:45:08 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Mon, 27 Sep 2010 02:45:08 -0700 (PDT)
In-Reply-To: <4CA063A4.90608@freyther.de>
References: <1285347950-27040-1-git-send-email-fahad_usman@mentor.com>
	<4CA063A4.90608@freyther.de>
Date: Mon, 27 Sep 2010 11:45:08 +0200
Message-ID: <AANLkTinTEHQVFnYoC=h_WZ1or-wvnuC6W6k_5Nm=xmZt@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] qmake-native_1.07a.bb: Converted to new style staging
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 27 Sep 2010 09:45:24 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/9/27 Holger Freyther <holger+oe@freyther.de>:
> On 09/25/2010 01:05 AM, Fahad Usman wrote:
>> * Converted do_stage to do_install.
>> * Added NATIVE_INSTALL_WORKS = "1"
>> * replaced QMAKE_MKSPEC_PATH (which is defined in bitbake.conf) with ${D}${datadir}/qmake as discussed on irc
>> * Bumped PR
>>
>
> Hi,
> is qmake-native still used by something?

Apparently yes:

qt/qt-x11-free-native_3.3.5.bb:DEPENDS = "qmake-native x11-native"
uicmoc/uicmoc3-native_3.3.5.bb:DEPENDS = "qmake-native"

grep also gave me these:

dcop/dcopidl2cpp-native_3.5.8.bb:inherit native qmake qt3e
dcop/dcopidl-native_3.5.8.bb:inherit native qmake qt3e
opie-i18n/opie-lrelease-native.inc:inherit native qmake qt3e
opie-i18n/opie-lupdate-native.inc:inherit native qmake qt3e
sip/sip3-native_3.10.1:inherit qmake native
sip/sip3-native_4.0.1.bb:inherit qmake native

didn't peek into qmake.bbclass to see whether it drags in qmake-native
one way or another.

Frans


