Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id C0DF96E650
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Nov 2016 10:40:10 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id u144so4573753wmu.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Nov 2016 02:40:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dominion-thruhere-net.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=i26VgiTfwFg6Vw9sBFAh8iWmTjs/7Oth1z2FWoc8FJU=;
	b=hYOHLg3nwJYyFSpniLzIrQOygmDbyJrkZq702oAKy+MRsxwy7JM74smOa+jIVONE8X
	ocGFQJhGGKjXICEowGuzyUVT4uKVEStpL5x7gtxT2/OLENNl4bwaxkZA775fFzaypln2
	oG4NpYpKlykivhrto8arkLnV7xM9I9+TlJqhkg/dU+BSWUBkU0aFLxCCx+uHCXEogvki
	QumnsUPI7RxiEhEP10Os+csHivGfEUSd/fkpyHX7k9wXtXIBJhk8aYs2OkclK1UKxkx3
	de/3IpioxRCrDaiJGnOdCdmWDKmr/cBORqYrOsfCViyIYLT1wP7veeiGF/X80MBng5L6
	7BEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=i26VgiTfwFg6Vw9sBFAh8iWmTjs/7Oth1z2FWoc8FJU=;
	b=HLnGBXvNgyv8bhfKkkQAAcaidb9J7abnhMtI2WIREe43RnUkPTmn29Q4imD9gEQEMn
	+O9YHdT06yVoJz1HaMtTfm1TMq18dAza1Z9tkZNt/mC11RL+OljhzwVCXWoRSyexs7O+
	UCYoeBfAbdBvYKeCmD0cUSbC8Yj3rfOlrLjqPXdbKSGwfxtmspu70Y2Pq72kS6CxLrex
	iuwlq/O9JQsEeLkeJZ+oIoDF75e/ubwnQq98l8xILwIRszBDR/DFN4djFGs4DBrxKSJo
	J5kA9Zob+QejNENKBALIolPxi66pGtVESVj6i12pLLDQdHzZOSWigdXWs2nntGnrc8dh
	q49A==
X-Gm-Message-State: AKaTC01s1xYEcfn5h/fyXBG3sVapxZ3gvJ/9K+lXLOTTr2JmxOpOTuMPP4py7FFadHkqvg==
X-Received: by 10.28.138.137 with SMTP id m131mr1698906wmd.118.1479984011316; 
	Thu, 24 Nov 2016 02:40:11 -0800 (PST)
Received: from iMac.local (ip4da29576.direct-adsl.nl. [77.162.149.118])
	by smtp.gmail.com with ESMTPSA id
	e188sm7508697wma.21.2016.11.24.02.40.10
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 24 Nov 2016 02:40:10 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <20161124055713.23487-1-jackie.huang@windriver.com>
From: Koen Kooi <koen@dominion.thruhere.net>
Message-ID: <f95790bd-1e5b-3666-e042-a1fe7aded164@dominion.thruhere.net>
Date: Thu, 24 Nov 2016 11:40:09 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20161124055713.23487-1-jackie.huang@windriver.com>
Subject: Re: [meta-networking][PATCH] samba: fix the hardcoded path in init script
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
X-List-Received-Date: Thu, 24 Nov 2016 10:40:11 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Op 24-11-16 om 06:57 schreef jackie.huang@windriver.com:
> From: Jackie Huang <jackie.huang@windriver.com>
> 
> Replace the hardcoded path with base_bindir in init script to fix the
> error: /etc/init.d/samba.sh: line 15: /usr/bin/ps: No such file or
> directory /etc/init.d/samba.sh: line 17: /usr/bin/sed: No such file or
> directory /etc/init.d/samba.sh: line 16: /usr/bin/grep: No such file or
> directory
> 
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com> --- 
> meta-networking/recipes-connectivity/samba/samba_4.4.5.bb | 1 + 1 file
> changed, 1 insertion(+)
> 
> diff --git a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
> b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb index
> e9694d4..6c1e3ef 100644 ---
> a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb +++
> b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb @@ -111,6
> +111,7 @@ do_install_append() { -e
> 's,/opt/samba/smb.conf,${sysconfdir}/samba/smb.conf,g' \ -e
> 's,/opt/samba/log,${localstatedir}/log/samba,g' \ -e
> 's,/etc/init.d/samba.server,${sysconfdir}/init.d/samba.sh,g' \ +
> -e 's,/usr/bin,${base_bindir},g' \ -i ${D}${sysconfdir}/init.d/samba.sh 
> fi

Wouldn't it be better to completely remove the absolute paths?


