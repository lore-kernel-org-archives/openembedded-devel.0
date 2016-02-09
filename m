Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f68.google.com (mail-pa0-f68.google.com
	[209.85.220.68])
	by mail.openembedded.org (Postfix) with ESMTP id 92BB4731A3
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Feb 2016 23:33:27 +0000 (UTC)
Received: by mail-pa0-f68.google.com with SMTP id fl4so109341pad.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Feb 2016 15:33:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=+N8PPr/uT7OSKvOHZQyiCsBeGwblvOwHo8kM4JOHwBI=;
	b=RB6pReGEn0lDGrpJAEKd3AbjFSdGiW83jYvmJbhpZ1zGB8G/ypMYizX8TxivEmO19Y
	NSis2D5RZLNoO4SXLxXdRtZpQr1l6VGh2NAI9yZ4oUkFzXCIy+1Rb6nKM28EZH7uy9xW
	oWcxUM4/kvDnNG47yDr54gFGDn49JDW+t3UOJTkmRAEm1jPlH2CqFM3peA0RXO+ooBH+
	qOFMJ7g3eCHRvIYMS6C+0Ct+/G67Bc1ZIP3wVI1mMM3EKuFRrcIcboFSSiXvfMDCPqOm
	gRfNbXQ1JdzqTwAl8KJ9+3tsl1M9axKLzL5gMoN1GzsMvJ0p/A9GSgMlrrlUTLaRsDPb
	Zz2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type
	:content-transfer-encoding;
	bh=+N8PPr/uT7OSKvOHZQyiCsBeGwblvOwHo8kM4JOHwBI=;
	b=Ial/EJfyzyhUG981Nb60yNWT/8fU3ZRzryMSPkt4jbZginB5ZokHiHFwbKXKMkN492
	yMioU8wujWtyGEPXfHSbEBYuvluBEpUdvPRG6IXp1WuBiGs9cNIRRLYHyInghQlAK3kx
	nnsQB5Bz2D1xsLx5R7LlT5z36b5sWkk96l6S2HCU5HnxybO0gOchA2KY8qaH+m/1DvJo
	7UGRuLhZlD4WjzEgAWnWOXm429zS0RBTv8m/uTW/ebKWvylyM6qB+64MtuIL4Gw1q5dF
	mOlewtok5wLdyIMNEG50HiuieztMqKEwwcocnnUirJsMTbVnZbiz3ulAXF2Pua63mdYj
	qyuw==
X-Gm-Message-State: AG10YORCqd9STeyXEc5q4ku8WDM7S9eltPAxHSbe/zJ7qrffZe+b9PXog6nZW2r+6i9XhA==
X-Received: by 10.66.222.101 with SMTP id ql5mr54257196pac.144.1455060808317; 
	Tue, 09 Feb 2016 15:33:28 -0800 (PST)
Received: from ?IPv6:2601:202:4000:1239:932:7842:972b:d985?
	([2601:202:4000:1239:932:7842:972b:d985])
	by smtp.googlemail.com with ESMTPSA id
	o184sm296926pfo.36.2016.02.09.15.33.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 09 Feb 2016 15:33:27 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <cover.1454879225.git.akuster@mvista.com>
	<8239925181787e297b39460fc9d4dd953f9ce946.1454879225.git.akuster@mvista.com>
	<20160209180833.GA2608@jama> <56BA4BBC.6030800@gmail.com>
	<49B177ED-5022-473E-85FD-2CF254C27499@gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <56BA7740.2090003@gmail.com>
Date: Tue, 9 Feb 2016 15:33:20 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <49B177ED-5022-473E-85FD-2CF254C27499@gmail.com>
Cc: otavio@ossystems.com.br
Subject: Re: [PATCH 7/7] krb5: Fix warning.
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
X-List-Received-Date: Tue, 09 Feb 2016 23:33:29 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit



On 02/09/2016 01:41 PM, Khem Raj wrote:
> 
>> On Feb 9, 2016, at 12:27 PM, akuster808 <akuster808@gmail.com> wrote:
>>
>>
>>
>> On 02/09/2016 10:08 AM, Martin Jansa wrote:
>>> On Sun, Feb 07, 2016 at 01:11:59PM -0800, Armin Kuster wrote:
>>>> From: Armin Kuster <akuster@mvista.com>
>>>>
>>>> WARNING: /tmp/work/armv5e-poky-linux-gnueabi/krb5/1.12.2-r0/krb5-1.12.2/src/ ('S') doesn't exist, please set 'S' to a proper value
>>>>
>>>> remove extra "/"
>>>
>>> This patch isn't in master and master still has trailing /, why is this
>>> needed for fido only?
>>
>> I only saw it occur in fido.
> 
> it doesnt change any functionality if its included in master too moreover makes back port easier.
> so lets apply it to master as well.

sending patches

- armin
> 
>>
>> - armin
>>>
>>>>
>>>> Signed-off-by: Armin Kuster <akuster@mvista.com>
>>>> ---
>>>> meta-oe/recipes-connectivity/krb5/krb5_1.12.2.bb | 2 +-
>>>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/meta-oe/recipes-connectivity/krb5/krb5_1.12.2.bb b/meta-oe/recipes-connectivity/krb5/krb5_1.12.2.bb
>>>> index c492496..c19fffb 100644
>>>> --- a/meta-oe/recipes-connectivity/krb5/krb5_1.12.2.bb
>>>> +++ b/meta-oe/recipes-connectivity/krb5/krb5_1.12.2.bb
>>>> @@ -33,7 +33,7 @@ SRC_URI = "http://web.mit.edu/kerberos/dist/${BPN}/${SHRT_VER}/${BP}-signed.tar
>>>> SRC_URI[md5sum] = "357f1312b7720a0a591e22db0f7829fe"
>>>> SRC_URI[sha256sum] = "09bd180107b5c2b3b7378c57c023fb02a103d4cac39d6f2dd600275d7a4f3744"
>>>>
>>>> -S = "${WORKDIR}/${BP}/src/"
>>>> +S = "${WORKDIR}/${BP}/src"
>>>>
>>>> PACKAGECONFIG ??= "openssl"
>>>> PACKAGECONFIG[libedit] = "--with-libedit,--without-libedit,libedit"
>>>> --
>>>> 2.3.5
>>>>
>>>> --
>>>> _______________________________________________
>>>> Openembedded-devel mailing list
>>>> Openembedded-devel@lists.openembedded.org
>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> 
> 
> 

