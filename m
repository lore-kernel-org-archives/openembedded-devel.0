Return-Path: <h4nn35.work@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 8DF8D719BD
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jul 2017 06:09:35 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id k67so29687462wrc.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Jul 2017 23:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ix6yzx2MBhZUJ/MiHBb/FZRLBXRx7z1fd2IbwEIxQ/c=;
	b=q9ezEN26jZUMkYfLDr/RfKwAltZpJuRudRuQex4/snmM0uTPS1uj2hCVdQJ2a/Iw6A
	10VG5Sq0resVF8MzEUc/WfxUohRjrPjlswaOqtsHdp6G+rreSvYD/b3TnfGPi9b8CY3k
	c/a8gCA3Eo3jMePWaWUzInYQBGzaNzEr/DMwGqiKi6K+vmhtLcYrhIv0MVzBuoO2uxFq
	yFSAcBpaiyJt23qlVuHECnJQMqCtlyaMXVTyXdcuy7OmfsV51SHAOxW+8GZtxxi6goCy
	MP7hKmGmnRQzrbR8Yb5YBbbH8YZGxN9oUg9FwDVrxYEcT+jM+AGtgNtjVJujLhhwYD62
	MwVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ix6yzx2MBhZUJ/MiHBb/FZRLBXRx7z1fd2IbwEIxQ/c=;
	b=crKMQPMjVejMe0JgSgwyz4xS2cNwfI7ZmKXk+UW5X9mq0XycnuD25JE7DF5aFfL+ec
	YMhwuX83iEjlG21i9Q+bNLrciVzAq/ec9C/rVQTJqLMgNJ+8X/Ks0+1jsCBMG7RZcSgA
	lNtSENwCFSe4HlJ3NI5nCks1NmiYH/Q0pETp4gBQRr01NgrXNv1zrbm/C4PDIFsFiQfq
	TsxV/tjQMwfbQS2pK4ropUI59BcdMdADa232XvvR7moqBnmQG2W5kBlzo/O42rLU4kWv
	eCypHg3sl1L8YkyhakepmTO6qz7CkEG9MC01TY6e0+2V74/zjAq/ioaE9WAAiwI1QLeQ
	ybfA==
X-Gm-Message-State: AIVw110jRg6pStSWqdxa+h65NrNLHEoOT96h0USjvaSp9/E4Vboy/3sM
	9PYqqKuJMHCDBD/nhAzgr8TD9wvOKA==
X-Received: by 10.28.144.6 with SMTP id s6mr10186526wmd.16.1499753377078; Mon,
	10 Jul 2017 23:09:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.63.69 with HTTP; Mon, 10 Jul 2017 23:09:36 -0700 (PDT)
In-Reply-To: <CAJ86T=XdFKzseQKej3w7rPamzfUmH0391r-hFX=aTquDjtnOew@mail.gmail.com>
References: <20170706093039.30435-1-johannes.pointner@br-automation.com>
	<CAJ86T=XdFKzseQKej3w7rPamzfUmH0391r-hFX=aTquDjtnOew@mail.gmail.com>
From: Johannes Pointner <h4nn35.work@gmail.com>
Date: Tue, 11 Jul 2017 08:09:36 +0200
Message-ID: <CAHvQdo32whF=KGa06f8ZXpMvEL=dOaphbFFfODa_Zv9GUGUk5Q@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] libtinyxml2: upgrade to 5.0.1
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
X-List-Received-Date: Tue, 11 Jul 2017 06:09:37 -0000
Content-Type: text/plain; charset="UTF-8"

2017-07-11 2:13 GMT+02:00 Andre McCurdy <armccurdy@gmail.com>:
> On Thu, Jul 6, 2017 at 2:30 AM, Johannes Pointner
> <johannes.pointner@br-automation.com> wrote:
>> Signed-off-by: Johannes Pointner <johannes.pointner@br-automation.com>
>> ---
>>  .../{libtinyxml2_4.0.1.bb => libtinyxml2_5.0.1.bb}          | 13 ++++++++++++-
>>  1 file changed, 12 insertions(+), 1 deletion(-)
>>  rename meta-oe/recipes-support/libtinyxml2/{libtinyxml2_4.0.1.bb => libtinyxml2_5.0.1.bb} (63%)
>>
>> diff --git a/meta-oe/recipes-support/libtinyxml2/libtinyxml2_4.0.1.bb b/meta-oe/recipes-support/libtinyxml2/libtinyxml2_5.0.1.bb
>> similarity index 63%
>> rename from meta-oe/recipes-support/libtinyxml2/libtinyxml2_4.0.1.bb
>> rename to meta-oe/recipes-support/libtinyxml2/libtinyxml2_5.0.1.bb
>> index 3a6659815..edf836814 100644
>> --- a/meta-oe/recipes-support/libtinyxml2/libtinyxml2_4.0.1.bb
>> +++ b/meta-oe/recipes-support/libtinyxml2/libtinyxml2_5.0.1.bb
>> @@ -6,10 +6,21 @@ LIC_FILES_CHKSUM = "file://tinyxml2.cpp;endline=22;md5=c19221dbd8a66ad3090462af4
>>
>>  SRC_URI = "git://github.com/leethomason/tinyxml2.git"
>>
>> -SRCREV = "74d44acb176f8510abf28ee0a70961eb26631988"
>> +SRCREV = "37bc3aca429f0164adf68c23444540b4a24b5778"
>>
>>  S = "${WORKDIR}/git"
>>
>>  inherit cmake
>>
>> +FILES_${PN} = " \
>> +    ${libdir}/lib*${SOLIBS} \
>> +    ${includedir}/* \
>> +    "
>> +
>> +FILES_${PN}-dev = " \
>> +    ${libdir}/lib*${SOLIBSDEV} \
>> +    ${libdir}/cmake/* \
>> +    ${libdir}/pkgconfig/* \
>> +    "
>> +
>
> These packaging changes look very odd. Can you explain why they're needed?
>
> If the default packaging rules are not sufficient, the preferred
> approach is to add additional patterns just to catch any unpackaged
> files, not to completely replace the default rules.

without these I'll get the following error:

ERROR: libtinyxml2-5.0.1-r0 do_package: QA Issue: libtinyxml2:
Files/directories were installed but not shipped in any package:
  /usr/lib/cmake
  /usr/lib/cmake/tinyxml2
  /usr/lib/cmake/tinyxml2/tinyxml2Targets.cmake
  /usr/lib/cmake/tinyxml2/tinyxml2Targets-noconfig.cmake
  /usr/lib/cmake/tinyxml2/tinyxml2Config.cmake
Please set FILES such that these items are packaged. Alternatively if
they are unneeded, avoid installing them or delete them within
do_install.
libtinyxml2: 5 installed and not shipped files. [installed-vs-shipped]

Then I tried only to add the packaging rules for the dev package, but
then I ran into the next errors:
ERROR: libtinyxml2-5.0.1-r0 do_package: QA Issue: libtinyxml2:
Files/directories were installed but not shipped in any package:
  /usr/include
  /usr/include/tinyxml2.h
Please set FILES such that these items are packaged. Alternatively if
they are unneeded, avoid installing them or delete them within
do_install.
libtinyxml2: 2 installed and not shipped files. [installed-vs-shipped]

So I ended up with the above.
But I'm open for suggestions. Maybe there is a better solution I'm no seeing.

>
>>  BBCLASSEXTEND = "native"
>> --
>> 2.13.2
>>
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

