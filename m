Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OPjgL-0006JX-MW
	for openembedded-devel@lists.openembedded.org;
	Sat, 19 Jun 2010 00:05:17 +0200
Received: by iwn5 with SMTP id 5so1552831iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Jun 2010 15:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=1ja/DgewZCJar5pPm1xMsHvUmAY+QnfqZl10ZwGpwfs=;
	b=X4K1iZX8+FRPSO7LCxhkpwBaLHRqU8v9TKXiugWP4eJGtFu+5uR1VRGwg/xfRn6vI4
	ng3FDt4Iv+8ma34k1QYrQBUBkHq7YB85Hgjl+9h2TGj8E4nRQ7RmffEwPJRwzpXOJ5V/
	/vCD1K+A44qnSnmXkDrWqgxs8TMdKtYcukwNs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=Yc2jJCaUnAt0HiiqROCk69XA/lni7pUBwxQk12VxY9twQpBaxOjk4nxZyQCkrUs46D
	FLygnJ1Z/bqOScBJAZH5JVhtXxdOFzPqU1rf7CS0MeLwF+lPbF/+KHcSX0mx4G7u9Cp+
	w6JEMNxwGzkBMregLZ7uDOtweY/v9RgScEJ7E=
Received: by 10.231.124.227 with SMTP id v35mr1674288ibr.185.1276898416187; 
	Fri, 18 Jun 2010 15:00:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.17.130 with HTTP; Fri, 18 Jun 2010 14:59:56 -0700 (PDT)
In-Reply-To: <hvfnha$e9k$1@dough.gmane.org>
References: <20100618001536.60bbc113.ospite@studenti.unina.it> 
	<hvfnha$e9k$1@dough.gmane.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 18 Jun 2010 14:59:56 -0700
Message-ID: <AANLkTild9C_PVbfpBYlTeknKZ4k64bjMqwNvwfMk3rTi@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: meta-toolchain fails in do_populate_sdk
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
X-List-Received-Date: Fri, 18 Jun 2010 22:05:17 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 18, 2010 at 5:07 AM, Koen Kooi <k.kooi@student.utwente.nl> wrot=
e:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 18-06-10 00:15, Antonio Ospite wrote:
>> Hi,
>>
>> * check_data_file_clashes: Package gdb-cross-sdk wants to install file
>> .../build/tmp/work/armv5te-oe-linux-gnueabi/meta-toolchain-1.0-r0/sdk/im=
age/usr/local/minimal/arm/share/info/dir
>> But that file is already provided by package =A0* binutils-cross-sdk
>
> I can confirm this bug, any fixes for it available?

we should force gdb-cross-sdk to not have those files and dirs.

> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFMG2FqMkyGM64RGpERAhzBAJsFd7qOJJGf6m4LH9GrC1Phdu/OzACguoWM
> 95Vei+qCe5qxjVygXxyZPmY=3D
> =3DVxkz
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


