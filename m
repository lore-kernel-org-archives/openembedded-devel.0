Return-Path: <adrian.freihofer@gmail.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id C20416FF56
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Feb 2016 13:10:13 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id p65so13816005wmp.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Feb 2016 05:10:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=e3Ymp9pYHbhSHVwoslJLMp1bTv9ZjAZJslA+AlMqID4=;
	b=HBuRilWy4KI5zkwygtdmC5+Is0zoTDo/HNEjurfLuyNsfvoOoFfD5o0Xt1aLNH0B+X
	w6EgzhtALsvJQC21wT0DXk8tEpdIozvIRh8JM07qKF6nW0OQ6ZJHimQ5Vg81z7zfl0WN
	N/wvPQk1lQOml8c/o8tOUPEwTC6aINs6YzLxkc/5je1A5tgjnbgnFqjX11+yqWsKyxr7
	FQi+XNtXPHCsR8q0K5kmC3QAr00GOz06txHzgWn6bBctffqcFG9goe5JmVzIIN0LnJlX
	q6Hr5KZBWcRIsgjxsLcRKHWzxcm7M493mvB3xQKjjxUSbgSP3+FTTBgGtDqT/gL0Qx95
	xLGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=e3Ymp9pYHbhSHVwoslJLMp1bTv9ZjAZJslA+AlMqID4=;
	b=KDfqHs9wNIiu0VdMmwGQd3efgaYqm7tGVn8KlyOE/Sxlexg1UDUSEmqoATdwkq57Mz
	kqlRM3tBuPT7Cq76r7FdxJ8gSJsbqlyioBZj5gCQOevyFiewx7Ssppp41oPmQknvB+UO
	11mYA7DH14eoqdRN0EaKB16x0OfgN3t3X+8JUXXtEEVMB/Yt+tZ9FCnTQYwVfFt2SK7j
	lfU4SfOKdwUEheWdBSACsWcTMAsGdUdR/3e04qZvjKzuA9Uqy1YLfoIqQa38dRedUfXX
	KoYx0A/gMIWE/d8b3qy/ktHIQbtPGWMa/GFiawfHRKp/XVnKltXsE7iFo6H7Hk/aLJ8J
	2d/Q==
X-Gm-Message-State: AD7BkJK+xEEGPn4oBWWzBv5QVepAOXOCWnbIxP7xGCnGL2STYbZeoFZKutsv/omhB+tsvg==
X-Received: by 10.28.1.196 with SMTP id 187mr6638613wmb.68.1456665013563;
	Sun, 28 Feb 2016 05:10:13 -0800 (PST)
Received: from wsadrian.lan.ffah.ch (c-82-192-248-24.customer.ggaweb.ch.
	[82.192.248.24]) by smtp.gmail.com with ESMTPSA id
	gb9sm21118712wjb.26.2016.02.28.05.10.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 28 Feb 2016 05:10:12 -0800 (PST)
Message-ID: <1456665011.2775.24.camel@gmail.com>
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 28 Feb 2016 14:10:11 +0100
In-Reply-To: <db2af35a3af2a5e9a18611b66d05c8b91c0e73e5.1456236552.git.alexander.kanavin@linux.intel.com>
References: <cover.1456236552.git.alexander.kanavin@linux.intel.com>
	<db2af35a3af2a5e9a18611b66d05c8b91c0e73e5.1456236552.git.alexander.kanavin@linux.intel.com>
X-Mailer: Evolution 3.18.4 (3.18.4-1.fc23) 
Mime-Version: 1.0
Subject: Re: [PATCH 20/34] networkmanager: fix introspection and vala support
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 28 Feb 2016 13:10:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hi Alexander

Please consider the following lines before adding polkit to DEPENDS:
PACKAGECONFIG[systemd] = " \
    --with-systemdsystemunitdir=${systemd_unitdir}/system --with-session-tracking=systemd --enable-polkit, \
    --without-systemdsystemunitdir, \
    polkit \
"

I think the final solution should be a flag on DISTRO_FEATURES level to enable/disable polkit for systemd, networkmanager, modemmanager and other packages.
As a first step you might split polkit PACKAGECONFIG from systemd PACKAGECONFIG. The (untested) patch allows to enable disable polkit independently from systemd without changing
the default settings.

> diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.10.bb b/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.10.bb
> index b00c9bb..1e64c4b 100644
> --- a/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.10.bb
> +++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.10.bb
> @@ -35,15 +35,15 @@ EXTRA_OECONF = " \
>  "
>  
>  PACKAGECONFIG ??= "nss ifupdown netconfig dhclient dnsmasq \
> -    ${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd','consolekit',d)} \
> +    ${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd polkit','consolekit',d)} \
>      ${@bb.utils.contains('DISTRO_FEATURES','bluetooth','${BLUEZ}','',d)} \
>      ${@bb.utils.contains('DISTRO_FEATURES','wifi','wifi','',d)} \
>  "
>  PACKAGECONFIG[systemd] = " \
> -    --with-systemdsystemunitdir=${systemd_unitdir}/system --with-session-tracking=systemd --enable-polkit, \
> -    --without-systemdsystemunitdir, \
> -    polkit \
> +    --with-systemdsystemunitdir=${systemd_unitdir}/system --with-session-tracking=systemd, \
> +    --without-systemdsystemunitdir \
>  "
> +PACKAGECONFIG[polkit] = "--enable-polkit, --disable-polkit, polkit"
>  PACKAGECONFIG[bluez5] = "--enable-bluez5-dun,--disable-bluez5-dun,bluez5"
>  # consolekit is not picked by shlibs, so add it to RDEPENDS too
>  PACKAGECONFIG[consolekit] = "--with-session-tracking=consolekit,,consolekit,consolekit"

Regards,
Adrian

