Received: from mail-pw0-f53.google.com ([209.85.160.53])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NVjh5-00056A-O2
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Jan 2010 11:46:23 +0100
Received: by pwi4 with SMTP id 4so201616pwi.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jan 2010 02:44:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:content-type:to:subject
	:references:date:mime-version:content-transfer-encoding:from
	:organization:message-id:in-reply-to:user-agent;
	bh=trz03n3MQr5yOs8r2bWmgTMG//inMeP+AV3rz0egj5o=;
	b=C2HoUwUqhDQdHqGdOajrWO4VhEOosIvyUQTuJQHKKl/zpmJifekUFQGeQOSwhCw390
	ncIn8z1GFA67T+latv3+4+scmOytLgJfhEKUWgblAbHu4L+QyRSDOT8Q7e28jGAEm36G
	dYtJQj+JLJN2QDlvaswTqXSToAKl+xNb6cpFY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=content-type:to:subject:references:date:mime-version
	:content-transfer-encoding:from:organization:message-id:in-reply-to
	:user-agent;
	b=U1SOjwFVQdF5lUi4ZSBpM4cHqEwSQ7UySAhZWAatUZHDer+OneSS8uhaPB7+pk2hvs
	ck+kxeF5cd7WWtQw1Butl9GIXdEkOsQiaLQAHqiKFtIl96Bfmw24HvZ+QJqnffBvrnu0
	+ZV7WDzDA04/i8T3M6JC7vHoVnUjPQCViowg4=
Received: by 10.114.21.13 with SMTP id 13mr1488671wau.225.1263552246794;
	Fri, 15 Jan 2010 02:44:06 -0800 (PST)
Received: from guohr-laptop-ubuntu ([123.54.101.24])
	by mx.google.com with ESMTPS id 20sm1323122pzk.1.2010.01.15.02.44.03
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 15 Jan 2010 02:44:06 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <> <1263455739-13595-1-git-send-email-camelguo@gmail.com>
	<201001141014.53764.marcin@juszkiewicz.com.pl>
	<op.u6imubdtmn1qzu@guohr-laptop-ubuntu>
	<20100114195301.GA3529@gmail.com>
	<op.u6jv0uycmn1qzu@guohr-laptop-ubuntu> <4B4FE54D.3070402@mwester.net>
	<op.u6kherjdmn1qzu@guohr-laptop-ubuntu>
	<1263549399.457.313.camel@lenovo.internal.reciva.com>
Date: Fri, 15 Jan 2010 18:43:56 +0800
MIME-Version: 1.0
From: "Guo Hongruan" <camelguo@gmail.com>
Organization: Gulessoft, Inc
Message-ID: <op.u6klfitsmn1qzu@guohr-laptop-ubuntu>
In-Reply-To: <1263549399.457.313.camel@lenovo.internal.reciva.com>
User-Agent: Opera Mail/10.10 (Linux)
X-SA-Exim-Connect-IP: 209.85.160.53
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
X-List-Received-Date: Fri, 15 Jan 2010 10:46:24 -0000
Content-Type: text/plain; charset=utf-8; format=flowed; delsp=yes
Content-Transfer-Encoding: Quoted-Printable

In fact, I should implement it as a single bbclass file, which let you  =

enable or disable it through 'inherit'

=E5=9C=A8 Fri, 15 Jan 2010 17:56:39 +0800=EF=BC=8CPhil Blundell <philb@g=
nu.org> =E5=86=99=E9=81=93:

> On Fri, 2010-01-15 at 17:17 +0800, Guo Hongruan wrote:
>> Without ${LIBS}, sometimes
>> it is difficult to determine which libc the runtime image is based on=
.
>
> For the majority of DISTROs, there is only a single supported C librar=
y
> anyway so there should be no ambiguity.  For example, if you build for=

> micro-uclibc, that means you are using uClibc.  If you build for micro=
,
> that means you are using eglibc.
>
> So, I would not be in favour of rearranging the filesystem layout for
> those DISTROs to make the selection of libc explicit in the pathnames.=

>
> p.
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


