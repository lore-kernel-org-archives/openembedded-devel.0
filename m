Received: from [74.125.92.144] (helo=qw-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1MwJO3-0006d4-0D
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Oct 2009 19:36:18 +0200
Received: by qw-out-1920.google.com with SMTP id 4so2503635qwk.36
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Oct 2009 10:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=NAYkJYgBpI/7jIkzCCtgkURtMi8QdMwrkZbBPjjRr9k=;
	b=OTQyPS0AzAPGofRWsbLNUB2tMhzJR5JltkNOvRBqE1kbOpWiHLcyGWo6MaqzKosHBr
	BmjCKLRkszE3mNVVc8+mbiL/XESmZ5ESXxDaoALpKwVJxL7zgL0up/6h+863x0FpAsvA
	O2pCivaXCiYVl/aSL8smZ7t2qGDj0XHApBmSI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=QT6sDTisZMOxV/cbM56IuwRqNWOG1nJiI5kBDI+aQBA2dN94dQs72PeVOythE+uT3G
	kaHihmLbZ54CZGN8Y7ClhjvcNR4p2jcMGk3zs5DCVDNeXxoUlmTrw3Cm7MTb6zDsjkKo
	0yQI4G8FXz0ufxraoGE0r9354xY9px1LNTKUk=
MIME-Version: 1.0
Received: by 10.229.69.93 with SMTP id y29mr1745868qci.53.1255109725345; Fri, 
	09 Oct 2009 10:35:25 -0700 (PDT)
In-Reply-To: <200910091103.37284.holger+oe@freyther.de>
References: <1255043385-5606-1-git-send-email-raj.khem@gmail.com>
	<200910091103.37284.holger+oe@freyther.de>
Date: Fri, 9 Oct 2009 10:35:25 -0700
Message-ID: <19c1b8a90910091035r4c0c339bj5500883bced31123@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Holger Hans Peter Freyther <holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 74.125.92.144
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] conf: Decosmetize TARGET_OS
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
X-List-Received-Date: Fri, 09 Oct 2009 17:36:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 9, 2009 at 2:03 AM, Holger Hans Peter Freyther
<holger+oe@freyther.de> wrote:
> On Friday 09 October 2009 01:09:45 Khem Raj wrote:
>> * This patch reverts the cosmetic change which used linux-gnu instead of
>> =C2=A0linux
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Tested-by: Holger Freyther <zecke@selfish.org>
>
> This makes bitbake meta-toolchain-qte at least start to compile again. On=
ce
> you put your changes in a branch I can do test builds and fixes for MIPS.
>

I have built console-image with it on armeabi mipsel and
powerpc-gnuspe targets with minimal distro
I am testing angstrom on armeabi atm.

> regards
> =C2=A0 =C2=A0 =C2=A0 =C2=A0holger
>


