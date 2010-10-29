Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1PBwtS-0008KG-2l
	for openembedded-devel@lists.openembedded.org;
	Fri, 29 Oct 2010 23:53:50 +0200
Received: by wwb39 with SMTP id 39so3516016wwb.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Oct 2010 14:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=9cvoadXcufp8kul2VG4silDn1jnIgJ5CLNaPnz8UJWI=;
	b=e2XFogVP1I2e6YiTxz3OkZpscfuOYNix/LsMfzg4Rr63hlUqaxT4l/DSOqMcVQ5HvR
	CiLHwKksNTpTP6bjFOnbjznmVcJ2Rin0cP86gJ9zo1KCOGbujRvugxC0pMdqrEte2Kf8
	jAufG8xrspmfELdVwPLGzL66F6xk+vJ9Cem2I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=m7Ed40XpmIBdku7OkRQG2R792kMfZDmyBDn2LyK6IOKhZhP7yVynhB6JXlOJko1CWr
	Hx1WKPwjcwhAuf5iYTvGnnPv0+lmdv6dh+UdlIwxCG4VmanJ3dvPiEQh38I+S2RlbJ96
	KfHpB6+Iyv5FGvcoIjmvGrO6xjjWBp8Eavdb0=
MIME-Version: 1.0
Received: by 10.227.138.142 with SMTP id a14mr1015605wbu.78.1288389182931;
	Fri, 29 Oct 2010 14:53:02 -0700 (PDT)
Received: by 10.227.37.205 with HTTP; Fri, 29 Oct 2010 14:53:02 -0700 (PDT)
In-Reply-To: <20101029191718.GA27520@gmail.com>
References: <20101029191718.GA27520@gmail.com>
Date: Sat, 30 Oct 2010 08:23:02 +1030
Message-ID: <AANLkTinhwS6oiM4iF_eoEbugqdaWBLN8Pgd0bCaupzwc@mail.gmail.com>
From: Graham Gower <graham.gower@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] Toolchain recipes, versions, removal and consolidation
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
X-List-Received-Date: Fri, 29 Oct 2010 21:53:50 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 30 October 2010 05:47, Khem Raj <raj.khem@gmail.com> wrote:
> Hi
>
> There are so many versions of toolchain components gcc/binutils/glibc that
> we have in metadata. I would like to reduce the number and keep supporting
> the ones we really use. Right now we have recipes for
>
> binutils = 2.14.90.0.6,2.14.90.0.7, 2.15.94.0.1, 2.16, 2.16.1, 2.16.91.0.6,
> 2.16.91.0.7, 2.17, 2.17.50.1, 2.17.50.0.5, 2.17.50.0.8, 2.17.50.0.12, 2.18,
> 2.18.50.0.7, 2.18.atmel.1.0.1, 2.19, 2.19.1, 2.19.51, 2.19.51.0.3, 2.20,
> 2.20.1, cvs
>
> gcc = 3.3.3, 3.3.4, 3.4.3, 3.4.4, 3.4.6, 4.0.0, 4.0.2, 4.1.0, 4.1.1, 4.1.2,
> 4.2.1, 4.2.2, 4.2.3, 4.2.4, 4.3.1, 4.3.2, 4.3.3, 4.3.4, 4.4.1, 4.4.2,
> 4.4.4, 4.5, csl-arm-2007q3, csl-arm-2008q1, csl-arm-2008q3
>
> glibc = 2.2.5, 2.3.2, 2.3.3, 2.3.5+cvs20050627, 2.5, 2.6.1, 2.9, 2.10.1,
> cvs
>
> uclibc = 0.9.28, 0.9.29, 0.9.30, 0.9.30.1, 0.9.30.2, 0.9.30.3, 0.9.31, git
>
>
> eglibc = 2.9, 2.10, 2.11, 2.12, svn
>
> They all use common files. So whenever there is a bugfix needed its a very
> hard job to first create a common fix that works across all versions
> secondly verify if it works and I am sure 80% of recipe versions mentioned
> here dont even build
>
> So I am going to propose to remove most of them which dont build and
> request the distro and machine maintainers to please update the list of
> toolchain components to keep.
>
> Please voice which versions should we really really keep. This should be a
> set which is buildable and functional.
>
> If I dont hear on this in coming weeks then I have a plan in my mind on
> which versions to keep
>
> Thanks
>
> -Khem
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


I welcome removal of obsolete recipes here. The barrier for others to
create patches will be reduced dramatically.

One further thing: glibc is obsolete for embedded systems, long live eglibc.

-Graham


