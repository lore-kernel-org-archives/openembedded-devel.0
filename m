Return-Path: <prvs=072d76755=Richard.Leitner@skidata.com>
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
	by mail.openembedded.org (Postfix) with ESMTP id 9C66D7E034
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jun 2019 10:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
	t=1561457881; x=1592993881;
	h=subject:to:cc:references:from:message-id:date:
	mime-version:in-reply-to:content-transfer-encoding;
	bh=WOEIka0EfhHe4i6CrBQiwQqjIuW3giOIJjmdbaWJY6Q=;
	b=KA3QZPub83RAq0t43miU6dgxB+4sgdQ5wjmhR8X9MbNeUVSxjKr0OWkX
	sMQlxtrPwYT77WNnjtbqmERVKjK6hqH5FqaP6wmlPG8okPToslT68ZKZh
	arU5ms1g5YqWb66BHpRHgrdP9vvLjZXy8R+Lr4yvL3Ncf/Kztnd5fuRoO
	ziIPWF/JC7nd/NESah3o+F0D+JEIX4DOom7fqq4dztpV1xLzM059+0/eq
	vWLcurgTUZGbByHWHuvebYnoeOCVmC27wcTdZBbDOvEx0X5IdRevCkiU5
	50hbwcAAEbH7CZvS7++A1HksnH6zOIZ4uZ21v0ndUBZUupRqgVgy/XXy0 A==;
IronPort-SDR: yvKH+yqxeeYCLMIwjOAnCQKxkk3p9lu7pDg/KuskFtp8cK9RItbcw6cLRbLosaRhKTMTf9Rgim
	A6RfcDD/g8ILlyqL2Q4yu2a7jrBFllJuQnbrilb6c8R/+uUzs5K4h29W9O/6O+ijT1I0aBCZPv
	DBLf0gXM+A06TdsksViRDjngfTGcKTOh60K7WCP+ofmy/2OFBuxQCy0nC/BqY+Hjwpg04x0cr2
	lCc8c71xL7zZ2+WoBk62NP+9Eb/ttjghvP8JOMxrfrL2yTpn2MS9gDU9UD/aP35g2kRn2uP9TE
	d2E=
X-IronPort-AV: E=Sophos;i="5.63,415,1557180000"; d="scan'208";a="17956516"
To: Ricardo Ribalda Delgado <ricardo@ribalda.com>
References: <20190625075223.13585-1-ricardo@ribalda.com>
	<20190625075223.13585-3-ricardo@ribalda.com>
	<46a0e244-16f4-f014-bdd7-08ea31c32176@skidata.com>
	<CAPybu_2YJ2a7FY6rziTsnzA6y-pC23hf4XLacCkaG+z1t4rh_w@mail.gmail.com>
From: Richard Leitner <richard.leitner@skidata.com>
Message-ID: <7f885a44-835f-0e6e-ce1d-ecad9f8713f0@skidata.com>
Date: Tue, 25 Jun 2019 12:17:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAPybu_2YJ2a7FY6rziTsnzA6y-pC23hf4XLacCkaG+z1t4rh_w@mail.gmail.com>
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex4srv.skidata.net (192.168.111.82) To
	sdex5srv.skidata.net (192.168.111.83)
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-java][PATCH 02/23] openjd7: remove support for kerberos
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
X-List-Received-Date: Tue, 25 Jun 2019 10:18:00 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 25/06/2019 12:03, Ricardo Ribalda Delgado wrote:
> Hi Richard
> 
> On Tue, Jun 25, 2019 at 11:41 AM Richard Leitner
> <richard.leitner@skidata.com> wrote:
>>
>> Hi Ricardo,
>> thanks for the patches!
>>
>> On 25/06/2019 09:52, Ricardo Ribalda Delgado wrote:
>>> It triggers a lot of dependencies, and it is no clear that
>>> is needed.
>>
>> To be honest I don't know if it's needed or used by anybody, but would
>> it be possible to create a PACKAGECONFIG for de-/selecting the
>> system-kerberos?
> 
> Sure,
> 
> I am working at:
> https://github.com/ribalda/meta-java/tree/v2
> 
> Do you prefer that I resend the patches after all the feedback is
> fixed or you rather pull directly from there?

For me pulling would be fine, but I think sending to the list would be 
preferred as anybody can leave comments then.

I'll review and test the other patches today or tomorrow and give you 
feedback for the v2!

Thanks again & regards;Richard.L

> 
> So far I have fix
> 
> - x11 native
> -packageconfig for kerberos openjdk8 and openjdk7
> 
> 
>>
>> Furthermore if you send a v2 can you please fix the subject (openjd7 ->
>> openjdk7)?
>>
>> Same goes for openjdk-8.
>>

