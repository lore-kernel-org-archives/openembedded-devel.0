Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 3473C65CBB
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jan 2017 04:35:56 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id f144so6449203pfa.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Jan 2017 20:35:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=niVSPkz1miCUX8NINh6nZwZuRD2z+reFpaFHpiYH7dY=;
	b=ukLyi78N4xJNAYKo1v3t7cFNwFCJCRfcZMVp6yIq1nfxmPGEVhiZ7JFOdXw1g8GT4V
	ggqa+AByOMDcIQPtoraRu+4fJW3HmaVtNFDFjIy+J4uENyRFz5nZJkUqEiuyHrMbI4BS
	5VdHR3jdciFSMLF1yHSub1/bsaRELXR6UCTPOye/7FtjRI1Nci4rVuWZgFeYFEvf7gAP
	ILWCxc3HszRCx20khmsMd7Ayz/4UKNiLlycyde8XTvZDeDF69Y5+W/nJIySQQPgDdHZZ
	r+Rzlxx7tMlu+jQuad9RbO6Hml9Gb3wXjAYx9wcYN7rvyQ6R9ZT2zOl1UnWiRBBGtadT
	kIcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=niVSPkz1miCUX8NINh6nZwZuRD2z+reFpaFHpiYH7dY=;
	b=IfqFIa7ZXv2n9cmllKcTY4GgBbQzOfTz5QPG2MQTa7pfH/XCMq5Nw3JaubF1WQ/Mqg
	GBzwcY/K5cghIfYVPVW5l775F17eskJeKrPdsUgXfLnDe0utLz0fsmsCQLWyI6XqAUtc
	2/59mYSYBfwBsv4+gZtqBZh4mkih4yZSux30Taj4/p4XESAtCEXrKDwjHdX4b0I7fT69
	OU0ROS6IlOxEphEttf7jhKPTDYwo2LSPhdo8XZW7IYulrA1ZnFhpoJBr+KLfa0Vr6mlr
	qE8D3O4cSiSfSajXge/MxeDTa2lLNJQ7fNhcDHO6T27jYdoDdF21E1j9Jn/8RaJ1f79y
	SFFw==
X-Gm-Message-State: AIkVDXION8BiNtMvNM9VuDP4fLORe51UNRxIzSmYoF3ZkcdCQck/feOxWk65EscLwAy3KQ==
X-Received: by 10.84.129.131 with SMTP id b3mr26317671plb.54.1484282156811;
	Thu, 12 Jan 2017 20:35:56 -0800 (PST)
Received: from CACSVMO-14452.local ([2601:646:8882:b8c:fd99:2908:b743:c6c])
	by smtp.gmail.com with ESMTPSA id
	f65sm25089597pfk.5.2017.01.12.20.35.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Jan 2017 20:35:56 -0800 (PST)
To: openembedded-devel@lists.openembedded.org,
	Andre McCurdy <armccurdy@gmail.com>
References: <1484267158-15077-1-git-send-email-armccurdy@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <da346d5f-3311-468c-bf56-46dd55d65115@gmail.com>
Date: Thu, 12 Jan 2017 20:35:55 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:50.0)
	Gecko/20100101 Thunderbird/50.0
MIME-Version: 1.0
In-Reply-To: <1484267158-15077-1-git-send-email-armccurdy@gmail.com>
Subject: Re: [meta-oe][PATCH] syslog-ng: drop attempts to disable LFS
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
X-List-Received-Date: Fri, 13 Jan 2017 04:36:00 -0000
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 1/12/17 4:25 PM, Andre McCurdy wrote:
> Forcefully disabling Large File Support in packages which enable it
> by default is probably not the right thing to do anymore. Since the
> syslog-ng configure.in file has been renamed to configure.ac, the
> existing sed command would fail anyway.

Yes, moreover I think largefile support is more or less core feature now
a days.

> 
> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
>  meta-oe/recipes-support/syslog-ng/syslog-ng.inc | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
> index 0acdd73..4a66272 100644
> --- a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
> +++ b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
> @@ -56,10 +56,6 @@ PACKAGECONFIG[json] = "--enable-json,--disable-json,json-c,"
>  PACKAGECONFIG[tcp-wrapper] = "--enable-tcp-wrapper,--disable-tcp-wrapper,tcp-wrappers,"
>  PACKAGECONFIG[geoip] = "--enable-geoip,--disable-geoip,geoip,"
>  
> -do_configure_prepend() {
> -    eval "${@bb.utils.contains('DISTRO_FEATURES', 'largefile', '', 'sed -i -e "s/-D_LARGEFILE_SOURCE//" -e "s/-D_FILE_OFFSET_BITS=64//" ${S}/configure.in', d)}"
> -}
> -
>  do_install_prepend() {
>      sed -i -e 's,@SBINDIR@,${sbindir},g' ${S}/contrib/systemd/*.service
>      sed -i -e 's,@LOCALSTATEDIR@,${localstatedir},g' ${S}/contrib/systemd/*.service
> 

