Received: from mail-yw0-f178.google.com ([209.85.211.178])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NYcl6-0000Dz-2K
	for openembedded-devel@lists.openembedded.org;
	Sat, 23 Jan 2010 10:58:27 +0100
Received: by ywh8 with SMTP id 8so2012531ywh.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Jan 2010 01:56:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:content-type:to:subject
	:references:date:mime-version:content-transfer-encoding:from
	:organization:message-id:in-reply-to:user-agent;
	bh=0bLBJv6NFWIbsedoLh2aK2nnvRX9yFmdu0tdz2Tq/wU=;
	b=p67IpJVQmmcGiMxpSTqXEPGmWbm4kDf1lDrQ44XT4tMdkaoFCiCmRt7tWzkall95Bi
	EA+PRy1GgRI7ucCitnBURvLzZ92Lk20zgW8/K56ie6Agvq9Nl1DoijSCV/Q2QArdhz1A
	hWELyd7ftq9MzIT1z4Q3EIdxOE566PAfgziOk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=content-type:to:subject:references:date:mime-version
	:content-transfer-encoding:from:organization:message-id:in-reply-to
	:user-agent;
	b=lXLXtGqLgS7QQbE51hj1NxcIg8Cc9gO4hRDS5XPLmptfEdcF9PJ25Ho9yW658ISGG5
	qlbfsmxwUY2c5MPfOM3FF4iUl309C2O1u1fYDeLQxXX8Fe36V6YH1KhBukfVJA7Wqhgp
	h/7ECXymfTSUjo4BL7Z07PVmxNe95et/Uv2m0=
Received: by 10.150.76.24 with SMTP id y24mr5537477yba.151.1264240565252;
	Sat, 23 Jan 2010 01:56:05 -0800 (PST)
Received: from guohr-laptop-ubuntu ([123.162.71.84])
	by mx.google.com with ESMTPS id 6sm1106914ywc.38.2010.01.23.01.56.01
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 23 Jan 2010 01:56:04 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <> <1264239367-26057-1-git-send-email-camelguo@gmail.com>
	<201001231051.06864.holger+oe@freyther.de>
Date: Sat, 23 Jan 2010 17:55:54 +0800
MIME-Version: 1.0
From: "Guo Hongruan" <camelguo@gmail.com>
Organization: Gulessoft, Inc
Message-ID: <op.u6zcjg0gmn1qzu@guohr-laptop-ubuntu>
In-Reply-To: <201001231051.06864.holger+oe@freyther.de>
User-Agent: Opera Mail/10.10 (Linux)
X-SA-Exim-Connect-IP: 209.85.211.178
X-SA-Exim-Mail-From: camelguo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] linux-storcenter: fix circular dependency between do_package and do_deploy
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
X-List-Received-Date: Sat, 23 Jan 2010 09:58:27 -0000
Content-Type: text/plain; charset=utf-8; format=flowed; delsp=yes
Content-Transfer-Encoding: Quoted-Printable

Yes, I did.

the same question exists in
recipes/linux/gumstix-linux.inc|72| addtask deploy before do_package aft=
er  =

do_install
which may cause circular dependency too.

=E5=9C=A8 Sat, 23 Jan 2010 17:51:06 +0800=EF=BC=8CHolger Hans Peter Frey=
ther  =

<holger+oe@freyther.de> =E5=86=99=E9=81=93:

> On Saturday 23 January 2010 10:36:07 Guo Hongruan wrote:
>> * 'addtask deploy' sentence in linux-storcenter_2.6.27.7.bb conflicts=
  =

>> with
>>  the same one in kernel.bbclass and causes circular dependency betwee=
n
>>  do_package and do_deploy
>
> Could you please grep through recipes/linux and see how many more issu=
es  =

> we
> have of the same kind?
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel=



-- =

Guo Hongruan, Embedded Linux Consultant
Skype: camelguo
Twitter: camelguo
http://www.gulessoft.com


