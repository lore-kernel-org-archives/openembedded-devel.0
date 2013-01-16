Received: from mail-vc0-f171.google.com ([209.85.220.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TvWWK-0008Jt-5y
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Jan 2013 18:11:36 +0100
Received: by mail-vc0-f171.google.com with SMTP id fk10so74567vcb.16
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Jan 2013 08:56:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:content-type:content-transfer-encoding;
	bh=4saqQ6WdNSBHoSmvYo1PuIX+PY5Lc4pOIESpf9z0lvI=;
	b=jdd5Ej/0zOY7tbdKig+cljb2uX68uHGdolol6JVRHshrCPvKNSU7ptvSh989QQ07Fy
	Pl59mxUqNKdGxT51s2+aHG1UnDUM97EZPK8UwcOdZfI6Bo4i6dmZUYVLyBOy10ClwExY
	gNYqI4rZV45E2vj78gb5DeC/D+/nmgHQzvZLnXuB6YwOAPsVtIAVLUeTWXHQqzYbqMma
	/KSfgh3rFFr8MDYROjXHtd/l9vu6PsaB1X+35f5qjYzDJX8CZEtwWdSlYgA69ZON4YmT
	OtC+NDByuUh62D23l2/kOrH1PiCASNle5TZ/wrk+8xVEkHY2Hn4VaTMYnyRLY1IlmmDP
	/o3Q==
MIME-Version: 1.0
X-Received: by 10.52.70.205 with SMTP id o13mr1703141vdu.75.1358355360938;
	Wed, 16 Jan 2013 08:56:00 -0800 (PST)
Received: by 10.52.95.243 with HTTP; Wed, 16 Jan 2013 08:56:00 -0800 (PST)
In-Reply-To: <CALbNGRS645Gs8Dbb=qHiwxC11LnN5hh404XQ1H9vQ_tQqjzVyA@mail.gmail.com>
References: <1358188976-14581-1-git-send-email-andrei.gherzan@windriver.com>
	<CALbNGRS645Gs8Dbb=qHiwxC11LnN5hh404XQ1H9vQ_tQqjzVyA@mail.gmail.com>
Date: Wed, 16 Jan 2013 17:56:00 +0100
Message-ID: <CALbNGRSMqRuuLUioaMbv9zeBAkVD0haCLy17_bFb5iH1R9WT1w@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][meta-systemd][PATCH 1/4] bluez4: Package systemd service
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
X-List-Received-Date: Wed, 16 Jan 2013 17:11:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 15, 2013 at 12:39 AM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
>> +SYSTEMD_AUTO_ENABLE =3D "disable"
> This is quite interesting: For my first tests I also added the
> 'disable' but I could not get bluez start automatically so I decided
> to start it at boot time. Maybe it is related to that I did not yet
> find a way to setup my bluetooth device automatically. It still needs
>
> hciattach ttyO1 csr
>
> Which service starts blues if not enabled?
>
> Andreas
I finally have an idea how blues service is started automatically. So

SYSTEMD_AUTO_ENABLE =3D "disable"

is the better default. Therefore

Acked-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>


