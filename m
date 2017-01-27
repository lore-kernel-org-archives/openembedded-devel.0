Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id B8C1A7198A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jan 2017 01:03:13 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id 75so23594407pgf.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Jan 2017 17:03:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=N/Esvog3yQDlwpNLISuY1/zbr8i/N0vBW4gBgQ0cCq0=;
	b=Wf/znAXdKl0K5rHMSTstNpHKzRL08m0vZH/SRhyP0JbjteP2E0eYkJtbJtwX7rmgOB
	yg8/WuFsxnbxrHSNTxw8w4K6PqXZ3sVLb1tAHmiMt59UZxQ4W0SodHzEL8JGaPgi4j7G
	4m+GDFQCuoEHXzbzeJ/dF3fG4VkktaGgG4xspBvy5cqbn3UEPKNzHBLHyTUlkvn2zKgE
	dnBjuVkzAnag24PXzcDflPaRyGpsl3gzV5vdiZ7fnyDvgKBP92Y4GJlG6JGzTqNOviU5
	owz6Jxy5+akpTsduc2/wznkXeNwK3C3voaGAEEQUH8YuHf1ROmJg+YLroOVPmAHB/gGI
	X5PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=N/Esvog3yQDlwpNLISuY1/zbr8i/N0vBW4gBgQ0cCq0=;
	b=pCCd5wJpXfO39puKzyksWAg1g7U9GjUT2Uz8VoPJ184Rzq4XT0WZ0DQLRvO2YrAUf3
	B6u8sFHeIfyAEut1myazkXjzkYOuYotyBNS4RXmQ3es7uIrKtp10ZowJtr3r2RcoegDM
	pQeMonX+I1DZctL3gYOU95Ugzk1bWstG4SLFs1mHjJ5ma8IPvTaV2UdcQ//kREG+BZr1
	3WkSsk306vec+BNr/lZF1hdzzvMMN3WuY0doDx/0U3K/nPaOfL2RIe0icN5Ndf8oSP/1
	4qabAwBf4fmDhaeO9LO+/sLnlMjQ6ZK8Fo01gTgv3RmRIFxwtdwtAM8pr1vOy/hEQTaK
	CcaQ==
X-Gm-Message-State: AIkVDXJHjDfizTRDvxDBG5crH9NBzuY0v51A6WBn93DXH0IT8S34/4Ttfl1rDdEunTc+Ww==
X-Received: by 10.84.231.139 with SMTP id g11mr5308793plk.110.1485478993680;
	Thu, 26 Jan 2017 17:03:13 -0800 (PST)
Received: from CACSVMO-14452.local (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	w76sm6067139pfd.74.2017.01.26.17.03.12
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 26 Jan 2017 17:03:13 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <1484608187-28597-1-git-send-email-max.krummenacher@toradex.com>
	<CAEHkU3V3UUhzJEeYmNTAqzCWMnq6nbw1PNM12L6cxKmHz5HkRw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <44845cb5-d36c-80a8-a5cd-94238289fb9a@gmail.com>
Date: Thu, 26 Jan 2017 17:02:24 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.6.0
MIME-Version: 1.0
In-Reply-To: <CAEHkU3V3UUhzJEeYmNTAqzCWMnq6nbw1PNM12L6cxKmHz5HkRw@mail.gmail.com>
Subject: Re: [meta-browser][PATCH 1/2] firefox: remove nss private libs setting
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
X-List-Received-Date: Fri, 27 Jan 2017 01:03:14 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

this is ok to install.

On 1/26/17 2:27 PM, Max Krummenacher wrote:
> ping
> 
> Any comments on this one?
> 
> Max
> 
> 
> 2017-01-17 0:09 GMT+01:00 Max Krummenacher <max.oss.09@gmail.com>:
>> Commit 8cc038d uses the system's nss rather than building a private
>> one. So one should remove the nss libs from PRIVATE_LIBS also.
>> Otherwise bitbake does not add nss to RDEPENDS automatically resulting
>> in a potentially missing nss package in an image.
>> Additianlly bitbake shows the following warning:
>>
>> | WARNING: firefox-45.6.0esr-r0 do_package_qa: QA Issue: /usr/lib/firefox/libxul.so
>> |   contained in package firefox requires libnss3.so(NSS_3.12),
>> |   but no providers found in RDEPENDS_firefox? [file-rdeps]
>>
>> Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
>> ---
>>  recipes-mozilla/firefox/firefox_45.6.0esr.bb | 12 ------------
>>  1 file changed, 12 deletions(-)
>>
>> diff --git a/recipes-mozilla/firefox/firefox_45.6.0esr.bb b/recipes-mozilla/firefox/firefox_45.6.0esr.bb
>> index bed50dd..31b3353 100644
>> --- a/recipes-mozilla/firefox/firefox_45.6.0esr.bb
>> +++ b/recipes-mozilla/firefox/firefox_45.6.0esr.bb
>> @@ -95,15 +95,3 @@ PRIVATE_LIBS = "libmozjs.so \
>>                  libmozsqlite3.so \
>>                  libbrowsercomps.so \
>>                  libclearkey.so"
>> -
>> -# mark libraries also provided by nss as private too
>> -PRIVATE_LIBS += " \
>> -    libfreebl3.so \
>> -    libnss3.so \
>> -    libnssckbi.so \
>> -    libsmime3.so \
>> -    libnssutil3.so \
>> -    libnssdbm3.so \
>> -    libssl3.so \
>> -    libsoftokn3.so \
>> -"
>> --
>> 2.6.6
>>

