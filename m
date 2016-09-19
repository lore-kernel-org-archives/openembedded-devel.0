Return-Path: <mike.looijmans@topicproducts.com>
X-Greylist: delayed 2401 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 19 Sep 2016 13:50:07 UTC
Received: from mx18-09.smtp.antispamcloud.com (mx18-09.smtp.antispamcloud.com
	[207.244.64.178])
	by mail.openembedded.org (Postfix) with ESMTP id 6FE776014F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Sep 2016 13:50:07 +0000 (UTC)
Received: from [37.74.225.130] (helo=TOP-EX01.TOPIC.LOCAL)
	by mx18.antispamcloud.com with esmtps (TLSv1:ECDHE-RSA-AES256-SHA:256)
	(Exim 4.86) (envelope-from <mike.looijmans@topicproducts.com>)
	id 1blyKg-0001gX-EP for openembedded-devel@lists.openembedded.org;
	Mon, 19 Sep 2016 15:10:03 +0200
Received: from [192.168.80.121] (192.168.80.121) by webmail.topic.nl
	(192.168.10.102) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Mon, 19 Sep 2016 15:08:36 +0200
To: <openembedded-devel@lists.openembedded.org>
References: <1472730043-31245-1-git-send-email-maxin.john@intel.com>
	<CAAQYJAtf4ixqfk+0Xk2z7jSHE8=b3GWW1m=Viw8Qnu_1ZMCFSQ@mail.gmail.com>
	<CAJTo0LYBx4JAof1mHvPc87eN24kioa9n33K46ig_O_JoE7z1vg@mail.gmail.com>
	<58965482.AtoM11idVP@peggleto-mobl.ger.corp.intel.com>
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: TOPIC
Message-ID: <57DFE354.2000008@topic.nl>
Date: Mon, 19 Sep 2016 15:08:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <58965482.AtoM11idVP@peggleto-mobl.ger.corp.intel.com>
X-Originating-IP: [192.168.80.121]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
X-Filter-ID: s0sct1PQhAABKnZB5plbIbbvfIHzQjPVmPLZeVYSu3xU9luQrU+8/8qthi+0Jd/W6KAUC/fjyuDn
	NXFr4uarw8GIk4znw5EcwHHi+ra9lypEmJCbamfqLB4wH/k+k+Tftor9O5jjWZI633McN2M/OUXR
	4XktS92Fqq3Qa0exZrH30SrPk8tfaSF+RZrpk8YKU12d2pmLLkAmzasehlwbl7sN9K7zsVtvh41y
	MgGC2dc+DKA2NNvQHVv9U39IvZ21x85OM4GWP9JQ/hHPc9c4dspy46MY4AXC06EFbOC1uAoX2ECf
	0tidf4f9xbnt4dr3ucE6FVHy9oQcVLiVeDoadp8jI9oH6dGc6edzLFJtSM1o5rQC2VE4ySdZe0mi
	K6wgOmG6/54gza7q5Za0AFsz6J51OyFNIoaxpS1mXZNdroDdpaan89csPuxNcrcm3g0VrZ+7KIxe
	L9a8yWCRhadOUlss+n2ffnQxt6aJ7klZab+9g1L5kxBIYGB7BJyUdlmpOtqAyNDaGu3M3V4NLSLw
	IF/664n8xZZ193ZhZHjQXRt4h/Pe0HoJfXSEQK0FPGvjWxwNFavLErUb39TUKcCiO2iH1Wgh6RAe
	nBR+licROGaX3Boon9SxUKxCjuDQ3yDiJRQzYkGgwKDF1jNhg8Xt+mNIBxN+8iLMjiqr6CILtV73
	kf3bHfLz5oIsvwONwYzu
X-Report-Abuse-To: spam@mx99.antispamcloud.com
X-Originating-IP: 37.74.225.130
X-SpamExperts-Domain: topic.nl
X-SpamExperts-Username: 37.74.225.128/28
Authentication-Results: antispamcloud.com;
	auth=pass smtp.auth=37.74.225.128/28@topic.nl
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: Combined (0.04)
X-Recommended-Action: accept
Subject: Re: [PATCH 4/4] tslib: move recipe from oe-core
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
X-List-Received-Date: Mon, 19 Sep 2016 13:50:09 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFOn 17-09-16 02:43, Paul Eggleton wrote:
> On Fri, 16 Sep 2016 16:08:57 Burton, Ross wrote:
>> On 16 September 2016 at 13:10, Andrea Adami <andrea.adami@gmail.com> wro=
te:
>>> Well, there is still one drawback...the 'custom' xserver-nodm-init is
>>> still present but there are patches on the ML for its removal.
>>
>> Hopefully the improvements in oe-core mean the meta-oe recipe can be
>> removed, but it was decided that it was too late in the cycle to push th=
is
>> and will wait for 2.3 to release before looking at deleting bits of meta=
-oe.
>
> The trouble is there are still people using it and we didn't wait for the
> recipe to be merged into meta-oe before removing it from oe-core. Can we
> please put in place procedures to avoid this happening in future?

... again.

Has happened a few times before, and it's really frustrating...


Kind regards,

Mike Looijmans
System Expert

TOPIC Products
Materiaalweg 4, NL-5681 RJ Best
Postbus 440, NL-5680 AK Best
Telefoon: +31 (0) 499 33 69 79
E-mail: mike.looijmans@topicproducts.com
Website: www.topicproducts.com

Please consider the environment before printing this e-mail

Topic zoekt gedreven (embedded) software specialisten!
http://topic.nl/vacancy/topic-zoekt-technische-software-engineers/



