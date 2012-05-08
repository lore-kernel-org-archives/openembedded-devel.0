Received: from smtprelay-b11.telenor.se ([62.127.194.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <openembedded@emagii.com>) id 1SRsAU-0005q4-1p
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 May 2012 23:42:02 +0200
Received: from ipb3.telenor.se (ipb3.telenor.se [195.54.127.166])
	by smtprelay-b11.telenor.se (Postfix) with ESMTP id 50919C3EE
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 May 2012 23:32:10 +0200 (CEST)
X-SENDER-IP: [83.227.58.214]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AoobAI2QqU9T4zrWPGdsb2JhbAANN7NEAQEBATeCQAEBAQEDAQEBNTYKEQsYCRYPCQMCAQIBFQEbFBMGAgEBiBW7Fo1vgyYEk0+CL4ERkhw
X-IronPort-AV: E=Sophos;i="4.75,553,1330902000"; d="scan'208";a="112789022"
Received: from c-d63ae353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.243]) ([83.227.58.214])
	by ipb3.telenor.se with ESMTP; 08 May 2012 23:31:57 +0200
Message-ID: <4FA990CE.2060502@emagii.com>
Date: Tue, 08 May 2012 23:31:58 +0200
From: Ulf Samuelsson <openembedded@emagii.com>
Organization: eMagii
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1336391680.3417.7.camel@dasty-laptop>
	<4FA7B9DF.60304@mlbassoc.com>
	<1336394035.3417.12.camel@dasty-laptop>
In-Reply-To: <1336394035.3417.12.camel@dasty-laptop>
Subject: Re: Simultaneous build of two intree packages
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
X-List-Received-Date: Tue, 08 May 2012 21:42:02 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2012-05-07 14:33, Radek Dostal wrote:
> On Mon, 2012-05-07 at 06:02 -0600, Gary Thomas wrote:
>> On 2012-05-07 05:54, Radek Dostal wrote:
>>> Dear All,
>>>
>>> I have three intree recipes A, B and C which are part of the same layer.
>>> =>   B depends on A
>>> =>   C depends on A.
>>>
>>> There is no dependency between B and C. Only important thing is that B
>>> and C are not build simultaneously. This is not a problem unless I use
>>> configure BB_NUMBER_THREADS>   1. Than builds B and C starts to collide
>>> and produce mess because they are both intree builds.
>> What are you doing that makes these clash?
> usually it crashes during "ln -sf target dest" which is executed
> simultaneously with same parameters for both builds. There are other
> issues as well in addition to this ln issue.
>
>>> Is there something like a mutex/lock mechanism in openembedded-core,
>>> which would forbid two recipes to be build simultaneously?
>> Just make C depend on B
> I have already considered this, but unfortunately I also have
> configurations where only B is included or where only C is included :(
>
> Thanks,
> Radek
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
Fixing the packages, is probably the way to go.
You could also create pseudo package "D" which is available in several 
versions.

Package D-1.0c:      Package D is depending on nothing
Package D-1.0bc:    Package D is depending on B

Package C is always dependent on Package D and A.
Package B is always dependent on Package A

If you set PREFERRED_VERSION_D = "1.0c"
C is depending on D, which is depending on nothing, and C is depending on A.
No problem, A and C is built.

If you set PREFERRED_VERSION_D = "1.0c"
C is depending on D, which is depending on B.  B and C is depending on A.
A is built, then B is built, and then D finalizing with C.

If you only want B, don't include C in the image.

Not tested, but it looks like it would work.

-- 
Best Regards
Ulf Samuelsson
ulf@emagii.com
+46 722 427437



