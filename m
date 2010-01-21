Received: from mail-gx0-f227.google.com ([209.85.217.227])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NXnSQ-0004yL-L9
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Jan 2010 04:11:45 +0100
Received: by gxk27 with SMTP id 27so603025gxk.7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jan 2010 19:09:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:content-type:to:subject
	:references:date:mime-version:content-transfer-encoding:from
	:organization:message-id:in-reply-to:user-agent;
	bh=w3ULh9ZuVFRG8R3a6GYiIQuYRT3bogzGrDiitCqxDOQ=;
	b=t2hdEXK+AJIiAJgS8+08Tireu74n5bGrdaMRj06EQur+gKzON2sQFse2BZhh4yHfZD
	T+xHZU9JyeMoFr+e/Ma/4hv1EcK0JjpvuzJXIo2X95aNL7Nl+v4b/1iz07A18NRoC4pX
	Zisy9DPYAX49iMAHLJqu6zqdtXIbD6vtNm0MU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=content-type:to:subject:references:date:mime-version
	:content-transfer-encoding:from:organization:message-id:in-reply-to
	:user-agent;
	b=v2iPYKACNqn5v3sykXqXZM7mc4Rm12NM8hEQ8T+/ui+zRV39DndEDudfnM7WrPoIFt
	b3YCNfqNeQOgTqS9RHZ92/0trBjx6TJoM1cl8NFUtVy19lIxIejAdv3XJs1Yu2HMQvj5
	gjjo2+W7nahvWwZ3W/7Tzsmmd7ok2BjZLokXo=
Received: by 10.151.58.8 with SMTP id l8mr1331438ybk.59.1264043365812;
	Wed, 20 Jan 2010 19:09:25 -0800 (PST)
Received: from guohr-laptop-ubuntu ([123.54.100.209])
	by mx.google.com with ESMTPS id 8sm199070yxg.42.2010.01.20.19.09.22
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 20 Jan 2010 19:09:25 -0800 (PST)
To: "Guo Hongruan" <camelguo@gmail.com>, openembeded-devel
	<openembedded-devel@lists.openembedded.org>
References: <op.u6u35hgwmn1qzu@guohr-laptop-ubuntu>
Date: Thu, 21 Jan 2010 11:09:17 +0800
MIME-Version: 1.0
From: "Guo Hongruan" <camelguo@gmail.com>
Organization: Gulessoft, Inc
Message-ID: <op.u6u4dr18mn1qzu@guohr-laptop-ubuntu>
In-Reply-To: <op.u6u35hgwmn1qzu@guohr-laptop-ubuntu>
User-Agent: Opera Mail/10.10 (Linux)
X-SA-Exim-Connect-IP: 209.85.217.227
X-SA-Exim-Mail-From: camelguo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: circular dependency on do_package and do_deploy in recipes/linux/linux-storcenter_2.6.27.7.bb
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
X-List-Received-Date: Thu, 21 Jan 2010 03:11:46 -0000
Content-Type: text/plain; charset=utf-8; format=flowed; delsp=yes
Content-Transfer-Encoding: Quoted-Printable

the same question exists in

recipes/linux/gumstix-linux.inc|72| addtask deploy before do_package aft=
er  =

do_install

which may cause circular dependency too.

=E5=9C=A8 Thu, 21 Jan 2010 11:04:19 +0800=EF=BC=8CGuo Hongruan <camelguo=
@gmail.com> =E5=86=99=E9=81=93:

> Hi guys,
>    I build my openembedded project using the following setting:
> MACHINE=3Dstorcenter
> DISTRO=3Dmicro
> LIBC=3Deglibc
>
>    But the build failed to execute due to the following error:
> ERROR: Task  =

> /media/work-disk/testslave/oe_gss_inc_change_allinone/build/../openemb=
edded/recipes/linux/linux-storcenter_2.6.27.7.bb  =

> (do_package) has circular dependency on  =

> /media/work-disk/testslave/oe_gss_inc_change_allinone/build/../openemb=
edded/recipes/linux/linux-storcenter_2.6.27.7.bb  =

> (do_deploy)
>    I guess that it is caused by the following line in  =

> linux-storcenter_2.6.27.7.bb:
> addtask deploy before do_package after do_install
> because the kernel has defined the dependency in kernel.bbclass
> 554 addtask deploy before do_build after do_package
> So, do_package and do_deploy causes the circular dependency.
>
> I think it can be solved just remove the addtask in  =

> linux-storcenter_2.6.27.7.bb. Am I right?
>
> Thanks a lot
>


-- =

Guo Hongruan, Embedded Linux Consultant
Skype: camelguo
Twitter: camelguo
http://www.gulessoft.com


