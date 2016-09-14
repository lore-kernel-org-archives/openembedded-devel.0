Return-Path: <martin.jansa@gmail.com>
Received: from mail-yw0-f195.google.com (mail-yw0-f195.google.com
	[209.85.161.195])
	by mail.openembedded.org (Postfix) with ESMTP id 96F6C731B9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Sep 2016 14:39:02 +0000 (UTC)
Received: by mail-yw0-f195.google.com with SMTP id g192so1140213ywh.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Sep 2016 07:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=kiJSI0nXz4aGtVf/VvJ90+tXAbKmeZ1hhXapwQhNjAs=;
	b=QAQjfqlxWzIZmU0Dg1u4x5MOl0O0NdXgtKKXPk/FKoUWTuZwwCcQtECKs/DviU5jl6
	zgGMexulf/JpuHRkJlAVzYWvDxZuW/2qVTM/ZhHAwSILyqeEJwuNgxc2RzJ54EBK/q1q
	oXmFF5QgAGBEpI74gHg4qoScZtVhySvp07oA5k9GxF7T2Hi+F/dWvhfivUBZPhygLoXL
	oxa0buo65pDB0ctC5jBikCzzMwgG6c+xQAR7mSlVrDLwTYMwOEBxsqnVp3rBcSVUFVu+
	U3x2X9wrcggAo4ptxA95as4bePq2j4WICiWxntjmbrt86ELC7MauwP/MKndf0g10c1FD
	mXBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=kiJSI0nXz4aGtVf/VvJ90+tXAbKmeZ1hhXapwQhNjAs=;
	b=au07ytnuv63LbBqK5hg4OOGEXNkVwcyeq4spLogENlYxvrrNG9V3R11MBRZVbAn0lT
	vEsg6jXaSqOgaN/pnE8/EiUvFdCSzCZsO7OOsXQwmtzFP3J4qJE7vejJuSrQwApkgww0
	pNSzbeOS2D0b7auGyhJCTSMwycSgbT5CEvzXjnHwqfihRZwbwsTZSGIii738/r+eFcrx
	nzgjm7JgVQUp2ZwvQ7vMO3eNjtj+Y6FO3mAHzG3ogEFNCA/7k8pWcavjkYR2SULdr8OW
	MN8mBToEJeM2egi8S67mMzBJvvjicVTBcPoJw55j2CklSEBKa/jO6uXyvwMlgnnjaqnw
	ZP2A==
X-Gm-Message-State: AE9vXwNqbWrSuvcKTY/G+AMmIpfJrAnaf0XGKZF+ZFruxpcnRlEja2bqLNvoWv8eyxHV1VtUR6WJmieT6B8VmQ==
X-Received: by 10.129.125.66 with SMTP id y63mr2898906ywc.46.1473863942602;
	Wed, 14 Sep 2016 07:39:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.154.225 with HTTP; Wed, 14 Sep 2016 07:38:26 -0700 (PDT)
In-Reply-To: <57D93AB0.2010305@topic.nl>
References: <17c49fd3-d0d9-d00f-69d9-07656bee9c00@gmail.com>
	<57D93AB0.2010305@topic.nl>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 14 Sep 2016 16:38:26 +0200
Message-ID: <CA+chaQeraoVUDBe9+14AWxo5OSyNf2rjwbCyus+qc1thd1AdmA@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [PATCH] libnl: Fix possible host contamination error
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
X-List-Received-Date: Wed, 14 Sep 2016 14:39:03 -0000
Content-Type: text/plain; charset=UTF-8

This also needs to go to openembedded-core not -devel.

On Wed, Sep 14, 2016 at 1:55 PM, Mike Looijmans <mike.looijmans@topic.nl>
wrote:

> Usually this is the result from using a "cp" (typically "cp -r") command
> in the install script instead of "install". Use "install" if possible,
> patch the makefile if you have to. If the install script uses "cp -r", add
> a few extra --preserve options to the command to prevent it overriding
> ownership.
>
>
> On 14-09-16 12:45, Mats Karrman wrote:
>
>>  From 975b7e64462a465449d367ff6a4e5240a59221d9 Mon Sep 17 00:00:00 2001
>> From: =?UTF-8?q?Mats=20K=C3=A4rrman?= <mats@southpole.se>
>> Date: Wed, 14 Sep 2016 12:29:27 +0200
>> Subject: [PATCH] libnl: Fix possible host contamination error
>>
>> ---
>>   meta/recipes-support/libnl/libnl_3.2.28.bb | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>>   Possibly a cannon to swat a fly but I get "WARNING: libnl-1_3.2.28-r0
>> do_package_qa: QA Issue: libnl: /libnl-nf/usr/lib/libnl-nf-3.so.200.23.0
>> is
>> owned by uid 1001, which is the same as the user running bitbake. This
>> may be
>> due to host contamination [host-user-contaminated]"
>>   type errors on every file.
>>
>> diff --git a/meta/recipes-support/libnl/libnl_3.2.28.bb
>> b/meta/recipes-support/libnl/libnl_3.2.28.bb
>> index 26982f3..3fcfbc1 100644
>> --- a/meta/recipes-support/libnl/libnl_3.2.28.bb
>> +++ b/meta/recipes-support/libnl/libnl_3.2.28.bb
>> @@ -23,6 +23,10 @@ SRC_URI[sha256sum] =
>> "cd608992c656e8f6e3ab6c1391b162a5a51c49336b9219f7f390e61fc5
>>
>>   inherit autotools pkgconfig
>>
>> +do_install_append() {
>> +    chown -R root:root ${D}
>> +}
>> +
>>   FILES_${PN} = "${libdir}/libnl-3.so.* \
>>                  ${libdir}/libnl.so.* \
>>                  ${sysconfdir}"
>>
>
>
>
> Kind regards,
>
> Mike Looijmans
> System Expert
>
> TOPIC Products
> Materiaalweg 4, NL-5681 RJ Best
> Postbus 440, NL-5680 AK Best
> Telefoon: +31 (0) 499 33 69 79
> E-mail: mike.looijmans@topicproducts.com
> Website: www.topicproducts.com
>
> Please consider the environment before printing this e-mail
>
> Topic zoekt gedreven (embedded) software specialisten!
> http://topic.nl/vacancy/topic-zoekt-technische-software-engineers/
>
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

