Received: from mail-vb0-f49.google.com ([209.85.212.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1U2htr-0004Ei-ED
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Feb 2013 13:45:23 +0100
Received: by mail-vb0-f49.google.com with SMTP id s24so47344vbi.8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Feb 2013 04:29:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type:content-transfer-encoding;
	bh=G8cbxYeIqHHb4uiZ3eJJXkfbWyd32GBRXIlMhTLBOM8=;
	b=03oX0bGjxljI7jGnRr2GlqmNR05xkX3r3vKkWfrdKkW7LRV+gi4RFkTjrBkpchff8H
	blMaviEiUToOQCK5ptrBYgTSUWY8O7pYJuzVfTshF6XvDyXxGXpBcEAwWUaXtCn8eug2
	ziEaC3O6bDSo/DgF7+2B/OrPpe+jZMPS4F215xwDy7peVhdcrHN7toe1sCYKIcSFrx1x
	yL7BS4YiSN0bcou8rtDgf1hrO7yfVEu/cvp0FowfMBMPy8lizI+BlDlDn5/g3IilHcf4
	SXnUX2Fd8QgTbIUwErL08basRDW5zM87QDB6IuTVyM2Ajo/WZSHQfvAsfqVEhEOTYs0M
	3aOg==
MIME-Version: 1.0
X-Received: by 10.52.26.17 with SMTP id h17mr12375400vdg.101.1360067373586;
	Tue, 05 Feb 2013 04:29:33 -0800 (PST)
Received: by 10.52.95.243 with HTTP; Tue, 5 Feb 2013 04:29:33 -0800 (PST)
In-Reply-To: <20130205120416.GC8509@windriver.com>
References: <1360062139-10894-1-git-send-email-andrei.gherzan@windriver.com>
	<20130205112251.GO3271@jama>
	<CALbNGRSpp0mq7e7ZUR-+yDpaq8XWSsfRiMMUyt1QAJwY13VYQQ@mail.gmail.com>
	<20130205120416.GC8509@windriver.com>
Date: Tue, 5 Feb 2013 13:29:33 +0100
Message-ID: <CALbNGRSZr1o87D3BJ8p9cQJ3ysZBFW58AvcRKXEtOD-+d2pO-Q@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Andrei Gherzan <andrei.gherzan@windriver.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][meta-systemd][PATCH] wpa-supplicant: Add bbappend to package systemd service in a -systemd package
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
X-List-Received-Date: Tue, 05 Feb 2013 12:45:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 5, 2013 at 1:04 PM, Andrei Gherzan
<andrei.gherzan@windriver.com> wrote:
> On Tue, Feb 05, 2013 at 12:49:43PM +0100, Andreas M=C3=BCller wrote:
>> On Tue, Feb 5, 2013 at 12:22 PM, Martin Jansa <martin.jansa@gmail.com> w=
rote:
>> > On Tue, Feb 05, 2013 at 01:02:19PM +0200, Andrei Gherzan wrote:
>> >> Signed-off-by: Andrei Gherzan <andrei.gherzan@windriver.com>
>> >> ---
>> >>  .../wpa-supplicant/wpa-supplicant_2.0.bbappend     |    7 +++++++
>> >>  1 files changed, 7 insertions(+), 0 deletions(-)
>> >>  create mode 100644 meta-systemd/oe-core/recipes-connectivity/wpa-sup=
plicant/wpa-supplicant_2.0.bbappend
>> >
>> > oe-core wpa-supplicant now installs wpa_supplicant.service to PN, is
>> > this SYSTEMD_PACKAGES correct now?
>> >
>
> Hmm... don't really understand your question. I know the service is insta=
lled in
> PN and by using SYSTEMD_PACKAGES=3D"${PN}-systemd" I actually move that
> service in ${PN}-systemd.
>
>> > http://lists.linuxtogo.org/pipermail/openembedded-devel/2013-January/0=
43675.html
>> >
>> > --
>> oe-core has set facts. The decision systemd or not is made by
>> DISTRO_FEATURE. I think we have to follow that (=3Dlet meta-systemd die)
>> to avoid two concurrent systemd enable mechanisms.
>
> I understand this and makes sense. But still, systemd services should be =
in a
> systemd package. Will resend this to oe-core.
>
Good luck :))

Andreas


