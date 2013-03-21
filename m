Received: from mail-la0-f48.google.com ([209.85.215.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1UIo9Q-0003ci-57
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Mar 2013 23:40:00 +0100
Received: by mail-la0-f48.google.com with SMTP id fq13so6178409lab.35
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Mar 2013 15:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	bh=8cNA5Hc/efJIoXNmnqqw7HVGTzeulWbr2lUR7EF4Nig=;
	b=xJENFPFhZ3dEBdUF4VZ2mREe3lMlD4bt9X6gUGP6Al5IUAIo/p39LbvuCQzxOKYYcm
	pAHKsHWF2bwynmdcE5ALqgjNXkno4/emCACnMLxEze5AwCey4hdNhdubQFPF4XUz44TJ
	JVl1Buu7P6iyAQN1Qm83ZWmiVqmI1P1rrEEg74034B3odlgdI23lY9PCv6h2kYWi+IFC
	rLzq2H/pAn2RPd6MiIyl1YqPJryYTlVK0R1/djh42opX3alybKxRUMIGoqeqiWBEK/IV
	nMt69su8X7G/qQP2cG2hlqqIibfB5n8BgX68BagH2lXjq9iyoIPCBSRusjbzP9BsL0Hg
	PBoQ==
X-Received: by 10.112.49.201 with SMTP id w9mr12172406lbn.2.1363904586801;
	Thu, 21 Mar 2013 15:23:06 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.25.195 with HTTP; Thu, 21 Mar 2013 15:22:46 -0700 (PDT)
In-Reply-To: <514B857F.2000400@windriver.com>
References: <1363902391-29945-1-git-send-email-kergoth@gmail.com>
	<514B857F.2000400@windriver.com>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 21 Mar 2013 15:22:46 -0700
X-Google-Sender-Auth: 3d8J6DmJ67ixycg1OMFAppcR3Kw
Message-ID: <CABcZANnt7WB5P2t--wO5q+U2_z0PzNwLZHx-Pn3CSx2B4daKVg@mail.gmail.com>
To: Openembedded Discussion <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-networking][danny][PATCH] layer.conf: Use .= for adding to BBPATH and += to BBFILES
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Mar 2013 22:40:01 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Mar 21, 2013 at 3:11 PM, Mark Hatle <mark.hatle@windriver.com>wrote:

> On 3/21/13 4:46 PM, Christopher Larson wrote:
>
>> From: Andrei Gherzan <andrei.gherzan@windriver.com>
>>
>> Fixes parsing errors which is appearing after this commit to
>> meta-openembedded
>>
>> http://cgit.openembedded.org/**meta-openembedded/commit/?id=**
>> 3c21a46020bd0816579648f684c41d**bd6333583e<http://cgit.openembedded.org/meta-openembedded/commit/?id=3c21a46020bd0816579648f684c41dbd6333583e>
>>
>> This triggers
>> exception NameError: name 'base_contains' is not defined
>> without this change
>>
>> Signed-off-by: Andrei Gherzan <andrei.gherzan@windriver.com>
>> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
>> ---
>>   meta-networking/conf/layer.**conf | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta-networking/conf/layer.**conf
>> b/meta-networking/conf/layer.**conf
>> index f26a172..1ea2bc2 100644
>> --- a/meta-networking/conf/layer.**conf
>> +++ b/meta-networking/conf/layer.**conf
>> @@ -1,9 +1,9 @@
>>   # We have a conf and classes directory, add to BBPATH
>> -BBPATH := "${BBPATH}:${LAYERDIR}"
>> +BBPATH .= ":${LAYERDIR}"
>>
>>   # We have a packages directory, add to BBFILES
>> -BBFILES := "${BBFILES} ${LAYERDIR}/recipes-*/*/*.bb \
>> - ${LAYERDIR}/recipes-*/*/*.**bbappend"
>> +BBFILES += "${LAYERDIR}/recipes-*/*/*.bb \
>> +            ${LAYERDIR}/recipes-*/*/*.**bbappend"
>>
>>   BBFILE_COLLECTIONS += "networking"
>>   BBFILE_PATTERN_networking := "^${LAYERDIR}/"
>>
>>
> Don't those two have to be ":=" so that 'LAYERDIR' is immediately
> evaluated? LAYERDIR changes depending on which layer is currently being
> processed


Nope, bitbake has handled LAYERDIR specially since Wed Apr 14 14:30:09
2010. See commits 849dbd63244cbc4eaca0f1beedbb67baca024629 and
40778a6e9e82c7ea4673a74fc19574430fa63e8d in bitbake.
-- 
Christopher Larson

