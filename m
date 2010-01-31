Received: from mail-pz0-f177.google.com ([209.85.222.177])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NbTEc-00073t-Km
	for openembedded-devel@lists.openembedded.org;
	Sun, 31 Jan 2010 07:24:41 +0100
Received: by pzk7 with SMTP id 7so3138911pzk.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Jan 2010 22:22:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:content-type:to:subject
	:references:mime-version:content-transfer-encoding:from:organization
	:date:message-id:in-reply-to:user-agent;
	bh=FabmW8VpuKXMfH8Vpz2A9zze153YguZ7+wZ7awX4JG8=;
	b=N8et92SXWGJxAt6CPa25JI6rpqAQ/9OYdjiakkT6SW/dr2l/T8kCcIec1pRlzodj02
	tNUwpG3FfIBCG8+HuDMcWMbfe53Es4Aeu1i6MQKSFpYkePh5wrpjZsQhWXfqitBRLJZv
	ZC7P5h010LmOz9vg7j8bwtmlvG0KDidUEzvFU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=content-type:to:subject:references:mime-version
	:content-transfer-encoding:from:organization:date:message-id
	:in-reply-to:user-agent;
	b=SDzFFKM7/KdsMny1V2K9WvxZzJUUe7MBiDEboRHg1oiNALE5N2PDgNmcliCs6G2J0y
	rOzhXn8xixXPTmPWnpSVYiFpUgA+lVPVAL6NSkVeHU9hYF8Q4EHLN2pCBL6wBzxhFuhH
	9qkShrUalzE4prxL6YEcHpV8NdbsItd7/iWg8=
Received: by 10.143.154.6 with SMTP id g6mr1996943wfo.162.1264918932849;
	Sat, 30 Jan 2010 22:22:12 -0800 (PST)
Received: from camelguo ([123.54.107.86])
	by mx.google.com with ESMTPS id 20sm555830pzk.5.2010.01.30.22.22.10
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 30 Jan 2010 22:22:12 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <op.u7dmmldamn1qzu@camelguo> <op.u7dt8jyhmn1qzu@camelguo>
	<op.u7dus8qwmn1qzu@camelguo> <201001310714.09989.holger+oe@freyther.de>
MIME-Version: 1.0
From: "Guo Hongruan" <camelguo@gmail.com>
Organization: Gulessoft, Inc
Date: Sun, 31 Jan 2010 14:22:03 +0800
Message-ID: <op.u7dvy1vrmn1qzu@camelguo>
In-Reply-To: <201001310714.09989.holger+oe@freyther.de>
User-Agent: Opera Mail/10.10 (Linux)
X-SA-Exim-Connect-IP: 209.85.222.177
X-SA-Exim-Mail-From: camelguo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: building piccontrol - 0.4 failed due to lack of liblua5.1.a
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
X-List-Received-Date: Sun, 31 Jan 2010 06:24:42 -0000
Content-Type: text/plain; charset=utf-8; format=flowed; delsp=yes
Content-Transfer-Encoding: Quoted-Printable

OK, no problem

=E5=9C=A8 Sun, 31 Jan 2010 14:14:09 +0800=EF=BC=8CHolger Hans Peter Frey=
ther  =

<holger+oe@freyther.de> =E5=86=99=E9=81=93:

> On Sunday 31 January 2010 06:56:58 Guo Hongruan wrote:
>> =E5=9C=A8 Sun, 31 Jan 2010 13:44:33 +0800=EF=BC=8CGuo Hongruan <camel=
guo@gmail.com>  =

>> =E5=86=99=E9=81=93:
>
>>     20 LDFLAGS +=3D " ${STAGING_LIBDIR}/liblua5.1.a -lpthread -lm -ld=
l "
>
> Okay,
> care to write a patch with a proper commit message and a Signed-off-by=
  =

> line?
>
> PS: In the long run the lua recipe should install the .pc and we shoul=
d  =

> link
> with pkg-config --libs lua5.1
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


