Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-pd0-f181.google.com (mail-pd0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id 32A7771633
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Jun 2015 07:22:34 +0000 (UTC)
Received: by pdcu2 with SMTP id u2so47663888pdc.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Jun 2015 00:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=8ORzzAhq9T66RljgUp96Tjvfcq0lolDnbH4Y4kDlY+c=;
	b=Ssq9rvHApZttb0ktxEnUMEMcCR94NVpr8akGj0Wd+yMs6QewzZYV93nZRf/i5OSVCq
	6SPVeSWCUuYlsFkhj4g4eX0ivKok5++BMP5SUAUCHzeLkNmmKtBDT3/zVP41H1WE1+mu
	Eyh0rocG6OacnBm4ScQbA567nCmSsM5cR53CWVGkGZR69euVixcS5X707IxRdln8RiB5
	NarvlDvhBkJ10nwJv1TyLXxAFE0u0Z0VHqTkpeERsk9jWVbohl1MpV7J0h59VKOCq7VH
	/S8URwO7frYaPlMDuPp6SXya0gNj9UpOF/U44GeXPCBzUdaWONbFi4dG0ytdG+uF1XDQ
	So7Q==
MIME-Version: 1.0
X-Received: by 10.70.47.9 with SMTP id z9mr88933724pdm.69.1435216955506; Thu,
	25 Jun 2015 00:22:35 -0700 (PDT)
Received: by 10.70.44.41 with HTTP; Thu, 25 Jun 2015 00:22:35 -0700 (PDT)
In-Reply-To: <A8FC939F80655644A89BB21CCD3741E87390AF90@G08CNEXMBPEKD02.g08.fujitsu.local>
References: <1435197618-1621-1-git-send-email-lixin.fnst@cn.fujitsu.com>
	<1435197618-1621-2-git-send-email-lixin.fnst@cn.fujitsu.com>
	<CALbNGRQU9+M1aQMWRtW8p02esF8K9COy=LPM6R8=wSZB4xY_dA@mail.gmail.com>
	<A8FC939F80655644A89BB21CCD3741E87390AF66@G08CNEXMBPEKD02.g08.fujitsu.local>
	<CALbNGRR_yo9RC0TTvoK8SjLKowvQm12FD+_xE1r+shm+M2iWKA@mail.gmail.com>
	<A8FC939F80655644A89BB21CCD3741E87390AF90@G08CNEXMBPEKD02.g08.fujitsu.local>
Date: Thu, 25 Jun 2015 09:22:35 +0200
Message-ID: <CALbNGRQUVopNa07ri0XqXGtcYH2JDqjnN64r+-Ljmuq_RQzePA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "Li, Xin" <lixin.fnst@cn.fujitsu.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 1/2] networkmanager: upgrade from 0.9.8.10 to 1.0.2
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
X-List-Received-Date: Thu, 25 Jun 2015 07:22:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 25, 2015 at 9:09 AM, Li, Xin <lixin.fnst@cn.fujitsu.com> wrote:
>
>> -----Original Message-----
>> From: Andreas M=C3=BCller [mailto:schnitzeltony@googlemail.com]
>> Sent: Thursday, June 25, 2015 2:37 PM
>> To: Li, Xin/=E6=9D=8E =E6=AC=A3
>> Cc: openembedded-devel@lists.openembedded.org
>> Subject: Re: [oe] [meta-oe][PATCH 1/2] networkmanager: upgrade from 0.9.=
8.10 to
>> 1.0.2
>>
>> On Thu, Jun 25, 2015 at 8:34 AM, Li, Xin <lixin.fnst@cn.fujitsu.com> wro=
te:
>> >> >
>> >> >  SYSTEMD_SERVICE_${PN} =3D "NetworkManager.service"
>> >> > +SYSTEMD_AUTO_ENABLE =3D "disable"
>> >> What is this for?
>> >>
>> >> Otherwise: Have same her under test for a while and am fine with it.
>> >>
>> > Thanks for your reply.
>> >
>> > After setting "SYSTEMD_AUTO_ENABLE =3D "disable"", the
>> > NetworkManager.service will not Be started when the system starts.
>> > And we did test about this.
>> Yes and how is it started?
>
> The systemd is enabled in our system.
> So, In the process of starting the system, it will check all of the servi=
ce which is enabled and start them .
> For example, if we set NetworkManager.service enable, it will be started =
automatically when the system is starting.
>
People install networkmanager to take care for all types of
connections out of the box. So this default is not what most people
want installing networkmanager so NAK - you can add that in a
bbappend.

Andreas

