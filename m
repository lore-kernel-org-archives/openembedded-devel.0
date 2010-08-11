Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Oj9vT-0002AY-2N
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Aug 2010 13:56:57 +0200
Received: by gwb15 with SMTP id 15so11147gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Aug 2010 04:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=voKJZM+EMm548dgtY0z64slctOYt3I2iHW0w0khnEno=;
	b=BlUACj+6aj9D7swmF1orm76o3nRtlU3A7QKECqyBvEr6BeNWhbF2uFSfVUw4ZCjmNc
	dURhITOKD7BEy1t8kFIKDBmQHa/z81xgH9P+ZL4+crjJWRuypZAFrkfx9gOUyzWwhJlZ
	fTFKRYD4yE+LWc9iAx7x5td4hiFyWVHm5k59g=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=x44VXDjPUvZTUgekS6KHTx57f/Yob01U1rypHtdZ1CN34YbS1D5YHmmwbUlHKI5bj/
	og+HZL77UKhnQ7E4L/An6LLY4hZH+2tho6QOJK/GVIcS9TKuQkjhx2F2i2vAvmJm6ty/
	9vQiMv/78Kj/D7Sf3l5LSae5IvDVZD0aafUhM=
MIME-Version: 1.0
Received: by 10.150.140.6 with SMTP id n6mr17427524ybd.315.1281527800917; Wed, 
	11 Aug 2010 04:56:40 -0700 (PDT)
Received: by 10.150.53.9 with HTTP; Wed, 11 Aug 2010 04:56:40 -0700 (PDT)
In-Reply-To: <i3tp29$uvf$1@dough.gmane.org>
References: <4C61E523.7070405@gmail.com>
	<i3tp29$uvf$1@dough.gmane.org>
Date: Wed, 11 Aug 2010 13:56:40 +0200
Message-ID: <AANLkTin=ZaqVrBgzXYjfy_nchZVSh5eBUuqXQBRryEwt@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] Mass convert PREFERRED_VERSION_* to be weakly assigned.
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
X-List-Received-Date: Wed, 11 Aug 2010 11:56:57 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/8/11 Koen Kooi <k.kooi@student.utwente.nl>:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 11-08-10 01:47, Graham Gower wrote:
>> find conf -type f -exec sed -i -e 's/^PREFERRED_VERSION_\([^ \t]*\)\([ \t]*\)=/PREFERRED_VERSION_\1\2?=/' {} \;
>
> NAK, Angstrom pins things with a hard assignment for good reasons. We
> are open to discuss specific issues you have with versions for various
> recipes, though.

Well, I would like angstrom to move to the latest version of mythtv.
Would that be possible (and if not what is the problem with mythtv 0.23)

Frans.

PS: I'm planning to migrate mythtv to 0.23.1 in a few days.


