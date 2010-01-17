Received: from mail-pw0-f53.google.com ([209.85.160.53])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NWT7K-0005gE-Se
	for openembedded-devel@lists.openembedded.org;
	Sun, 17 Jan 2010 12:16:30 +0100
Received: by pwi4 with SMTP id 4so1169026pwi.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Jan 2010 03:14:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:content-type:to:subject
	:references:date:mime-version:content-transfer-encoding:from
	:organization:message-id:in-reply-to:user-agent;
	bh=B5lZBh6kZnmBeWWy3oYz6ER9dCu0Rqj2FTTl9LL37+8=;
	b=ofdr3GcB0ymgFBq3ejHmsgv5p8XPbFsa4wM3C4jeDzwOU84o41XN66O9qhFvNwWO6T
	09ykoEqCXd20TAea+hhnAFW372r1YXHzDL+zptlTsvq2Lo6tpqtTTGlGZBhG84nxgme2
	uItupUfgc2FI8lFiewA9DbQirTGMljoz0Qt+I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=content-type:to:subject:references:date:mime-version
	:content-transfer-encoding:from:organization:message-id:in-reply-to
	:user-agent;
	b=F9NYPh/qp1kTC3CBoBAAys+E9KkOXZdHqSUUnbWJA7iVI0nWHK2FZbW6ONCN24ftZ7
	ozjyuXPBjK/kvjiLSN0hfrzsKsOmD+dlDJf7dPSPMM5Emt9Cdmy2/yf2sNCrToQxcx4u
	qxe+eeFIyay5XOzozMrM+/uF3ZUNpIrnZ+snA=
Received: by 10.141.108.11 with SMTP id k11mr3399125rvm.237.1263726852448;
	Sun, 17 Jan 2010 03:14:12 -0800 (PST)
Received: from guohr-laptop-ubuntu ([123.54.105.23])
	by mx.google.com with ESMTPS id 21sm3238925pzk.7.2010.01.17.03.14.09
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 17 Jan 2010 03:14:11 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <> <1263698541-9726-1-git-send-email-camelguo@gmail.com>
	<1263726023.457.897.camel@lenovo.internal.reciva.com>
Date: Sun, 17 Jan 2010 19:14:02 +0800
MIME-Version: 1.0
From: "Guo Hongruan" <camelguo@gmail.com>
Organization: Gulessoft, Inc
Message-ID: <op.u6ob5ohzmn1qzu@guohr-laptop-ubuntu>
In-Reply-To: <1263726023.457.897.camel@lenovo.internal.reciva.com>
User-Agent: Opera Mail/10.10 (Linux)
X-SA-Exim-Connect-IP: 209.85.160.53
X-SA-Exim-Mail-From: camelguo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] Change the prefer binutils of micro.conf from 2.19.51 to 2.18
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
X-List-Received-Date: Sun, 17 Jan 2010 11:16:30 -0000
Content-Type: text/plain; charset=utf-8; format=flowed; delsp=yes
Content-Transfer-Encoding: Quoted-Printable

=E5=9C=A8 Sun, 17 Jan 2010 19:00:23 +0800=EF=BC=8CPhil Blundell <philb@g=
nu.org> =E5=86=99=E9=81=93:

> On Sun, 2010-01-17 at 11:22 +0800, Guo Hongruan wrote:
>> * the previous default version of binutils (2.19.51) in micro.conf  =

>> cause the default version of glibc failed to build
>>
>> Signed-off-by: Guo Hongruan <camelguo@gmail.com>
>>
>> -PREFERRED_BINUTILS =3D "2.19.51"
>> +PREFERRED_BINUTILS =3D "2.18"
>
> No, this is not acceptable.  Moving binutils forwards to 2.20{.1} woul=
d
> probably be OK, but going back to 2.18 is no good since that version
> does not work correctly with Thumb code.

the toolchain setting in micro.conf is incompatible, which caused this  =

problem. For the preferred version of glibc is 2.6.1 which is set in  =

conf/distro/include/sane-toolchain.inc, I think it is better to change t=
he  =

binutils preferred version which is set in conf/distro/micro.conf.

see http://bugs.openembedded.org/show_bug.cgi?id=3D5365 to get to know w=
hat  =

I have tried.


>
> What is the specific problem you are experiencing with glibc?

When building glibc-2.6.1 with bintuils-2.19.51, the linker report the  =

following error

/opt/testslave/oe_oe_inc_nightly_glibc/build/tmp/work/i686-oe-linux/glib=
c-2.6.1-r35.0/build-i686-oe-linux/elf/librtld.os:  =

In function `_dl_start':
rtld.c:(.text+0xac5): undefined reference to `_begin'
/opt/testslave/oe_oe_inc_nightly_glibc/build/tmp/cross/i686/lib/gcc/i686=
-oe-linux/4.4.2/../../../../i686-oe-linux/bin/ld:  =

/opt/testslave/oe_oe_inc_nightly_glibc/build/tmp/work/i686-oe-linux/glib=
c-2.6.1-r35.0/build-i686-oe-linux/elf/librtld.os:  =

relocation R_386_GOTOFF against undefined hidden symbol `_begin' can not=
  =

be used when making a shared object
/opt/testslave/oe_oe_inc_nightly_glibc/build/tmp/cross/i686/lib/gcc/i686=
-oe-linux/4.4.2/../../../../i686-oe-linux/bin/ld:  =

final link failed: Bad value
collect2: ld returned 1 exit status

See http://tinderbox.openembedded.net/packages/427429/ for more detailed=
  =

information

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


