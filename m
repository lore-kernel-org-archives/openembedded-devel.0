Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <giuseppe.condorelli@gmail.com>) id 1Rbg7Z-00011h-DB
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Dec 2011 23:19:17 +0100
Received: by iakh37 with SMTP id h37so1542341iak.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Dec 2011 14:12:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=references:from:in-reply-to:mime-version:date:message-id:subject:to
	:content-type; bh=4ulSLkgR0q4EGO3T/UxzZEyh56JmAzeZ/Onf8386Puc=;
	b=fAEikGy08VUEXT0hIF0muKPRcYcoKtxLNuQletXQ3TfiTEk8jcq1ADe/+1RdGsFkwq
	4M9uYtIqN1laWfSVgL8rM7IOkFbEmF/XsjVPPjxKuu0KzmyA4h56cY6DxkAFTDsyP68n
	KSuHy6H6920mUBoskOR+MKNK/ilXTzLmKj1pc=
Received: by 10.50.188.129 with SMTP id ga1mr10921062igc.69.1324073533119;
	Fri, 16 Dec 2011 14:12:13 -0800 (PST)
References: <CAOHjBZtWd8-_xgqbzx=jBjA4=tRD3CHJ62YiA=dzFr9QsUzaVA@mail.gmail.com>
	<20111216220119.GE28832@sakrah.homelinux.org>
From: Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
In-Reply-To: <20111216220119.GE28832@sakrah.homelinux.org>
Mime-Version: 1.0 (1.0)
Date: Fri, 16 Dec 2011 23:12:09 +0100
Message-ID: <-6031077886875684187@unknownmsgid>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: Question about package prefix
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
X-List-Received-Date: Fri, 16 Dec 2011 22:19:18 -0000
Content-Type: text/plain; charset=ISO-8859-1

Thanks so much!!!
Do you mean I have to write a unified (in distro/machine conf dir)
do_install to be propagated to all the built packages?

Regards,
Giuseppe

Il giorno 16/dic/2011, alle ore 23:01, Khem Raj <raj.khem@gmail.com> ha scritto:

> On (16/12/11 10:36), Giuseppe Condorelli wrote:
>> Hi All,
>>
>> I need to package against a different prefix using rpm. I mean, I don't
>> want to have to files located with
>> the absolute path (i.e. /usr/lib/ etc...) but I need to have them under a
>> specified path.
>> How can I obtain this? I saw conf/bitbake.conf contains many variable to be
>> accordingly set (prefix, exec_prefix, etc...)
>> but if I modify them the build will be broken. Also, looking at the
>> distro/<distros>.conf files I have not seen nothing similar.
>> Please can you suggest me something to solve my issue?
>
> write do_install so they get installed in the new location.
>
>>
>> Thanks,
>> Giuseppe
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
> --
> -Khem
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


