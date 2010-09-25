Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OzOt7-0003rk-Kb
	for openembedded-devel@lists.openembedded.org;
	Sat, 25 Sep 2010 09:09:39 +0200
Received: by iwn2 with SMTP id 2so1213320iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 25 Sep 2010 00:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=MZbdqz2Osdwa0BMOv5nJ271+YCYmgQbgbzIQutchjmw=;
	b=XE63vgjBKKIbNtZz7c52yyc8fqHlB1MtLw5D2QpKVjxMI1O2LhVmpXbLicNYWrBjM1
	EZuFiBhzi32bwD/dQ9ymeMw8ybcn0IsuH6WHgJxF2qTttrUivKtihandOE+Nvi+EmMSX
	dvewuVMZN2sHa35BJccz3EBFg27KeERo0nKa4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=PyVC8sjTQ1Xkl/vzACmAh3MWVGS1jUko4quFxuYC4ErqTQ5U/RctIluiZh6G2t53Av
	Gn1KWbsVr064eWtkKdTYCwuSCcqDJcdSz+9mhdhBSHDCQfz4HfJeZpug9f02RfTl+MVn
	zTpfPLWx+CtE6lUjji5ES2uUDFnWtxL5jJS+o=
MIME-Version: 1.0
Received: by 10.231.159.203 with SMTP id k11mr5110427ibx.115.1285398571183;
	Sat, 25 Sep 2010 00:09:31 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Sat, 25 Sep 2010 00:09:31 -0700 (PDT)
In-Reply-To: <i7j7n6$u68$1@dough.gmane.org>
References: <4C9D1136.2070507@freyther.de>
	<i7j7n6$u68$1@dough.gmane.org>
Date: Sat, 25 Sep 2010 09:09:31 +0200
Message-ID: <AANLkTikLp83F_dsDzD7fqL4LLm+Kgh75KFri++OBmHxf@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Qt and detecting iWMMXT
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
X-List-Received-Date: Sat, 25 Sep 2010 07:09:39 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/9/25 Koen Kooi <k.kooi@student.utwente.nl>:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 24-09-10 22:59, Holger Freyther wrote:
>> Hi all,
>>
>> when building for XScale one could pass -iwmmxt to the configure script. Now
>> how can a recipe find out if XScale systems are targeted? The closest thing I
>> can think of is to look at PACKAGE_ARCH and see if xscale is in it.
>
> Adapted from the mplayer magic Graeme and I came up with some years ago:
>
> #build with support for the iwmmxt instruction (pxa270 and up)
> MY_ARCH := "${PACKAGE_ARCH}"
> PACKAGE_ARCH = "${@base_contains('MACHINE_FEATURES', 'iwmmxt', 'iwmmxt',
> '${MY_ARCH}',d)}"
>
> QT_CONFIG_FLAGS_append = " ${@base_contains('MACHINE_FEATURES',
> 'iwmmxt', ' -iwmmxt', '',d)} "
>
> regards,
>
> Koen

Nice solution.
Guess it would be useful to have a list of all possible
MACHINE_FEATURES and DISTRO_FEATURES somewhere (e.g. wiki)

Frans


