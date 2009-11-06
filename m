Received: from [209.85.210.175] (helo=mail-yx0-f175.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1N6MI0-0001gS-QY
	for openembedded-devel@lists.openembedded.org;
	Fri, 06 Nov 2009 11:43:35 +0100
Received: by yxe5 with SMTP id 5so835706yxe.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Nov 2009 02:42:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=m5eR17z5mYLHFuBSKzcJTyYe9S3GQJ4IYg87R1vhez0=;
	b=gmZzTX+Nxy0YAmFiDqowsvNafAPmcD5xTNyGxQhe2HiZFVRZ25uw29V8O+EUHpq/Jv
	VxbpZKvKyYL/yAJR/bPeCJD5gaODP28RZUYN/qf3u9XbWM6zPFIt/NiHqRo2PgeaFKqj
	w9whuIcKKNrsTcBp1GRbC5hgy2++aOPo/NDTM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=KnCj1ahQJqY4D2IpkprGhp+OWwAXr1yItoMpBEYo9qdZ0E40+KKSbtlFGDDKvfewnL
	UJM1nOj3XkGN923yUdzVzzS/YcffUSrMJOVldv95ch4+ETYz4gShfxiuYRBcCjvM+uh8
	U/+Fs4Et9CxM0beoSZzq6d5tRPkOZwX+jOy34=
MIME-Version: 1.0
Received: by 10.101.54.13 with SMTP id g13mr3826462ank.158.1257503694257; Fri, 
	06 Nov 2009 02:34:54 -0800 (PST)
In-Reply-To: <20091106092315.GA2246@xora-eee>
References: <E1N6JRY-00072R-9B@melo.openembedded.org>
	<20091106092315.GA2246@xora-eee>
Date: Fri, 6 Nov 2009 11:34:54 +0100
Message-ID: <ac9c93b10911060234n43c9eeabh1582dcc59ae64a55@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.210.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [oe-commits] Frans Meulenbroeks : mysql: moved pid dir from /var/run/mysql to /var/lib/ mysql as /var/run is created upon boot
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
X-List-Received-Date: Fri, 06 Nov 2009 10:43:36 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2009/11/6 Graeme Gregory <dp@xora.org.uk>:
> On Fri, Nov 06, 2009 at 07:41:12AM +0000, git version control wrote:
>> Module: openembedded.git
>> Branch: org.openembedded.dev
>> Commit: 189a5b7f7665ce2c1d4d406ca7343ffeb3ea2afd
>> URL: =A0 =A0http://gitweb.openembedded.net/?p=3Dopenembedded.git&a=3Dcom=
mit;h=3D189a5b7f7665ce2c1d4d406ca7343ffeb3ea2afd
>>
>> Author: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
>> Date: =A0 Fri Nov =A06 08:39:56 2009 +0100
>>
>> mysql: moved pid dir from /var/run/mysql to /var/lib/mysql as /var/run i=
s created upon boot
>> (and so var/run disappears)
>> added restart to init.d script
>>
> This is wrong.
>
> As I told you on IRC, make use of the volatiles system to
> create /var/run/mysql with the corrct ownership. Check
> hal for an example if you need one.
>
> Graeme

Apparently I did not get your volatiles suggestion, and when I asked
this morning on irc khem suggested using  /var/lib/mysql, and pb did
understand it and did not object.
Feel free to correct.
(btw i'm not really attached to the mysql recipe, I noticed it was
broken, so I tried to fix it; at least it is now less broken)

Frans


