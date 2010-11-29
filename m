Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1PN0Ye-0003W7-Az
	for openembedded-devel@lists.openembedded.org;
	Mon, 29 Nov 2010 11:02:06 +0100
Received: by wwi17 with SMTP id 17so1112235wwi.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Nov 2010 02:00:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=jDFrVqcYJ2XuZ5st2TnXg6PrZCF2InHLw2SqOZ0bL8U=;
	b=W0BaTaJks6T/3k4F2Xf7Z78MHK0pq7SGIrG1Rn+NyrD/DZPlgwJP9HxRMqNV2JyvoC
	4zVdRp0UOkbYPXqxTkew4Z5XwdzRUnph0Dabc1id5VTMNFn6k/e7iey7ei2sghEdunq+
	iAOmv01Ssc+gd9O1ckWnSib74uZGUU1EJFB4E=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=tUKPd1l3w3cDgN5rlqY2KYlDE+5zO7djzfgZkyJkJ83WbnUCu1HEKmMzuyaDMajMRn
	uLjGtuyBwEEobAyFSo+FYL+mEPWsF8oVpMZx8X01J9vR/xe5hskgTpgxMZ0HQgTRGuSS
	uHSfV+VWqlfUNviLi0pWutYKMoXrq4RWniGRg=
MIME-Version: 1.0
Received: by 10.216.52.11 with SMTP id d11mr4453885wec.0.1291024836713; Mon,
	29 Nov 2010 02:00:36 -0800 (PST)
Received: by 10.216.49.130 with HTTP; Mon, 29 Nov 2010 02:00:36 -0800 (PST)
In-Reply-To: <4CF32D52.1000901@gmail.com>
References: <4CF32D52.1000901@gmail.com>
Date: Mon, 29 Nov 2010 11:00:36 +0100
Message-ID: <AANLkTim2+Qe+-ODy0+8eX2NXoW-_9RPbWjWJXb8zGDsp@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] glib-2.0_2.24.1.bb: Fix build when DISTRO_FEATURES lacks ipv6.
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
X-List-Received-Date: Mon, 29 Nov 2010 10:02:06 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 29, 2010 at 5:34 AM, Graham Gower <graham.gower@gmail.com> wrot=
e:
> Signed-off-by: Graham Gower <graham.gower@gmail.com>
> ---
> =A0.../glib-2.0/glib-2.0-2.24.1/disable-ipv6.patch =A0 =A0| =A0 26 ++++++=
++++++++++++++
> =A0recipes/glib-2.0/glib-2.0_2.24.1.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0 =A04 +++
> =A02 files changed, 30 insertions(+), 0 deletions(-)
> =A0create mode 100644 recipes/glib-2.0/glib-2.0-2.24.1/disable-ipv6.patch
>
> diff --git a/recipes/glib-2.0/glib-2.0-2.24.1/disable-ipv6.patch b/recipe=
s/glib-2.0/glib-2.0-2.24.1/disable-ipv6.patch
> new file mode 100644
> index 0000000..9e7951b

...
Graham,

thx for the patch.
However I did not encounter this failure, instead
http://tinderbox.openembedded.org/builds/107121/

(gconvert.c:55:2: error: #error GNU libiconv not in use but included
iconv.h is from libiconv)

I could fix it with  EXTRA_OECONF_append_libc-uclibc =3D "
--with-libiconv=3Dgnu "  but I'm not sure about the real cause and the
best fix.

Opinions?

Andrea


