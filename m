Received: from mail-yw0-f178.google.com ([209.85.211.178])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NYdAn-0001Bw-BP
	for openembedded-devel@lists.openembedded.org;
	Sat, 23 Jan 2010 11:25:00 +0100
Received: by ywh8 with SMTP id 8so2026156ywh.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Jan 2010 02:22:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:content-type:to:subject
	:references:date:mime-version:content-transfer-encoding:from
	:organization:message-id:in-reply-to:user-agent;
	bh=c6U6J3yAIVUeKAqBV7v77f4j9jd6K+no+ofhmiDTN5k=;
	b=u0Ey9WL/pigSeQaMYwqqumq1wlHt3krsNkg8D2Quu1DF1xE8kJKefe+gAEiZlyCYLD
	ZFHdIiUHxHvjxoBN1z3tb0Wk37BkU1VUR3kV3QAxSsH4nd7FHBjm789XNynwNf17QA3u
	1ARwDwj7Uwt/R9yf1+i/4jsa/biJp9d1w6hr4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=content-type:to:subject:references:date:mime-version
	:content-transfer-encoding:from:organization:message-id:in-reply-to
	:user-agent;
	b=WwaqddfGuK35WUsTn4NE6nBUxQUYkMpbRC23NdoYJqffJGnWb7CcSGKBEUez/sppk2
	2LhLvUOH9drBthTVd0/YMOiPpoZj0m/j0gDMM05yV6UmZmI2hxoY14gP/8CYayHa2wsN
	UTFdxa6l+Gwe2vRugeFuUts3hQdSNemFCmftw=
Received: by 10.101.82.19 with SMTP id j19mr5343601anl.44.1264242158520;
	Sat, 23 Jan 2010 02:22:38 -0800 (PST)
Received: from guohr-laptop-ubuntu ([123.162.71.84])
	by mx.google.com with ESMTPS id 22sm1119619ywh.0.2010.01.23.02.22.35
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 23 Jan 2010 02:22:37 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <> <1264239785-28226-1-git-send-email-camelguo@gmail.com>
	<201001231050.38823.holger+oe@freyther.de>
	<op.u6zcfwramn1qzu@guohr-laptop-ubuntu>
	<1264241020.3630.14.camel@mattotaupa.wohnung.familie-menzel.net>
Date: Sat, 23 Jan 2010 18:22:27 +0800
MIME-Version: 1.0
From: "Guo Hongruan" <camelguo@gmail.com>
Organization: Gulessoft, Inc
Message-ID: <op.u6zdrp0kmn1qzu@guohr-laptop-ubuntu>
In-Reply-To: <1264241020.3630.14.camel@mattotaupa.wohnung.familie-menzel.net>
User-Agent: Opera Mail/10.10 (Linux)
X-SA-Exim-Connect-IP: 209.85.211.178
X-SA-Exim-Mail-From: camelguo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] linux-storcenter: add fw-and-powerpc-install.patch
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
X-List-Received-Date: Sat, 23 Jan 2010 10:25:00 -0000
Content-Type: text/plain; charset=utf-8; format=flowed; delsp=yes
Content-Transfer-Encoding: Quoted-Printable

=E5=9C=A8 Sat, 23 Jan 2010 18:03:40 +0800=EF=BC=8CPaul Menzel  =

<paulepanter@users.sourceforge.net> =E5=86=99=E9=81=93:

> Am Samstag, den 23.01.2010, 17:53 +0800 schrieb Guo Hongruan:
>> the building of linux-storcenter_2.6.27.7 failed due to lack of this =
 =

>> patch
>
> I think Holger meant, what the patch is doing. Maybe it is not needed
> and you can remove it from `SRC_URI`.

I just copied it from linux-orion directory. This patch just adds space =
 =

between '-m' and 'mode'. (see the patch) On my ubuntu-8.04, 'install  =

-m0644' is the same as 'install -m 0644', so this patch can be removed  =

 from SRC_URI. But I don't know whether or not it is an issue on other  =

linux operation systems.

By the way, I found it in the following recipes, all of them are for ppc=
  =

arch.
linux-linkstationppc_2.6.28.4.bb:            =

file://fw-and-powerpc-install.patch;patch=3D1 \
linux-orion_2.6.28.4.bb:            =

file://fw-and-powerpc-install.patch;patch=3D1 \
linux-storcenter_2.6.27.7.bb:            =

file://fw-and-powerpc-install.patch;patch=3D1 \
So, I just copy it into linux-storcenter.

>
> That said, firstly Holger probably did not see that the patch is copie=
d
> from somewhere else in the repository. The question is if it is
> recommended to note in the commit message from where it is copied or i=
f
> Git should be used to determine this.

Yes, I understand. I should tell where I copied it from

>
> The second thing is, that the patch from `SRC_URI` is missing a header=

> with the description of its purpose [1]. But since it is copied it has=

> been so before.
>
>
> Thanks,
>
> Paul
>
>
> [1] http://wiki.openembedded.net/index.php/Push_patches_upstream


-- =

Guo Hongruan, Embedded Linux Consultant
Skype: camelguo
Twitter: camelguo
http://www.gulessoft.com


