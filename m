Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1RySvB-0004ya-VK
	for openembedded-devel@lists.openembedded.org;
	Fri, 17 Feb 2012 19:52:42 +0100
Received: by lahc1 with SMTP id c1so4258782lah.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Feb 2012 10:44:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=ZUGgTzgW7cm5wc0TOMJGEbVANTxwsA3X7zt9BaXpfKw=;
	b=dT9KouEoqhrThI2UHvAAEcAp2N0aeoZPAxYrJ7O+7VAOMC9LoGdsA5saqTLtiCHWru
	KbEEEpkKNAPIwf+gUvGQ5AttOTDo0QZtnki1YePWkPhE/dUFbF0sD0ivC9Lruh6fWNUD
	H/rvfnGdCS2Ye3ze5lB1n5d4LyFiBSC5wFi24=
MIME-Version: 1.0
Received: by 10.112.25.70 with SMTP id a6mr2955942lbg.47.1329504267193; Fri,
	17 Feb 2012 10:44:27 -0800 (PST)
Received: by 10.112.108.164 with HTTP; Fri, 17 Feb 2012 10:44:27 -0800 (PST)
In-Reply-To: <20120217093459.GG5822@jama.jama.net>
References: <1329357796-27398-1-git-send-email-schnitzeltony@googlemail.com>
	<1329357796-27398-6-git-send-email-schnitzeltony@googlemail.com>
	<20120217093459.GG5822@jama.jama.net>
Date: Fri, 17 Feb 2012 19:44:27 +0100
Message-ID: <CALbNGRTU6F7Yd1wQODe31XP4tNJqVhNdEvWO5KiUM-75T=Losw@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][v2] 05/22] automatically install all *.service and *.socket supplied in recipe's SRC_URI
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
X-List-Received-Date: Fri, 17 Feb 2012 18:52:42 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 17, 2012 at 10:34 AM, Martin Jansa <martin.jansa@gmail.com> wro=
te:
> On Thu, Feb 16, 2012 at 03:02:59AM +0100, Andreas M=FCller wrote:
>> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
>> Acked-by: Otavio Salvador <otavio@ossystems.com.br>
>
>
> After reading today's gentoo systemd news:
> We have decided to move our systemd installation into /usr prefix.
> After the upgrade, the main systemd executable will be installed
> as /usr/bin/systemd and the unit files will be installed
> to /usr/lib/systemd; however, systemd will still look for unit files
> in the /lib location.
>
> I think we should abstract
> ${base_libdir}/systemd
> to some variable inside systemd.bbclass, so if we ever decide to move it
> to /usr/lib too, then not only automatically installed *.service files
> from SRC_URI are installalled to right directory.
>
I would like to take this in for V3. To avoid further iterations:

* I the name 'systemd_unitdir' OK?
* Would it make sense to abstract "${base_libdir}/systemd/system" (too)

Andreas


