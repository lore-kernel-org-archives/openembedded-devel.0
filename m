Received: from mail-bw0-f209.google.com ([209.85.218.209])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <clenovak@gmail.com>) id 1NbwbP-0000yt-FS
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Feb 2010 14:46:10 +0100
Received: by bwz1 with SMTP id 1so2322474bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Feb 2010 05:43:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:references:in-reply-to
	:content-type:content-transfer-encoding;
	bh=tlFzAhhyHO5iDjSTSb3/It2bT4KRddI3JmkhIa9El4E=;
	b=MfQ4sjonkEMw7mrEzf3aPHO/gC/EHUUQiqvAkH7J/kG8qno3wUu3ZEzffMbSz3N3Oe
	OzJUoKFk5zBD/aLJo+FvTSJcoR2V+p6q4G6EC0shFmZx0jgqnKtf1/j3aIDvAM1DSqUT
	maQFGFVv16WCV/slVvO8QLfm/7KC0r9/PNLBw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=FiUgj+Ofu3kBvQ14Umibrrmnd9slN6Jv1y4UGZK8IgOYsV3ysDudeDs9iqjR1cRVht
	4LI1cqYQXvWUQJwtOlYvoVfRerr/jbr0vE+mefXG79JtQiMokPEk8EJbRvrAryKwtqfv
	GeBy2J3X8nb0KUZvr8pHZ4Eb3oUENiOpK8XFA=
Received: by 10.204.135.211 with SMTP id o19mr3409879bkt.100.1265031820982;
	Mon, 01 Feb 2010 05:43:40 -0800 (PST)
Received: from ?128.131.67.97? (zuckerhut.nt.tuwien.ac.at [128.131.67.97])
	by mx.google.com with ESMTPS id 14sm2119717bwz.5.2010.02.01.05.43.39
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 01 Feb 2010 05:43:40 -0800 (PST)
Message-ID: <4B66DA8A.8070907@gmail.com>
Date: Mon, 01 Feb 2010 14:43:38 +0100
From: Clemens Novak <clenovak@gmail.com>
User-Agent: Thunderbird 2.0.0.23 (Windows/20090812)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <6594c4541001300748n1e9939f2t2ef47cb7738f2f4d@mail.gmail.com>	<6594c4541001300751j40b0c294g8f185063f80d1607@mail.gmail.com>
	<hk1mv9$vao$1@ger.gmane.org>
In-Reply-To: <hk1mv9$vao$1@ger.gmane.org>
X-SA-Exim-Connect-IP: 209.85.218.209
X-SA-Exim-Mail-From: clenovak@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Problems with building minimial-image for AVR32
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
X-List-Received-Date: Mon, 01 Feb 2010 13:46:10 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Thank you very much for your help - it works now!

Regards - Clemens

Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 30-01-10 16:51, clemens novak wrote:
>   
>> Dear all,
>>
>> I'm fairly new to Openembedded, and try to build a system for the
>> Atmel NGW100. I proceeded according to the getting started guide
>> (obtaining bitbake and checking out openembedded). My local.conf sets
>> DL_DIR, BBFILES,
>> MACHINE = "atngw100"
>> TARGET_OS = "linux-uclibc"
>> DISTRO = "angstrom-2008.1"
>> ANGSTROM_MODE = "uclibc"
>> ANGSTROMLIBC = "uclibc"
>>     
>
> Remove the TARGET_OS setting, local.conf is not the place to poke at
> that, the ANGSTROM_MODE will do the right thing already.
>
> regards,
>
> Koen
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFLZF8qMkyGM64RGpERAqQwAJ9xLOXBzkj7PDpUP3bQa8ASbCN0OwCgtODf
> EdY0DbG0OCh+4C+ohgJ4kGA=
> =hFY0
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>   



