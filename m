Received: from mail-yx0-f180.google.com ([209.85.210.180])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1NeTeh-0003Lw-2o
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Feb 2010 14:28:02 +0100
Received: by yxe10 with SMTP id 10so5249774yxe.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Feb 2010 05:25:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=5IbxifZNasfizomXwc5VtUJEgGOmXxsvroeM6B96Ov0=;
	b=oI2xTIgQDmqgrG6kJMGjvA+/PBW0NU2Ca3h4Vcoi0zCWzGGRym74/y2Q2p4mWri1Lb
	3pCtWAMv7uHvvxzHKAHQWhZ1pnwOxb9H7Gb5hgSarqgK261Gdo8CZ9A2z8LfnepCYcIT
	Fhebh02nQ+IpNkG/keffNfgzym1a1qJ/TSvM0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=Q1xkRR2kD2AQYAF//nrZx68Fp6Gc0DLiYy7OuxeLAwimKotBaBaQ7r6gjGVP/ASldV
	wu3RPBQf50203TPWoOrA4ebbo7I4uQzn74vknrw6Lii3uSJCj4VXBLjr2WW4d3k0VIpn
	wL/N2KUvBDMeRkQLvaFugoMWn/tfQcGk3Kj/Y=
MIME-Version: 1.0
Received: by 10.101.14.16 with SMTP id r16mr3360143ani.23.1265635526674; Mon, 
	08 Feb 2010 05:25:26 -0800 (PST)
In-Reply-To: <hkmqif$i2t$1@ger.gmane.org>
References: <hkm5j4$fib$2@ger.gmane.org>
	<ac9c93b11002070821x6d5ac559sd8bb519b902b0af0@mail.gmail.com>
	<hkmqif$i2t$1@ger.gmane.org>
Date: Mon, 8 Feb 2010 14:25:26 +0100
Message-ID: <ac9c93b11002080525l4399ea54h23d387c8ce2f9024@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.210.180
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: TSC meeting minutes 20100204
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
X-List-Received-Date: Mon, 08 Feb 2010 13:28:02 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/2/7 Koen Kooi <k.kooi@student.utwente.nl>:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 07-02-10 17:21, Frans Meulenbroeks wrote:
>
>> The last two items discussed were new-style staging and packaged
>> staging. The TSC would like to *strongly* encourage people to move their
>> recipes to new style staging. If you are using packaged-staging with a
>> big TMPDIR (e.g. a few machines with big images built) legacy staging
>> will easily take more than 15 minutes per recipe because it scans
>> through the complete staging looking for changes.
>>
>>> Maybe I missed a thing, but can someone provide a pointer to how a
>>> good recipe with new style staging =A0should look like?
>>> I'll happily modify the recipes I touch regularly, but don't exactly
>>> know what to do.
>
> New-style staging means it has no do_stage method defined anymore (and
> not getting one thru things like autotools_stage.bbclass as well).
> It will re-use the output of do_install() to populate staging and run QA
> checks on.
>
> You can check it building it and and looking for messages like "Legacy
> staging enabled", which would tell you it's still using the old, slow
> method.
>
> regards,
>
> Koen

Did a quick grep, there are still some 1400+ recipes that have a
do_stage. Now some of them are older versions (e.g. there are 6
xorg-lib/pixman recipes).
I'm more than happy to do my part of the cleaning but....
Almost most of the packages are things I don't know too much about.
What I can do (with packaged staging) remove do_stage, build, build a
package that depends on it and if that builds commit my work. Is that
considered to be good enough?

Frans


