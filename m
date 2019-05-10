Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by mail.openembedded.org (Postfix) with ESMTP id B7B1A7E09C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 May 2019 14:09:37 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id w1so2661076ljw.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 May 2019 07:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=zazYlntY3DdjUOqrdNWdIKk5wqTFWR86TjJFYxy1O/A=;
	b=TwSPy6MmN1NTd9+aJMmXMLB7wgIrEBs0SYa6ZbFZJXvy3iz4+KD/571t58UkXfjBvf
	m7S15bGldPkNIHE8zvcF1j4M0sAo8zrbgGbg+oG3Vpp+Psh5DlMp72hW2bLqIWfbjWOL
	YxyuFvoH7tSWlJQNM4Dc03diSVThvqrlib258yE4/nJwYVDtYg0d2WndVJyF4S/lV4vW
	6IZpuNQYYG38sIY6+4FfF/IvDacd1u0Z4hxFIpf5VbcHG2hAbTSRLl034Yb6nBZR3zBe
	6RDkFFMApykzJa/TX+Of8XRWKMb8Bz/ZDUS9eFYTY2WCqF7d6MUmLeNnD1W+BfP83i7Z
	1Fmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=zazYlntY3DdjUOqrdNWdIKk5wqTFWR86TjJFYxy1O/A=;
	b=Go9+67fLfFd5FrGxJl+5KT+RriSSEk6PHZ+dwkPOhxn7xtIairgEtIwGI0v+GgaJDx
	pQccu7NDwSN07YfHSb/PKLpdapmwvR1pg/Xkr1TcM3Sq0A/Yu2hGapSvq3fSy1Xnqkw9
	Zg8U/E18LI5X2NZ6skqPaXaHpCE/AqRE0lwVYvIhOc+r6GvirPZStWTV/bmfbztxRLV5
	0geDIWdmAslZCcTKMzlnEiB/jfj4b/EpCja6pYkNR6fyeZDC2V5ZUBdtrzTJCN8ozww8
	2wLBZrjwNH1uHJRKALpil28IPFBmp+oqVUTN0vqXcl9ms7JaEqtrosCuzDqTF0AtrFeY
	2fPg==
X-Gm-Message-State: APjAAAXgWo+LmRy0Q4d5aZrr0GNMBqrf7wL2zek/l3Y0mPzX9suWk5fZ
	hos4497Dh0Ah3Uq2Bykv6HfKI+icfeY=
X-Google-Smtp-Source: APXvYqwSD1NSKvO6wrecLzmwa+39QX3sORXx5XYQiEkla6qWAbolhYsj2dyVE3KGCnomu5GZGA74KQ==
X-Received: by 2002:a2e:85d2:: with SMTP id h18mr6027350ljj.128.1557497378021; 
	Fri, 10 May 2019 07:09:38 -0700 (PDT)
Received: from [192.168.0.8] (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id x6sm1721613ljd.63.2019.05.10.07.09.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 10 May 2019 07:09:37 -0700 (PDT)
To: Khem Raj <raj.khem@gmail.com>
References: <20190507222212.1808-1-open.source@oleksandr-kravchuk.com>
	<CAMKF1so9YYSGVFzLD-9tt-UmRi-x6n3HtK3XiVXo0gQKe0FOXA@mail.gmail.com>
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Message-ID: <d2ad54bc-5333-e1dd-410c-86b6215e3683@oleksandr-kravchuk.com>
Date: Fri, 10 May 2019 16:09:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1so9YYSGVFzLD-9tt-UmRi-x6n3HtK3XiVXo0gQKe0FOXA@mail.gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH][meta-networking] libnetfilter-conntrack: update to 1.0.7
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
X-List-Received-Date: Fri, 10 May 2019 14:09:38 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Resent together with conntrack-tools update which is compatible with
this version.

On 10/05/2019 05:29, Khem Raj wrote:
> Hi Oleksandr
>
> this is breaking conntrack-tools I believe see
>
> https://errors.yoctoproject.org/Errors/Details/239969/
>
> On Tue, May 7, 2019 at 3:22 PM Oleksandr Kravchuk
> <open.source@oleksandr-kravchuk.com> wrote:
>> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
>> ---
>>  ...-conntrack_1.0.6.bb => libnetfilter-conntrack_1.0.7.bb} | 7 +++----
>>  1 file changed, 3 insertions(+), 4 deletions(-)
>>  rename meta-networking/recipes-filter/libnetfilter/{libnetfilter-conntrack_1.0.6.bb => libnetfilter-conntrack_1.0.7.bb} (63%)
>>
>> diff --git a/meta-networking/recipes-filter/libnetfilter/libnetfilter-conntrack_1.0.6.bb b/meta-networking/recipes-filter/libnetfilter/libnetfilter-conntrack_1.0.7.bb
>> similarity index 63%
>> rename from meta-networking/recipes-filter/libnetfilter/libnetfilter-conntrack_1.0.6.bb
>> rename to meta-networking/recipes-filter/libnetfilter/libnetfilter-conntrack_1.0.7.bb
>> index e4e186bdb..5c8150156 100644
>> --- a/meta-networking/recipes-filter/libnetfilter/libnetfilter-conntrack_1.0.6.bb
>> +++ b/meta-networking/recipes-filter/libnetfilter/libnetfilter-conntrack_1.0.7.bb
>> @@ -6,10 +6,9 @@ LICENSE = "GPLv2+"
>>  LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
>>  DEPENDS = "libnfnetlink libmnl"
>>
>> -SRC_URI = "http://www.netfilter.org/projects/libnetfilter_conntrack/files/libnetfilter_conntrack-${PV}.tar.bz2;name=tar \
>> -"
>> -SRC_URI[tar.md5sum] = "7139c5f408dd9606ffecfd5dcda8175b"
>> -SRC_URI[tar.sha256sum] = "efcc08021284e75f4d96d3581c5155a11f08fd63316b1938cbcb269c87f37feb"
>> +SRC_URI = "https://www.netfilter.org/projects/libnetfilter_conntrack/files/libnetfilter_conntrack-${PV}.tar.bz2"
>> +SRC_URI[md5sum] = "013d182c2df716fcb5eb2a1fb7febd1f"
>> +SRC_URI[sha256sum] = "33685351e29dff93cc21f5344b6e628e41e32b9f9e567f4bec0478eb41f989b6"
>>
>>  S = "${WORKDIR}/libnetfilter_conntrack-${PV}"
>>
>> --
>> 2.17.1
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

