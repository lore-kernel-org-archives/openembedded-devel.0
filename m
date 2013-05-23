Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vb0-f51.google.com (mail-vb0-f51.google.com
	[209.85.212.51])
	by mail.openembedded.org (Postfix) with ESMTP id 359D26086B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 May 2013 12:10:34 +0000 (UTC)
Received: by mail-vb0-f51.google.com with SMTP id x16so2067457vbf.38
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 May 2013 05:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=hyeYVpd4arb2wj/CqnHotif1l8nPCzPYpPI/juXE4Is=;
	b=MEBkbd/v7blPd38YYCSvrKFtNwf93F8mPoW4UJ370Bipkh9DjJAIdrzjSGfbsr/SZP
	G4AVI7+NkHnco6acPwYC+QJYdgEGPCiUa7FzZ7z37ZiRbUfXF1tabHV+R+Rd+S1jnh9y
	9cy386vH7Xw1rvdqLyoAOjnk6JxyvbNwJ/lVHtZWYTLsLjuq8ssyPW17dyUiQtY4qXHh
	4/mZUCVedvOHboavsnQn7/3xBbAN5bVpEYxCc4tg4jtQk2B5S/ryVz1w++hsld1yZqRn
	Pj6Cixp53/hJE13aPEXfFzZhDsPb1axH5bmFqB1Pytnxplo9WAAEN0XZaOgfciy2RmEJ
	VQlA==
MIME-Version: 1.0
X-Received: by 10.220.191.129 with SMTP id dm1mr5009716vcb.54.1369311035066;
	Thu, 23 May 2013 05:10:35 -0700 (PDT)
Received: by 10.52.18.177 with HTTP; Thu, 23 May 2013 05:10:34 -0700 (PDT)
In-Reply-To: <CALbNGRRp0pW3qZiU+WoDJ52MnqTJg+1SpmzfurucVb1QCRivgw@mail.gmail.com>
References: <CA+YB3rYf0Tt181v+zAqCwjKk74uP88Zoaht_+FMuS7ee2tJRfQ@mail.gmail.com>
	<CALbNGRSV7KK5hPddSiVTRborW6_PZfYstDFfu4M2oRJ5QwtV_Q@mail.gmail.com>
	<CAJTo0Lb-d-ZOYc+WxaONDXy+vwbsEJKG8SsnQ0LDP7og5Sm9SQ@mail.gmail.com>
	<CALbNGRRp0pW3qZiU+WoDJ52MnqTJg+1SpmzfurucVb1QCRivgw@mail.gmail.com>
Date: Thu, 23 May 2013 14:10:34 +0200
Message-ID: <CALbNGRQsK1cqzikHYpdtkCoPh23Cize33cSRJK-5JtNXnEJJvw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [OE-core] OE TSC Minutes 7 May 2013
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
X-List-Received-Date: Thu, 23 May 2013 12:10:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, May 23, 2013 at 2:02 PM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> On Wed, May 22, 2013 at 12:31 PM, Burton, Ross <ross.burton@intel.com> wr=
ote:
>>> * Are there plans to update gtk3 to 3.8.x to have wayland support?
>>
>> Yes, another 1.5 feature I own.  I have most of the pieces around now.
>>  If anyone has a ARM or PPC board to immediate hand, then doing a
>> configure of at-spi2-core and at-spi2-gtk on the devices to get the
>> right alignment values (yet more alignment checks in configure.ac)
>> would be incredibly useful.
>>
> I attached configure.log for at-spi2-core (2.8.0) taken on gumstix
> overo (cortex A8).
>
> at-spi2-gtk configure fails for atk >=3D 2.7.90. Are you sure you need
> that because there I did not find some alignment code. If yes let me
> know - then I'll see how to make configure happy.
>
I meant at-spi2-atk - typo copied :)

Andreas

