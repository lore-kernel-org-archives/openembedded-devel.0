Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Po3Ge-0000sY-ME
	for openembedded-devel@lists.openembedded.org;
	Sat, 12 Feb 2011 01:23:16 +0100
Received: by iwn8 with SMTP id 8so2899941iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Feb 2011 16:22:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=qbziElQp6vONIlQHfrfYhoLdEfNfKuAj0oEJUksM7jE=;
	b=RYPZ0T0RgLxZry7VNvX0BJF+EfTzCgH1DeqsgWt6or852jru4mcYVOMxsdVxFuJ8NG
	9E0lBtgPbw3S7D1SHmJYiK1I3rT3KfkvhEM46AQEXutVO0aZhbijlfpvbaDU5Fp1DpjS
	vOEd2kjTAFMMj6tcLaghqsc1l1UAd3q/vZ2uo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=pXVsCK2KxtgFcBBcDTYaeqiHVQa4WSfjYsx6rEdxo7aUpnvjykLmK+xPhkEHAbvwdD
	eqzZs9cOnxwBQe2UmqhkRZKbw/TDyWF/jmCw0FxKo0T1l9/nAaoc5SNq0XrVVbXqEyvk
	zIem9NufX8WXoPy8+6ICthbSpS2dyQ+f5qWuI=
Received: by 10.42.164.201 with SMTP id h9mr1445018icy.301.1297470130095;
	Fri, 11 Feb 2011 16:22:10 -0800 (PST)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id d21sm1082371ibg.15.2011.02.11.16.22.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 11 Feb 2011 16:22:09 -0800 (PST)
Date: Fri, 11 Feb 2011 16:22:01 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110212002201.GG1010@gmail.com>
References: <1296657327-11166-1-git-send-email-stefan@buglabs.net>
MIME-Version: 1.0
In-Reply-To: <1296657327-11166-1-git-send-email-stefan@buglabs.net>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Stefan Schmidt <stefan@buglabs.net>
Subject: Re: [PATCH] angstrom-2008-preferred-versions: Bump wpa-supplicant version to 0.7.3
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
X-List-Received-Date: Sat, 12 Feb 2011 00:23:16 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (02/02/11 15:35), Stefan Schmidt wrote:
> This allows the use of the new DBUS API which is needed by connman 0.68 and
> higher.
> 
> Signed-off-by: Stefan Schmidt <stefan@buglabs.net>

I dont know if angstrom-2008 is still taking package verison upgrades but
nonetheless

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
>  .../include/angstrom-2008-preferred-versions.inc   |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/conf/distro/include/angstrom-2008-preferred-versions.inc b/conf/distro/include/angstrom-2008-preferred-versions.inc
> index c5e1a42..77e5e00 100644
> --- a/conf/distro/include/angstrom-2008-preferred-versions.inc
> +++ b/conf/distro/include/angstrom-2008-preferred-versions.inc
> @@ -61,7 +61,7 @@ PREFERRED_VERSION_udev_libc-uclibc = "141"
>  UDEV_GE_141 = "1"
>  
>  PREFERRED_VERSION_usbutils = "0.86"
> -PREFERRED_VERSION_wpa-supplicant = "0.6.9"
> +PREFERRED_VERSION_wpa-supplicant = "0.7.3"
>  PREFERRED_VERSION_wget = "1.11.4"
>  PREFERRED_VERSION_xserver-common = "1.33"
>  PREFERRED_VERSION_xserver-kdrive = "1.4.0.90"
> -- 
> 1.7.2.3
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


