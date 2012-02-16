Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Ry0BX-0002op-Mf
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Feb 2012 13:11:39 +0100
Received: by bkwq11 with SMTP id q11so1951733bkw.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Feb 2012 04:03:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=2O7HlANbU+Od0ZpLK95hULk/tRiMVqxYebVBriTwoek=;
	b=uKz2akKwp+tOryTz74ug2jYnbh84TkbE4FJH5I/NjMlXar9tCs70B4kE6DXP1fepk9
	DM37WWyQl3M4AbVhpgWlM/duFUA0Xc/ZjoL9K5jp3BMfnt25V/SlLNQ/z+toKAsLklYl
	geEseiu2s6jEafJdeAx6QpO+gFNIOXxmuPcFU=
MIME-Version: 1.0
Received: by 10.112.54.36 with SMTP id g4mr790781lbp.19.1329393806839; Thu, 16
	Feb 2012 04:03:26 -0800 (PST)
Received: by 10.112.108.164 with HTTP; Thu, 16 Feb 2012 04:03:26 -0800 (PST)
In-Reply-To: <CAP9ODKrFQHjvVRswZ6UjFbAugiJmMFG-w7OYYiCfm8GLxLhMJQ@mail.gmail.com>
References: <1329357796-27398-1-git-send-email-schnitzeltony@googlemail.com>
	<1329357796-27398-23-git-send-email-schnitzeltony@googlemail.com>
	<CAP9ODKoy3RRkOAjkGQXUnMw9EaU2rXasxw3bvWU+UrdhAJL53Q@mail.gmail.com>
	<CALbNGRRvhqQXqECfRD_PBTiK+NpiTrycthsPrU7Nhac4ifsAMQ@mail.gmail.com>
	<CAP9ODKrFQHjvVRswZ6UjFbAugiJmMFG-w7OYYiCfm8GLxLhMJQ@mail.gmail.com>
Date: Thu, 16 Feb 2012 13:03:26 +0100
Message-ID: <CALbNGRT+riFB=5BiR+r4g=t22U60ZAhChcs1iSFk_3j4eEQyTA@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][v2] 22/22] gpsd: use ${PN}.service instead ${PN}.socket in SYSTEMD_SERVICE to enable service
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
X-List-Received-Date: Thu, 16 Feb 2012 12:11:39 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 16, 2012 at 12:28 PM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> On Thu, Feb 16, 2012 at 08:43, Andreas M=FCller
> <schnitzeltony@googlemail.com>wrote:
>
>> As far as I can see there is no link from *.socket to *.service (
>> *.service requires *.socket) - correct?. Interesting: This was
>> highlighted by the systemd.bbclass modification: without this patch
>> *.service is not installed. Is there something I have overseen?
>
>
> As you can see at
> http://www.freedesktop.org/software/systemd/man/systemd.socket.html if
> Accept is false, then a <service>.service needs to exist, if Accept is
> true, then <service>@.service needs to exist.
>
> --
OK - but is it a problem to choose *.service? Will
systemd-sysctl-native do the expected job?

Andreas


