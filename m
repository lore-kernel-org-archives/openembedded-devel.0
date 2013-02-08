Received: from mail-vc0-f181.google.com ([209.85.220.181])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1U3wPs-0000Y9-9K
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Feb 2013 23:27:33 +0100
Received: by mail-vc0-f181.google.com with SMTP id d16so2645619vcd.26
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Feb 2013 14:11:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:content-type:content-transfer-encoding;
	bh=7VAd0nUZ0BWZ1CH5PXlbtRTof3GP85RPwZaDxNhLdOU=;
	b=QH+nx6EUxLs5G5Ad4y9HEcfSIOlavvDaYSkEDl7fb5KozA5nHsJb0YNYLBhXCahGbN
	NcZh0qucaii8SxRZF7F8x8SrRQBMtEaU7717yjfsu9FjZzJAU0EDAxb1Em08vUNa5+SX
	VWhnFlpPvDKcXrsdEtuj4c0ltXF1nE3qA4XEOCTH7KapU1klStKPL6RpF7CS5j3rVJyW
	ozVhxw9cuAwhxDXFzCRDqLMix/lxj/naOtxi3DLbd3Tz0dUxd4dj2cJOhIuFEikJtV9e
	6y44sP+NEvhumuckXQB1kGS1+e5Ay15YwKVdrT7GUSHDW2eFdM821CA8oYcfKhUi1VS7
	IgIQ==
MIME-Version: 1.0
X-Received: by 10.220.154.148 with SMTP id o20mr8741940vcw.54.1360361497655;
	Fri, 08 Feb 2013 14:11:37 -0800 (PST)
Received: by 10.52.95.243 with HTTP; Fri, 8 Feb 2013 14:11:37 -0800 (PST)
In-Reply-To: <kevu1a$phk$1@ger.gmane.org>
References: <1360102723-27891-1-git-send-email-schnitzeltony@googlemail.com>
	<1360102723-27891-5-git-send-email-schnitzeltony@googlemail.com>
	<kevu1a$phk$1@ger.gmane.org>
Date: Fri, 8 Feb 2013 23:11:37 +0100
Message-ID: <CALbNGRT5K3UTNYqtR3-R9S3bB5Xo7qxLViT7efMQW4_Wh5Wx2Q@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe-meta-systemd 4/5] pointercal-xinput: remove
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
X-List-Received-Date: Fri, 08 Feb 2013 22:27:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 7, 2013 at 11:01 AM, Koen Kooi <koen@dominion.thruhere.net> wro=
te:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Op 05-02-13 23:18, Andreas M=C3=BCller schreef:
>> Calibration values are stored now in /etc/xorg.conf.d/99-<device>.conf.
>> After this is accepted patches to layers appending pointercal-xinput wil=
l
>> be send.
>
> How does this work with board where you can plug in different touchscreen
> (like beaglebone) or difference touchscreen controllers (beagleboard, oli=
mex
> allwinner boards, etc)?
>
Each device gets an conf-file named by the name of the device. An
example file I took from my gumstix:

Section "InputClass"
	Identifier	"calibration"
	MatchProduct	"ADS7846 Touchscreen"
	Option	"Calibration"	"96 3935 3591 98"
	Option	"SwapAxes"	"0"
EndSection

For devices with different name it works fine. I have no solution yet
for connecting multiple touchscreen devices of same device name -
similar to your use-case connecting different touchscreens on same
controller. There a manual recalibration has to be started which now
stores the data persistent (if the operator has the right to write to
/etc/X11/xorg.conf.d).

Andreas


