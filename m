Received: from mail-pz0-f192.google.com ([209.85.222.192])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NNFuY-0003lI-CF
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Dec 2009 02:21:13 +0100
Received: by pzk30 with SMTP id 30so4655894pzk.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Dec 2009 17:19:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:content-type:to:subject
	:references:date:mime-version:content-transfer-encoding:from
	:organization:message-id:in-reply-to:user-agent;
	bh=+VNWd2ZuXKC3RQeZm7FV4e9gNCRCQHtD+hlA/5JmOwM=;
	b=l5uO67eSeip1nVexzbFIEndwu53SaENKLZaMdCtbZmQ2AVKk3wOLnO/fbRVlSWa8Z/
	Ir9Rw3tStDQbjxnCS3V1K9F/oQvROM1dzsKyBflxzD3Sb3GybT5CY50wTW/NM4SYFnpb
	dWcUJVEGY5sE26ozs2efkCj5TUFg5fw5RxwAQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=content-type:to:subject:references:date:mime-version
	:content-transfer-encoding:from:organization:message-id:in-reply-to
	:user-agent;
	b=OkD9iz03t2/3MIIjuevMbIGgE19s0i63cKBh/yueDEyav6wvI/K8SKglmGSqvPPunB
	vexhlM2SoOH/xm95C98xPYx2yI6p18//jan9GIgQv5kbd/TgL21ZhnkGC3fGgL6T1Lml
	c6xqRk80cQjkQOmJQG4HQgUj+Odu7jro76KQw=
Received: by 10.115.64.16 with SMTP id r16mr4980325wak.224.1261531156326;
	Tue, 22 Dec 2009 17:19:16 -0800 (PST)
Received: from guohr-laptop-ubuntu ([123.162.69.196])
	by mx.google.com with ESMTPS id 23sm6465060pzk.12.2009.12.22.17.19.13
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 22 Dec 2009 17:19:15 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <op.u5bvk31emn1qzu@guohr-laptop-ubuntu>
	<20091222112005.GA21050@rhein.zuhause.netz>
Date: Wed, 23 Dec 2009 09:19:07 +0800
MIME-Version: 1.0
From: "Guo Hongruan" <camelguo@gmail.com>
Organization: Gulessoft, Inc
Message-ID: <op.u5c9x5xpmn1qzu@guohr-laptop-ubuntu>
In-Reply-To: <20091222112005.GA21050@rhein.zuhause.netz>
User-Agent: Opera Mail/10.10 (Linux)
X-SA-Exim-Connect-IP: 209.85.222.192
X-SA-Exim-Mail-From: camelguo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: compiling dietlibc failed when DISTRO = "minimal" and MACHINE = "qemux86"
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
X-List-Received-Date: Wed, 23 Dec 2009 01:21:13 -0000
Content-Type: text/plain; charset=utf-8; format=flowed; delsp=yes
Content-Transfer-Encoding: Quoted-Printable

All right, I will try to figure out the cause and fix it.

=E5=9C=A8 Tue, 22 Dec 2009 19:20:06 +0800=EF=BC=8CHenning Heinold  =

<heinold@inf.fu-berlin.de> =E5=86=99=E9=81=93:

> Hi,
>
> sorry I didnt test it with i386 yet. But seems that the strip of diet =
 =

> somehow effected compilation, because
> the compilation of elftrunc segfaults now. Maybee its my patch, which =
 =

> let diet compile with ccache.
> And sorry that I dont have the time to look at it closer.
>
> Bye Henning
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


