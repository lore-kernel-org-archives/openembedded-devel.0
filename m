Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PgbfB-0004NZ-4C
	for openembedded-devel@lists.openembedded.org;
	Sat, 22 Jan 2011 12:29:49 +0100
Received: by iwn8 with SMTP id 8so2817269iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Jan 2011 03:29:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=OcK1f82mc8F7AOYv0hQoy9YM/W52ClaMSqG7cDcsMlY=;
	b=ngLYivYC8ssjA68H7u7Z5NGqpX2Ee3N/Qv5bljPTlO4npnKVVeIbvMgf/ZXjvfVg2T
	tCaohd4D4qQSE3ZiwYg7/n/jO4Uwnzbcw+cvvgrySikhDqDk47Q+2iIiedBqmblmVDyZ
	ovH2uUTye/fuUvxaWzyz9CRS6vaieFe/apk1E=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=G3KsHV2jEMceeS/ZBtllGeCRd3+RSoS8ZbFZypSDcxx0hOyP79NMDQPQvvfYul4Yxo
	gnGXl1fktqnbjdbV0zYxbKe9XqMJyw/RVvk3mJ1u7Mk1LuF9UftKdvJdk4yhD2bTHQWy
	RlZM3Qh4ZFLe0I9X8h0iye5ytpsSro8bsaRFE=
MIME-Version: 1.0
Received: by 10.231.15.5 with SMTP id i5mr2072265iba.149.1295695747575; Sat,
	22 Jan 2011 03:29:07 -0800 (PST)
Received: by 10.231.34.69 with HTTP; Sat, 22 Jan 2011 03:29:07 -0800 (PST)
In-Reply-To: <20110121102102.GA7400@lit.local.igalia.com>
References: <20110120181233.GA1789@lit.local.igalia.com>
	<AANLkTin6XfEpo_ic0Edp8+58EbzGutuhohM-V4EzzwhJ@mail.gmail.com>
	<20110121102102.GA7400@lit.local.igalia.com>
Date: Sat, 22 Jan 2011 12:29:07 +0100
Message-ID: <AANLkTimuFZ094f47doDbgXRpL3W1=TU3miw5UqF+ZE2=@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org, vjaquez@igalia.com
Subject: Re: problems compiling glibc_2.9-r37.4 under Angstrom
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
X-List-Received-Date: Sat, 22 Jan 2011 11:29:49 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2011/1/21 V=EDctor M. J=E1quez L. <vjaquez@igalia.com>:
> On Thu, Jan 20, 2011 at 01:40:19PM -0800, Khem Raj wrote:
>> 2011/1/20 V=EDctor M. J=E1quez L. <vjaquez@igalia.com>:
>> >
>> > In order to build native-sdk-image recipe, I found my self compiling
>> > glibc_2.9-r37.4, because it is the real provider of virtual-libc-dev (=
the
>> > toolchain does not truly provide it -but that is another bug [1]-).
>> >
>> > But the glibc_2.9-r37.4 configuration fails using the canonical
>> > arm-angstrom-linux-gnueabi- toolchain (using the csl external toolchai=
n fails
>> > too, but for other reasons):
>> >
>> > Log data follows:
>> > [snip]
>>
>>
>> you might try to use eglibc. It may fix this issue for you.
>>
>
> Thanks. I'm giving a try to minimal distribution according to Yuri's
> observation [1].
>
> 1. http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-January/0=
28950.html

Victor, apologies for hijacking your thread.

If you are interested to use minimal, be sure to give it a try.
It works like a charm for me. and according to the testing page on the
wiki (http://wiki.openembedded.org/index.php/Testing) there are
several reports for native-sdk-image building under the minimal distro
(for various machines).
And if you encounter issues, feel free to send another mail to the
list or join the #oe irc channel on freenode. Often there is someone
around in that channel willing to help you.

Enjoy OE! Frans (eFfeM on irc).


