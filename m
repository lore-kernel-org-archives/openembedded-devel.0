Received: from mail-fx0-f51.google.com ([209.85.161.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <christian.betz@gmail.com>) id 1QM9V4-0002vS-8i
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 May 2011 03:55:06 +0200
Received: by fxm5 with SMTP id 5so145639fxm.10
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 May 2011 18:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=JpgfXiGCWSo2m81WOGjrrSLLNPahyuuGYvok5Yg04xw=;
	b=j8NZIb04lWYgJKZ6lpDZExPNwus3OsGMQ+/1EHJ73A2iQqLLbEHEspkZDANljl/E72
	4gK/j7tT75T4mxbR1CMSUeJL9SmWmZMDT9ykkt36vh/kZb9eQdVGT0zFJFVNtI6f6+HU
	bPbP70XJbs36jSBFmCKo3krFmLmr9uRvcpACU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=KjkZbftZPc4Y4Sf6K3na3xaTINiR77tqqXMl5F+s4DWi8opU8z2Il+8K7dQgeHFec/
	Fe5K48cmF4T99GHk2b0g73+CSSAWpCBKwc2GSZU9W9Q7d1OR/RMQmxTuLStUDJ+ehXJc
	3bxvAimQWW895kgk+7tSNuxZxyzPF2oRSjUgQ=
MIME-Version: 1.0
Received: by 10.223.6.71 with SMTP id 7mr108123fay.14.1305597132351; Mon, 16
	May 2011 18:52:12 -0700 (PDT)
Received: by 10.223.13.8 with HTTP; Mon, 16 May 2011 18:52:12 -0700 (PDT)
In-Reply-To: <1305551284.5159.8.camel@mattotaupa>
References: <BANLkTikH4sOR-aupFyQ9ArqF8iXyk0uGtw@mail.gmail.com>
	<1305541284-18178-1-git-send-email-sgh@sgh.dk>
	<1305551284.5159.8.camel@mattotaupa>
Date: Mon, 16 May 2011 21:52:12 -0400
Message-ID: <BANLkTikOynL1MRD721Wc2v9ktmm32V_RVQ@mail.gmail.com>
From: Christian Betz <christian.betz@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 2/3] acpid: Make 1.0.10 compile.
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
X-List-Received-Date: Tue, 17 May 2011 01:55:06 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

S=F8ren and Paul:

I've officially signed off on my patch in the other thread, and have
also sent an email upstream to ted felix (maintainer of acpid-netlink
from which the patch in oe is derived). I'll let you know what I hear
back.

Of course my next question is why debian and oe are not using
acpid-netlink, but instead cherry pick certain files and then patch
vanilla acpid. I'll see if I can figure that out.

Christian

On Mon, May 16, 2011 at 9:08 AM, Paul Menzel
<paulepanter@users.sourceforge.net> wrote:
> Dear S=F8ren,
>
>
> Am Montag, den 16.05.2011, 12:21 +0200 schrieb S=F8ren Holm:
>> Patch is tested on i686.
>> Compilation failed with the following error :
>>
>> | i686-angstrom-linux-gcc -march=3Dpentiumpro --sysroot=3D/home/sgh/oe-n=
ew-oe/build-vmc16/tmp/sysroots/i686-angstrom-linux -W -Wall -Werror -Wundef=
 -Wshadow -D_GNU_SOURCE -O2 -g -DVERSION=3D"\"1.0.10\"" =A0 -c -o
>> sock.o sock.c
>> | cc1: warnings being treated as errors
>> | libnetlink.c: In function 'addraw_l':
>> | libnetlink.c:521:56: error: comparison between signed and unsigned int=
eger expressions
>
> Christian already submitted a patch for this issue [1][2], but did not
> provide a Signed-off-by line, which you also forgot in this patch by the
> way.
>
>> ---
>> =A0recipes/acpid/acpid-1.0.10/libnetlink.diff | =A0 15 +++++++++++++++
>> =A0recipes/acpid/acpid_1.0.10.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =A01 +
>> =A02 files changed, 16 insertions(+), 0 deletions(-)
>> =A0create mode 100644 recipes/acpid/acpid-1.0.10/libnetlink.diff
>>
>> diff --git a/recipes/acpid/acpid-1.0.10/libnetlink.diff b/recipes/acpid/=
acpid-1.0.10/libnetlink.diff
>> new file mode 100644
>> index 0000000..59ab951
>> --- /dev/null
>> +++ b/recipes/acpid/acpid-1.0.10/libnetlink.diff
>> @@ -0,0 +1,15 @@
>> +diff --git a/libnetlink.c b/libnetlink.c
>> +index 6f1ceea..d34dfe4 100644
>> +--- a/libnetlink.c
>> ++++ b/libnetlink.c
>> +@@ -518,8 +518,8 @@ int addattr_l(struct nlmsghdr *n, int maxlen, int t=
ype, const void *data,
>> +
>> + int addraw_l(struct nlmsghdr *n, int maxlen, const void *data, int len=
)
>> + {
>> +- =A0 =A0if ((int)NLMSG_ALIGN(n->nlmsg_len) + NLMSG_ALIGN(len) > maxlen=
) {
>> +- =A0 =A0 =A0 =A0 =A0 =A0fprintf(stderr, "addraw_l ERROR: message excee=
ded bound of %d\n",maxlen);
>> ++ =A0 =A0if ((int)NLMSG_ALIGN(n->nlmsg_len) + (int)NLMSG_ALIGN(len) > m=
axlen) {
>> ++ =A0 =A0fprintf(stderr, "addraw_l ERROR: message exceeded bound of %d\=
n",maxlen);
>
> This indentation change is not needed.
>
>> + =A0 =A0 =A0 =A0 =A0 =A0 return -1;
>> + =A0 =A0 }
>> +
>> diff --git a/recipes/acpid/acpid_1.0.10.bb b/recipes/acpid/acpid_1.0.10.=
bb
>> index 9d3170d..f0a6049 100644
>> --- a/recipes/acpid/acpid_1.0.10.bb
>> +++ b/recipes/acpid/acpid_1.0.10.bb
>> @@ -2,6 +2,7 @@ require acpid.inc
>>
>> =A0SRC_URI_append =3D " file://event.c.diff \
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 file://netlink.diff \
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 file://libnetlink.diff \
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 file://gcc44.diff \
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 file://acpid-sys-stat.patch \
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "
>
> I would say to wait for Christian=92s reply to his thread and hopefully
> will get this in as soon as possible.
>
>
> Thanks,
>
> Paul
>
>
> [1] http://patches.openembedded.org/patch/4023/
> [2] http://patches.openembedded.org/patch/4061/
>



--=20
For there are moments when one can neither think nor feel. =A0And if one
can neither think nor feel, she thought, where is one?
=A0-- Virginia Woolf, "To the Lighthouse"

[Quoted in "VMS Internals and Data Structures", V4.4, when referring
to powerfail recovery.]


