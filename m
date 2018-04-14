Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id 3B8C2602D9
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Apr 2018 22:36:59 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id a39-v6so7969897pla.10
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Apr 2018 15:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=nS0m+2P4iEdnDCkXOAPwpfPCXyBbl03QO5/0X1ObS6c=;
	b=ewOdj6lETgdtLUUAw3RIRMy4XJgd7D14JHX20d3P1ddy19zjksgA5p0V/lEKJJGyct
	/PtZ2pLQL2P0iqdsSr8aCPiPxBJ7vBYcKJk9IHI2CZH1Z/72hX0Gu2YQJV/D/GzF3/vu
	D7AFmO/oQAiKd/hxegdqaQNEL6sbdrnDGd/jyxh+BuXV7WPMPuYbr7cpEcV9m/+uY95q
	xGBXNspjaaypTEL5PkUGQP0xiglnP9vJJkDU/cyRRFbacxZBjkmCzCAp7FjQCHDPUcSW
	InrShZ0EjrlL8rASuqSWQITSUCge2XbghVQ/Bf0oyw9Wv+766DunRKg5ylAuf7QxkRN0
	VAiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=nS0m+2P4iEdnDCkXOAPwpfPCXyBbl03QO5/0X1ObS6c=;
	b=NaFg94edjavJAKg2VQmLYX2dTeiLHbYRvmQ0VAi+NQf8+6L6BZgVc2w3EfH/9+y7qY
	05n5UlU7fsDJuVj0JGpmFLQ4cOKjOPeIgR3q82et8lwDZxX54GGdwJC7Md0tiDBGq6xN
	IpXA0pdNDN1sRaVwexwosVTpD+0q5eQUfr0t3Gvvi6cmer+e2Iz2+YtH9EZSa7TIBvog
	3w85+cgXJVM+Cc4AbYgXZXrWpi/GlVVFjo00GawSUNQYPFA33G467q/rEVoxE8N43TwB
	fPLuY3l9DUtJKc+pIFUbGTyIMVW1WO0c5T8YdezBH2u9hJC/Rv7fbTXgDstDQmf20q45
	VzpA==
X-Gm-Message-State: ALQs6tCsaGwTGhfrRUWx18DIa/eNKYqe2FGd9vGN4rJKlplcqSC5QoGJ
	jLeLFDWIltDdGeb1skZ/gZcYyw==
X-Google-Smtp-Source: AIpwx49HcRfPRIq1DSKBjwW1dt6iIE+pzhqKhSn1NnJzzhS9sb0zI8PdXgSOhP4vbi1sY7n484qNhQ==
X-Received: by 2002:a17:902:8490:: with SMTP id
	c16-v6mr10115636plo.132.1523745420665; 
	Sat, 14 Apr 2018 15:37:00 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1184:19e4:d7e5:ee20:78ac?
	([2601:202:4000:1184:19e4:d7e5:ee20:78ac])
	by smtp.gmail.com with ESMTPSA id a1sm16263472pff.5.2018.04.14.15.36.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 14 Apr 2018 15:37:00 -0700 (PDT)
To: =?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@gmail.com>
References: <1522465461-19511-1-git-send-email-akuster808@gmail.com>
	<CALbNGRQhEfExsH2odx2r_NwQuAzzBN6bSV0GMhhX4nc7dDUKTg@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <2ff7c81c-0c57-f666-8141-bf9659e3e0a7@gmail.com>
Date: Sat, 14 Apr 2018 15:36:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <CALbNGRQhEfExsH2odx2r_NwQuAzzBN6bSV0GMhhX4nc7dDUKTg@mail.gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] networkmanager: Fix many typos in DISTRO_FEATURES PACKAGECONFIG decodes
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
X-List-Received-Date: Sat, 14 Apr 2018 22:37:00 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 04/13/2018 01:25 PM, Andreas Müller wrote:
> On Sat, Mar 31, 2018 at 5:04 AM, Armin Kuster <akuster808@gmail.com> wrote:
>> fixes issues found with yocto-check-layer
>>
>>  File "/home/akuster/oss/maint/openembedded-core/bitbake/lib/bb/data_smart.py", line 436, in DataSmart.expand(s="nss ifupdown netconfig dhclient dnsmasq     ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'consolekit', '', d)}     ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', '${BLUEZ}', '', d)}     ${@bb.utils.contains('DISTRO_FEATURES', 'wifi', '', d)} ", varname='PACKAGECONFIG'):
>>          def expand(self, s, varname = None):
>>     >        return self.expandWithRefs(s, varname).value
>>
>>   File "/home/akuster/oss/maint/openembedded-core/bitbake/lib/bb/data_smart.py", line 426, in DataSmart.expandWithRefs(s="nss ifupdown netconfig dhclient dnsmasq     ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'consolekit', '', d)}     ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez5', '', d)}     ${@bb.utils.contains('DISTRO_FEATURES', 'wifi', '', d)} ", varname='PACKAGECONFIG'):
>>                  except Exception as exc:
>>     >                raise ExpansionError(varname, s, exc) from exc
>>
>> bb.data_smart.ExpansionError: Failure expanding variable PACKAGECONFIG, expression was nss ifupdown netconfig dhclient dnsmasq     ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'consolekit', '', d)}     ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez5', '', d)}     ${@bb.utils.contains('DISTRO_FEATURES', 'wifi', '', d)}  which triggered exception TypeError: contains() missing 1 required positional argument: 'd'
>>
>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>> ---
>>  .../recipes-connectivity/networkmanager/networkmanager_1.10.6.bb   | 7 ++++---
>>  1 file changed, 4 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.10.6.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.10.6.bb
>> index f201a75..d90b782 100644
>> --- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.10.6.bb
>> +++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.10.6.bb
>> @@ -59,11 +59,12 @@ do_compile_prepend() {
>>  }
>>
>>  PACKAGECONFIG ??= "nss ifupdown netconfig dhclient dnsmasq \
>> -    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', \
>> -    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'consolekit', '', d), d)} \
>> +    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
>> +    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'consolekit', '', d)} \
> ^ Whatever magic scripts wants to tell us: I think this was OK before.
>
> The patch turns the logic. Intended is:
>
> For systemd in DISTRO_FEATURES: PACKAGAGECONFIG +=systemd
> For systemd NOT in DISTRO_FEATURES *AND* x11 in DISTRO_FEATURES:
> PACKAGAGECONFIG +=consolekit
>
> By the way I did the similar mistake (+broke parsing really) in V1 of
> gobject-introspection-patch. Checking logs I found
>
> commit b55738ef8d30d6aa92e2e644a50f4b06ec541204
> Author: Jackie Huang <jackie.huang@windriver.com>
> Date:   Mon Nov 13 16:04:18 2017 +0800
>
>     networkmanager: add consolekit only when x11 is enabled
>
>     consolekit depends on virtual/libx11 then it requires x11
>     distro feature, so add consolekit option only when x11
>     is in DISTRO_FEATURES.
>
>     Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
>     Signed-off-by: Armin Kuster <akuster808@gmail.com>
>     Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
>
> That helped me to remember what was intended.
>
> To avoid this in the future I suggest to have systemd/consolekit in
> one line. That should make it more clear.
>
> Shall I send a patch on top of master-next?
yes please.

- armin
>
> Andreas


