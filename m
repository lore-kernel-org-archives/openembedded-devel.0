Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B3B9C433EF
	for <webhook@archiver.kernel.org>; Thu,  9 Dec 2021 16:15:07 +0000 (UTC)
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by mx.groups.io with SMTP id smtpd.web12.13343.1639066506206463307
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Dec 2021 08:15:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gherzan.com header.s=fm3 header.b=TSMOx8rt;
 spf=pass (domain: gherzan.com, ip: 66.111.4.29, mailfrom: andrei@gherzan.com)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 82DE35C022F;
	Thu,  9 Dec 2021 11:15:05 -0500 (EST)
Received: from imap41 ([10.202.2.91])
  by compute4.internal (MEProxy); Thu, 09 Dec 2021 11:15:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	mime-version:message-id:in-reply-to:references:date:from:to:cc
	:subject:content-type; s=fm3; bh=iVscX2zEz8UfPpBXxdQEsXXnp7q+j5j
	HKffkA4ssrfU=; b=TSMOx8rtxOOTbRFbFSs8NYhnU3NXjmr9+pPRINUBNZcyuNa
	8LFaQGfZvmC4YnIBNNIYHW//K3aR48TA0yooy7nqz+bIuQeAN6pDBErK5zFXw/ly
	XnMwpPDlgSQwUrPslHNGPTk85wUPe97ZrvdHEZ2xZ1oS7cDihtmA5575zKPOTLSc
	quE57f4ooZq3E4LsavcTsg6mjzTWLUUsqQMov1c2K/hRZXeybiY41nORi+zytbfN
	/txz2wTzeCByzcO+4o5OOuEc+87CTk5C/L1LQ/7m5lNnZRy6QscBnp9xxwwTfcME
	amcyUGMDd4XVkMP6L0wydFMB2UX/mK5nnN+d4zg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=iVscX2
	zEz8UfPpBXxdQEsXXnp7q+j5jHKffkA4ssrfU=; b=P/VNXaneokngsSDhZBoE2g
	uk+loecOmawne2NPxzXK40lhE4pzC8gtm3Pt5gOfwunANPSuJrj+m1gWsY6YMZMn
	hVWcYy/vpwusvavSpEegJQ8tn6U8KIfSg0zyzPTRq3iJsUdl2r0G7VIWc86cO55A
	sNPmExG/gIPBZAKY+yxQrvxJ7HLFmvfHGIDBAWhusTO/hvNK60TIIevnXCkkXYOC
	BT5KQYi/XUUKDzupkHbAyoS9nYiQKGGyA/t/W0y9c9Fpxwe5HXAXlmkISIvuX+n+
	Qmw5QdKLQDNk1mQ4iGx0HrQLbDVaAsBbAk8xAvvHj1ltzsr/wMTLCrB0bJf7OQdQ
	==
X-ME-Sender: <xms:iSuyYenVqNSLbT90EDB_2SzOxLUqj5YlBRY-6AKU8DjNcg_aMQF7JQ>
    <xme:iSuyYV2G1MTVOdWzk9lA0wbuVf4TCosOk93URAOLs57vR4Va-oDmb9KW-CHw0kEsk
    AfasZPnxp15KFfToJc>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvuddrkedtgdekkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
    vghiucfihhgvrhiirghnfdcuoegrnhgurhgvihesghhhvghriigrnhdrtghomheqnecugg
    ftrfgrthhtvghrnhepffektdelfeffhfekffefueevjeduteevjedtlefhveelueeujeeg
    leeukefgffevnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvihesghhhvghriigr
    nhdrtghomh
X-ME-Proxy: <xmx:iSuyYcobUTo2HvYrNpavKNz3-wu8xit8UdaNiUcEwjftielflzdOgg>
    <xmx:iSuyYSm9m8JkI3E5KMS1A_Dw2bjE-GQZEh9tGWBtIblYHCjZ-N_wWA>
    <xmx:iSuyYc0kUvTVWAMOFUH8PSpnGeAzt2HfPaBrSSjejcRUqim7QTpYYw>
    <xmx:iSuyYR8oNofJZhsggCyBDcHeC6LlE9lBPuafQZX6_fpzOdI28Poqzg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 0A6153C0265; Thu,  9 Dec 2021 11:15:05 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4506-g4374de3f18-fm-20211208.001-g4374de3f
Mime-Version: 1.0
Message-Id: <86096171-0f2c-4f7f-b9c9-e2aea5d7ecf6@www.fastmail.com>
In-Reply-To: 
 <CAMKF1srkS7nJaG==67-f5o=P4s58xMutoPSSqHHK6TOotKD4hw@mail.gmail.com>
References: <20211209150014.2294075-1-andrei@gherzan.com>
 <CAMKF1srkS7nJaG==67-f5o=P4s58xMutoPSSqHHK6TOotKD4hw@mail.gmail.com>
Date: Thu, 09 Dec 2021 16:14:44 +0000
From: "Andrei Gherzan" <andrei@gherzan.com>
To: "Khem Raj" <raj.khem@gmail.com>
Cc: openembedded <openembedded-devel@lists.openembedded.org>,
 "Andrei Gherzan" <andrei.gherzan@huawei.com>
Subject: Re: [oe] [meta-python][PATCH] python3-pymetno: Introduce recipe on
 0.7.0
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Dec 2021 16:15:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94265

On Thu, 9 Dec 2021, at 15:58, Khem Raj wrote:
> On Thu, Dec 9, 2021 at 7:00 AM Andrei Gherzan <andrei@gherzan.com> wrote:
>>
>> From: Andrei Gherzan <andrei.gherzan@huawei.com>
>>
>> Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
>> ---
>>  .../python/python3-pymetno_0.7.0.bb              | 16 ++++++++++++++++
>>  1 file changed, 16 insertions(+)
>>  create mode 100644 meta-python/recipes-devtools/python/python3-pymetno_0.7.0.bb
>>
>> diff --git a/meta-python/recipes-devtools/python/python3-pymetno_0.7.0.bb b/meta-python/recipes-devtools/python/python3-pymetno_0.7.0.bb
>> new file mode 100644
>> index 000000000..453f66afd
>> --- /dev/null
>> +++ b/meta-python/recipes-devtools/python/python3-pymetno_0.7.0.bb
>> @@ -0,0 +1,16 @@
>> +SUMMARY = "Python library to talk to the met.no api"
>> +HOMEPAGE = "https://github.com/Danielhiversen/pyMetno"
>> +LICENSE = "MIT"
>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=5d503272f52c35147ec960cb56a03bf4"
>> +
>> +SRC_URI = "git://github.com/Danielhiversen/pyMetno.git;protocol=https;branch=master"
>> +SRCREV = "15f1e887aaaba3bf243cc8f88eb761e0ad85c355"
>> +S = "${WORKDIR}/git"
>> +
>> +inherit setuptools3
>> +
>> +RDEPENDS_${PN} = "\
>
> This should use the new override separator ':' instead of '_'

Indeed. Fixed in v2.

--
Andrei

