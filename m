Received: from [209.85.220.172] (helo=mail-fx0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ihar.hrachyshka@gmail.com>) id 1M8X0V-0008KF-Pd
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 May 2009 12:02:13 +0200
Received: by fxm20 with SMTP id 20so3017107fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 May 2009 02:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=DeTnZ7nhAh491c8sh6cydaprOg1172sSDp1g+B5Czsg=;
	b=AsWEwAxh1AGq3hJtdaQ9DmABr5yrTumtxsI3T91Hycgb2LMVatTle3CphfgrrfGntI
	SIepZ6AVmbld0ETyRJiA+oOdsvUfx8y475f9/yK1Xb/YG5Qejfk6dk1Q3cgFRJzhE1IS
	fHNPNOG4Z/NzA7uUAyeleqxU0XVE6XfogpaI8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=IhJfF5Ficm6YHOD4mY9mLjkH1JJrQyCsQ6yhqZXP5ytZaJkP7V9bKnFdE41QxzzHiW
	mXcwseVL7RQ1wV21gN6PC7bHkisXKtOw0eCJGD++GniowhKXMEMXTN+h9SvKq4vwyS6c
	AFtARB2go03kxvXriFXCK9vgcWnrJfw+TYFQg=
MIME-Version: 1.0
Received: by 10.103.167.14 with SMTP id u14mr3545512muo.38.1243245250484; Mon, 
	25 May 2009 02:54:10 -0700 (PDT)
In-Reply-To: <200905251125.45665.marcin@juszkiewicz.com.pl>
References: <1243189985-19060-1-git-send-email-ihar.hrachyshka@gmail.com>
	<1243189985-19060-2-git-send-email-ihar.hrachyshka@gmail.com>
	<200905251125.45665.marcin@juszkiewicz.com.pl>
Date: Mon, 25 May 2009 12:54:10 +0300
Message-ID: <fce2a370905250254p4c51b706q399b14d9b0bb20e5@mail.gmail.com>
From: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 2/2] udev: moved udevadm to the main udev package
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
X-List-Received-Date: Mon, 25 May 2009 10:02:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, May 25, 2009 at 12:25 PM, Marcin Juszkiewicz
<marcin@juszkiewicz.com.pl> wrote:
> Dnia niedziela, 24 maja 2009 o 20:33:05 Ihar Hrachyshka napisa=C5=82(a):
>> The reason for the move is that udevadm binary is executed from udev
>> init.d script.
>
> NACK, NACK, NACK - udevadm is also udevinfo and is used by HAL. Your
> patch will make my mdev images not working properly because I would need
> to install mdev and udev to get HAL working and then find a way to not
> run udev at boot time (even after package upgrades).

I tried to understand your complain (really) but don't get it. What do
you mean when saying "udevadm is also udevinfo and is used by HAL"?
And also please provide your solution for the problem of broken images
with unfuctional udev subsystem.

>
> Regards,
> --
> JID: =C2=A0 =C2=A0 =C2=A0hrw@jabber.org
> Website: =C2=A0http://marcin.juszkiewicz.com.pl/
> LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


