Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 3B04A71B19
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  3 Dec 2016 17:11:51 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id e9so11228811pgc.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 03 Dec 2016 09:11:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=6uYuYR6vivN8gmgKYboPVPtULq/I0bJAwIsseFZZi8o=;
	b=MYqSA20NdCUKvJroyC3GGJT1JiRq6zH5luAxkupH3snEYxvc7nswJloE7XNwf44KM8
	ipA5ed1+fyDCXHyXljYuVqEYmDxuZSulEQ4B1AuQryCKFAXbpeBD7R6OGN2Bo4gNth6B
	7wG+qj7Agixd/yDMZMP76bhApRcWokLi92c14vVFJA7AG99OaAYlddpTkiJ6BFU72zo/
	MyjZNLlLywA7eH7k/1wC8A3RdbdEKR/AAKrfSShElwBmbK2AWFbA4C22ZRqSQhZv4TuL
	fHFCD8vMhmZu4kbHXeJ6Gts1X10COUOgrJbwbUelAKA3lwLRcUbiOcqScPpDsI86vyxT
	fWTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=6uYuYR6vivN8gmgKYboPVPtULq/I0bJAwIsseFZZi8o=;
	b=lOxeE/JbRM9lS0MO0kHQjahiNtrH1uDEJuSpdPn2iyDM/wbVJ7OCrKBn/VIPK7xdg5
	rajczVB0yajO4d3ed4aCjReh4wYR38gUgeKZB4bK9egPYjj8Rd02uPREduP4wgiB1BAF
	t3A++k5dGnUrV0ACwbsL4ARAjMfP1SL4ISVfSPqJTSW3CEuqIBUuN3ZYENXC5nm0ofIV
	rCbhS7qhwjgqavWZi/t9ozZKtLyBC38vawYxGPzdNhqERxYfu4mLkhnJZr3vqCVNKHrO
	syilF4ZYjKOEL0pHwmQGYUwMOQmAOLAZrXZAwKpb0mOnPNdV0iOw5ggWoXN1TG/oEzJn
	nqfA==
X-Gm-Message-State: AKaTC02IlHDUWJIw9E3DaivuPWvlXqCcMXHgKbnhPJm1tYHyJ7U6Lgo0r+GGUdYNAeOH3w==
X-Received: by 10.84.217.20 with SMTP id o20mr109129103pli.28.1480785113060;
	Sat, 03 Dec 2016 09:11:53 -0800 (PST)
Received: from ?IPv6:2601:202:4001:9ea0:5aa:72a1:f3b6:20dc?
	([2601:202:4001:9ea0:5aa:72a1:f3b6:20dc])
	by smtp.googlemail.com with ESMTPSA id
	w17sm16233964pgm.18.2016.12.03.09.11.52
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 03 Dec 2016 09:11:52 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <20161202142102.31673-1-nicolas.dechesne@linaro.org>
From: akuster808 <akuster808@gmail.com>
Message-ID: <f300639f-8bee-bc63-804a-8ba02ff12cbf@gmail.com>
Date: Sat, 3 Dec 2016 09:11:51 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20161202142102.31673-1-nicolas.dechesne@linaro.org>
Subject: Re: [meta-oe][morty][PATCH] gpsd: fix multilib build
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
X-List-Received-Date: Sat, 03 Dec 2016 17:11:52 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit



On 12/02/2016 06:21 AM, Nicolas Dechesne wrote:
> While testing arm 64/32 multi, the following issue was observed:
> 
merged to staging.

thanks,
Armin
> WARNING: gpsd-3.14-r0 do_package: QA Issue: gpsd: Files/directories were
> installed but not shipped in any package:
>   /usr/lib/libgpsd.so.22.0
>   /usr/lib/libgps.so.22
>   /usr/lib/libgpsd.so.22.0.0
>   /usr/lib/libgpsd.so.22
>   /usr/lib/libgps.so.22.0.0
>   /usr/lib/libgps.so
>   /usr/lib/libgps.so.22.0
>   /usr/lib/libgpsd.so
>   /usr/lib/pkgconfig
>   /usr/lib/pkgconfig/libgpsd.pc
>   /usr/lib/pkgconfig/libgps.pc
> Please set FILES such that these items are packaged. Alternatively if they are
> unneeded, avoid installing them or delete them within do_install.
> gpsd: 11 installed and not shipped files. [installed-vs-shipped]
> WARNING: gpsd-3.14-r0 do_package_qa: QA Issue: /usr/bin/cgps contained in
> package gps-utils requires libgps.so.22()(64bit), but no providers found in
> RDEPENDS_gps-utils? [file-rdeps]
> WARNING: gpsd-3.14-r0 do_package_qa: QA Issue: /usr/sbin/gpsdctl contained in
> package gpsd requires libgps.so.22()(64bit), but no providers found in
> RDEPENDS_gpsd? [file-rdeps]
> WARNING: gpsd-3.14-r0 do_package_qa: QA Issue: /usr/bin/gpsctl contained in
> package gpsd-gpsctl requires libgps.so.22()(64bit), but no providers found in
> RDEPENDS_gpsd-gpsctl? [file-rdeps]
> WARNING: gpsd-3.14-r0 do_package_qa: QA Issue: gpsd-dbg: found library in wrong
> location: /usr/lib/.debug/libgpsd.so.22.0.0
> gpsd-dbg: found library in wrong location: /usr/lib/.debug/libgps.so.22.0.0 [libdir]
> 
> gpsd SConstruct file defaults to using '/lib' suffix, which needs to be
> overriden in the recipe.
> 
> Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> (cherry picked from commit 45837e6c567b1b9ff9d152a7e2a752488d313455)
> Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
> ---
>  meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb
> index b7b8968..4d00fea 100644
> --- a/meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb
> +++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb
> @@ -46,6 +46,7 @@ EXTRA_OESCONS = " \
>      strip='false' \
>      chrpath='yes' \
>      systemd='${SYSTEMD_OESCONS}' \
> +    libdir='${libdir}' \
>      ${PACKAGECONFIG_CONFARGS} \
>  "
>  # this cannot be used, because then chrpath is not found and only static lib is built
> 

