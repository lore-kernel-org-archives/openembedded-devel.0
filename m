Return-Path: <gordan.markus@pelagicore.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 9D1F077156
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Aug 2016 10:52:39 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id f65so83276058wmi.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Aug 2016 03:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=pelagicore-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=4aXk1ZgGvYLLmcef4kcXKmB2ujf2LWWsjtsQj8l4AlA=;
	b=L4geGFxwpjS435RVbyyu7t2GGbu1B0XlUU4HPlDVAGbdTcwepGN4yjDhkmOjm/2o+Y
	1lC4kBt9CMnpERME7kS8A1wYfvBDjxttOvJ5bgMvrpBba+J0dlctAtwnF/Wej0OcGlnw
	yQJ5M3e9OX32Eb7KO8ArZmwfJRCtzS6py/Ml+zVK0RHLt8p8sE8Awam3wkJ8jxVrTN7J
	lvhZoo1B3EmPdMdQs10dWxFiM2JuAp2rF6IcStQm/kCSN5pSdWCaKH0GQM2vZRluZHzy
	+0uwZmmGqzKFZ9wsDCOKzhjsNStHlfTAV64deWoKrssatFBZop648hQfM+lSuK8CQBeS
	XJQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=4aXk1ZgGvYLLmcef4kcXKmB2ujf2LWWsjtsQj8l4AlA=;
	b=gKSIyDPdrRVEcHM9D1NzyRTl5ZjMjRM35/tXoF4p51YDuDz0zERJBV3Wzq7CuWeR5l
	bJUGlXwQJXuRO2dTg/WgPZYpjDVa47yWKECTo++ptiLnjccOzh8gBu7bHNeElgnlFYO7
	n/mXQQ5Uc8D7RkithrP7xHtARPJ3+XNCdGZoqlvMxwZQZWcKbv/GDwbN+g37UUgcQVte
	GywNrtENeaWOr/m8fmDBZi6hpWBV0gtvvy6d17+5H4tuhBef72pxlwgnYJzHhHidYRDQ
	NurfX72N/SxHdEI8h+XTiDPYHCHa5XYyjnn3fQMurQF9OQawlt3Cdvip2bKSBE2+ouFz
	/tTg==
X-Gm-Message-State: AEkoousNqJCuzW3athQVMj+YnCj5223IGgnMwi8ZZyDY43r4LUdukxaXVQKumcsZ72QQTiC4
X-Received: by 10.25.42.82 with SMTP id q79mr5015537lfq.102.1471258359068;
	Mon, 15 Aug 2016 03:52:39 -0700 (PDT)
Received: from [192.168.70.35] ([212.247.53.108])
	by smtp.gmail.com with ESMTPSA id
	h62sm3757169lji.28.2016.08.15.03.52.37
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 Aug 2016 03:52:38 -0700 (PDT)
To: openembedded-devel@lists.openembedded.org
References: <1469014819-17231-1-git-send-email-gordan.markus@pelagicore.com>
	<CAP9ODKqggtFoq0N9NdrL+0-yFk6PtbyOD6ozZJHrGeKHO_NyXA@mail.gmail.com>
From: =?UTF-8?Q?Gordan_Marku=c5=a1?= <gordan.markus@pelagicore.com>
Message-ID: <31249664-2de3-b68c-1cf5-e5755a9944ae@pelagicore.com>
Date: Mon, 15 Aug 2016 12:52:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <CAP9ODKqggtFoq0N9NdrL+0-yFk6PtbyOD6ozZJHrGeKHO_NyXA@mail.gmail.com>
Subject: Re: [meta-qt5][PATCH] qt5: update the recipes to the latest LTS stable Qt 5.6.1-1
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
X-List-Received-Date: Mon, 15 Aug 2016 10:52:40 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Otavio,
Unfortunately, I was on vacation.
Though, I see that Martin has already updated the Qt 5.6 version with 
the following commit "[oe] [meta-qt5][krogoth][PATCH] qt5: upgrade to 
latest revisions in 5.6 branch".
Thanks for the reply!

On 2016-07-22 21:29, Otavio Salvador wrote:
> On Wed, Jul 20, 2016 at 8:40 AM, Gordan Markuš
> <gordan.markus@pelagicore.com> wrote:
>> * The Qt 5.6 release featured a severe bug where the
>> Qt Quick applications would crash after some time (QTBUG-53761)
>>
>> * qtdeclarative: Fix crashes when incubating objects asynchronously
>> with initial properties
>> * qtdeclarative: QML: Only release types if they aren't referenced anymore
> Missing the Signed-off-by. Please send a new patch revision and I can apply it.
>
>

-- 

Gordan Markuš
Embedded Linux Software Developer

Pelagicore AB
Ekelundsgatan 4, 6tr, SE-411 18 Gothenburg, Sweden
+46 (0)7333 04579
gordan.markus@pelagicore.com
www.pelagicore.com

Registered Office Gothenburg, Sweden
Registration No. 556780-4199



