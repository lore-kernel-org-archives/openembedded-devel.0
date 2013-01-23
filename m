Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Txxzx-0005O7-Fy
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Jan 2013 11:56:18 +0100
Received: from mail-gh0-f199.google.com ([209.85.160.199])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 23 Jan 2013 02:40:32 -0800
Received: by mail-gh0-f199.google.com with SMTP id r16so10080777ghr.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Jan 2013 02:40:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=rL0LGJ5oBj99REfqBOxqO2GBJSPUOMQFgxEADQgXPkw=;
	b=UYlAoIvcUzUOnZUBFVg37iqa2QRXGBHJIqd75Ci4yBUlnBg74C25As189sfEk72fYN
	KTKyYYyfz90qnx3gNP3nOoAkHXCqFwPFT2+oNS7MAJUB8t0trEfckgjUaYQlNNOShdou
	yMoxiO21/XfGjs4zSpTBOnw09Nt7EdljoJniXgdgn9F3PiftWZrM+wwNX0YUqYFbPqjc
	SP2QIXUA5PNyxF1rAzokRXbXppgiFeAYQZ6R4jKarNJA31rez84/WPAfVuoeSa0RUwhw
	lbpmLV4EFf/8Mf9MXiCOyHDxy7NGZz3cZLytnCOpkbdVKj0YorEMCZzrxlVwXfL/MrYr
	SMQQ==
X-Received: by 10.52.66.71 with SMTP id d7mr595184vdt.121.1358937631788;
	Wed, 23 Jan 2013 02:40:31 -0800 (PST)
X-Received: by 10.52.66.71 with SMTP id d7mr595178vdt.121.1358937631675; Wed,
	23 Jan 2013 02:40:31 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.152.232 with HTTP; Wed, 23 Jan 2013 02:40:11 -0800 (PST)
In-Reply-To: <CALbNGRTpOzUnNrOMH9AsTnG320z88iT1pmz2qrj0GBkyrkgLYw@mail.gmail.com>
References: <CALbNGRTpOzUnNrOMH9AsTnG320z88iT1pmz2qrj0GBkyrkgLYw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 23 Jan 2013 10:40:11 +0000
Message-ID: <CAJTo0LayN8m-GCitEb4GU5DSwGzcNfhf0nhQinvY=bWKNiM-LA@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
X-Gm-Message-State: ALoCoQmOYnCdMxOCBzEt3Cc4tak+G5J16MCN5H6YoZXO2yPBhcvIYQQTwgO2/uo0gU+fBxVEsdzSKUR7NJSEJ7jrpNmp8wy5ZIwn+hGr2t/Vd4Ltf5tV8EEyHrddXnZHzXn0LCAD5iUgFW4eDHw0B6no/P1MyPGwUccHwfMyHWnZqBQNQ9hT5X+LYXla90QrLMasytgKND6I
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] future of meta-systemd
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
X-List-Received-Date: Wed, 23 Jan 2013 10:56:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 23 January 2013 00:46, Andreas M=C3=BCller <schnitzeltony@googlemail.com=
> wrote:
> Major difference is that we now get a distro feature for init system
> (for systemd part kind of D=C3=A9j=C3=A0-vu for me..). As I see it, we sh=
ould
> now merge all appends back into the layers, align some configurations
> depending on systemd and remove meta-systemd.
>
> If this is correct: Is anybody out there willing to or already working on=
 this?
> If not: What is the suggested layout?

I do intend on merging all of the changes that should land in oe-core.
 Help is much appreciated once systemd.bbclass lands.

Ross


