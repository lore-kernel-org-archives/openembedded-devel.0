Received: from eumx.net ([91.82.101.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1T9XNi-0001MZ-LD
	for openembedded-devel@lists.openembedded.org;
	Thu, 06 Sep 2012 10:24:10 +0200
Received: from localhost ([127.0.0.1]:57848 helo=eumx.net)
	by eumx.net with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1T9XBi-00065q-Pf
	for openembedded-devel@lists.openembedded.org;
	Thu, 06 Sep 2012 08:11:46 +0000
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=eumx.net; h=message-id
	:date:from:reply-to:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding; s=default;
	bh=QOG2Pl4zp6xn9xK2ETE5RaSD5ec=; b=faczXyXWeHIIxeMltVRxhLjC5cyB
	okJdPiJ41S8MVQkPEIzC/vvXX+EkPDcvV+Cg/+M99jArKwfNrBNrE7NCW4qVz5LP
	x74MQyesJZNcl4SI8/FtFiIZA+2G0eYVjZiXdCg/NbB+x3ti3c6nvsRbyKBJYwEG
	8UAqEABjgf9dPQE=
Received: from [195.171.99.130] (port=59220 helo=[192.168.0.33])
	by eumx.net with esmtpa (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1T9XBi-00065n-NW
	for openembedded-devel@lists.openembedded.org;
	Thu, 06 Sep 2012 08:11:46 +0000
Message-ID: <50485B04.4030002@communistcode.co.uk>
Date: Thu, 06 Sep 2012 09:12:52 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120828 Thunderbird/15.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1346853750-503-1-git-send-email-ml@communistcode.co.uk>
	<4375690.RKMBt9Sfd5@helios> <20120905192818.GR3372@jama.jama.net>
	<1718555.hFmUFu8O5x@helios>
In-Reply-To: <1718555.hFmUFu8O5x@helios>
Subject: Re: [PATCH 3/3] libcec: update libcec to latest version (1.8.2) as to include RasPi support
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
X-List-Received-Date: Thu, 06 Sep 2012 08:24:10 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/09/12 22:32, Paul Eggleton wrote:
> On Wednesday 05 September 2012 21:28:18 Martin Jansa wrote:
>> On Wed, Sep 05, 2012 at 03:16:10PM +0100, Paul Eggleton wrote:
>>> It's not totally clear but it doesn't look like 1.8.2 has been released
>>> yet judging from their website; if that's the case then PV should be set
>>> to "1.8.1+git${SRCPV}".
>> Or rather
>> "1.8.1+gitr${SRCPV}"
>> like most meta-* recipes
> This was discussed not that long ago IIRC - the r is superfluous for git. In
> fact if you look at most OE-Core recipes that use SRCPV they do not precede it
> with r.
>
> Cheers,
> Paul
>

So even though it is the 1.8.1 release commit it should still be tagged 
with the git SRCPV?

-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--



