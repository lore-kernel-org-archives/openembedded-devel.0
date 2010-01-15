Received: from mail-px0-f179.google.com ([209.85.216.179])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NVly2-0008Dp-Iy
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Jan 2010 14:12:01 +0100
Received: by pxi9 with SMTP id 9so476700pxi.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jan 2010 05:09:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:content-type:to:subject
	:references:date:mime-version:content-transfer-encoding:from
	:organization:message-id:in-reply-to:user-agent;
	bh=5FpEKxGZB5G9lnXVYy8bHOBQK4kjCAjPVxbK+tvVfgc=;
	b=lUmzNp4LUVxL2nx/rjAo+jx6/5M7Qo8YBZmPF6oOwC15MGckuwClvKvIcMMpVHzq+Q
	7w1Ob+u9u1IgS5b5+BqQ9DiDIE2Vod702A+ffENxuez0YkXNuu68YsxLPSQ0/3MKzv6b
	j31fBFgKymqszBclbcAX/IJdoAPrlZ95eulqU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=content-type:to:subject:references:date:mime-version
	:content-transfer-encoding:from:organization:message-id:in-reply-to
	:user-agent;
	b=amVgzpnhUScpnHU+w7kHgzd4XhxEfN+Yrh7F8lGx23dUS/GmU0mVYJpkx3u3Kp6ZRM
	cmJJyDmOHDq9SOhv579IjZO+msUFhLL12iYif+KsYWaHX28AUxrgDdJrsQE5FLJ2S6sn
	7KkiXdNgRwkSQiY9j/MtPR/vO54q0U/Uo5sOo=
Received: by 10.143.25.40 with SMTP id c40mr1543203wfj.265.1263560985712;
	Fri, 15 Jan 2010 05:09:45 -0800 (PST)
Received: from guohr-laptop-ubuntu ([123.54.101.24])
	by mx.google.com with ESMTPS id 22sm1383580pzk.10.2010.01.15.05.09.42
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 15 Jan 2010 05:09:45 -0800 (PST)
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
	<op.u6kl4xh4mn1qzu@guohr-laptop-ubuntu>
	<1263559808.457.327.camel@lenovo.internal.reciva.com>
	<op.u6krmehqmn1qzu@guohr-laptop-ubuntu>
	<1263560559.457.336.camel@lenovo.internal.reciva.com>
Date: Fri, 15 Jan 2010 21:09:35 +0800
MIME-Version: 1.0
From: "Guo Hongruan" <camelguo@gmail.com>
Organization: Gulessoft, Inc
Message-ID: <op.u6kr59g7mn1qzu@guohr-laptop-ubuntu>
In-Reply-To: <1263560559.457.336.camel@lenovo.internal.reciva.com>
User-Agent: Opera Mail/10.10 (Linux)
X-SA-Exim-Connect-IP: 209.85.216.179
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
X-List-Received-Date: Fri, 15 Jan 2010 13:12:01 -0000
Content-Type: text/plain; charset=utf-8; format=flowed; delsp=yes
Content-Transfer-Encoding: Quoted-Printable

=E5=9C=A8 Fri, 15 Jan 2010 21:02:39 +0800=EF=BC=8CPhil Blundell <philb@g=
nu.org> =E5=86=99=E9=81=93:

> On Fri, 2010-01-15 at 20:57 +0800, Guo Hongruan wrote:
>> In theory, mixing mutiple DISTROs in one TMPDIR should be fine too,  =

>> unless
>> the package recipes use the DISTRO as OVERRIDE.
>
> Several package recipes do indeed use the DISTRO as an override, but
> even if this were not the case it would still not be safe to mix
> multiple DISTROs in a single TMPDIR.
>
> As I said before, the DISTRO configurations might be quite incompatibl=
e
> in any number of ways: for example, they might be using entirely
> different ABIs, or packaging systems, or binary formats, or package
> naming conventions, or filesystem layouts.

Yes, You are right, they are some questions we must consider before  =

continue.

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


