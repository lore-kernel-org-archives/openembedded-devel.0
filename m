Received: from mail-pz0-f192.google.com ([209.85.222.192])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NVjvr-0001Sh-MV
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Jan 2010 12:01:38 +0100
Received: by pzk30 with SMTP id 30so512251pzk.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jan 2010 02:59:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:content-type:to:subject
	:references:date:mime-version:content-transfer-encoding:from
	:organization:message-id:in-reply-to:user-agent;
	bh=krlxp82YGssfOo2Q5tUydMzUW4LeUyi0hcJq+xQyai8=;
	b=exKLbnelWkWH1QZxKZ7wAx6YQ5RGFK0zblFipTmb7CI+EYxK1I160aIk75W06mFQHi
	X/Zq+SpZaSSdxMwZ9CGCTMSd+bRfH7JBmy/vNkv+2Fwzng4HhtaXD6mc7+6aBqdycMQ7
	Mpb32CU1anUsFW3eGw6rSkj4r3qHYrAODx1QA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=content-type:to:subject:references:date:mime-version
	:content-transfer-encoding:from:organization:message-id:in-reply-to
	:user-agent;
	b=HfuNknDawSDHoUVmgMO13QHRqWLRcLkYyb6QmG2SzdjwM+jun7Q+h2IpOtgeoHih4D
	oqFGExYWoTI6w1eU0v0Lp48mDNlP2oVdXrknhAd4I3e2aTOMfOmNPX458cZFGmUhTc6v
	tUjejWcEwHfSEtuYyFo1x+Hpc/VMBkbLN4YOM=
Received: by 10.141.106.13 with SMTP id i13mr1625185rvm.0.1263553162174;
	Fri, 15 Jan 2010 02:59:22 -0800 (PST)
Received: from guohr-laptop-ubuntu ([123.54.101.24])
	by mx.google.com with ESMTPS id 22sm1324576pzk.6.2010.01.15.02.59.19
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 15 Jan 2010 02:59:21 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <> <1263455739-13595-1-git-send-email-camelguo@gmail.com>
	<201001141014.53764.marcin@juszkiewicz.com.pl>
	<op.u6imubdtmn1qzu@guohr-laptop-ubuntu>
	<20100114195301.GA3529@gmail.com>
	<op.u6jv0uycmn1qzu@guohr-laptop-ubuntu> <4B4FE54D.3070402@mwester.net>
	<op.u6kherjdmn1qzu@guohr-laptop-ubuntu>
	<1263549399.457.313.camel@lenovo.internal.reciva.com>
	<op.u6klcvzcmn1qzu@guohr-laptop-ubuntu>
	<1263552396.457.318.camel@lenovo.internal.reciva.com>
Date: Fri, 15 Jan 2010 18:59:11 +0800
MIME-Version: 1.0
From: "Guo Hongruan" <camelguo@gmail.com>
Organization: Gulessoft, Inc
Message-ID: <op.u6kl4xh4mn1qzu@guohr-laptop-ubuntu>
In-Reply-To: <1263552396.457.318.camel@lenovo.internal.reciva.com>
User-Agent: Opera Mail/10.10 (Linux)
X-SA-Exim-Connect-IP: 209.85.222.192
X-SA-Exim-Mail-From: camelguo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] Support building all project in one directory
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
X-List-Received-Date: Fri, 15 Jan 2010 11:01:39 -0000
Content-Type: text/plain; charset=utf-8; format=flowed; delsp=yes
Content-Transfer-Encoding: Quoted-Printable

In fact, I just mixer multiple machines in a single TMPDIR with differen=
t  =

libcs. Hope I am lucky  :)

=E5=9C=A8 Fri, 15 Jan 2010 18:46:36 +0800=EF=BC=8CPhil Blundell <philb@g=
nu.org> =E5=86=99=E9=81=93:

> On Fri, 2010-01-15 at 18:42 +0800, Guo Hongruan wrote:
>> OE should provide a mechanism which should not restrict one certain l=
ibc
>> type.
>>
>> Even though every distro supports only one libc type, you should be  =

>> better
>> add ${LIBC} into your pathnames if you are trying to build multiple
>> projects (which use different libc) in one directory. To illustrate t=
his
>> problem, let suppose that: you are trying to build DISTR_A which uses=

>> glibc and DISTRO_B which uses eglibc for qemumips machine, What would=

>> happended when building them in one directory?
>
> You can't do this.  There are many other reasons besides C library
> selection why packages (and even -native tools, under some
> circumstances) from DISTRO_A might be incompatible with those for
> DISTRO_B.  Mixing multiple DISTROs in a single TMPDIR is not, and neve=
r
> has been, supported.
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
Skype: camelguo
Twitter: camelguo
http://www.gulessoft.com


