Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OWZkq-0002Fe-E0
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 Jul 2010 20:53:57 +0200
Received: by bwz10 with SMTP id 10so20523bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Jul 2010 11:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=62kZFZd2xD5EKxcWeyOU5Jj0mYLaSTntNwkCfiIlieM=;
	b=MacUTDgZOmtJ0nMYoLvODzpZowgzZsLw9/WjFKBQygH+9DgvGcVzqgIj+tvzcQdisf
	NA4KkAeIuolHw5rYiMCQaAnvLbOXwS5ZFHSksT+vvPDWa2WUS7RCl4QmL/N4R0SRp/BM
	IL2c5WmZHHiiI8fip38Vmk8yFvFefMXX5N3Jo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=w+XAoSC3jwwoMFIRbq2hdyuCV8HGt6TBHH9vAoLaHcEwdmCQbtr4M39WctUz3LAVj/
	tXM+Spf5tJD/QJY+5unVjkKr1HV66dxa1XizS93oncXjcTqj2Wy6TXNn1DvBXEkN4C4K
	YdXyOfg/+xRPM3KmHynvqdEFPjG2RVd8NL4Hw=
MIME-Version: 1.0
Received: by 10.204.34.133 with SMTP id l5mr5444559bkd.180.1278528546774; Wed, 
	07 Jul 2010 11:49:06 -0700 (PDT)
Received: by 10.204.66.68 with HTTP; Wed, 7 Jul 2010 11:49:06 -0700 (PDT)
In-Reply-To: <1278527926-5065-1-git-send-email-fransmeulenbroeks@gmail.com>
References: <1278527926-5065-1-git-send-email-fransmeulenbroeks@gmail.com>
Date: Wed, 7 Jul 2010 20:49:06 +0200
Message-ID: <AANLkTikso9BfJHslU0Ss6nQ5SfnOdgy8RIU0WF383jXX@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] classes/base.bbclass: add INCOMPATIBLE_MACHINE
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
X-List-Received-Date: Wed, 07 Jul 2010 18:53:57 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/7/7 Frans Meulenbroeks <fransmeulenbroeks@gmail.com>:
> added INCOMPATIBLE_MACHINE
> we have COMPATIBLE_MACHINE but that does not allow to say that
> a package is supported by all except a certain machine.
> a regexp like "(?!arch)"
> This mechanism can be used to exclude certain machines.
> Idea is that in binutils and gcc you can use this to specify that
> a certain version does not support a certain machine

actually what I wanted to say in the commit message is that a regexp
like (?!arch) does not work.
\b(?!arch) or ^(?!arch) didn't work either and consulting #python did
also not give a solution to
exclude a string.

If I get enough acks for this I will commit after improving the commit mess=
age
>
> Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
> ---
> =A0classes/base.bbclass | =A0 =A07 +++++++
> =A01 files changed, 7 insertions(+), 0 deletions(-)
>
> diff --git a/classes/base.bbclass b/classes/base.bbclass
> index 2da0b7a..3174469 100644
> --- a/classes/base.bbclass
> +++ b/classes/base.bbclass
> @@ -380,6 +380,13 @@ python () {
> =A0 =A0 =A0 =A0 =A0 =A0 if this_machine and not re.match(need_machine, th=
is_machine):
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 raise bb.parse.SkipPackage("incompatible =
with machine %s" % this_machine)
>
> + =A0 =A0 =A0 =A0need_machine =3D bb.data.getVar('INCOMPATIBLE_MACHINE', =
d, 1)
> + =A0 =A0 =A0 =A0if need_machine:
> + =A0 =A0 =A0 =A0 =A0 =A0import re
> + =A0 =A0 =A0 =A0 =A0 =A0this_machine =3D bb.data.getVar('MACHINE', d, 1)
> + =A0 =A0 =A0 =A0 =A0 =A0if this_machine and re.match(need_machine, this_=
machine):
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0raise bb.parse.SkipPackage("incompatible=
 with machine %s" % this_machine)
> +
> =A0 =A0 pn =3D bb.data.getVar('PN', d, 1)
>
> =A0 =A0 # OBSOLETE in bitbake 1.7.4
> --
> 1.6.4.2
>
>


