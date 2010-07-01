Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OUDFn-0007Hb-JA
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Jul 2010 08:28:23 +0200
Received: by iwn34 with SMTP id 34so1727562iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jun 2010 23:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=byqmjCGhtdrCdvmeRwAMW1aBg1d0W6APIXVNh19h00Y=;
	b=phPYzS+HNJ0ubyaJm7curP5TW4iG3gcommsghukBfyZiSRkVtmN+Ah46GuLO8uZPhF
	kmbBfA1/zj6ujc7uamnMkTAoQ5Ypp2VczYzxKklw3gfE7u8AZj/MBF3jBtuSwNrtiwTJ
	89+Z54vsOOGa5TqbfTT+dkV/Ev3lyuwKAqjZg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=Fbom3NLWNNRQ7//6x4JcjSbwyFsACuXQVm/fr1c8Caf0fblzNzOB4FCqvnIqux7JrW
	Y3SS1yDBnfpcA5csKTBpZXMnnsxYo/R5i00hxuiSFd8q4/djIRrn7qJJuWm00VRV0L9O
	AmV0KoKaqL2fJm5nw628ROH8fHyt834YCNQus=
Received: by 10.231.183.19 with SMTP id ce19mr9414772ibb.35.1277965404271; 
	Wed, 30 Jun 2010 23:23:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.14.131 with HTTP; Wed, 30 Jun 2010 23:23:04 -0700 (PDT)
In-Reply-To: <AANLkTimMVcS5I1GcVuqa1eTwZ4YIqb0NaJMqd1nepQYv@mail.gmail.com>
References: <AANLkTimMVcS5I1GcVuqa1eTwZ4YIqb0NaJMqd1nepQYv@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 30 Jun 2010 23:23:04 -0700
Message-ID: <AANLkTilGJjsqfz2zu4m3m5vQ99jCX44CrtFUSiRTpkE9@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC} cleanup glibc
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
X-List-Received-Date: Thu, 01 Jul 2010 06:28:23 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Jun 30, 2010 at 1:02 PM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> Triggered by a short discussion on irc with woglinde, I would like to
> suggest the following cleanup actions for glibc.
>
> 1. rewrite the recipes so they do not use patches in the dir of
> another version. Better copy those. That makes clearer who uses what,
> and avoids problems if a recipe is removed.
> (btw if people are against having copies, I suggest to put common
> patches in a dir whose name actually resembles it is for multiple
> versions e.g. glibc-2.4-2.5 or so)
> 2. remove some old recipes that are not pinned. Reason for removing
> them is that it reduces the amount of work needed for step 1
>
> currently we have:
>
> glibc-initial_2.10.1.bb
> glibc-initial_2.2.5.bb
> glibc-initial_2.3.2+cvs20040726.bb
> glibc-initial_2.3.2.bb
> glibc-initial_2.3.6.bb
> glibc-initial_2.4.bb
> glibc-initial_2.5.bb
> glibc-initial_2.6.1.bb
> glibc-initial_2.7.bb
> glibc-initial_2.9.bb
> glibc-initial_cvs.bb
> glibc_2.10.1.bb
> glibc_2.2.5.bb
> glibc_2.3.2+cvs20040726.bb
> glibc_2.3.2.bb
> glibc_2.3.3+cvs20041128.bb
> glibc_2.3.3+cvs20050221.bb
> glibc_2.3.3+cvs20050420.bb
> glibc_2.3.3.bb
> glibc_2.3.5+cvs20050627.bb
> glibc_2.3.6.bb
> glibc_2.4.bb
> glibc_2.5.bb
> glibc_2.6.1.bb
> glibc_2.7.bb
> glibc_2.9.bb
> glibc_cvs.bb
>
> suggestion is to remove the following versions because no one uses
> them: (verified by grepping for them in conf/distro (with -r)
>
> glibc-initial_2.3.2+cvs20040726.bb
> glibc-initial_2.3.6.bb
> glibc-initial_2.4.bb
> glibc-initial_2.7.bb
> glibc_2.3.2+cvs20040726.bb
> glibc_2.3.3+cvs20041128.bb
> glibc_2.3.3+cvs20050221.bb
> glibc_2.3.3+cvs20050420.bb
> glibc_2.3.6.bb
> glibc_2.4.bb
> glibc_2.7.bb
>
> I think the following are also obsolete, but I would like to get
> advise for these
> glibc-initial_cvs.bb
> glibc_cvs.bb

yes they could be converted into _git

>
> What do people think about this?

good plan. I think we should work towards reducing
the recipes for some packages before they become
unmanagable

>
> Frans
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


