Received: from mail-yw0-f188.google.com ([209.85.211.188])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NK7DW-0002rA-FA
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Dec 2009 10:27:49 +0100
Received: by ywh26 with SMTP id 26so2614191ywh.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Dec 2009 01:26:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:content-type:to:subject
	:references:date:mime-version:content-transfer-encoding:from
	:organization:message-id:in-reply-to:user-agent;
	bh=QtA+OF/uWraKpLYvsO+9fh2W3wUPZYwXZqaPkQ1hggw=;
	b=qaGDt22BnxkbME5jvngRB3UTTuN+ucuShog8LWkr37nGuo7yOGzSe2xssd0EDWIiCw
	ZlkO7RbH4/xSk/rHi6/g173DNmqGdjAzxibVDeTMl6ht9e5u0xAB7+J3OREOndiGEigN
	inY2sZW01eEZVFabAZSSnOXtxD1O2rcSZUejw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=content-type:to:subject:references:date:mime-version
	:content-transfer-encoding:from:organization:message-id:in-reply-to
	:user-agent;
	b=BtPW+L0jXvuVr2IikCeGTItc2jJzCMNAZXHExW5+8WRUpO3Z6anfeUhXBZ8sGgHDAs
	w/zCG6iZRSYhz3uBM/+ttTNsP0j8OTpMm4kwDwGkUdZ/T3SQ6+rqr+z6txbG9Odb3zLo
	YZY8sFZ1xiNshrhkTWwy4F1LJXg4E8Qw2GSDI=
Received: by 10.150.166.4 with SMTP id o4mr6819700ybe.53.1260782760343;
	Mon, 14 Dec 2009 01:26:00 -0800 (PST)
Received: from guohr-laptop-ubuntu ([123.54.125.108])
	by mx.google.com with ESMTPS id 20sm3476424iwn.5.2009.12.14.01.25.57
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 14 Dec 2009 01:25:59 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <op.u4w4tyyrmn1qzu@guohr-laptop-ubuntu>
	<200912140947.10207.holger+oe@freyther.de>
Date: Mon, 14 Dec 2009 17:25:53 +0800
MIME-Version: 1.0
From: "Guo Hongruan" <camelguo@gmail.com>
Organization: Gulessoft, Inc
Message-ID: <op.u4w8hfz5mn1qzu@guohr-laptop-ubuntu>
In-Reply-To: <200912140947.10207.holger+oe@freyther.de>
User-Agent: Opera Mail/10.10 (Linux)
X-SA-Exim-Connect-IP: 209.85.211.188
X-SA-Exim-Mail-From: camelguo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: How generate dependence file without native packages
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
X-List-Received-Date: Mon, 14 Dec 2009 09:27:49 -0000
Content-Type: text/plain; charset=utf-8; format=flowed; delsp=yes
Content-Transfer-Encoding: Quoted-Printable

Hi,
     Yes, it works. The following is the command line I used to generate=
  =

dot file

bitbake -g helloworld-image -I quilt-native -I opkg-native -I  =

shasum-native -I ipkg-utils-native

     Unfortunately,  It does not support wild characters, so I must appe=
nd  =

lots of -I options for every native packages.

Thanks for your help.


=E5=9C=A8 Mon, 14 Dec 2009 16:47:10 +0800=EF=BC=8CHolger Hans Peter Frey=
ther  =

<holger+oe@freyther.de> =E5=86=99=E9=81=93:

> On Monday 14 December 2009 09:07:08 Guo Hongruan wrote:
>> Hi guys,
>
>> Is there any way to generate dependence without native packages?
>
> bitbake -h
>
>
>   -g, --graphviz        emit the dependency trees of the specified  =

> packages in
>                         the dot syntax
>   -I IGNORED_DOT_DEPS, --ignore-deps=3DIGNORED_DOT_DEPS
>                         Stop processing at the given list of  =

> dependencies when
>                         generating dependency graphs. This can help to=
  =

> make
>                         the graph more appealing
>
>
> (but then again this option might not work anymore... give it a try)
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel=



-- =

Guo Hongruan, Embedded Linux Consultant
Mobile: +86-0-13484056007
Skype: camelguo
Twitter: camelguo
http://www.gulessoft.com


