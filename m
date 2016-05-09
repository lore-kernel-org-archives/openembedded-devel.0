Return-Path: <george.mccollister@gmail.com>
Received: from mail-io0-f196.google.com (mail-io0-f196.google.com
	[209.85.223.196])
	by mail.openembedded.org (Postfix) with ESMTP id DF501606BF
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 May 2016 19:19:32 +0000 (UTC)
Received: by mail-io0-f196.google.com with SMTP id d62so19623404iof.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 May 2016 12:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=9ohpbtpCuIqkO/89V2INvIpV9EkigmtQkRQhS34KpSM=;
	b=Jt2K5NJeqWmEkerplfoQnhijpQzLrQ7keIrOQvbX/eBHoxVt3y9o2ofmxlyhX8zaRO
	wUMwfv0ZhD1h49ijvPqBnzhSn+aNT7yolJOp75HOTO8HAE3Ycb0UEL01i5H1KucqapZI
	liJBmJOQeuEAPv4FRgIbVWMtkwnt/m/3XstVlZvXT+l8AeyObKMmpzz9IF+mP5bctSsh
	HadHmYGhQkb3QrjPoeGczIsGFdECO+ocKJQjAVor/MU/+/lzWA7i4h+pq4tx4p1KHHLd
	yCzVKEWtgM0Fb29dGaAq/qT5kakNKTp/q+2v07zXigTlfyD9jV3IUqzlBfdUK+wlnqNn
	A/Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=9ohpbtpCuIqkO/89V2INvIpV9EkigmtQkRQhS34KpSM=;
	b=QFL5Zq4m3gd+ZsgrbdtHc8pKkoPyoldyoV25wnF1Lwo0AJah1cpKTAwPUz7O1mfHMI
	3WQXBYxueNps2dSNRs4A9GndeGd7whVTr894wN+BA+/P9S01xWodO5LA7Y2GyZW+299z
	zd73tx72a+lFuWG7zqjNdYK2VIO6Iu1Mb2hU5df2SgBv47gbv62sDBIG6k1B0V3OxVD/
	xEG2OuVX7YYo321CkAA+rPvlf20bGmx9U5bhK/ReOaSM+mMSX1lErSSkVhiJStic1p1P
	1EjIAXwcvxL/Xuv1khcSNI7fWKvi2Hlbikiv6XwKdj97eQScPKiqZSc5l3Pkz6tv/4Rr
	k3Dw==
X-Gm-Message-State: AOPr4FVjLlzJt80zYV6rv+42Y5XkHAqcMdvYd0pyUdcHHfA9rIsRhGPno4BjY/Y2EmK9WtGiq/pdcDg92SFITQ==
MIME-Version: 1.0
X-Received: by 10.107.147.138 with SMTP id v132mr36689477iod.38.1462821573159; 
	Mon, 09 May 2016 12:19:33 -0700 (PDT)
Received: by 10.36.81.212 with HTTP; Mon, 9 May 2016 12:19:33 -0700 (PDT)
In-Reply-To: <20160502161809.GD17714@mentor.com>
References: <1462204748-3435-1-git-send-email-akuster808@gmail.com>
	<20160502161809.GD17714@mentor.com>
Date: Mon, 9 May 2016 14:19:33 -0500
Message-ID: <CAFSKS=P_CqdgrO_rcTpGQPNn7Vo1t9MAUmg2-D8RdANiFY9gGQ@mail.gmail.com>
From: George McCollister <george.mccollister@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Armin Kuster <akuster@mvista.com>
Subject: Re: [meta-networking][master][krogoth][jethro][fido][PATCH] ntp: Security fixes via update to 4.2.8p7
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
X-List-Received-Date: Mon, 09 May 2016 19:19:35 -0000
Content-Type: text/plain; charset=UTF-8

4.2.8p7 appears to have been removed from:
https://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/

Not sure if this is temporary...

Regards,
George McCollister

On Mon, May 2, 2016 at 11:18 AM, Joe MacDonald <Joe_MacDonald@mentor.com> wrote:
> [[meta-networking][master][krogoth][jethro][fido][PATCH] ntp: Security fixes via update to 4.2.8p7] On 16.05.02 (Mon 08:59) Armin Kuster wrote:
>
>> From: Armin Kuster <akuster@mvista.com>
>>
>> CVE-2016-1551
>> CVE-2016-2516
>> CVE-2016-2517
>> CVE-2016-2518
>> CVE-2016-2519
>> CVE-2016-1547
>> CVE-2015-7704
>> CVE-2015-8138
>> CVE-2016-1550
>>
>> for more info see:
>> http://support.ntp.org/bin/view/Main/SecurityNotice#April_2016_NTP_4_2_8p7_Security
>>
>> Signed-off-by: Armin Kuster <akuster@mvista.com>
>
> Acked-by: Joe MacDonald <joe_macdonald@mentor.com>
>
>> ---
>>  .../recipes-support/ntp/{ntp_4.2.8p6.bb => ntp_4.2.8p7.bb}            | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>  rename meta-networking/recipes-support/ntp/{ntp_4.2.8p6.bb => ntp_4.2.8p7.bb} (97%)
>>
>> diff --git a/meta-networking/recipes-support/ntp/ntp_4.2.8p6.bb b/meta-networking/recipes-support/ntp/ntp_4.2.8p7.bb
>> similarity index 97%
>> rename from meta-networking/recipes-support/ntp/ntp_4.2.8p6.bb
>> rename to meta-networking/recipes-support/ntp/ntp_4.2.8p7.bb
>> index a7b998a..ff4ba64 100644
>> --- a/meta-networking/recipes-support/ntp/ntp_4.2.8p6.bb
>> +++ b/meta-networking/recipes-support/ntp/ntp_4.2.8p7.bb
>> @@ -23,8 +23,8 @@ SRC_URI = "http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-${PV}.tar.g
>>             file://ntpd.list \
>>  "
>>
>> -SRC_URI[md5sum] = "60049f51e9c8305afe30eb22b711c5c6"
>> -SRC_URI[sha256sum] = "583d0e1c573ace30a9c6afbea0fc52cae9c8c916dbc15c026e485a0dda4ba048"
>> +SRC_URI[md5sum] = "46dfba933c3e4bc924d8e55068797578"
>> +SRC_URI[sha256sum] = "81d20c06a0b01abe3b84fac092185bf014252d38fe5e7b2758f604680a0220dc"
>>
>>  inherit autotools update-rc.d useradd systemd pkgconfig
>>
> --
> -Joe MacDonald.
> :wq
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

