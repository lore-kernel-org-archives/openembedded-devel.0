Return-Path: <bounce+4d9b4d.3a5685-openembedded-devel=lists.openembedded.org@asterius.io>
Received: from mail4.static.mailgun.info (mail4.static.mailgun.info
	[104.130.122.4])
	by mail.openembedded.org (Postfix) with ESMTP id 50A52784DF
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Dec 2017 19:19:16 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=asterius.io; q=dns/txt;
	s=mailo; t=1513365558; h=Content-Type: Cc: To: Subject: Message-ID:
	Date: From: References: In-Reply-To: MIME-Version: Sender;
	bh=rNzzKmQtDHFcJUh5eN0nhccV1BP3o1ah7w4ZlzmYQ4k=;
	b=OYanfq5xrNV6fuxdzr4TGMhDwwpCd44roaAQU1KnMy5NOwPcEB16FxIpDcpn8r8iUplLE7zh
	UkDfZVxwwGeclwthFFeAkn+YL14dAvJXRDndF6Mabc9TjWQUG+1Viy77AWeGCXkS0UHvpBTd
	zTLDqdFyBSh4xBortcsrAk1cbQM=
X-Mailgun-Sending-Ip: 104.130.122.4
X-Mailgun-Sid: WyIzN2NkMyIsICJvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyIsICIzYTU2ODUiXQ==
Sender: derek@asterius.io
Received: from mail-qk0-f175.google.com (mail-qk0-f175.google.com
	[209.85.220.175])
	by mxa.mailgun.org with ESMTP id 5a342035.7fab16c095b0-smtp-out-n03;
	Fri, 15 Dec 2017 19:19:17 -0000 (UTC)
Received: by mail-qk0-f175.google.com with SMTP id 8so11620868qkj.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Dec 2017 11:19:17 -0800 (PST)
X-Gm-Message-State: AKGB3mKDyl6J8gsaeVoFxI4bpGUqeNU6VwK5Q3f921R+1xM/OwC6T4aD
	meeIBaIxVeQcEb/2EcJ4G6HDSwC4/nL2ThD7PVA=
X-Google-Smtp-Source: ACJfBot2f4+L4wPf3TZlskHYteHoNUCjvZhpHRQlKrNXbqQXW9SGlxKJ+AyMPSP08ln1bFwhcoENkNVpFAi0bNrKV68=
X-Received: by 10.55.21.35 with SMTP id f35mr19722867qkh.153.1513365556806;
	Fri, 15 Dec 2017 11:19:16 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.21.177 with HTTP; Fri, 15 Dec 2017 11:19:16 -0800 (PST)
Received: by 10.140.21.177 with HTTP; Fri, 15 Dec 2017 11:19:16 -0800 (PST)
In-Reply-To: <CAPuovEJCQwFBiFsG5_7miubOgteakgkSzXL5H+3qLYcWqPeo+w@mail.gmail.com>
References: <1513359926-17087-1-git-send-email-mark.asselstine@windriver.com>
	<1513359926-17087-3-git-send-email-mark.asselstine@windriver.com>
	<CADNbA1ruiCp4u810eg9LcLXzWdAAaMY5aC-5KVyeViq4jSKxKg@mail.gmail.com>
	<CAPuovEJCQwFBiFsG5_7miubOgteakgkSzXL5H+3qLYcWqPeo+w@mail.gmail.com>
From: Derek Straka <derek@asterius.io>
Date: Fri, 15 Dec 2017 14:19:16 -0500
X-Gmail-Original-Message-ID: <CADNbA1oB3Mmq5B9SNX5OCG8uzmTdTx2kQ8EChZu1_JpntweSNQ@mail.gmail.com>
Message-ID: <CADNbA1oB3Mmq5B9SNX5OCG8uzmTdTx2kQ8EChZu1_JpntweSNQ@mail.gmail.com>
To: mark.asselstine@windriver.com
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][rocko][PATCH 2/2] python-twisted: restore RDEPENDS on -news for py2
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
X-List-Received-Date: Fri, 15 Dec 2017 19:19:17 -0000
Content-Type: text/plain; charset="UTF-8"

Sure.  I wasn't clear and even then I misread the 1/2 patch and thought I
removed news from core and not the base package RDEPENDS.

On Dec 15, 2017 2:08 PM, "Mark Asselstine" <mark.asselstine@windriver.com>
wrote:

The RDEPENDS are not for core, these are RDEPENDS_${PN}, ie. if you
don't know what parts you want you install ${PN} and get everything.
We can straighten this up though if my thoughts are incorrect. I have
to send a V2 anyway as I was hasty and missed the cherrypick of a
bunch of dependencies you added for automat and others.

Mark

On Fri, Dec 15, 2017 at 1:32 PM, Derek Straka <derek@asterius.io> wrote:
> Is it actually required for core?  I thought I went through and verified
> that news was a stand alone module.
>
> On Dec 15, 2017 12:46 PM, "Mark Asselstine" <mark.asselstine@windriver.com
>
> wrote:
>
>> Although this plugin has not yet been ported to py3 it is available in
>> py2. The previous commit isn't clear about what is being addressed but
>> I assume it is:
>>
>> nothing provides python3-twisted-news needed by
python3-twisted-17.9.0-r0.
>> corei7_64
>>
>> For py2 this package is valid and so we should maintain the RDEPENDS,
>> restore this RDEPENDS for py2.
>>
>> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
>> ---
>>  meta-python/recipes-devtools/python/python-twisted_17.9.0.bb | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/meta-python/recipes-devtools/python/python-twisted_17.9.0.bb
>> b/meta-python/recipes-devtools/python/python-twisted_17.9.0.bb
>> index 2be1709..7fc8c65 100644
>> --- a/meta-python/recipes-devtools/python/python-twisted_17.9.0.bb
>> +++ b/meta-python/recipes-devtools/python/python-twisted_17.9.0.bb
>> @@ -2,3 +2,9 @@ inherit pypi setuptools
>>  require python-twisted.inc
>>
>>  RDEPENDS_${PN}-core += "${PYTHON_PN}-contextlib"
>> +
>> +# Not yet ported to py3 yet available in py2
>> +# See src/twisted/python/_setup.py -- notPortedModules
>> +RDEPENDS_${PN} += "\
>> +    ${PN}-news \
>> +    "
>> --
>> 2.7.4
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

