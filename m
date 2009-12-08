Received: from mail-pw0-f53.google.com ([209.85.160.53])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NHvuA-0005OP-Gh
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Dec 2009 09:58:49 +0100
Received: by pwi11 with SMTP id 11so734297pwi.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Dec 2009 00:57:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:content-type:to:subject
	:references:date:mime-version:content-transfer-encoding:from
	:organization:message-id:in-reply-to:user-agent;
	bh=c7vkxqGGOwwMQFCgbJof2bdz7+Ei0tCkv5GVCIJ4evg=;
	b=eNdqOxWaz11qvWbh9njTq2X0Ze+tXi4I1FDAaq7fAqm5SjGtFoOG5+z5ZMDKIQJ4uB
	Qdt+2CgcdjofHAhBA4vfkX4Dk1M0dYWiPWoO4GdMK9mr+WLDgf6y+e9ufrkacSJN/Dgh
	a3aG+noPz6Rd2sDMWmP/ix7E0YwjprzMmg87c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=content-type:to:subject:references:date:mime-version
	:content-transfer-encoding:from:organization:message-id:in-reply-to
	:user-agent;
	b=rKw1IkS4kxsKdyew1BUMrH6pQyPvzYtRNB0gkf8EdDBGfmF6xijPGHlvtZsTfIhWsP
	QxuNruIeTqLwbLE4IVsq0jfDI4ZEU/iYLohCGjLqeBdp26pn6OAmFNW86tT3UyLlOIUu
	eQ50nDioK2s9eh12FGjn769QSlibRUZIf5y/U=
Received: by 10.115.102.5 with SMTP id e5mr10392521wam.210.1260262625488;
	Tue, 08 Dec 2009 00:57:05 -0800 (PST)
Received: from guohr-laptop-ubuntu ([123.162.69.77])
	by mx.google.com with ESMTPS id 21sm5826775pzk.7.2009.12.08.00.57.02
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 08 Dec 2009 00:57:04 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <op.u4lz932emn1qzu@guohr-laptop-ubuntu>
	<hfl1ft$sog$2@ger.gmane.org>
Date: Tue, 08 Dec 2009 16:56:56 +0800
MIME-Version: 1.0
From: "Guo Hongruan" <camelguo@gmail.com>
Organization: Gulessoft, Inc
Message-ID: <op.u4l246yhmn1qzu@guohr-laptop-ubuntu>
In-Reply-To: <hfl1ft$sog$2@ger.gmane.org>
User-Agent: Opera Mail/10.10 (Linux)
X-SA-Exim-Connect-IP: 209.85.160.53
X-SA-Exim-Mail-From: camelguo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Does it possible to use pre-built native tools
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
X-List-Received-Date: Tue, 08 Dec 2009 08:58:49 -0000
Content-Type: text/plain; charset=utf-8; format=flowed; delsp=yes
Content-Transfer-Encoding: Quoted-Printable

Hi Koen,
    Thanks for your information.
    I think it will save my time. Consider I have to build several  =

platforms for different architecture, in fact the native tools is  =

architecture independent. So I think it is more reasonable to avoid  =

building native tools for other platforms. Is there anything wrong with =
me.


    I tried to use ASSUME_PROVIDED to avoid compiling some native tools,=
  =

but it seems that there are some building failure. I am trying to figure=
  =

them out.

=E5=9C=A8 Tue, 08 Dec 2009 16:07:25 +0800=EF=BC=8CKoen Kooi <k.kooi@stud=
ent.utwente.nl>  =

=E5=86=99=E9=81=93:

> On 08-12-09 08:55, Guo Hongruan wrote:
>> Hi guys,
>> I want to configure openembedded to use the pre-built native tools.
>> e.g: qemu-native, quilt-native when building the whole image, so that=
  =

>> the
>> building can save lots of time. Is there anyone know how to achieve i=
t?
>
> It won't save you any time, since every tool OE builds for it self is =
 =

> built for a reason. If you think a 10 minute buildtime improvement  =

> outweighs a month more of bughunting then look into ASSUME_PROVIDED.
>
> regards,
>
> Koen
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


