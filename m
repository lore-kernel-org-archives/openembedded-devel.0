Received: from mail-pz0-f192.google.com ([209.85.222.192])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NNFwU-0004BD-U4
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Dec 2009 02:23:14 +0100
Received: by pzk30 with SMTP id 30so4656694pzk.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Dec 2009 17:21:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:content-type:to:subject
	:references:date:mime-version:content-transfer-encoding:from
	:organization:message-id:in-reply-to:user-agent;
	bh=NmAUFsC39AmO9OVbiA8APyc5hk3g/xdY9456E29Neh8=;
	b=nQBY8+RD9pXcm7QD7nwpnYaqcmbYhO9IFx9J8u5ly1Uj++AO17tDTsN2yStr0W5wyI
	49Ym5wOAnOLQwzLx2pRkugE4cHuOZA9cga4Wty9uj0sbp3hpzAgumDTFr88oE8VTQvWo
	i5W1J9OaX4P8Fj4ckjU0LPv6Yht7pgehsXRSg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=content-type:to:subject:references:date:mime-version
	:content-transfer-encoding:from:organization:message-id:in-reply-to
	:user-agent;
	b=NSJzZs49agALEe+OFJhDb7nxSNgK8fl6oqE9jWeg0WONJiPn1wGkJexIICudPt5Rq3
	U8/If/DqswRsGN3gbmh/r+I0VLc8KqnkF4/v8j+INBDrLwynbmKnhLqsHiIxzG1jgn4x
	LheJ9QsN2EPc2hY0cv9KpDF3IxOGplisbsJMI=
Received: by 10.114.6.28 with SMTP id 28mr6399135waf.115.1261531277808;
	Tue, 22 Dec 2009 17:21:17 -0800 (PST)
Received: from guohr-laptop-ubuntu ([123.162.69.196])
	by mx.google.com with ESMTPS id 23sm6473974pzk.4.2009.12.22.17.21.13
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 22 Dec 2009 17:21:17 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <> <1261448680-12334-1-git-send-email-camelguo@gmail.com>
	<1261473949.28755.191.camel@lenovo.internal.reciva.com>
Date: Wed, 23 Dec 2009 09:21:00 +0800
MIME-Version: 1.0
From: "Guo Hongruan" <camelguo@gmail.com>
Organization: Gulessoft, Inc
Message-ID: <op.u5c91ae4mn1qzu@guohr-laptop-ubuntu>
In-Reply-To: <1261473949.28755.191.camel@lenovo.internal.reciva.com>
User-Agent: Opera Mail/10.10 (Linux)
X-SA-Exim-Connect-IP: 209.85.222.192
X-SA-Exim-Mail-From: camelguo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] Modify distro/minimal.conf to use glibc and add an eglibc-based minimal distribution
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
X-List-Received-Date: Wed, 23 Dec 2009 01:23:15 -0000
Content-Type: text/plain; charset=utf-8; format=flowed; delsp=yes
Content-Transfer-Encoding: Quoted-Printable

No, it is not a bug. I just want to specify the libc type explicitly in =
 =

the distribution name.

=E5=9C=A8 Tue, 22 Dec 2009 17:25:49 +0800=EF=BC=8CPhil Blundell <philb@g=
nu.org> =E5=86=99=E9=81=93:

> On Tue, 2009-12-22 at 10:24 +0800, Guo Hongruan wrote:
>> 1. conf/distro/minimal-eglibc.conf: add minimal distribution based on=
  =

>> eglibc.
>> 2. conf/distro/minimal.conf: use glibc instead of eglibc
>
> What's the reason for this change?  If eglibc is deficient in some way=

> then I would prefer to either see it fixed, or just switch minimal bac=
k
> to using glibc generically.  I am not sure that adding another distro
> variant for this is a good idea.
>
> p.
>
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


