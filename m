Received: from mail-pw0-f53.google.com ([209.85.160.53])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NPv82-0004Ke-Fh
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Dec 2009 10:46:09 +0100
Received: by pwi18 with SMTP id 18so7259101pwi.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Dec 2009 01:44:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:content-type:to:subject
	:references:date:mime-version:content-transfer-encoding:from
	:organization:message-id:in-reply-to:user-agent;
	bh=DeCZ4z2vTIxjyWXSm5tplC0txd4MzKOlrH7xHtftQsQ=;
	b=XDHMnfgGprQ7XxWPQrMZ3zYtJfyEaGVyljvXOYWmgTZR4M/FIDNqAVjgMnD+Eutkuj
	nsAMtCQEK9eULzSgtQnlhA8KudUsSB42KerMJoIsNiNrGoeD6vxhBk51dKIcB/L7fi7k
	Zn4QyvwdmR/nlwtCnpL8RJwlFSWMZ6EueZZ4k=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=content-type:to:subject:references:date:mime-version
	:content-transfer-encoding:from:organization:message-id:in-reply-to
	:user-agent;
	b=DQaBBpX4ExB2B2pMokY7atydB7nCjYI0gvBUTaSapI8CwJHstHIBSBcZy31HYToHhm
	flqtGYXuyvgio3On0XA7R+GLCXZOwZC8m7foD5kUGvBLHjN122h1tsYQ+cCKR66ZT1dZ
	BeZ+Tit5e+UvnJPRQFaGAGEd9MsPRGTiByW2I=
Received: by 10.143.137.2 with SMTP id p2mr12056141wfn.318.1262166247059;
	Wed, 30 Dec 2009 01:44:07 -0800 (PST)
Received: from guohr-laptop-ubuntu ([123.54.101.56])
	by mx.google.com with ESMTPS id 22sm13352139pzk.6.2009.12.30.01.44.04
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 30 Dec 2009 01:44:06 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <> <1262160936-28480-1-git-send-email-camelguo@gmail.com>
	<200912300930.12895.holger+oe@freyther.de>
	<op.u5qsujbtmn1qzu@guohr-laptop-ubuntu>
	<1262164637.2553.6.camel@lenovo.internal.reciva.com>
	<op.u5qu12iemn1qzu@guohr-laptop-ubuntu>
	<1262165510.2553.9.camel@lenovo.internal.reciva.com>
Date: Wed, 30 Dec 2009 17:43:59 +0800
MIME-Version: 1.0
From: "Guo Hongruan" <camelguo@gmail.com>
Organization: Gulessoft, Inc
Message-ID: <op.u5qvzljcmn1qzu@guohr-laptop-ubuntu>
In-Reply-To: <1262165510.2553.9.camel@lenovo.internal.reciva.com>
User-Agent: Opera Mail/10.10 (Linux)
X-SA-Exim-Connect-IP: 209.85.160.53
X-SA-Exim-Mail-From: camelguo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] Remove the micro distro specific overridding of variables
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
X-List-Received-Date: Wed, 30 Dec 2009 09:46:10 -0000
Content-Type: text/plain; charset=utf-8; format=flowed; delsp=yes
Content-Transfer-Encoding: Quoted-Printable

There are lots of failure buildings due to the problem of base-file  =

packages which I have not enumerated in my previous email.

By the way, I have renamed the micro.conf to micro-eglibc.conf locally, =
so  =

that I can get to know which type of libc the distribution is using. so =
 =

the micro-eglibc.conf is just the same as micro.conf in git tree.

=E5=9C=A8 Wed, 30 Dec 2009 17:31:50 +0800=EF=BC=8CPhil Blundell <philb@g=
nu.org> =E5=86=99=E9=81=93:

> On Wed, 2009-12-30 at 17:23 +0800, Guo Hongruan wrote:
>> =E5=9C=A8 Wed, 30 Dec 2009 17:17:17 +0800=EF=BC=8CPhil Blundell <phil=
b@gnu.org> =E5=86=99=E9=81=93:
>>
>> > On Wed, 2009-12-30 at 16:36 +0800, Guo Hongruan wrote:
>> >> The micro/micro-uclibc specific check does cause the miss of the
>> >> /etc/default directory, which is required by the following  =

>> installation.
>> >> So the installation of base-file failed when DISTRO=3Dmicro or
>> >> DISTRO=3Dmicro-uclibc.
>> >
>> > Can you give any more details of the problem you are trying to solv=
e?
>> > Which exact installation step requires /etc/default?
>> >
>>
>> See the following for details:
>>
>>
>> http://tinderbox.openembedded.net/packages/392296/
>> http://tinderbox.openembedded.net/packages/391393/
>
> Ah, I see.  So, it would appear that you are actually using
> "DISTRO=3Dmicro-eglibc", rather than the micro and micro-uclibc that y=
ou
> mentioned above.
>
> That DISTRO is not in the org.openembedded.dev tree so I can't test wi=
th
> it but, if you want to stick with that setting, I would guess that you=

> probably need to modify the ${DISTRO} conditional that wraps the
> relevant lines of the base-files do_install() method so that it
> recognises micro-eglibc as a synonym for micro.
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


