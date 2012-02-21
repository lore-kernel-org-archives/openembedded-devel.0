Received: from mail-qw0-f54.google.com ([209.85.216.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1Rzy2S-0002mW-30
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Feb 2012 23:18:24 +0100
Received: by qaea17 with SMTP id a17so8613987qae.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Feb 2012 14:10:04 -0800 (PST)
Received-SPF: pass (google.com: domain of kergoth@gmail.com designates
	10.229.75.138 as permitted sender) client-ip=10.229.75.138; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of kergoth@gmail.com
	designates 10.229.75.138 as permitted sender)
	smtp.mail=kergoth@gmail.com;
	dkim=pass header.i=kergoth@gmail.com
Received: from mr.google.com ([10.229.75.138])
	by 10.229.75.138 with SMTP id y10mr20822636qcj.110.1329862204386
	(num_hops = 1); Tue, 21 Feb 2012 14:10:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=RQCgAQbb6j+ZP3tBtP2MhprQksqXc3c83kPGoHl/Pfg=;
	b=MwQQS+rWetYJJ7XgfIm3xwBmo1BAYIxMW1YaBbXph6CCFEZDbgfoDX48D79CrgQ6A5
	F7YqjvjpZyovfA2rRV9JwAEI+Ric3GmGhwwxz1MlYv6BQM146U69EJs1BsDAxMmbS9yz
	YcLo4Arz+JASqsqAeW1SdrG8KlRnldK0FXfCc=
Received: by 10.229.75.138 with SMTP id y10mr17629910qcj.110.1329862204278;
	Tue, 21 Feb 2012 14:10:04 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.224.145 with HTTP; Tue, 21 Feb 2012 14:09:44 -0800 (PST)
In-Reply-To: <CAOHjBZtEx8atBFuAji1ba7Lurda4fqG-HTiSOmn8W_w1Yp76jA@mail.gmail.com>
References: <CAOHjBZvHtGh1v0LSUkDA=o9F0cHxD1TZ8CtrOQdzeXy8yZk-Dg@mail.gmail.com>
	<CABcZAN=c1Hi9B5WL96XaDQScypRO4ETF9GtKKdPdZ=Gxqmfq5A@mail.gmail.com>
	<CAOHjBZtEx8atBFuAji1ba7Lurda4fqG-HTiSOmn8W_w1Yp76jA@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 21 Feb 2012 15:09:44 -0700
X-Google-Sender-Auth: ppqUFHS1xaok9xD-vo4vCadSL0c
Message-ID: <CABcZANmqnYRC4Gx+HPwJ8k7Dd7-apMFAuuwRT7aH1dy-Fa2kBg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: CONFIG_SITE usage
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
X-List-Received-Date: Tue, 21 Feb 2012 22:18:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 21, 2012 at 2:15 PM, Giuseppe Condorelli
<giuseppe.condorelli@gmail.com> wrote:
> Il giorno marted=C3=AC 21 febbraio 2012, Chris Larson ha scritto:
>
>> On Tue, Feb 21, 2012 at 3:48 AM, Giuseppe Condorelli
>> <giuseppe.condorelli@gmail.com <javascript:;>> wrote:
>> > I'm in trouble trying to set CONFIG_SITE to allow my build process to
>> load
>> > cache from a given file. I've understood CONFIG_SITE can be set from .=
bb
>> > file, but I'm wondering if it could be set on local.conf or
>> distro/machine
>> > conf file to be inherited by all packages.
>>
>> CONFIG_SITE is automatically set for all autotools recipes. Read
>> siteinfo.bbclass and autotools.bbclass.
>
>
> Yes I know this but I'm wondering how I can overwrite the CONFIG_SITE
> default setting (made by autotools) for all packages in one single shot. =
I
> mean, I think that exporting CONFIG_SITE =3D "my *.site files" on one of =
the
> .conf files I can say to the system to read those instead of the ones set
> as default by autotools.

CONFIG_SITE is set by a class, which means it overrides the config
metadata (e.g. local.conf). You could either set it in the recipes, or
set it in the config metadata using an appropriate override (see
OVERRIDES).
--=20
Christopher Larson


