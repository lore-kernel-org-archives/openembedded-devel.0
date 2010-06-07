Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OLjrC-0001pc-7g
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Jun 2010 23:27:44 +0200
Received: by iwn6 with SMTP id 6so1867796iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Jun 2010 14:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=7VUMIUvpq0Yb6lHshrzQrHT4bjuZjgGCIgk1MrqEANk=;
	b=L99x6tL1dEBifEvWi1g053jjlCWtFHPmaoUGW8Rwu4fjrGznVZNzF5iHYgBPPYLXEe
	HggExbRUKXon+jKbymHsFn3lKCD14P/sUXo8U+6CFDitCghccPJsjlNvK4+ZGIROFWLL
	7i6fN+GIIBWCIG85nL5QIKM2jZGmwDTt+l4Ro=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=PWtK+6LCpOofQ+Gg26WXwO3REhglHCdpempE7mNDbIYBIRHiS8nvvUsuhID86RKlRS
	zk9L1j98G9Bh2edWfiz1pJoCKkx8P1EfkSzmzFnzAOSA8JCxQQ7001fZ1KYY2w5sIWW6
	w6rrBArKygnn6gDQ7M57npQSPB5628r61nrwo=
Received: by 10.231.171.13 with SMTP id f13mr5147960ibz.103.1275945803424; 
	Mon, 07 Jun 2010 14:23:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.39.137 with HTTP; Mon, 7 Jun 2010 14:23:03 -0700 (PDT)
In-Reply-To: <1275941424-14837-2-git-send-email-GNUtoo@no-log.org>
References: <1275941424-14837-1-git-send-email-GNUtoo@no-log.org> 
	<1275941424-14837-2-git-send-email-GNUtoo@no-log.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 7 Jun 2010 14:23:03 -0700
Message-ID: <AANLkTinpmVu9ZmOzPwblvkirXsS877bqdcpqnnowoOQ7@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] netbase: add support for htcdream
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
X-List-Received-Date: Mon, 07 Jun 2010 21:27:44 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 7, 2010 at 1:10 PM, Denis 'GNUtoo' Carikli
<GNUtoo@no-log.org> wrote:
> If we don't add a custom file containing auto usb0,
> usb0 is not configured at boot and we can't ssh into the phone
>
> Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
> =A0recipes/netbase/netbase/htcdream/interfaces | =A0 17 +++++++++++++++++
> =A0recipes/netbase/netbase_4.21.bb =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =A02 +-
> =A02 files changed, 18 insertions(+), 1 deletions(-)
> =A0create mode 100644 recipes/netbase/netbase/htcdream/interfaces
>
> diff --git a/recipes/netbase/netbase/htcdream/interfaces b/recipes/netbas=
e/netbase/htcdream/interfaces
> new file mode 100644
> index 0000000..a75f259
> --- /dev/null
> +++ b/recipes/netbase/netbase/htcdream/interfaces
> @@ -0,0 +1,17 @@
> +# /etc/network/interfaces -- configuration file for ifup(8), ifdown(8)
> +
> +# The loopback interface
> +auto lo
> +iface lo inet loopback
> +
> +# Ethernet/RNDIS gadget (g_ether)
> +# ... or on host side, usbnet and random hwaddr
> +auto usb0
> +iface usb0 inet static
> + =A0 =A0 =A0 address 192.168.0.202
> + =A0 =A0 =A0 netmask 255.255.255.0
> + =A0 =A0 =A0 network 192.168.0.0
> + =A0 =A0 =A0 up route add default gw 192.168.0.200 metric 8
> + =A0 =A0 =A0 up echo nameserver 208.67.222.222 > /etc/resolv.conf
> + =A0 =A0 =A0 up echo nameserver 208.67.220.220 >> /etc/resolv.conf
> + =A0 =A0 =A0 down route del default gw 192.168.0.200 metric 8
> diff --git a/recipes/netbase/netbase_4.21.bb b/recipes/netbase/netbase_4.=
21.bb
> index 4e1d39f..baec44b 100644
> --- a/recipes/netbase/netbase_4.21.bb
> +++ b/recipes/netbase/netbase_4.21.bb
> @@ -2,7 +2,7 @@ DESCRIPTION =3D "This package provides the necessary \
> =A0infrastructure for basic TCP/IP based networking."
> =A0SECTION =3D "base"
> =A0LICENSE =3D "GPLv2"
> -PR =3D "r41"
> +PR =3D "r42"
>
> =A0inherit update-rc.d
>
> --
> 1.7.0.4
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


