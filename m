Received: from mail-vc0-f180.google.com ([209.85.220.180])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1U3wOv-0000Rk-67
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Feb 2013 23:26:34 +0100
Received: by mail-vc0-f180.google.com with SMTP id fo13so2626315vcb.39
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Feb 2013 14:10:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:content-type:content-transfer-encoding;
	bh=Zu80XNXUSPkPU/dKkggoXHcv5fxDeLzEFxm1h9/h1N4=;
	b=jIIH7ySg9ZjoVKsYKEz6jK3KCtfJ6hSsOfMl0gTGWjd7iK6phkO+bK7MQcrmn2fX+f
	rnsuKdlbrkoli5HfDlGDvsV+jzA8pr98/yrH+0PbaSwHPdSlGub0jqA0X5ZeWIGQJJsr
	WjWBMvezzvfWAju+niielm4V25INSfp7I7e70fnMkmJq5KMq6b3fIEDPNJvC1wOd1zf5
	Fk+2OotdrsPqNkTTnwbZonAcoFLd4WTtzPI9mskh5TKaN3FDmd2liLRtwNgGcyPqMwrL
	lFkq2yD4G0zVpVVyke1hwcChiNEBc+lLDkTKQKDxGD5daDV567embBrJcNukw/EFGKOo
	VA6g==
MIME-Version: 1.0
X-Received: by 10.52.26.17 with SMTP id h17mr7606561vdg.101.1360361438486;
	Fri, 08 Feb 2013 14:10:38 -0800 (PST)
Received: by 10.52.95.243 with HTTP; Fri, 8 Feb 2013 14:10:38 -0800 (PST)
In-Reply-To: <kevubg$t7s$1@ger.gmane.org>
References: <1360102723-27891-1-git-send-email-schnitzeltony@googlemail.com>
	<kevubg$t7s$1@ger.gmane.org>
Date: Fri, 8 Feb 2013 23:10:38 +0100
Message-ID: <CALbNGRRcVyv3198HCRvCT-tx2bzxRLFV+XZwFtfe_00YJ_rAmg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe-meta-systemd 0/5] xinput-calibrator rework
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
X-List-Received-Date: Fri, 08 Feb 2013 22:26:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 7, 2013 at 11:06 AM, Koen Kooi <koen@dominion.thruhere.net> wro=
te:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Op 05-02-13 23:18, Andreas M=C3=BCller schreef:
>> * Implemented are 3 modes of invocation: 1. udev/systemd 2.
>> /etc/xdg/autostart 3. manual 1/2 are selected upon DISTRO_FEATURES
>> containing systemd or not
>>
>> * The calibration is stored in
>> /etc/X11/xorg.conf.d/99-<name-of-touchscreen>.conf Herby support for
>> multiple touchsceen devices is prepared.
>>
>> * The script detects upon parameter information how it was called and
>> waits for xserver to come up / detect connected touchsceen devices. If n=
o
>> matching calibration file is found, the xinput_calibrator is called for
>> this device. For systemd invocation the default display is choosen.
>>
>> * For manual invocation and multiple touchscreen devices attached, the
>> operator can select which device to calibrate interactively.
>>
>> * Multiple touchscreen support is prepared - the following open issues
>> are known: * Multiple touchscreens with same device name will get same
>> calibration values. An unique device identifier could not be found yet. =
*
>> systemd startup with multiple device cause multiple instances of
>> xinput_calibrator being started without information for which device the
>> calibration is performed.
>>
>> * Many many tests were performed: 2 automatic invocation types * (1st +
>> 2nd startup) * (0, 1, 2 touchscreens)
>>
>> * Other layers need alignment for pointercal removement. If accepted I
>> can take care (this is NOT an extortion :)
>
> At FOSDEM I found out that the Tias wearing the FOSDEM organization hoodi=
e
> is actually the same Tias who maintains xinput-calibrator. Long story sho=
rt:
> we should send all out patches upstream and he'll have a look at them. He=
 is
> a big fan of the xorg conf snippet that this patchset introduces.
I will append the script/udev-rule/systemd service to the patchset.
With the systemd/udev stuff I would like to wait a bit until our users
have collected experience. After sending this series I saw that on
some images at first start xinput-calibrator is hidden by the greeter
application of dm. Up to now I did not yet find a good way to have
xinput_calibrator 'always on top'.

Andreas


