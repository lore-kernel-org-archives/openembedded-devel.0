Received: from mail.dream-property.net ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1QLyi8-0004xQ-Df
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 May 2011 16:23:52 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 63B943150E00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 May 2011 16:21:02 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 5KLHIwrS-Ecm
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 May 2011 16:20:53 +0200 (CEST)
Received: from [172.22.22.61] (drms-590c46b9.pool.mediaWays.net [89.12.70.185])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id F00C03150F1E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 May 2011 16:20:52 +0200 (CEST)
Message-ID: <4DD132C2.5050303@opendreambox.org>
Date: Mon, 16 May 2011 16:20:50 +0200
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <BANLkTimHpb2Jyf=QYk_p0VL95jdNQJGCog@mail.gmail.com>	<1305236006.13652.41.camel@mattotaupa>	<BANLkTimdLk4S_0zjM8NTwXSxrTU_epdC+Q@mail.gmail.com>	<1305238433.13652.47.camel@mattotaupa>
	<BANLkTinkK8Erz22QP=2CbyOReFc9b2YnSw@mail.gmail.com>
In-Reply-To: <BANLkTinkK8Erz22QP=2CbyOReFc9b2YnSw@mail.gmail.com>
Subject: Re: wpa-supplicant-0.7.inc patch
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
X-List-Received-Date: Mon, 16 May 2011 14:23:52 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 05/16/2011 04:02 PM, Martin Bures wrote:
> diff --git a/recipes/wpa-supplicant/wpa-supplicant-0.7.inc
> b/recipes/wpa-supplicant/wpa-supplicant-0.7.inc
> index 7649038..abf01c2 100644
> --- a/recipes/wpa-supplicant/wpa-supplicant-0.7.inc
> +++ b/recipes/wpa-supplicant/wpa-supplicant-0.7.inc
> @@ -63,6 +63,7 @@ do_install () {
>      cd ${D}${sysconfdir}/network/ && \
>      ln -sf ../if-pre-up.d/wpa-supplicant if-post-down.d/wpa-supplicant
> 
> +    cd ${S}

Sorry for not having replied earlier, but I think the more obvious fix
is to not use "cd" at all. How about this?

ln -s ../if-pre-up.d/wpa-supplicant
${D}${sysconfdir}/network/if-post-down.d/wpa-supplicant

(Using ln -f just hides possible errors in this case.)

Regards,
Andreas

>      if grep -q ^CONFIG_CTRL_IFACE_DBUS=y .config || grep -q
> ^CONFIG_CTRL_IFACE_DBUS_NEW=y .config; then
>          install -d ${D}/${sysconfdir}/dbus-1/system.d
>          install -m 644 ${S}/dbus/dbus-wpa_supplicant.conf
> ${D}/${sysconfdir}/dbus-1/system.d



