Received: from mail-pz0-f192.google.com ([209.85.222.192])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NPvam-0004Dw-Hh
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Dec 2009 11:15:51 +0100
Received: by pzk30 with SMTP id 30so8254233pzk.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Dec 2009 02:13:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:content-type:to:subject
	:references:date:mime-version:content-transfer-encoding:from
	:organization:message-id:in-reply-to:user-agent;
	bh=h+O4kz8roERv5odZyM2j7eJCmjqKc1JieidmTtnmRMs=;
	b=pw9RwB4ZeW2e8vRKTCy3LXqc6hLSsvaIHnUpw5cNKnYsxqDHQXuXT5aluw0j4w6Q4f
	5GWDbMS5qSTcKLh/B2xqGX4OgQqa5kOIb1X0SmGa4rCfvDH/YLKakopoYz7stoTzXUFh
	9Qc62CdoPv3fouNgYee9G+nIZ1jPeIbbJ7m8I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=content-type:to:subject:references:date:mime-version
	:content-transfer-encoding:from:organization:message-id:in-reply-to
	:user-agent;
	b=hH172A32qv3iTDj5Q8wwmqaJqTVjqUX2cw8ro4lgxCu4Mz4usaD/gZD9RHfNhf9tI7
	2aROqV5Cy/O6Q3hhLe0Q5lzeMaT2uD5DXbwcpnM7MkKaQ7MkH2y+YxNXh5/hwuCxkewq
	6Bi0cwe/98a1+mA7LVTwxMHwcH5kFi1prulkQ=
Received: by 10.141.105.5 with SMTP id h5mr12856598rvm.178.1262168028761;
	Wed, 30 Dec 2009 02:13:48 -0800 (PST)
Received: from guohr-laptop-ubuntu ([123.54.101.56])
	by mx.google.com with ESMTPS id 23sm13414894pzk.8.2009.12.30.02.13.46
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 30 Dec 2009 02:13:48 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <> <1262160936-28480-1-git-send-email-camelguo@gmail.com>
	<200912300930.12895.holger+oe@freyther.de>
	<op.u5qsujbtmn1qzu@guohr-laptop-ubuntu>
	<1262164637.2553.6.camel@lenovo.internal.reciva.com>
	<op.u5qu12iemn1qzu@guohr-laptop-ubuntu>
	<1262165510.2553.9.camel@lenovo.internal.reciva.com>
	<op.u5qvzljcmn1qzu@guohr-laptop-ubuntu>
	<1262167325.2553.14.camel@lenovo.internal.reciva.com>
Date: Wed, 30 Dec 2009 18:13:41 +0800
MIME-Version: 1.0
From: "Guo Hongruan" <camelguo@gmail.com>
Organization: Gulessoft, Inc
Message-ID: <op.u5qxc3ulmn1qzu@guohr-laptop-ubuntu>
In-Reply-To: <1262167325.2553.14.camel@lenovo.internal.reciva.com>
User-Agent: Opera Mail/10.10 (Linux)
X-SA-Exim-Connect-IP: 209.85.222.192
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
X-List-Received-Date: Wed, 30 Dec 2009 10:15:51 -0000
Content-Type: text/plain; charset=utf-8; format=flowed; delsp=yes
Content-Transfer-Encoding: Quoted-Printable

I will try it tonight.

=E5=9C=A8 Wed, 30 Dec 2009 18:02:05 +0800=EF=BC=8CPhil Blundell <philb@g=
nu.org> =E5=86=99=E9=81=93:

> You can't just rename DISTROs arbitrarily like that since all the
> overrides will go wrong.  I think most or all of your build failures a=
re
> probably due to your "micro-eglibc" distro being neither one thing or
> another.
>
> Please try building with DISTRO=3Dmicro (and not anything else that yo=
u
> believe to be equivalent) and see if your situation improves.
>
> p.
>
> On Wed, 2009-12-30 at 17:43 +0800, Guo Hongruan wrote:
>> There are lots of failure buildings due to the problem of base-file
>> packages which I have not enumerated in my previous email.
>>
>> By the way, I have renamed the micro.conf to micro-eglibc.conf locall=
y,  =

>> so
>> that I can get to know which type of libc the distribution is using. =
so
>> the micro-eglibc.conf is just the same as micro.conf in git tree.
>>
>> =E5=9C=A8 Wed, 30 Dec 2009 17:31:50 +0800=EF=BC=8CPhil Blundell <phil=
b@gnu.org> =E5=86=99=E9=81=93:
>>
>> > On Wed, 2009-12-30 at 17:23 +0800, Guo Hongruan wrote:
>> >> =E5=9C=A8 Wed, 30 Dec 2009 17:17:17 +0800=EF=BC=8CPhil Blundell <p=
hilb@gnu.org>  =

>> =E5=86=99=E9=81=93:
>> >>
>> >> > On Wed, 2009-12-30 at 16:36 +0800, Guo Hongruan wrote:
>> >> >> The micro/micro-uclibc specific check does cause the miss of th=
e
>> >> >> /etc/default directory, which is required by the following
>> >> installation.
>> >> >> So the installation of base-file failed when DISTRO=3Dmicro or
>> >> >> DISTRO=3Dmicro-uclibc.
>> >> >
>> >> > Can you give any more details of the problem you are trying to  =

>> solve?
>> >> > Which exact installation step requires /etc/default?
>> >> >
>> >>
>> >> See the following for details:
>> >>
>> >>
>> >> http://tinderbox.openembedded.net/packages/392296/
>> >> http://tinderbox.openembedded.net/packages/391393/
>> >
>> > Ah, I see.  So, it would appear that you are actually using
>> > "DISTRO=3Dmicro-eglibc", rather than the micro and micro-uclibc tha=
t you
>> > mentioned above.
>> >
>> > That DISTRO is not in the org.openembedded.dev tree so I can't test=
  =

>> with
>> > it but, if you want to stick with that setting, I would guess that =
you
>> > probably need to modify the ${DISTRO} conditional that wraps the
>> > relevant lines of the base-files do_install() method so that it
>> > recognises micro-eglibc as a synonym for micro.
>> >
>> > p.
>> >
>> >
>> >
>> > _______________________________________________
>> > Openembedded-devel mailing list
>> > Openembedded-devel@lists.openembedded.org
>> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-de=
vel
>>
>>
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


