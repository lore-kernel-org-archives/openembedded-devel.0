Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <captain.deadly@gmail.com>) id 1Othdg-0005Ee-Ks
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Sep 2010 15:58:09 +0200
Received: by wwb13 with SMTP id 13so348690wwb.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Sep 2010 06:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:references:in-reply-to
	:x-enigmail-version:content-type:content-transfer-encoding;
	bh=k2qsoRLCcMjn8T3pAKntSXEtX/RNDKQssjMSPHX8Q/o=;
	b=MVwjNEM2OLkzzbcKDFyTP6cuJeE+HikZMjtU+a2So83WTLSqvcEaCSIYikvFiQHZLo
	4KXvPU1NdBS2RRDQAaN/OyxH5bhmAhifp27tjnEUK8jbZTIpSCRKfxLfmFuXO0R5OFwg
	LY2NZc2qQRLbUNRMrm9Ca36EKWYFNNsgjglvw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding;
	b=VfBRmB/+Y78QE850yO8TnM81XpxR+T4XEuDOJfHsdFDrHhJpteBSolouExXoDND1C1
	hnjxMA20fQLaZCpAByMJ6U/BxP2pEvEzNSh9FQnw1k/u3o461vjRCYEHanOv/PydKoaq
	vFvF3n8KoJVYFew+5jY+6OBN3DSYvGKVvaPDY=
Received: by 10.227.135.71 with SMTP id m7mr50725wbt.11.1284040645226;
	Thu, 09 Sep 2010 06:57:25 -0700 (PDT)
Received: from [192.168.1.134] (dsl-51-41.dsl.netsource.ie [213.79.51.41])
	by mx.google.com with ESMTPS id e31sm1149902wbe.17.2010.09.09.06.57.23
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 09 Sep 2010 06:57:24 -0700 (PDT)
Message-ID: <4C88E7C2.1030500@gmail.com>
Date: Thu, 09 Sep 2010 14:57:22 +0100
From: Arigead <captain.deadly@gmail.com>
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4C85058D.8070506@gmail.com>	<1283996027.3036.1.camel@gnutoo-laptop>
	<AANLkTimz=Q1KsMrMUfwvSEueq1a3kEcgWFoVZDvFqzqK@mail.gmail.com>
In-Reply-To: <AANLkTimz=Q1KsMrMUfwvSEueq1a3kEcgWFoVZDvFqzqK@mail.gmail.com>
X-Enigmail-Version: 0.96.0
X-SA-Exim-Connect-IP: 74.125.82.41
X-SA-Exim-Mail-From: captain.deadly@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Asterisk and termcap
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
X-List-Received-Date: Thu, 09 Sep 2010 13:58:09 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Frans Meulenbroeks wrote:
> 2010/9/9 Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>:
>> On Mon, 2010-09-06 at 16:15 +0100, Arigead wrote:
>>> was trying to build Asterisk for the OpenMoko Free runner and it failed
>>> on a dependency on termcap so I tried to bitbake termcap first and that
>>> failed. The termcap compile stage is working but it's when it tries to
>>> install that the recipe seems to fail but I'm new to this.
>>>
>>> I'm off to read the openembedded documentation again but in the mean
>>> time if anybody can give me a hit that would be great.
>> We can't help you if you don't post some logs or console output.
>> Copy-pasting the part where it fails, if it's small, could be enough for
>> a start.
>> Denis.
>>
>>
> Denis, the message from Arigead is 3 days old and has already been dealt with.
> There is a patch for asterisk from Eric that makes it build fine for me.
> 
> Frans.
> 

Yes sorry if my original post was too vague, but it was a known issue at
the time anyhow. As Frans says the patch was added and is in the feeds
and Asterisk is now building for my target device. Thanks for you help
and pointing out where the problem was.



