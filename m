Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id C7AB67F2D5
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Sep 2019 02:41:00 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id l21so8269961pgm.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Sep 2019 19:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=/Zsv6cH1pHeggUaTt2496S7DtGpTUk+01aVHXPlLY18=;
	b=qUU9kP63j6aoMyk3WIpomWTFPtAgM6Sehx2Gb+K7uuHcI7EVz5+0Y77vfWhc+KZn/J
	BrgmDaVqgFNQfMc8qEpC92H2h3yaj0iwbwIbEf3GAwyiA8eRNlUF/4OzhEXLMqmnTZHF
	ZREsk6KVBaA5ErJbLb6Pne6F4sp2JAWu0wjuLZzUv72UhyY32RDgN5tK0k6phqecCFM5
	rKfj8ZeFXezmGfxSkUhqPvdC8+6snOi/vUCgT2x3iUrhD6CRLQASiKUbYjDwFnfPDmGl
	pSv7W4Mn3Omk/NHWol/jd3it4bEacAwXLj6vJuLFTztdL7CvwA4iGHicdZoJOcJ2MLId
	ll0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=/Zsv6cH1pHeggUaTt2496S7DtGpTUk+01aVHXPlLY18=;
	b=dKfx3Je02dvTVka8sioGHU6GXs2CFT0QO3Enh8UuPaCRJYQewOdhAKwFRNYWtXgM0L
	NWk4O92QjDCHkl7bnK3x9tkmLn2prPdAlNcM3PtXoOffI/j1fHx6uX6XFlQrf1Z+0N5V
	+aZPgMI9JGZK1FStrPtrWygbnvCyyqwXiek+fJ0Rb5sj6KkQvwoll2tbbPv+okNYcujM
	xcK++VposHdCqh76xbw9UsKZs3IGQsA/Nvy7YkJjrFUHHDhMCwIDRka8A585y9e/EP13
	rKEbDXNk/Rzvrg1w1d3qMLRGDb6PqzoIbk2v0cvHJOnbXLoo30HoeQtBXRh5gBN2qP41
	ZpuA==
X-Gm-Message-State: APjAAAVtYRcYyeBMM33MxibWUwZhrN/tX4ENuV4KwYxH+r+sJNkSU6c0
	kmIpNsVmoVJJsZw+zOE+zo6EO1AS
X-Google-Smtp-Source: APXvYqxLunp5AvGoKf4fCbehn7UhrgLzgyx48ghQnQMpYcCM4GTwtlYbR9YjvM0B2Y/SIxwjxusdFQ==
X-Received: by 2002:a17:90a:ba04:: with SMTP id s4mr155219pjr.73.1567478461751;
	Mon, 02 Sep 2019 19:41:01 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:8d1e:9a6d:fc3a:2e51?
	([2601:202:4180:c33:8d1e:9a6d:fc3a:2e51])
	by smtp.gmail.com with ESMTPSA id
	n19sm6003401pfa.67.2019.09.02.19.41.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 02 Sep 2019 19:41:01 -0700 (PDT)
To: Adrian Bunk <bunk@stusta.de>
References: <cover.1567286967.git.akuster808@gmail.com>
	<c9e4dfbcc163fdc33f62419b5c65c057c924247d.1567286967.git.akuster808@gmail.com>
	<20190901063954.GB22307@localhost>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <eef5f4a2-e318-6a33-0465-90cadfd1d8f2@gmail.com>
Date: Mon, 2 Sep 2019 19:41:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190901063954.GB22307@localhost>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [warrior 04/23] network-manager-applet: Remove obsolete dbus-glib and libnm-glib dependencies
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
X-List-Received-Date: Tue, 03 Sep 2019 02:41:00 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 8/31/19 11:39 PM, Adrian Bunk wrote:
> On Sat, Aug 31, 2019 at 02:31:25PM -0700, Armin Kuster wrote:
>> From: Adrian Bunk <bunk@stusta.de>
>>
>> network-manager-applet stopped using dbus-glib 3 years ago.
>>
>> Building of the obsolete libnm-gtk is disabled by default in 1.8.20.
>> ...
> This commit is not really appropriate for stable branches.

thanks for the feedback.

removed from list.

-armin
>
>> --- a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.8.20.bb
>> +++ b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.8.20.bb
>> @@ -2,7 +2,7 @@ SUMMARY = "GTK+ applet for NetworkManager"
>>  LICENSE = "GPLv2"
>>  LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
>>  
>> -DEPENDS = "gtk+3 libnotify libsecret networkmanager dbus-glib \
>> +DEPENDS = "gtk+3 libnotify libsecret networkmanager \
>> ...
> That's a cleanup change removing an unused build dependency with
> no (intentional) changes to the built binaries.
>
>> --- a/meta-gnome/recipes-connectivity/networkmanager/networkmanager_%.bbappend
>> +++ /dev/null
>> @@ -1,3 +0,0 @@
>> -# networkmanager-applet requires glib support
>> -PACKAGECONFIG_append = " glib"
>> ...
> The bbappend might not be nice, but removing it would be a behaviour 
> change in a stable branch.
>
> cu
> Adrian
>


