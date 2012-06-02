Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kristoffer.ericson@gmail.com>) id 1SaqeW-0003DD-E7
	for openembedded-devel@openembedded.org; Sat, 02 Jun 2012 17:54:08 +0200
Received: by lbol5 with SMTP id l5so2333655lbo.6
	for <openembedded-devel@openembedded.org>;
	Sat, 02 Jun 2012 08:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=w31/8LeHS8hdFqWl5jtqd+I3dKPAWn+1Rxr7MfOw1+o=;
	b=yq5hrwL8Trm/G6xzBJiNcotVK+wHHshltoLILpptJS0f8asuVijmgY/EUXGo3dH9xS
	MFMsEMJ62QRwhyHDU92PgYFmwjV64oEyT69MCXW3qUeFTUguiAzpuu6SUCY7xnyWfPR2
	JfmVkeVQc4RszQcf1IIKwJdA14NJpkq8aMuUmZNGOSa/RBA0Si07GIGvw6C0tMkX42Dh
	WNJAlQcWj//bXastl8DN7EtB3kRRQy2hPLhIjvMrqUUJZV7+Uif7DEu7+Ku5EPuRSYpU
	EnBEPUOXgm0fm1+px3upm86LoKQEZF3Lj5nblEU43wpbkcrkQwITx2r/UQ+7wp2/W81i
	PHHA==
Received: by 10.152.108.178 with SMTP id hl18mr6919571lab.11.1338651825826;
	Sat, 02 Jun 2012 08:43:45 -0700 (PDT)
Received: from Kristoffers-iMac.local
	(c-34dae555.010-30-6c6b7012.cust.bredbandsbolaget.se.
	[85.229.218.52])
	by mx.google.com with ESMTPS id gt19sm8397538lab.17.2012.06.02.08.43.42
	(version=SSLv3 cipher=OTHER); Sat, 02 Jun 2012 08:43:43 -0700 (PDT)
Message-ID: <4FCA34AD.3010608@gmail.com>
Date: Sat, 02 Jun 2012 17:43:41 +0200
From: Kristoffer Eriksson <kristoffer.ericson@gmail.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:12.0) Gecko/20120428 Thunderbird/12.0.1
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <1337120874-17531-1-git-send-email-apelete@seketeli.net>
	<1337120874-17531-2-git-send-email-apelete@seketeli.net>
	<20120520201339.GR19142@hermes>
	<20120520203942.GA3166@jama.jama.net>
In-Reply-To: <20120520203942.GA3166@jama.jama.net>
Cc: openembedded-devel@openembedded.org
Subject: Re: [PATCH 1/1] libecj-bootstrap: Update SRC_URI to archive.eclipse.org
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
X-List-Received-Date: Sat, 02 Jun 2012 15:54:08 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

Martin Jansa skrev 2012-05-20 22:39:
> On Sun, May 20, 2012 at 10:13:39PM +0200, Apelete Seketeli wrote:
>> Hello,
>>
>> Le 16-May-12, Apelete Seketeli a écrit:
>>> This updates SRC_URI to archive.eclipse.org since mirrors.ibiblio.org
>>> seems to be down.
>>>
>>> Signed-off-by: Apelete Seketeli<apelete@seketeli.net>
>>> ---
>>>   recipes/ecj/libecj-bootstrap_3.6.1.bb |    2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/recipes/ecj/libecj-bootstrap_3.6.1.bb b/recipes/ecj/libecj-bootstrap_3.6.1.bb
>>> index d5da24e..996ab33 100644
>>> --- a/recipes/ecj/libecj-bootstrap_3.6.1.bb
>>> +++ b/recipes/ecj/libecj-bootstrap_3.6.1.bb
>>> @@ -3,7 +3,7 @@ require libecj-bootstrap.inc
>>>   PR = "${INC_PR}.0"
>>>
>>>   SRC_URI = " \
>>> -	   http://mirrors.ibiblio.org/pub/mirrors/eclipse/eclipse/downloads/drops/R-3.6.1-201009090800/ecjsrc-${PV}.zip \
>>> +	   http://archive.eclipse.org/eclipse/downloads/drops/R-3.6.1-201009090800/ecjsrc-${PV}.zip \
>>>
>>>             "
>>>
>>> -- 
>>> 1.7.9.5
>>>
>> Once again, I need libecj-bootstrap to build muffinman-image in
>> oe-classic, can someone here please review this patch ?
>>
>> http://patchwork.openembedded.org/patch/27791/
> Patch looks good, I haven't used oe-classic for some time, so I haven't
> tested it.
>
> Cheers,
>
Applied, thanks


