Received: from mail-gx0-f215.google.com ([209.85.217.215])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NS8M5-0001nU-VK
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Jan 2010 13:17:49 +0100
Received: by gxk7 with SMTP id 7so11212827gxk.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Jan 2010 04:15:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:content-type:to:subject
	:references:date:mime-version:content-transfer-encoding:from
	:organization:message-id:in-reply-to:user-agent;
	bh=Ol7LkG2TQr2ZSNnSRSZ7J/yc5u/H6HR1G6AyNKIG1OA=;
	b=Fd0WLo9XCE9ACZ5XvAGOBRtoanhKs6tC1p8OtldlQjWImKGwD53DMecxiAcBx6D1el
	kuKfEj8WJKwgO+afaBQklSF5r3AAE9xOiDPGpUSEwyK/RQyV2kdw62YP4fNowaBUN4SJ
	x5hCFRCiWsMZwBr0j6IEiWWrMUhV8FeCONqeM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=content-type:to:subject:references:date:mime-version
	:content-transfer-encoding:from:organization:message-id:in-reply-to
	:user-agent;
	b=S9IAm8N++gmRMrqNeycCsYKc6BmOa6nqgn+mG4MdYqVBpfUqd23uNiaj8BU7oHkYWe
	obSQO0jsycUwoGE8qb//YR72FHfAHxA5qqp4LZvTbNSG34yrAIAcfnmn5Oa8bS7vtBr5
	1oT4lN+L2ApLAF4uM7Xgt0/62S5ozPQ3u4P8g=
Received: by 10.100.246.25 with SMTP id t25mr25607949anh.4.1262693740642;
	Tue, 05 Jan 2010 04:15:40 -0800 (PST)
Received: from guohr-laptop-ubuntu ([123.54.99.142])
	by mx.google.com with ESMTPS id 21sm6606988ywh.16.2010.01.05.04.15.36
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 05 Jan 2010 04:15:39 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <op.u5yhl8usmn1qzu@guohr-laptop-ubuntu>
	<20100104191728.GE4326@gmail.com>
Date: Tue, 05 Jan 2010 20:15:30 +0800
MIME-Version: 1.0
From: "Guo Hongruan" <camelguo@gmail.com>
Organization: Gulessoft, Inc
Message-ID: <op.u516ztggmn1qzu@guohr-laptop-ubuntu>
In-Reply-To: <20100104191728.GE4326@gmail.com>
User-Agent: Opera Mail/10.10 (Linux)
X-SA-Exim-Connect-IP: 209.85.217.215
X-SA-Exim-Mail-From: camelguo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: compiling glibc-2.6.1 failed due to undefined reference to `_begin
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
X-List-Received-Date: Tue, 05 Jan 2010 12:17:49 -0000
Content-Type: text/plain; charset=utf-8; format=flowed; delsp=yes
Content-Transfer-Encoding: Quoted-Printable

=E5=9C=A8 Tue, 05 Jan 2010 03:17:28 +0800=EF=BC=8CKhem Raj <raj.khem@gma=
il.com> =E5=86=99=E9=81=93:

> On (03/01/10 20:14), Guo Hongruan wrote:
>> Hi guys:
>>    There is a building failure of org.openembedded.dev. I think it
>> may be a bug of openembedded. Have anyone met the same bug? Or have
>> some idea about it?
>
> I guess you are using latest binutils. There has been changes in ld
> which surfaced this issue. So either you could switch back to using
> older binutils like 2.18 or something. Or you could also port the patc=
h
> recipes/glibc/glibc-2.9/glibc-2.9-use-_begin.patch

Yes, you are right. With binutils 2.18, it works OK.

Thanks a lot

>
> -Khem
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


