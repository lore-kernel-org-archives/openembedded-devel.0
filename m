Return-Path: <lpapp@archlinux.us>
Received: from mail-pb0-f42.google.com (mail-pb0-f42.google.com
	[209.85.160.42])
	by mail.openembedded.org (Postfix) with ESMTP id A37F86BEF5
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Sep 2013 14:58:12 +0000 (UTC)
Received: by mail-pb0-f42.google.com with SMTP id un15so6107534pbc.29
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Sep 2013 07:58:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=Mv5UZPyHPQEjq+y9F8OzFdJw0ZHu5gAV2jvjPBTXG8s=;
	b=Sycm9Kd8f/mjPZ4TZyXHUEm+talJWHxh2RCdpNFGjukKzaVFs4daZ/2r30HUVzZbWT
	bwIUfLBIa0toCH1gMkZtWllmRAvgzRwiVxoCefXiQ4dif+24+oTglQN1+mVI6Cvsmujd
	ZFT2VO2UD7HfiTJBSM42x89/eejWIkHKlKawhkOkTSoR/pNoaG4Ju8RQA2srVAaPg3E6
	yiFBQ7fofViJTgt3+rErAOSLAz4JhfCZaCGA6WClFD/RIKpIgcWPWbmVvREx+84AZRga
	lI40gYygKD/z9BhdjDx3NAlSgwz2AVswuTnbeVTsc1jbK2cbdUWAZn3SGN4NjTdt9mr0
	12fg==
X-Gm-Message-State: ALoCoQmhbTjvxpADkP8PLnthxr7KAjHItUSjwVXAzoUjChFkNHBlrWBLSOamiySRlVVlAKQ72LpH
MIME-Version: 1.0
X-Received: by 10.68.234.41 with SMTP id ub9mr2358973pbc.201.1378220293724;
	Tue, 03 Sep 2013 07:58:13 -0700 (PDT)
Sender: lpapp@archlinux.us
Received: by 10.70.57.234 with HTTP; Tue, 3 Sep 2013 07:58:13 -0700 (PDT)
In-Reply-To: <5225F8A9.9040700@movis.dk>
References: <1378219999-12757-1-git-send-email-erp@movis.dk>
	<CAOMwXhPf33o2i_Ci6pRYe-j1ZYnF7ronJ7-8ydrA1Z9b=BLzWA@mail.gmail.com>
	<5225F8A9.9040700@movis.dk>
Date: Tue, 3 Sep 2013 15:58:13 +0100
X-Google-Sender-Auth: mIDKaHW7UBZaQ7_8MC0kFfCSm0g
Message-ID: <CAOMwXhMxfQWjE54jy50q=5ivpHHHbzZcwDSaHA35evL0Q-oGcg@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [PATCH] libcarp-perl: added
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
X-List-Received-Date: Tue, 03 Sep 2013 14:58:13 -0000
Content-Type: text/plain; charset=ISO-8859-1

I was doing like this before, but I have been told to mention the version,
too. I have no strong opinion about it. :-)


On Tue, Sep 3, 2013 at 3:56 PM, Emil R. Petersen <erp@movis.dk> wrote:

> I suppose? I'll do that if you want.
> If you're putting it to me as a question - No idea!
> As a request, then sure.
>
>
> On 03/09/13 16:55, Laszlo Papp wrote:
>
>> Hmm, shouldn't you mention in the commit message which version just in
>> case?
>>
>>
>> On Tue, Sep 3, 2013 at 3:53 PM, Emil Petersen<erp@movis.dk>  wrote:
>>
>>  Carp recipe added
>>>
>>> Signed-off-by: Emil Petersen<erp@movis.dk>
>>> ---
>>>   .../recipes-perl/libcarp-perl/**libcarp-perl_1.26.bb<http://libcarp-perl_1.26.bb>| 25
>>> ++++++++++++++++++++++
>>>   1 file changed, 25 insertions(+)
>>>   create mode 100644 meta-perl/recipes-perl/**libcarp-perl/
>>> libcarp-perl_1.26.bb
>>>
>>> diff --git a/meta-perl/recipes-perl/**libcarp-perl/libcarp-perl_1.**
>>> 26.bbb/meta-perl/recipes-perl/**libcarp-perl/
>>> libcarp-perl_1.26.bb
>>> new file mode 100644
>>> index 0000000..0ae7bf3
>>> --- /dev/null
>>> +++ b/meta-perl/recipes-perl/**libcarp-perl/libcarp-perl_1.**26.bb<http://libcarp-perl_1.26.bb>
>>> @@ -0,0 +1,25 @@
>>> +SUMMARY = "Carp - alternative warn and die for modules"
>>> +AUTHOR = "Andrew Main<zefram@fysk.org>"
>>> +HOMEPAGE = "https://metacpan.org/module/**Carp<https://metacpan.org/module/Carp>
>>> "
>>> +SECTION = "libs"
>>> +LICENSE = "Artistic-1.0 | GPL-1.0+"
>>> +LIC_FILES_CHKSUM = "file://README;md5=**d613c00d4cb8d48c01f09fca2a7873*
>>> *a0"
>>> +
>>> +RPROVIDES_${PN} = "libcarp-heavy-perl"
>>> +
>>> +RDEPENDS_${PN} += "perl-module-strict \
>>> +                   perl-module-warnings \
>>> +                   libexporter-perl \
>>> +                   libtest-more-perl \
>>> +                  "
>>> +
>>> +SRC_URI = "
>>> http://cpan.metacpan.org/**authors/id/Z/ZE/ZEFRAM/Carp-${**PV}.tar.gz<http://cpan.metacpan.org/authors/id/Z/ZE/ZEFRAM/Carp-$%7BPV%7D.tar.gz>
>>> "
>>> +SRC_URI[md5sum] = "**86229a6f0dc44e0730f96c1909bb34**6d"
>>> +SRC_URI[sha256sum] =
>>> "**0a310222a9a52eca9425bca19e6d8e**04faa8bb4f64d5c16f2f6cce8190c0**a99b"
>>> +
>>> +S = "${WORKDIR}/Carp-${PV}"
>>> +
>>> +inherit cpan
>>> +
>>> +BBCLASSEXTEND = "native"
>>> +
>>> --
>>> 1.8.4.rc3
>>>
>>> ______________________________**_________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.**openembedded.org<Openembedded-devel@lists.openembedded.org>
>>> http://lists.openembedded.org/**mailman/listinfo/openembedded-**devel<http://lists.openembedded.org/mailman/listinfo/openembedded-devel>
>>>
>>>  ______________________________**_________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.**openembedded.org<Openembedded-devel@lists.openembedded.org>
>> http://lists.openembedded.org/**mailman/listinfo/openembedded-**devel<http://lists.openembedded.org/mailman/listinfo/openembedded-devel>
>>
> ______________________________**_________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.**openembedded.org<Openembedded-devel@lists.openembedded.org>
> http://lists.openembedded.org/**mailman/listinfo/openembedded-**devel<http://lists.openembedded.org/mailman/listinfo/openembedded-devel>
>

