Received: from mail-qc0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SFWqH-00036v-0J
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Apr 2012 22:30:09 +0200
Received: by qcso7 with SMTP id o7so421868qcs.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Apr 2012 13:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=TD3AYScMAOV04/84dNu7sSRdLzuKgZjkvSJI9Z9w8Co=;
	b=SlWQFHApCWFC2qPDYA7IgtNrEY2Ct5NnvdMaRFQHhklm/+frwBPFT0bs9I28un5VgR
	W2Vu8ef0m4ZcbYWI613+mdAYN9G+kMzFor5QaoWloTKB4NwbYcfPxkkC4movd7w9llTj
	1Zx2ze0nA2qhs+ta49hLsEadRucSJB7kIqhl23kL/ffTtOwpxWRqIZgmXd5T/URoHg71
	cZ/a25x7A0jhtbO9NwvwYn8I/SmS+GKJpnmm+YsncwZ7dFXdF/wuOaGOIHB1zjxKOxEe
	4hSHB12GyCnUfSt5FXrTHP8FWGdhdko19pp63ULE2XhjUO5zjlMqiHoxo7I+sR5O6Xn1
	XYTw==
Received: by 10.229.136.17 with SMTP id p17mr7350749qct.151.1333570857834;
	Wed, 04 Apr 2012 13:20:57 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.79.79 with HTTP; Wed, 4 Apr 2012 13:20:37 -0700 (PDT)
In-Reply-To: <20120404190944.GB30445@denix.org>
References: <20120404091720.4b743c5b@eb-e6520> <jli1uf$7nt$1@dough.gmane.org>
	<CABcZANngH2BSmSdBPkaPyJcG1RFuKLxc9DnJWhe7_b9xcSGjxA@mail.gmail.com>
	<20120404190944.GB30445@denix.org>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 4 Apr 2012 13:20:37 -0700
X-Google-Sender-Auth: 34D_ELE5iO0116UJdHYlhmoB8r0
Message-ID: <CABcZANn7-uctk72r+7cCg-H8H80yXfmk78==PX-KFzgorNpeng@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: build meta-oe without systemd
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
X-List-Received-Date: Wed, 04 Apr 2012 20:30:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 4, 2012 at 12:09 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> On Wed, Apr 04, 2012 at 11:59:38AM -0700, Chris Larson wrote:
>> On Wed, Apr 4, 2012 at 10:55 AM, Koen Kooi <koen@dominion.thruhere.net> =
wrote:
>> > -----BEGIN PGP SIGNED MESSAGE-----
>> > Hash: SHA1
>> >
>> > Op 04-04-12 00:17, Eric B??nard schreef:
>> >> Hi,
>> >>
>> >> would that make sense to support systemd as a DISTRO_FEATURES ? That
>> >> would make builds using older udev (< 174) possible with meta-oe as t=
his
>> >> actually fails because of systemd.
>> >
>> > We talked about this during the yocto bsp summit this week and I'm wor=
king
>> > on a patchset to send as RFC later this month (post 1.2 release):
>> >
>> > commit b98d45b1bc2d9cf9ba41629240e6c21f19ddceff
>> > Author: Koen Kooi <koen@dominion.thruhere.net>
>> > Date: =C2=A0 Tue Apr 3 14:13:59 2012 -0700
>> >
>> > =C2=A0 =C2=A0meta-systemd: move over systemd from meta-oe
>> >
>> > =C2=A0 =C2=A0Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>> >
>> > commit 59c57bd73d1f157dfada233df889852fdb4a692f
>> > Author: Koen Kooi <koen@dominion.thruhere.net>
>> > Date: =C2=A0 Tue Apr 3 14:12:42 2012 -0700
>> >
>> > =C2=A0 =C2=A0meta-systemd: create layer
>> >
>> > =C2=A0 =C2=A0Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>>
>>
>> Woot! We can stop using BBMASK to exclude bbappends from meta-oe when
>> this happens :)
>
> You should have been at the BSP Summit, especially as it was hosted at
> Mentor. :) That was one of the important decisions made, but this topic
> in particular was being discussed for a while... So, I second your Woot! =
:)

Yeah, I wanted to make it, but unfortunately wasn't able to. Will
probably be there next time around.
--=20
Christopher Larson


