Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PyEGW-0003ab-Cj
	for openembedded-devel@lists.openembedded.org;
	Sat, 12 Mar 2011 03:09:12 +0100
Received: by pvc30 with SMTP id 30so538237pvc.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Mar 2011 18:07:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id
	:mail-followup-to:references:mime-version:content-type
	:content-disposition:content-transfer-encoding:in-reply-to
	:user-agent; bh=ZHEdtIWTC5b2FxokTsDa8gsltQ525Y/6flw8k/j2eBE=;
	b=Pdv4NF2eRH0Uz9VNtWc3yruM7Evdp8jH2uZAgAegvp1Y9YiQv0mdcL174zzORh3jfH
	wAHdsHZbaPSOwsgM/raDCF0mnyLFKTN4qGPXzNKBnQbgu0W+8dW/IbrWkQnqozkI1a4P
	x8M+sbjQ9idpSCGFM1VGxqOgrkwXcGc0j9Tk4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	b=e8AwIq2cY1zp3Kj7ZbELwPYwKOZ96t/XZNJsNWX1H+CktFzBQUyZaZLUjmkpyfs+Ft
	Om8bS6yMDUS/GS2IdE5/LkDHfx3uBjWDGLi7kFHwasQ8+EWYOI77vVXJQP39wXHkhs9H
	9eYtAWhE5wl7izav4j2D7nuHdBI/GigHNlO1A=
Received: by 10.143.86.5 with SMTP id o5mr8194899wfl.216.1299889436938;
	Fri, 11 Mar 2011 16:23:56 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id w32sm6038511wfh.19.2011.03.11.16.23.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 11 Mar 2011 16:23:55 -0800 (PST)
Date: Fri, 11 Mar 2011 16:24:20 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110312002420.GM5603@sakrah.homelinux.org>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <1299886498-22190-1-git-send-email-eric@eukrea.com>
	<1299886498-22190-2-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
In-Reply-To: <1299886498-22190-2-git-send-email-eric@eukrea.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH 1/2] obexd: add 0.40
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
X-List-Received-Date: Sat, 12 Mar 2011 02:09:12 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On (12/03/11 00:34), Eric Bénard wrote:
> Signed-off-by: Eric Bénard <eric@eukrea.com>
> ---
>  recipes/bluez/obexd_0.40.bb |   17 +++++++++++++++++
>  1 files changed, 17 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/bluez/obexd_0.40.bb
> 
> diff --git a/recipes/bluez/obexd_0.40.bb b/recipes/bluez/obexd_0.40.bb
> new file mode 100644
> index 0000000..3d8790a
> --- /dev/null
> +++ b/recipes/bluez/obexd_0.40.bb
> @@ -0,0 +1,17 @@
> +DESCRIPTION = "OBEX Server and Client"
> +DEPENDS = "openobex glib-2.0 dbus bluez4 libical"
> +
> +LICENSE = "GPLv2"
> +
> +PR = "r0"
> +
> +DEFAULT_PREFERENCE = "-1"

why DP -1 ?

> +
> +SRC_URI = "http://www.kernel.org/pub/linux/bluetooth/obexd-${PV}.tar.gz"
> +
> +inherit autotools
> +
> +FILES_${PN} += "${datadir}/dbus-1/"
> +
> +SRC_URI[md5sum] = "243335d849700c30b318c360db95f62c"
> +SRC_URI[sha256sum] = "5440a3df1d33c2c12cca61fff1e8d643488ea139eef7340cfdbf6d2e5ea3e04b"
> -- 
> 1.7.0.4
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-- 
-Khem


