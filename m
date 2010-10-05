Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1P3CSH-0003u6-Pr
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Oct 2010 20:41:39 +0200
Received: by yxg6 with SMTP id 6so2206073yxg.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Oct 2010 11:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=TdJ9sdcYaZwC5BTlr6aShcdcg9MHRi/qtfuXMMByQXc=;
	b=RXORR0x4F1RDI+6PuOvvdYITn4BmmGLqihajrkRKn0i/k9avObuB5WmXmg7H6k5z0u
	c6qdiOv65+HTnpb7zLkG1YN5yYFdoI28G3TENxG9UyxoJnuYPyyMhGOXJN3efsV6lUny
	+e6lFPnJ/9RtlXIiJyCbYtIzs51S/CH9CKU+k=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=Fj8zJzN5A+v/gR0U0JDeDqUwErs8GecSRG7hwrkxunmz5Ztj1KuPyuJ6tnaz72Fpk4
	PfSwoqgu9OGoM7w10EEivHoCUxQZ1wibKoJmgB8Z3lE4deRfn03DAg6kzhuGElTwyDu0
	Jtuv2/81MiYkIkgfpndnNWTZzvUEfiw+5mKKw=
Received: by 10.42.174.201 with SMTP id w9mr885548icz.86.1286304077229; Tue,
	05 Oct 2010 11:41:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.199.1 with HTTP; Tue, 5 Oct 2010 11:40:56 -0700 (PDT)
In-Reply-To: <i8ev7s$ts9$1@dough.gmane.org>
References: <1286264643-6352-1-git-send-email-raj.khem@gmail.com>
	<i8ev7s$ts9$1@dough.gmane.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 5 Oct 2010 11:40:56 -0700
Message-ID: <AANLkTik=8R-PVs1N=01fp3RB6WVUhFqF76NCBWHcRttL@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 0/6] libtool 2.4 upgrade
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
X-List-Received-Date: Tue, 05 Oct 2010 18:41:39 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Oct 5, 2010 at 3:38 AM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 05-10-10 09:43, Khem Raj wrote:
>> Hi
>>
>> Following set of patches is intial support for getting libtool 2.4 into
>> openemebedded. I have so far built minimal-image for two machines successfully
>>
>> The big change that libtool 2.4 brings is sysroot support and I have added
>> support to use this feature. It should make our life easier.


Adding --with-sysroot is not that big a problem as it will be ignored
if its not supported.
bigger problems are where we munge .la files. I have thrown out that
code which will render
2.2.6 useless for now but thats not the final patch. Final solution
would be to make 2.2 and
2.4 coexist unless there are road blockers.

>
> I'm a bit concerned about the way this is implemented, it seems to for
> libtool 2.4 onto everyone since it changes e.g. autotools.bbclass. Is
> that intended? If so we need signoffs from each and every distro
> maintainer *and* from the maemo-compat folks as well.
> Unless there is a way to make the new features conditional on the
> libtool version.
>
> My usecase is that I don't want to switch angstrom-2008 to a newer
> libtool, but do want to switch angstrom-2010 to a newer one and build
> *both* from .dev.

yes backward compatibility is in my minds. The intention was for
getting more hands on testing 2.4


>
> regards,
>
> Koen
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFMqwA8MkyGM64RGpERAoLPAKCSGVTJBBzV/OWiWfWBgTjKnQPlHQCeLfUh
> 2UOAJTM3NsITxR5QSYA+PDc=
> =PeUa
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


