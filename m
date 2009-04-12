Received: from [74.125.46.152] (helo=yw-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Lt0uv-00050d-BP
	for openembedded-devel@lists.openembedded.org;
	Sun, 12 Apr 2009 16:44:22 +0200
Received: by yw-out-1718.google.com with SMTP id 9so1153507ywk.42
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Apr 2009 07:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=IIP0SKkZ+YAGfXqRk7JxEkpyn9IUM59hXcUl9DON07g=;
	b=pBY6ynUcg1qGH6iaQcyW9QanhgEIhIfrNOYifzcC/Zd1SJRNaCHAkP/zQDCULui2uY
	urJIGi+cjIPXJ5sxLuU2mz6bQ2P1hPijQYUY3EgBOT/HJQ/IHAB9GunmkWjt1YN/Ufur
	S1GAYMxH2QriDHM6YNd8WWTdAU+dAsgi7HFHw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=ZftLw47Lh10AEjFR/5kXTr/mC0CZnDALuuFIzafsA+YCnCvITT4bUf9any5ve3ido6
	+IwlHLBaugFN26fpqUhJ9zj16KpQEZ22JiakUML0TbQxAGJxFvuxXYwKu2Jylyqealkt
	3xYycQIJreadoMaYbW1EcUzEJ7dw+LpGhVwcI=
MIME-Version: 1.0
Received: by 10.100.45.5 with SMTP id s5mr5342457ans.54.1239547248357; Sun, 12 
	Apr 2009 07:40:48 -0700 (PDT)
In-Reply-To: <1239271446-6732-1-git-send-email-k.kooi@student.utwente.nl>
References: <1239271446-6732-1-git-send-email-k.kooi@student.utwente.nl>
Date: Sun, 12 Apr 2009 07:40:48 -0700
Message-ID: <19c1b8a90904120740w68992392u6ac0b780e083abd8@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.46.152
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=AWL,BAYES_05,RDNS_NONE,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Koen Kooi <koen@openembedded.org>
Subject: Re: [STABLE][PATCH] bluez4: add less restrictive (and hence less secure) bluetooth dbus config
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
X-List-Received-Date: Sun, 12 Apr 2009 14:44:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Acked-by: Khem Raj <raj.khem@gmail.com>


oh the PR is jumping from 4 to 6. May be it should be 5 ?

On 4/9/09, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> From: Koen Kooi <koen@openembedded.org>
>
> * this makes bluetooth actually work for non-root users and when using
> ssh/vnc/etc
> * this also overwrites the bluetooth.conf in the files/ that wasn't used
> anymore
> * this also includes the fixup commit from .dev named "bluez4: fix dbus
> service file"
>
> Signed-off-by: Koen Kooi <koen@openembedded.org>
> ---
>  recipes/bluez/bluez4_4.31.bb       |    5 ++++-
>  recipes/bluez/files/bluetooth.conf |   29 ++++++++++++++++-------------
>  2 files changed, 20 insertions(+), 14 deletions(-)
>
> diff --git a/recipes/bluez/bluez4_4.31.bb b/recipes/bluez/bluez4_4.31.bb
> index 15e8b00..8c2f656 100644
> --- a/recipes/bluez/bluez4_4.31.bb
> +++ b/recipes/bluez/bluez4_4.31.bb
> @@ -4,12 +4,13 @@ PRIORITY = "optional"
>  DEPENDS = "gst-plugins-base alsa-lib libusb-compat dbus-glib"
>  HOMEPAGE = "http://www.bluez.org"
>  LICENSE = "GPL"
> -PR = "r4"
> +PR = "r6"
>
>  SRC_URI = "\
>    http://www.kernel.org/pub/linux/bluetooth/bluez-${PV}.tar.gz \
>    file://fix-dfutool-usb-declaration-mismatch.patch;patch=1 \
>    file://sbc-thumb.patch;patch=1 \
> +  file://bluetooth.conf \
>  #  file://hid2hci_usb_init.patch;patch=1 \
>  "
>  S = "${WORKDIR}/bluez-${PV}"
> @@ -43,6 +44,8 @@ do_install_append() {
>          install -m 0644 ${S}/audio/audio.conf ${D}/${sysconfdir}/bluetooth/
>          install -m 0644 ${S}/network/network.conf
> ${D}/${sysconfdir}/bluetooth/
>          install -m 0644 ${S}/input/input.conf ${D}/${sysconfdir}/bluetooth/
> +        # at_console doesn't really work with the current state of OE, so
> punch some more holes so people can actually use BT
> +        install -m 0644 ${WORKDIR}/bluetooth.conf
> ${D}/${sysconfdir}/dbus-1/system.d/
>  }
>
>  PACKAGES =+ "gst-plugin-bluez libasound-module-bluez"
> diff --git a/recipes/bluez/files/bluetooth.conf
> b/recipes/bluez/files/bluetooth.conf
> index 8720847..ca5e9e4 100644
> --- a/recipes/bluez/files/bluetooth.conf
> +++ b/recipes/bluez/files/bluetooth.conf
> @@ -1,13 +1,16 @@
> -#
> -# additional cards for /etc/pcmcia/bluetooth.conf
> -# Note for OE: This file is _appended_ to the stock
> -# bluetooth.conf in bluez-utils, so no need to duplicate
> -# entries for individual cards.
> -#
> -card "CSR BT01x0M Bluetooth CF Card"
> -  version "Bluetooth BT0100M", "", ""
> -  bind "serial_cs" class "bluetooth"
> -
> -card "Socket Bluetooth CF Card Rev. G"
> -  manfid 0x0104, 0x0096
> -  bind "serial_cs" class "bluetooth"
> +<!-- This configuration file specifies the required security policies
> +     for Bluetooth core daemon to work. -->
> +
> +<!DOCTYPE busconfig PUBLIC "-//freedesktop//DTD D-BUS Bus Configuration
> 1.0//EN"
> + "http://www.freedesktop.org/standards/dbus/1.0/busconfig.dtd">
> +<busconfig>
> +
> +  <!-- ../system.conf have denied everything, so we just punch some holes
> -->
> +
> +  <policy context="default">
> +    <allow own="org.bluez"/>
> +    <allow send_destination="org.bluez"/>
> +    <allow send_interface="org.bluez.Agent"/>
> +  </policy>
> +
> +</busconfig>
> --
> 1.5.6.5
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


