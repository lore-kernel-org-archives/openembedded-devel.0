Return-Path: <samuli.piippo@gmail.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id E26DE76A51
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Sep 2015 13:21:27 +0000 (UTC)
Received: by wicge5 with SMTP id ge5so7083041wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Sep 2015 06:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-type:content-transfer-encoding;
	bh=EEDidQ44rxFN9PYqmX5WNvnuyynN2mimo2toSK+Ik+E=;
	b=D0/n7mn/Xqpz+S9MWQGhAJF8vmtGP/19kLvWuiGnrPbNn8///JTdzSi2q0hzKLN8q5
	6ORMXc/fVBfynzzL+APwYCEnenO8i3nQesuxvCEsJN1q9U4fb02I9+u71VH83rkHhbDJ
	ttpk3qkkTOe/qOlQS/ftSuEjPmE+OWqd9vmycT6QO7ws4g66VM+k1EZ8xQ+dmUY2lbrY
	JqgYXzqdpPjiC9bZ6qyjGdx2dR1rUU1OWTZtMpIscJQGcY1juH+iFBxuWKXNl+NeKpEf
	UXYwDlNzxC69l/Ff4FyqywtLBjjaUbJClac6VXz4q7Hya6eWlBE6li1dhO2yTDz6fvmx
	2q5g==
X-Received: by 10.194.205.68 with SMTP id le4mr2156040wjc.74.1441113686751;
	Tue, 01 Sep 2015 06:21:26 -0700 (PDT)
Received: from [10.9.5.47] ([91.217.248.11])
	by smtp.googlemail.com with ESMTPSA id
	cx1sm2959219wib.0.2015.09.01.06.21.25
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 01 Sep 2015 06:21:25 -0700 (PDT)
To: openembedded-devel@lists.openembedded.org
References: <cover.1440502860.git.samuli.piippo@theqtcompany.com>
	<f7c705865ed574150e379a05345febead2237e07.1440502860.git.samuli.piippo@theqtcompany.com>
	<55E2FBD7.9020404@gmail.com>
From: Samuli Piippo <samuli.piippo@gmail.com>
X-Enigmail-Draft-Status: N1110
Message-ID: <55E5A655.8000300@gmail.com>
Date: Tue, 1 Sep 2015 16:21:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <55E2FBD7.9020404@gmail.com>
Subject: Re: [meta-qt5][PATCH v2 01/11] qt5: make populate_sdk_qt5 reusable
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 01 Sep 2015 13:21:30 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 30.08.2015 15:49, Jonathan Liu wrote:
> On 25/08/2015 9:43 PM, Samuli Piippo wrote:
>> Move task definitions from populate_sdk_qt5.bbclass to the toolchain
>> recipe,
>> so that populate_sdk_qt5 can be reused in different toolchain meta
>> recipes.
>>
>> Signed-off-by: Samuli Piippo <samuli.piippo@theqtcompany.com>
>> ---
>>   classes/populate_sdk_qt5.bbclass      | 5 -----
>>   recipes-qt/meta/meta-toolchain-qt5.bb | 4 ++++
>>   2 files changed, 4 insertions(+), 5 deletions(-)
>>
>> diff --git a/classes/populate_sdk_qt5.bbclass
>> b/classes/populate_sdk_qt5.bbclass
>> index 79df489..d29ec36 100644
>> --- a/classes/populate_sdk_qt5.bbclass
>> +++ b/classes/populate_sdk_qt5.bbclass
>> @@ -1,8 +1,5 @@
>>   # Copyright (C) 2014 O.S. Systems Software LTDA.
>> -TOOLCHAIN_HOST_TASK += "nativesdk-packagegroup-qt5-toolchain-host"
>> -TOOLCHAIN_TARGET_TASK += "packagegroup-qt5-toolchain-target"
>> -
>>   # This allow reuse of Qt paths
>>   inherit qmake5_paths
>> @@ -33,5 +30,3 @@ create_sdk_files_prepend () {
>>       echo 'HostPrefix = ${SDKPATHNATIVE}' >> $qtconf
>>       echo 'HostBinaries = ${SDKPATHNATIVE}${OE_QMAKE_PATH_HOST_BINS}'
>> >> $qtconf
>>   }
>> -
>> -FEATURE_PACKAGES_qtcreator-debug = "packagegroup-qt5-qtcreator-debug"
>> diff --git a/recipes-qt/meta/meta-toolchain-qt5.bb
>> b/recipes-qt/meta/meta-toolchain-qt5.bb
>> index 8991176..11b7962 100644
>> --- a/recipes-qt/meta/meta-toolchain-qt5.bb
>> +++ b/recipes-qt/meta/meta-toolchain-qt5.bb
>> @@ -5,3 +5,7 @@ LIC_FILES_CHKSUM =
>> "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d
>>
>> file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
>>   inherit populate_sdk populate_sdk_qt5
>> +
>> +TOOLCHAIN_HOST_TASK += "nativesdk-packagegroup-qt5-toolchain-host"
>> +TOOLCHAIN_TARGET_TASK += "packagegroup-qt5-toolchain-target"
>> +FEATURE_PACKAGES_qtcreator-debug = "packagegroup-qt5-qtcreator-debug"
> If someone had already copied meta-toolchain-qt5 into their own layer
> and modified it, this would be a breaking change for them as they need
> to make the same changes in their own toolchain recipe. I wonder if it
> would be better if the reusable part of populate_sdk_qt5.bbclass was
> split off into populate_sdk_qt5_base.bbclass instead and inherited by
> populate_sdk_qt5.bbclass.
>
> Regards,
> Jonathan

That sounds reasonable to me.

-samuli

