Return-Path: <sean@geanix.com>
Received: from first.geanix.com (first.geanix.com [116.203.34.67])
	by mail.openembedded.org (Postfix) with ESMTP id DB8D27DBC8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Apr 2019 15:04:42 +0000 (UTC)
Received: from [192.168.100.161] (unknown [95.138.208.137])
	by first.geanix.com (Postfix) with ESMTPSA id E1EC3308E82;
	Mon, 29 Apr 2019 15:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
	t=1556550280; bh=vG6/ektGLIvIFWkbSK7d2xGTEVHU6Bio2fvOZu/WiR4=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=Meykz8uAM9Nyvagpv80yqGjKJWoKrtenGVqGJbPa/3SJqCwbJyyhwLR5GnqvVK+80
	mNxxWzgEgX5hkiGYCpI3/gJuK/oW2XM9zcMYEovi9Jn6L5UgY5CiWKAWmkeUzQMqCi
	eRP423aNzAOPtVaLnX+h/BUcvV4fsgmVXL2zzodv023+Gkhf06jsHc9/qhWy11dBfo
	11HzzcUSjZdAKovVoZCzivdx+Tx0NJr5//pC9O05D0Hy1VQTu8o8sQpsfghrmRQWfT
	3cnAUCl7xeK2Pzm++t9ZZFhsEbgBb4P/HLLs1dVnirCdNchyJg84SVtdvZbFG+S4Nd
	gAXukUqQq+cFw==
To: akuster808 <akuster808@gmail.com>,
	openembedded-devel@lists.openembedded.org
References: <20190429131914.123617-1-sean@geanix.com>
	<32ba7bfc-2556-0707-fd27-51d44338aa52@gmail.com>
From: Sean Nyekjaer <sean@geanix.com>
Message-ID: <a10c0685-3602-efd2-fbec-4de81e5980ee@geanix.com>
Date: Mon, 29 Apr 2019 17:04:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <32ba7bfc-2556-0707-fd27-51d44338aa52@gmail.com>
X-Spam-Status: No, score=-3.1 required=5.0 tests=ALL_TRUSTED,BAYES_00,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,URIBL_BLOCKED
	autolearn=disabled version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on b7bf6291adac
Subject: Re: [PATCH] cannelloni: new package, CAN to ethernet proxy
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
X-List-Received-Date: Mon, 29 Apr 2019 15:04:43 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US-large
Content-Transfer-Encoding: 7bit



On 29/04/2019 16.57, akuster808 wrote:
> 
> 
> On 4/29/19 6:19 AM, Sean Nyekjaer via Openembedded-devel wrote:
>> Tool for sending SocketCAN messages
>> over Ethernet tunnel.
>>
>> Signed-off-by: Sean Nyekjaer <sean@geanix.com>
> 
> Thanks for the patch. One question is what version is this for?
> 
> Version by hash is not optimal. Can you add PV or change the recipe name
> to include the version?
> 
> - armin
Hi Armin

Upstream have not released in 3 years. But new commits are quite useful...
So do you have an idea to what I can add as a PV?

/Sean

>> ---
>>   .../cannelloni/cannelloni_git.bb                  | 15 +++++++++++++++
>>   1 file changed, 15 insertions(+)
>>   create mode 100644 meta-oe/recipes-connectivity/cannelloni/cannelloni_git.bb
>>
>> diff --git a/meta-oe/recipes-connectivity/cannelloni/cannelloni_git.bb b/meta-oe/recipes-connectivity/cannelloni/cannelloni_git.bb
>> new file mode 100644
>> index 000000000..43c04ef34
>> --- /dev/null
>> +++ b/meta-oe/recipes-connectivity/cannelloni/cannelloni_git.bb
>> @@ -0,0 +1,15 @@
>> +SUMMARY = "a SocketCAN over Ethernet tunnel"
>> +HOMEPAGE = "https://github.com/mguentner/cannelloni"
>> +LICENSE = "GPLv2"
>> +
>> +SRC_URI = "git://github.com/mguentner/cannelloni.git;protocol=https"
>> +SRCREV = "44080bb021d1a143e6906f2ec4610513c4e1cece"
>> +
>> +LIC_FILES_CHKSUM = "file://gpl-2.0.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>> +
>> +inherit cmake
>> +
>> +S = "${WORKDIR}/git"
>> +
>> +PACKAGECONFIG ??= "lksctp-tools"
>> +PACKAGECONFIG[lksctp-tools] = "-DSCTP_SUPPORT=true, -DSCTP_SUPPORT=false, lksctp-tools"
> 


