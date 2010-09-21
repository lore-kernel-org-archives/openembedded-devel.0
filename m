Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Oy4zn-0006mJ-ON
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Sep 2010 17:43:05 +0200
Received: by gxk10 with SMTP id 10so1853056gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Sep 2010 08:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=LM+dX+slwT4VBBktOGJ6aB156nYkjgucZsQz9KUKE1M=;
	b=kkmVhcs2sg5hufvwMZw+EQ0mZ0MvTi6s3O3jzU7WUYKSHf6ZT1jzucKNmk/PfD0SD0
	HJaGMJ6PPKPBKecLFbYFbFq/4VoXeCslOLggyedcn7apQcWS3PD6+Ducz3Iw6euUFs50
	m36QVl97ZgqjMwRrwRJbx7H91r8VtJ/xgqE80=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=AuV1ETlN8zgq2NJqSfmuOX62SCeUxQR2fs77RPIKOEv10cOmdJkgi2c8YVzqCrFPBl
	0XL7LJSjCKdvTRwuhQMICFtEU/dZwWgPHd21RzttWgOu+IO4Q/2MZDwAZA5mBDoPMAKO
	e9UpyQOr1CR905NX8O5CH5WuuJm3KX7LgqzgE=
Received: by 10.150.57.21 with SMTP id f21mr10770194yba.290.1285083771159;
	Tue, 21 Sep 2010 08:42:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.200.194 with HTTP; Tue, 21 Sep 2010 08:42:30 -0700 (PDT)
In-Reply-To: <4C98BE18.4080404@mentor.com>
References: <1285018008-2519-1-git-send-email-raj.khem@gmail.com>
	<4C98BE18.4080404@mentor.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 21 Sep 2010 08:42:30 -0700
Message-ID: <AANLkTikk6XoboNQvOBW7T-1povM+_-c2PM_m+hY=hYwK@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] gcc-cross: Link libmpfr, libgmp, libmpc and libelf statically into gcc
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
X-List-Received-Date: Tue, 21 Sep 2010 15:43:05 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Sep 21, 2010 at 7:15 AM, Tom Rini <tom_rini@mentor.com> wrote:
> Khem Raj wrote:
>
>> * Generate static version of these libraries
>
> We really need this either in gcc-configure-common, or gcc-configure-sdk as
> well.

I will add it to gcc-configure-sdk target gcc can link to .so's as
thats a captive
environment.

>
> --
> Tom Rini
> Mentor Graphics Corporation
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



-- 
-Khem


