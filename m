Return-Path: <bounce+4d9b4d.3a5685-openembedded-devel=lists.openembedded.org@asterius.io>
Received: from mail4.static.mailgun.info (mail4.static.mailgun.info
	[104.130.122.4])
	by mail.openembedded.org (Postfix) with ESMTP id 7E7F87723F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Dec 2016 23:24:36 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=asterius.io; q=dns/txt;
	s=mailo; t=1482535477; h=Content-Type: To: Subject: Message-ID: Date:
	From: References: In-Reply-To: MIME-Version: Sender;
	bh=Hu3o5m1AcbQZuTeHIfqAQKXoExK37afPGI4yojq8RAg=;
	b=Ks7hu1TYFNiixZU6s8jDgOgtWF2dPGkAkQZ7bZfIGDQL/W2MPT8A13ym4W+WfPSEm0bJSDGR
	pS4Seu/Pj3hPpAEGLHP1DQ9bxsin0zDiyRcNsZArnVDH62CDY9pnYFOLuSarwvivR4P1KLUQ
	35hZq4cf88T6Vdze9LiuEWRFqNo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=asterius.io; s=mailo;
	q=dns; h=Sender: MIME-Version: In-Reply-To: References: From: Date:
	Message-ID: Subject: To: Content-Type;
	b=Rx53g+UnMY5lllKYgNuFZRUFeRcEiM/5v44dHQZympktwfhRJ9CMlleGRlZuygFjuskNtq
	tt1w7nUoNnh/BDkze8IWmIFvqXHCuUKnexAo0Tx6f9iHB1idPSOlUt3079/luQ0Gp3JYj5fU
	y3OJiHmsoALm+wfz2gY+DXn/eYddk=
Sender: derek@asterius.io
X-Mailgun-Sending-Ip: 104.130.122.4
X-Mailgun-Sid: WyIzN2NkMyIsICJvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyIsICIzYTU2ODUiXQ==
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
	[209.85.223.176])
	by mxa.mailgun.org with ESMTP id 585db235.7fa0d8798330-in06;
	Fri, 23 Dec 2016 23:24:37 -0000 (UTC)
Received: by mail-io0-f176.google.com with SMTP id d9so263519608ioe.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Dec 2016 15:24:36 -0800 (PST)
X-Gm-Message-State: AIkVDXLVIqdGBHl8t1LSE2WnJKdSbnzwFNbBTs/y6CTVj58y5nB+A6wfbAD5vkTJnz05+4kffzTyz0Ics7pilw==
X-Received: by 10.107.131.195 with SMTP id n64mr17980277ioi.161.1482535476663; 
	Fri, 23 Dec 2016 15:24:36 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.191.2 with HTTP; Fri, 23 Dec 2016 15:24:36 -0800 (PST)
In-Reply-To: <CADNbA1rGRKuck_s=uvsntmWTiErEOTEzQc_SebnjVu-ZBevKdQ@mail.gmail.com>
References: <1482421531-29836-1-git-send-email-derek@asterius.io>
	<20161223060645.zxhknpoqi7bkfo43@ad.chargestorm.se>
	<CADNbA1rGRKuck_s=uvsntmWTiErEOTEzQc_SebnjVu-ZBevKdQ@mail.gmail.com>
From: Derek Straka <derek@asterius.io>
Date: Fri, 23 Dec 2016 18:24:36 -0500
X-Gmail-Original-Message-ID: <CADNbA1pF-JAD5jKi9rYFj=Pqf6xECoZSmW-H8-Q1svb_SkUQgQ@mail.gmail.com>
Message-ID: <CADNbA1pF-JAD5jKi9rYFj=Pqf6xECoZSmW-H8-Q1svb_SkUQgQ@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-python][PATCH] python3-wekzeug: update RDEPENDS to pull in http module
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 23 Dec 2016 23:24:37 -0000
Content-Type: text/plain; charset=UTF-8

Created patch to place it in a sane existing package, netclient (
http://lists.openembedded.org/pipermail/openembedded-core/2016-December/130597.html).
If accepted, python3-werkzeug needs to be updated with 'RDEPENDS_${PN} +=
"${PYTHON_PN}-html ${PYTHON_PN}-netclient"'

On Fri, Dec 23, 2016 at 9:16 AM, Derek Straka <derek@asterius.io> wrote:

> Agreed.  It is self-contained.  It looks like it just fell through into
> misc. I can submit a patch tomorrow to oe-core to create a new package.
> Until that gets accepted, depending on misc will be a necessary evil to use
> the full functionality.
>
> -Derek
>
> On Fri, Dec 23, 2016 at 1:06 AM, Anders Darander <anders@chargestorm.se>
> wrote:
>
>> * Derek Straka <derek@asterius.io> [161222 16:46]:
>>
>> > Signed-off-by: Derek Straka <derek@asterius.io>
>> > ---
>> >  meta-python/recipes-devtools/python/python3-werkzeug_0.11.11.bb | 2 ++
>> >  1 file changed, 2 insertions(+)
>>
>> > diff --git a/meta-python/recipes-devtools/python/python3-werkzeug_0.11.
>> 11.bb b/meta-python/recipes-devtools/python/python3-werkzeug_0.11.11.bb
>> > index af2d86a..145a1de 100644
>> > --- a/meta-python/recipes-devtools/python/python3-werkzeug_0.11.11.bb
>> > +++ b/meta-python/recipes-devtools/python/python3-werkzeug_0.11.11.bb
>> > @@ -1,2 +1,4 @@
>> >  inherit pypi setuptools3
>> >  require python-werkzeug.inc
>> > +
>> > +RDEPENDS_${PN} += "${PYTHON_PN}-misc"
>>
>> How much of python3-misc is actually needed? Just running du -sh gave
>> me:
>> 4.2M tmp/work/armv5e-oe-linux-gnueabi/python3/3.5.1-r1.0/packages
>> -split/python3-misc/usr/lib/python3.5/
>>
>> If `http` doesn't require much of the other stuf in python3-misc, could
>> you split out python3-http?
>>
>> Not that I'm using python3-werkzeug, but I've been contemplating it...
>>
>> Cheers,
>> Anders
>>
>> --
>> Anders Darander, Senior System Architect
>> ChargeStorm AB / eStorm AB
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>
>

