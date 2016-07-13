Return-Path: <kergoth@gmail.com>
Received: from mail-io0-f195.google.com (mail-io0-f195.google.com
	[209.85.223.195])
	by mail.openembedded.org (Postfix) with ESMTP id 4B0316067C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jul 2016 15:49:20 +0000 (UTC)
Received: by mail-io0-f195.google.com with SMTP id y34so3167536ioi.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jul 2016 08:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to; bh=uEw3gvY48hgkqpofMQizDi+cPxtx1vGSQqc8Sx9nLF8=;
	b=CNH58pntEktsaoAYWmptxID/pR8Tz5A6VGJykiGwNUUlcszJeq6x+Qgj/whaO7IlNi
	JwhF9jEwjX/wEQ3ZCehGHvdv5LUuCfnO1UebzdVw+T8CMaiHf2MntGZcf25qhJDrJi0g
	YzgeccKP7PcCJQ+/IIu/R1/hJLb3AVNIuaYZTKKdeqzwBLLEoqzOgPMfpQYBMxkO4o64
	M60jtly1HGdLC6ptZXGbA5okDP2n4MeXJ2360fyxEN5aAuuPSLSsjZFkXFYCH+6//rRD
	FWqgKasJwhdURfCZQbdjML/3Ua7NLt9ZSBBBj+/bRPJ79EaQuEqMKcFewLHmgB5X3f/T
	IcVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to;
	bh=uEw3gvY48hgkqpofMQizDi+cPxtx1vGSQqc8Sx9nLF8=;
	b=cDLYuuSRixr7P2DIQQEDxS3Ii5mG+TvaPZd9hJfDM0PhfbOJVAL4HHm4r4A1JhuG40
	zApaqIIGPsYd6yAxgSnxs8JL+vVYc/4FfB3yfLFMdcQvs+lbD+lrW4ECHqePbyO9/ZWV
	E83zirREU44PPE/eo18ru+DHLY1R2seXgDHNyeZfP1o+wVa4+K8NZQ+6yUOhNMPzupLd
	Kuusk29tIcxOrz7rRxtFNsEcaDRV0NEqI6gfsdGEB/WJvmeMZtsRm2ZFT8vckCN5gh7n
	cRzQSor9fD+1XsSlPQJCMTeZjvPOcdKd21VGVRpnI1PtdC2tlObzlnf8R0MaGIz1/ajK
	Htlg==
X-Gm-Message-State: ALyK8tJxtzesqXjd42aCdf+J0NJZ4mPZKI2gS6IbKlOquoAuHVx1/jEtjdy186XLyq3aC34xdM2TFBzJ65waMQ==
X-Received: by 10.107.128.210 with SMTP id k79mr2130980ioi.3.1468424960594;
	Wed, 13 Jul 2016 08:49:20 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.21.197 with HTTP; Wed, 13 Jul 2016 08:49:01 -0700 (PDT)
In-Reply-To: <5786579E.3080904@mlbassoc.com>
References: <1468421827-11561-1-git-send-email-cynthia.ms.chiu@gmail.com>
	<5786579E.3080904@mlbassoc.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Wed, 13 Jul 2016 08:49:01 -0700
X-Google-Sender-Auth: aoPX1Lqv8V-jJCkIptQqGTU4Udk
Message-ID: <CABcZANmoq80BN5Him7aVwO753n_Q+_nAF0GAAsfKLZhgrxFCGA@mail.gmail.com>
To: Openembedded Discussion <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH] CANopenNode: recipe for building the CANopenSocket tools
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
X-List-Received-Date: Wed, 13 Jul 2016 15:49:23 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jul 13, 2016 at 8:00 AM, Gary Thomas <gary@mlbassoc.com> wrote:

> On 2016-07-13 16:57, cynthiachiu wrote:
>
>> Initial check-in for the CANopenSocket tools recipe.
>>
>> Signed-off-by: cynthiachiu <cynthia.ms.chiu@gmail.com>
>> ---
>>   .../canopennode/canopensocket_git.bb               | 31
>> ++++++++++++++++++++++
>>   1 file changed, 31 insertions(+)
>>   create mode 100644 meta-oe/recipes-extended/canopennode/
>> canopensocket_git.bb
>>
>> diff --git a/meta-oe/recipes-extended/canopennode/canopensocket_git.bb
>> b/meta-oe/recipes-extended/canopennode/canopensocket_git.bb
>> new file mode 100644
>> index 0000000..4506698
>> --- /dev/null
>> +++ b/meta-oe/recipes-extended/canopennode/canopensocket_git.bb
>> @@ -0,0 +1,31 @@
>> +SUMMARY = "Linux CANOpen tools"
>> +DESCRIPTION = "Linux CANOpen Protocol Stack Tools"
>> +LICENSE = "GPLv2"
>> +LIC_FILES_CHKSUM =
>> "file://gpl-2.0.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>> +
>> +SRC_URI = "git://github.com/CANopenNode/CANopenSocket.git"
>> +SRCREV = "${AUTOREV}"
>>
>
> Can't you pick a known, working ${REV}?  Using ${AUTOREV} makes it
> impossible
> to use this recipe disconnected from the internet (yes, that's still a
> concern
> in 2016!)
>
>
> +
>> +S = "${WORKDIR}/git"
>> +
>> +do_compile_prepend() {
>> +    cd ${S}
>> +    git submodule init
>> +    git submodule update
>>
>
This fetches things at do_compile time, which is not appropriate. Use
gitsm:// instead of git:// and let the fetcher handle the submodules.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

