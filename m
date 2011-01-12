Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Pcu26-0003L2-Nn
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Jan 2011 07:18:10 +0100
Received: by pzk12 with SMTP id 12so43073pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jan 2011 22:17:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=0YhtQrrDQ2POBHnlNmq86HBcdgjkcD4l0yiJcqUuQaw=;
	b=Ok7+WGDdD8qJ2sNXC8j8/B4C5dFaX5hURe1/GBvyUmzTg1brr9I0ywK9bMh9H/8BRR
	5Bnyelr9cw8ZMoLQ0opJjjc6TE8t+Db3cGmUFR8QCbVl2J0NKUxw0VQHdB/Mh5F9vpIA
	MY0D+l9qXbo+Dxr0hviB3QcEeo83QjCKwrpXc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=eA+XzEDuDYqvdoz26sslsap+opuqTEWDM+PsIoGFtrkyNG1pB7hPEwCn2lQJSZi7HU
	0YKRsiVp1qkHteNHkIjJlPn6083cXTPkQn9NslxRs6HLz/4vZlW/f/8DdPsSMTsEhVR8
	ML72ory3/B97iOueuPVWUkw8UZF2H57TFlQ7c=
Received: by 10.142.193.4 with SMTP id q4mr568780wff.203.1294813058356;
	Tue, 11 Jan 2011 22:17:38 -0800 (PST)
Received: from [192.168.1.68] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id p8sm379689wff.4.2011.01.11.22.17.37
	(version=SSLv3 cipher=RC4-MD5); Tue, 11 Jan 2011 22:17:37 -0800 (PST)
Message-ID: <4D2D477E.6040104@gmail.com>
Date: Tue, 11 Jan 2011 22:17:34 -0800
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US;
	rv:1.9.2.13) Gecko/20101207 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1294761389-13634-1-git-send-email-Martin.Jansa@gmail.com>
In-Reply-To: <1294761389-13634-1-git-send-email-Martin.Jansa@gmail.com>
Subject: Re: [PATCH 01/12] xorg-data: obsolete old versions
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
X-List-Received-Date: Wed, 12 Jan 2011 06:18:11 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 1/11/2011 7:56 AM, Martin Jansa wrote:
> Signed-off-by: Martin Jansa<Martin.Jansa@gmail.com>

whole series

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
>   recipes/obsolete/xorg-data/xbitmaps_1.1.0.bb       |   10 ++++++++++
>   recipes/obsolete/xorg-data/xcursor-themes_1.0.2.bb |   11 +++++++++++
>   recipes/xorg-data/xbitmaps_1.1.0.bb                |   10 ----------
>   recipes/xorg-data/xcursor-themes_1.0.2.bb          |   11 -----------
>   4 files changed, 21 insertions(+), 21 deletions(-)
>   create mode 100644 recipes/obsolete/xorg-data/xbitmaps_1.1.0.bb
>   create mode 100644 recipes/obsolete/xorg-data/xcursor-themes_1.0.2.bb
>   delete mode 100644 recipes/xorg-data/xbitmaps_1.1.0.bb
>   delete mode 100644 recipes/xorg-data/xcursor-themes_1.0.2.bb
>
> diff --git a/recipes/obsolete/xorg-data/xbitmaps_1.1.0.bb b/recipes/obsolete/xorg-data/xbitmaps_1.1.0.bb
> new file mode 100644
> index 0000000..23cecdb
> --- /dev/null
> +++ b/recipes/obsolete/xorg-data/xbitmaps_1.1.0.bb
> @@ -0,0 +1,10 @@
> +require xorg-data-common.inc
> +
> +DESCRIPTION = "Common X11 Bitmaps"
> +LICENSE = "MIT"
> +DEPENDS += "libxmu"
> +
> +
> +SRC_URI[archive.md5sum] = "f9ddd4e70a5375508b3acaf17be0d0ab"
> +SRC_URI[archive.sha256sum] = "c9a2059c8b0636b7ee1169647bb22f6eb4a0589e36fdb98936002e2569ad8761"
> +PR = "${INC_PR}.0"
> diff --git a/recipes/obsolete/xorg-data/xcursor-themes_1.0.2.bb b/recipes/obsolete/xorg-data/xcursor-themes_1.0.2.bb
> new file mode 100644
> index 0000000..824bbeb
> --- /dev/null
> +++ b/recipes/obsolete/xorg-data/xcursor-themes_1.0.2.bb
> @@ -0,0 +1,11 @@
> +require xorg-data-common.inc
> +PE = "1"
> +
> +DEPENDS += " libxcursor xcursorgen-native"
> +
> +FILES_${PN} += "${datadir}/icons"
> +
> +
> +SRC_URI[archive.md5sum] = "e8929a1bb4d98d1a3991fd340d0b5f09"
> +SRC_URI[archive.sha256sum] = "5f798c2f1d2794c09fa0a40700c40359b725107608012866828015dca47514d6"
> +PR = "${INC_PR}.0"
> diff --git a/recipes/xorg-data/xbitmaps_1.1.0.bb b/recipes/xorg-data/xbitmaps_1.1.0.bb
> deleted file mode 100644
> index 23cecdb..0000000
> --- a/recipes/xorg-data/xbitmaps_1.1.0.bb
> +++ /dev/null
> @@ -1,10 +0,0 @@
> -require xorg-data-common.inc
> -
> -DESCRIPTION = "Common X11 Bitmaps"
> -LICENSE = "MIT"
> -DEPENDS += "libxmu"
> -
> -
> -SRC_URI[archive.md5sum] = "f9ddd4e70a5375508b3acaf17be0d0ab"
> -SRC_URI[archive.sha256sum] = "c9a2059c8b0636b7ee1169647bb22f6eb4a0589e36fdb98936002e2569ad8761"
> -PR = "${INC_PR}.0"
> diff --git a/recipes/xorg-data/xcursor-themes_1.0.2.bb b/recipes/xorg-data/xcursor-themes_1.0.2.bb
> deleted file mode 100644
> index 824bbeb..0000000
> --- a/recipes/xorg-data/xcursor-themes_1.0.2.bb
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -require xorg-data-common.inc
> -PE = "1"
> -
> -DEPENDS += " libxcursor xcursorgen-native"
> -
> -FILES_${PN} += "${datadir}/icons"
> -
> -
> -SRC_URI[archive.md5sum] = "e8929a1bb4d98d1a3991fd340d0b5f09"
> -SRC_URI[archive.sha256sum] = "5f798c2f1d2794c09fa0a40700c40359b725107608012866828015dca47514d6"
> -PR = "${INC_PR}.0"



