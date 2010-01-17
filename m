Received: from mail-pz0-f185.google.com ([209.85.222.185])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NWTx2-0001OJ-Gr
	for openembedded-devel@lists.openembedded.org;
	Sun, 17 Jan 2010 13:09:55 +0100
Received: by pzk15 with SMTP id 15so1585965pzk.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Jan 2010 04:07:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:content-type:to:subject
	:references:date:mime-version:content-transfer-encoding:from
	:organization:message-id:in-reply-to:user-agent;
	bh=bwB1smupHDdNbiwAwuowrB3OkXYbf53578QzowpkkN4=;
	b=lBm0hCGYSdavAWUN8nbgfscbHahlxq47/nZMy2XZwSoKRAERTmiy9FIp0VmJpt6qTZ
	zFWcfi3Q661hfNw1/qPDipoXdWilwI8kQ8tMYUhT6+ENMqolMCHbmhibZGLfk3LVb7pC
	JJk17OXdvtQ+VGgqkpoWmlXDncCm06RyY/QPg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=content-type:to:subject:references:date:mime-version
	:content-transfer-encoding:from:organization:message-id:in-reply-to
	:user-agent;
	b=BnK/Z09OZFES0ZzaKe5So9H/pSqU+WOwJH+QsBRvy3yK0Ou7K7bT8BUpOd/mCnCEa3
	S5E2bDEABVLgdR/NGFXdSiPQPFg33kK2Veh0vlWrGQsHiK3cdM1ZqT7IS+m+2IpFn38Z
	+WI2fcfUDacZTcIzPRyTNncFtINxWjL3uY7pc=
Received: by 10.141.213.32 with SMTP id p32mr3456668rvq.161.1263730057988;
	Sun, 17 Jan 2010 04:07:37 -0800 (PST)
Received: from guohr-laptop-ubuntu ([123.54.105.23])
	by mx.google.com with ESMTPS id 23sm3297527pzk.4.2010.01.17.04.07.34
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 17 Jan 2010 04:07:37 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <> <1263698541-9726-1-git-send-email-camelguo@gmail.com>
	<1263726023.457.897.camel@lenovo.internal.reciva.com>
	<op.u6ob5ohzmn1qzu@guohr-laptop-ubuntu>
	<1263729318.457.901.camel@lenovo.internal.reciva.com>
Date: Sun, 17 Jan 2010 20:07:27 +0800
MIME-Version: 1.0
From: "Guo Hongruan" <camelguo@gmail.com>
Organization: Gulessoft, Inc
Message-ID: <op.u6oempf0mn1qzu@guohr-laptop-ubuntu>
In-Reply-To: <1263729318.457.901.camel@lenovo.internal.reciva.com>
User-Agent: Opera Mail/10.10 (Linux)
X-SA-Exim-Connect-IP: 209.85.222.185
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
X-List-Received-Date: Sun, 17 Jan 2010 12:09:55 -0000
Content-Type: text/plain; charset=utf-8; format=flowed; delsp=yes
Content-Transfer-Encoding: Quoted-Printable

=E5=9C=A8 Sun, 17 Jan 2010 19:55:18 +0800=EF=BC=8CPhil Blundell <philb@g=
nu.org> =E5=86=99=E9=81=93:

> On Sun, 2010-01-17 at 19:14 +0800, Guo Hongruan wrote:
>> =E5=9C=A8 Sun, 17 Jan 2010 19:00:23 +0800=EF=BC=8CPhil Blundell <phil=
b@gnu.org> =E5=86=99=E9=81=93:
>>
>> > On Sun, 2010-01-17 at 11:22 +0800, Guo Hongruan wrote:
>> >> * the previous default version of binutils (2.19.51) in micro.conf=

>> >> cause the default version of glibc failed to build
>> >>
>> >> Signed-off-by: Guo Hongruan <camelguo@gmail.com>
>> >>
>> >> -PREFERRED_BINUTILS =3D "2.19.51"
>> >> +PREFERRED_BINUTILS =3D "2.18"
>> >
>> > No, this is not acceptable.  Moving binutils forwards to 2.20{.1}  =

>> would
>> > probably be OK, but going back to 2.18 is no good since that versio=
n
>> > does not work correctly with Thumb code.
>>
>> the toolchain setting in micro.conf is incompatible, which caused thi=
s
>> problem. For the preferred version of glibc is 2.6.1 which is set in
>> conf/distro/include/sane-toolchain.inc,
>
> Isn't micro using eglibc?  I wouldn't have expected that you should be=

> seeing glibc built at all for that DISTRO.

I set LIBC=3Dglibc in shell environment.

>
>> I think it is better to change the
>> binutils preferred version which is set in conf/distro/micro.conf.
>
> As I said before, binutils 2.18 is not acceptable in general because
> this version cannot do Thumb code.  Glibc 2.6.1 is pretty old and, if =
it
> is incompatible with newer toolchains, I would suggest updating to a
> newer version of glibc (e.g. 2.10) rather than trying to wind the
> toolchain backwards.

Yes, I think so. Several days ago, I submitted a patch to update glibc t=
o  =

2.10 in conf/distro/include/sane-toolchain.inc, but was rejected and the=
  =

reason was that it may break other buildings and had not full tested.

>
> As a last resort we could make the binutils version be
> architecture-specific, and select 2.18 for i386, but I really don't
> think this ought to be necessary.

I agree with you

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


