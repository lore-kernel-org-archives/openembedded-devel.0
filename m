Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PInUq-00083P-IY
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Nov 2010 20:16:45 +0100
Received: by ywg8 with SMTP id 8so934459ywg.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Nov 2010 11:15:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=xz9bY6osMoXwYslA8nW4h2fbznTl7UDH+zsaGQ5gkeU=;
	b=csaSovF65ASsJ7rZcI2NmoeQQp9dLzrbEe/yo1g3mEYv78ZLpGx8+FFiKucOMs9ztq
	hBmJI5DQ+FMnppku/tY8EIndQ9ChWHumyEIS51t52DOlbAIVpGP9eAGyZmOIolOfcC47
	dn9I4TunbcUN2pnovEb+QoEwZqu0s1N2gnIIA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=CairNko6HR7eGamaL/7rXe6fUzmgCGlRnGE4qEvFH6aHmsIKqNOVizXqQgPo1kV2Bl
	pXUS8Qq4cRXQ5t783NSxD7kMcPtdoRAXsJJ9c+jxXJVvKxoweC9k9GiIj6ycmsy8KJNf
	RToHnpNH8pkIqqyoxnUvRiQpvPTZiXF+my0ik=
Received: by 10.91.12.18 with SMTP id p18mr12066130agi.48.1290021337349; Wed,
	17 Nov 2010 11:15:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.120.8 with HTTP; Wed, 17 Nov 2010 11:15:17 -0800 (PST)
In-Reply-To: <ic06a8$uft$1@dough.gmane.org>
References: <AANLkTi=4sU4238+b8zyJJ35VCyJB2ysestx9N=_my697@mail.gmail.com>
	<ic06a8$uft$1@dough.gmane.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 17 Nov 2010 11:15:17 -0800
Message-ID: <AANLkTinMGzu9OvP65D95vqg9Bqiz80Yh9nkzJRUQbwFj@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Preparing for release - Freeze on master
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
X-List-Received-Date: Wed, 17 Nov 2010 19:16:46 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Nov 17, 2010 at 1:12 AM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 16-11-10 19:20, Khem Raj wrote:
>> Hello All,
>>
>> In order to get to the 2010.12 release, I would like to request to
>> stop pushing any changes to master until release. Please keep your
>> changes in you local tree ready for when the window
>> opens again after the release.
>
> At OEDEM we agreed that the release would pick a tested branch tag to
> avoid such a draconic freeze.
>

I guess you misunderstood. We are tagging tested releases. It will be
similar but this time
as we are making release, I want people to be more cautious of what is
committed. As we do not
branch and tag master thats why the request to be a bit careful
because if you look at the
tested tags we have broken builds for some weeks. The release will be
a tag and not a branch from master
after release if need be and there is enough developer interest to get
bug fixes to the release and maintain
it thats fine to branch at that point from the tag

> regards,
>
> Koen
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFM45yIMkyGM64RGpERAg3vAJwNA5rhbbvqBdlcooaaCAIdk3nixACbB698
> NO2DRKlx0oh3IaUQH0rhH1w=
> =66ST
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


