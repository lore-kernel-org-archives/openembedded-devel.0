Received: from mail-px0-f179.google.com ([209.85.216.179])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NVjfY-0003PC-FD
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Jan 2010 11:44:47 +0100
Received: by pxi9 with SMTP id 9so413242pxi.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jan 2010 02:42:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:content-type:to:subject
	:references:date:mime-version:content-transfer-encoding:from
	:organization:message-id:in-reply-to:user-agent;
	bh=Ew01F/7A/P25MzOKc2OWO7Wv92O33w/zTjanuZsZ/S4=;
	b=GKxpLYiN9Wk0XGmeruDT8OpnRWc8p8TzeY0l87O8xZyF+0qpBlKCwpKtiJ9DmVhSrY
	44AEphGgRNUETfavfVJ6bLy67Qcj2bwCKDlXabvhogIdnkxD2PWXai1nWd5BH7aVW4AU
	VqQP6H7CRB2KkX20F+QPqbbs7sxJrq9Ag61qc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=content-type:to:subject:references:date:mime-version
	:content-transfer-encoding:from:organization:message-id:in-reply-to
	:user-agent;
	b=FmyngInjP4ScHMOHMZLSI+gH1uxiiXsZ5quAtrc/3hHSlCkUK4QRlUGM9d+q7I2SrV
	P+IXVm2BCa3iQDgBZGhTwUFmppb5Cs69hw/azvubjmKswTwolQdVIx7CqIS0koIiyswn
	FRmYpVdZjURtW6ChZv4/v3O4FZHiN3DS6O71w=
Received: by 10.140.251.5 with SMTP id y5mr1621006rvh.2.1263552151744;
	Fri, 15 Jan 2010 02:42:31 -0800 (PST)
Received: from guohr-laptop-ubuntu ([123.54.101.24])
	by mx.google.com with ESMTPS id 22sm1304043pzk.10.2010.01.15.02.42.28
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 15 Jan 2010 02:42:31 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <> <1263455739-13595-1-git-send-email-camelguo@gmail.com>
	<201001141014.53764.marcin@juszkiewicz.com.pl>
	<op.u6imubdtmn1qzu@guohr-laptop-ubuntu>
	<20100114195301.GA3529@gmail.com>
	<op.u6jv0uycmn1qzu@guohr-laptop-ubuntu> <4B4FE54D.3070402@mwester.net>
	<op.u6kherjdmn1qzu@guohr-laptop-ubuntu>
	<1263549399.457.313.camel@lenovo.internal.reciva.com>
Date: Fri, 15 Jan 2010 18:42:21 +0800
MIME-Version: 1.0
From: "Guo Hongruan" <camelguo@gmail.com>
Organization: Gulessoft, Inc
Message-ID: <op.u6klcvzcmn1qzu@guohr-laptop-ubuntu>
In-Reply-To: <1263549399.457.313.camel@lenovo.internal.reciva.com>
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
X-List-Received-Date: Fri, 15 Jan 2010 10:44:47 -0000
Content-Type: text/plain; charset=utf-8; format=flowed; delsp=yes
Content-Transfer-Encoding: Quoted-Printable

=E5=9C=A8 Fri, 15 Jan 2010 17:56:39 +0800=EF=BC=8CPhil Blundell <philb@g=
nu.org> =E5=86=99=E9=81=93:

> For the majority of DISTROs, there is only a single supported C librar=
y
> anyway so there should be no ambiguity.  For example, if you build for=

> micro-uclibc, that means you are using uClibc.  If you build for micro=
,
> that means you are using eglibc.

OE should provide a mechanism which should not restrict one certain libc=
  =

type.

Even though every distro supports only one libc type, you should be bett=
er  =

add ${LIBC} into your pathnames if you are trying to build multiple  =

projects (which use different libc) in one directory. To illustrate this=
  =

problem, let suppose that: you are trying to build DISTR_A which uses  =

glibc and DISTRO_B which uses eglibc for qemumips machine, What would  =

happended when building them in one directory?

tmp/work/mips-oe-linux/libassuan-0.6.9-r0

You can not tell which the package building of libassuan is based on. An=
d  =

in fact, the next building will use the wrong temp files of packages  =

libassuan-0.6.9-r0. This case will cause some little questions which is =
 =

very very difficult to debug.

Most of the OE users do not need to build multiple projects in one  =

directory, but the QA does. The QA team need to setup regression test  =

environment. Without sharing, how much building time and disk space it  =

will consume!


-- =

Guo Hongruan, Embedded Linux Consultant
Skype: camelguo
Twitter: camelguo
http://www.gulessoft.com


