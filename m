Return-Path: <net147@gmail.com>
Received: from mail-pb0-f41.google.com (mail-pb0-f41.google.com
	[209.85.160.41])
	by mail.openembedded.org (Postfix) with ESMTP id 56BA86A619
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Jun 2013 09:53:40 +0000 (UTC)
Received: by mail-pb0-f41.google.com with SMTP id rp16so6646330pbb.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Jun 2013 02:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=cFBYNFfbbCBUeZBOjz6P7oM5dG4px65J0AEvSLWURHM=;
	b=jnL848zWP6IHzAy4lm33Pk6LELm4EBbihnfSH3QJo5yDUB3dx4z/g9M7a5XsdyQhjp
	qqJfWKeyTid199C5E82yBwCeyyvwdODSS96/9ctJtuT8dyqt622rUz66+wkeW95Rpd27
	6XZ7hTEASGqHdj6zkyzEdJtfrCsRfIP1TBf+0oAqlXRjzw8Wfx3+HCqMhXfSqGIg5GFq
	RSAoNXXUEmD7KCB4G6HzU1d+NsEj4YCcuzW01aR6tiKaj2OB6rxsb08JDVQc6BX3WsRm
	P3pnCSymzgrqVbTlKcfiqnvWjESGsL2IAPQWA2zNH4F5f3P1UtmBDiQGK0lOZHMpPMlO
	DfcQ==
X-Received: by 10.68.213.231 with SMTP id nv7mr99489pbc.70.1371117221364;
	Thu, 13 Jun 2013 02:53:41 -0700 (PDT)
Received: from [192.168.0.2] (60-242-179-244.static.tpgi.com.au.
	[60.242.179.244])
	by mx.google.com with ESMTPSA id fn9sm28691714pab.2.2013.06.13.02.53.39
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 13 Jun 2013 02:53:40 -0700 (PDT)
Message-ID: <51B9957F.1030107@gmail.com>
Date: Thu, 13 Jun 2013 19:48:47 +1000
From: Jonathan Liu <net147@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1371045305-11765-1-git-send-email-net147@gmail.com>
	<20130612140832.GQ3233@jama>
In-Reply-To: <20130612140832.GQ3233@jama>
Subject: Re: [meta-oe][PATCH v3] llvm-common: move cross script install to sysroot preprocess function
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
X-List-Received-Date: Thu, 13 Jun 2013 09:53:40 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 13/06/2013 12:08 AM, Martin Jansa wrote:
> On Wed, Jun 12, 2013 at 11:55:05PM +1000, Jonathan Liu wrote:
>> The llvm-config script doesn't get placed in the target sysroot
>> crossscripts directory otherwise.
>>
>> Signed-off-by: Jonathan Liu <net147@gmail.com>
>> ---
>>   meta-oe/recipes-core/llvm/llvm-common.bb | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta-oe/recipes-core/llvm/llvm-common.bb b/meta-oe/recipes-core/llvm/llvm-common.bb
>> index 612fd34..192919e 100644
>> --- a/meta-oe/recipes-core/llvm/llvm-common.bb
>> +++ b/meta-oe/recipes-core/llvm/llvm-common.bb
>> @@ -6,7 +6,10 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3
>>   
>>   SRC_URI = "file://llvm-config"
>>   
>> -do_install() {
>> +ALLOW_EMPTY_${PN} = "1"
>> +SYSROOT_PREPROCESS_FUNCS_append_class-target = " llvm_common_sysroot_preprocess"
>> +
>> +llvm_common_sysroot_preprocess() {
>>       install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}/
>>       install -m 0755 ${WORKDIR}/llvm-config ${SYSROOT_DESTDIR}${bindir_crossscripts}/
>>   }
> There is an issue with llvm-config without version when multiple
> versions of llvm are built:
>
> WARNING: The recipe llvm2.8 is trying to install files into a shared
> area when those files already exist. Those files and their manifest
> location are:
>     /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/qemuarm/usr/bin/crossscripts/llvm-config
>     Matched in manifest-qemuarm-llvm3.2
> manifest-qemuarm-llvm2.9
> manifest-qemuarm-llvm-common
> Please verify which package should provide the above files.
>
> Shouldn't we stage llvm-common only once and only from llvm-common
> recipe? Not caused by this change, but
> http://patchwork.openembedded.org/patch/50959/
That patch is to be ignored as indicated by my followup email 32 minutes 
after (see http://patchwork.openembedded.org/patch/50959/).

The only unmerged patches remaining:
- [PATCH v2] llvm: move cross script install to separate sysroot 
preprocess function
- [PATCH v3] llvm-common: move cross script install to sysroot 
preprocess function

With those two patches applied above the current meta-openembedded 
master, I can do the following in sequence without any issues:
bitbake llvm3.2
bitbake llvm2.9
bitbake llvm2.8

Regards,
Jonathan
> Other recipes can stage llvm-commonVER.


