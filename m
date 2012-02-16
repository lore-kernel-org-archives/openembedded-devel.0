Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Ry24D-00086s-6L
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Feb 2012 15:12:13 +0100
Received: by eekd41 with SMTP id d41so652101eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Feb 2012 06:04:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=Pm8/SihdIMFbGAKzEa8QaR8ZPc09TwRYT7ICNI0M1Yg=;
	b=jib9sPAlvIrtCkDFVRG1FbgGIpZfzOZVEIghXZ3xu52+MEShfj3UYiGl6sEy91ZVXf
	bv5+c9sZrgrd8JhHJga1Xd1go7lNZ14zmMPQhzKIo5Si1WX9QcAC+zgufPpCoDzFnTkH
	LWR/jxUbh1F/bNPoVxInj9FKu9Z2OnA4CKdYQ=
MIME-Version: 1.0
Received: by 10.112.25.70 with SMTP id a6mr896065lbg.47.1329401040290; Thu, 16
	Feb 2012 06:04:00 -0800 (PST)
Received: by 10.112.108.164 with HTTP; Thu, 16 Feb 2012 06:04:00 -0800 (PST)
In-Reply-To: <CAP9ODKq9xT+ZqCajjqDkM_-=Tkh8OJk0hKAugGfhXd6E=61Cpg@mail.gmail.com>
References: <1329357796-27398-1-git-send-email-schnitzeltony@googlemail.com>
	<1329357796-27398-23-git-send-email-schnitzeltony@googlemail.com>
	<CAP9ODKoy3RRkOAjkGQXUnMw9EaU2rXasxw3bvWU+UrdhAJL53Q@mail.gmail.com>
	<CALbNGRRvhqQXqECfRD_PBTiK+NpiTrycthsPrU7Nhac4ifsAMQ@mail.gmail.com>
	<CAP9ODKrFQHjvVRswZ6UjFbAugiJmMFG-w7OYYiCfm8GLxLhMJQ@mail.gmail.com>
	<CALbNGRT+riFB=5BiR+r4g=t22U60ZAhChcs1iSFk_3j4eEQyTA@mail.gmail.com>
	<CAP9ODKq9xT+ZqCajjqDkM_-=Tkh8OJk0hKAugGfhXd6E=61Cpg@mail.gmail.com>
Date: Thu, 16 Feb 2012 15:04:00 +0100
Message-ID: <CALbNGRSUxOf7U7H7AJjCaXYhuYe8bd64_YW6Vc9Mnf9PKdn+sg@mail.gmail.com>
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
X-List-Received-Date: Thu, 16 Feb 2012 14:12:13 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 16, 2012 at 1:13 PM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> On Thu, Feb 16, 2012 at 10:03, Andreas M=FCller
> <schnitzeltony@googlemail.com>wrote:
>
>> OK - but is it a problem to choose *.service? Will
>> systemd-sysctl-native do the expected job?
>
>
> Not really but it is a problem expect people will always choose .service
> file instead of .socket.
>
This is not the case for many packets having *.socket files
referencing *.service by 'Also'. But in gpsd.socket is nothing like
that.

One question the other way round: What fallout do you expect by this patch?

Andreas


