Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SPh5V-0001E0-GR
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 May 2012 23:27:53 +0200
Received: by pbbrq2 with SMTP id rq2so1403712pbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 May 2012 14:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding;
	bh=De5ePvLAJP9bl38Ht/22TcUfORFjnNZTTrWAl1+QCns=;
	b=JTZDPVM8lDiH++dtpFYDB3jz+jzWW4ag8SyTJm10uSGXsSn9vF63T0dlxfZrQZ43gs
	Qw7MYv+SSRehKUsB0VHYcZYow3d0tCQtVUKXi4pkkwr8Kf2M8TT6n4eEsQSTKLvoPFgt
	GXEK1s8ZyRVGbJRCCn4OrlXF5eTZRSazrZor0WWxuhW3Q679b3gPhgyUNySaQuWk9p88
	S7oHOx4KggaFHHnWlaUNLoNlCNiEjxJpPNLG+1ZnnEzNxYgtE5Dn2yJNmq8HsrFQObkq
	kYBP8m4IJZD24dNamCPElm8QHFpKq41SX6aDdulgyVBalkvyetgEk8qGexGYPEjvz6Qt
	eYOg==
Received: by 10.68.227.169 with SMTP id sb9mr776548pbc.157.1335993487996;
	Wed, 02 May 2012 14:18:07 -0700 (PDT)
Received: from [172.23.3.173] (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPS id 2sm2996677pbw.57.2012.05.02.14.18.04
	(version=SSLv3 cipher=OTHER); Wed, 02 May 2012 14:18:05 -0700 (PDT)
Message-ID: <4FA1A48A.2040605@gmail.com>
Date: Wed, 02 May 2012 14:18:02 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:11.0) Gecko/20120411 Thunderbird/11.0.1
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <1335951932-6143-1-git-send-email-koen@dominion.thruhere.net>
	<1335951932-6143-4-git-send-email-koen@dominion.thruhere.net>
	<20120502095150.GA3682@jama.jama.net>
	<CAMKF1spM9urWo1VBXG=qdWOcC_5_2kw-vBGqWv3Lg0xBPWiADA@mail.gmail.com>
	<788719CB-F74E-4219-85AC-82BE71D2068F@dominion.thruhere.net>
	<20120502182913.GA4658@jama.jama.net>
In-Reply-To: <20120502182913.GA4658@jama.jama.net>
X-Enigmail-Version: 1.4.1
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe/denzil][PATCH 4/6] gcc-4.5: Match with OE-Core on building procedure for libgcc and gcc-runtime
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
X-List-Received-Date: Wed, 02 May 2012 21:27:53 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 05/02/2012 11:29 AM, Martin Jansa wrote:
> On Wed, May 02, 2012 at 08:26:49PM +0200, Koen Kooi wrote:
>> 
>> 
>> Op 2 mei 2012 om 20:14 heeft Khem Raj <raj.khem@gmail.com> het
>> volgende geschreven:
>> 
>>> On Wed, May 2, 2012 at 2:51 AM, Martin Jansa
>>> <martin.jansa@gmail.com> wrote:
>>>> 
>>>> I'm not using gcc-4.5, but aren't those 3 patches only for
>>>> master? As gcc-4.7 and other gcc changes were in oe-core only
>>>> after release AFAIK.
>>>> 
>>> 
>>> Yes they are strictly for master to accomodate basic changes in
>>> build sequence we did for gcc 4.7 that said, I think now that
>>> denzil has released we should reconsider maintaining gcc 4.5 in
>>> toolchain-layer and same goes for other recipes in the layer.
>>> Infact I feel the whole layer can be dropped.
>> 
>> I was planning to propose the same, any objections?
> 
> I've switched to gcc-4.7, so not from me.

good and as Koen is nodding I assume angstrom is fine too. So I think
we should drop the layer from master.

> 
> Cheers,
> 

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAk+hpIoACgkQuwUzVZGdMxR1wwCfep667NaYhcoQKNuyTriVhRz4
FdwAn2sS+BlN0inqL0GsxJInP0CEnsN6
=E6x4
-----END PGP SIGNATURE-----


