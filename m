Received: from mail.dream-property.net ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1Rzc4z-0000Eg-Gl
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Feb 2012 23:51:33 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 7DDB331590F7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2012 23:43:17 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id uUlHvXWDK78e
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2012 23:43:10 +0100 (CET)
Received: from [172.22.22.61] (drms-590ecde1.pool.mediaWays.net
	[89.14.205.225])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 99C9C31590F2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2012 23:43:10 +0100 (CET)
Message-ID: <4F42CC7D.60401@opendreambox.org>
Date: Mon, 20 Feb 2012 23:43:09 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1329745909-21013-1-git-send-email-eric@eukrea.com>
	<4F429115.3070907@opendreambox.org>
	<20120220232237.39546d3f@eb-e6520>
In-Reply-To: <20120220232237.39546d3f@eb-e6520>
Subject: Re: [meta-oe] vsftpd: add new package
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
X-List-Received-Date: Mon, 20 Feb 2012 22:51:33 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 20.02.2012 23:22, Eric B=E9nard wrote:
> Hi Andreas,
>=20
> Le Mon, 20 Feb 2012 19:29:41 +0100,
> Andreas Oberritter <obi@opendreambox.org> a =E9crit :
>> On 20.02.2012 14:51, Eric B=E9nard wrote:
>>> - imported 2.0.5 from oe-classic
>>> - upgrade to 2.3.5 which is latest stable
>>> - tested on ARMv5 with Angstrom
>>
>> I created a recipe for vsftpd, too. Here's my version for your=20
>> reference. All patches were taken from the Debian or Ubuntu package.
>>
>> It differs from your recipe in these ways:
>> - uses openssl
>> - uses pam if available
>> - uses xinetd
>=20
> I'm not sure that depending on xinetd is a good point, I've no strong
> opinion concerning the other points (except I don't need openssl, pam
> & xinetd in my image in the project where I'm using vsftp).

I'm not sure either. All of this should probably be made optional.

>> - allows to set custom default configuration options in bbappends
>=20
> Isn't that also possible by simply providing a custom vsftpd.conf in
> the project's layer ?

Yes, that would be possible, too. The way I implemented just makes it
easier to use OE's variables in configuration items and to override only
few options like the ftp banner. And to keep an up-to-date configuration
example with increasing versions.

Regards,
Andreas



