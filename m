Received: from mail-fx0-f51.google.com ([209.85.161.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <christian.betz@gmail.com>) id 1QM8r8-0002UU-B5
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 May 2011 03:13:50 +0200
Received: by fxm5 with SMTP id 5so122563fxm.10
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 May 2011 18:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=vd5tomr1NdcJ/DVBZOhnpjAmGUM+HzzPMm7N/49lzaE=;
	b=Yj+fEKNRZI/wu/sNjyxO0sZ04uGc1xvVDsgvz4F6aXkIZQfOZUymuqpMJogXYs/ITP
	oYpM8G5tk+7XDq+4DJBLUEhbQFkaOODeVvP4mE9p1VGsxPgnWw+6LUsYH8Xbradknxfr
	0B8x+y3rH2o5h3SKNRMsYRrBYG3i2fxHI+Obc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=TLhmrOUoH06mnYeCCVigQ2vgmfF8pP7gm8x9nLdB9fg61lBo/4olapfJjUs6AkKzTe
	Iem0OUIbzLQKqN9nHlaI3cEDn/Vu2MKj1pMd7g7Y/QIV9iVftlu7YpqQC/1CfJp5YL8q
	iih+kW8lLlghUdcj00+Zlu0/ecWmJV0MYjHX4=
MIME-Version: 1.0
Received: by 10.223.117.134 with SMTP id r6mr36468faq.147.1305594657382; Mon,
	16 May 2011 18:10:57 -0700 (PDT)
Received: by 10.223.13.8 with HTTP; Mon, 16 May 2011 18:10:57 -0700 (PDT)
In-Reply-To: <1305456100.5838.16.camel@mattotaupa>
References: <BANLkTikVtDGTO=04H8kkPdJLH2UtN9JR2A@mail.gmail.com>
	<1305433012-13000-2-git-send-email-christian.betz@gmail.com>
	<1305456100.5838.16.camel@mattotaupa>
Date: Mon, 16 May 2011 21:10:57 -0400
Message-ID: <BANLkTik25d8oDdLDkFKe=Pnw_r=3hB6woA@mail.gmail.com>
From: Christian Betz <christian.betz@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] fix acpid compiler warning on some platforms
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
X-List-Received-Date: Tue, 17 May 2011 01:13:50 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Christian Betz <christian.betz@gmail.com>
---------------------------------------------------------
I'm sorry I missed the part about officially signing off.

Would you mind telling me the sequence of git format-patch and git
send-email that you typically use?

This is what I plan to do next time

  git format-patch -s 2b621ed98259fa87b2e7ad05d4787d2dbf618608
  git send-email --annotate 0001-fix-something.patch

I will put the commit message as the subject and then detail why the
fix is needed in my editor in annotate mode.

Or maybe there is an official wiki document you (someone) can point me to?

Christian


On Sun, May 15, 2011 at 6:41 AM, Paul Menzel
<paulepanter@users.sourceforge.net> wrote:
> Dear Christian,
>
>
> Am Sonntag, den 15.05.2011, 00:16 -0400 schrieb Christian Betz:
>
> thank you for your fast response. Next time please also add the commit
> message. The one you provided in your first message would have been
> enough. You can even change/improve commit messages using `git commit
> --amend` (or `git rebase =85`) before doing `git format-patch =85`.
>
> I will add the commit message when applying your patch.
>
> You also forgot your Signed-off-by line. Please reply to this message
> with just that line since it is required by our commit policy.
>
> Passing `-s` to `git commit` or `git format-patch` adds that line
> automatically to =A0the commit message.
>
>> ---
>> =A0recipes/acpid/acpid-1.0.10/netlink.diff | =A0 =A02 +-
>> =A01 files changed, 1 insertions(+), 1 deletions(-)
>>
>> diff --git a/recipes/acpid/acpid-1.0.10/netlink.diff b/recipes/acpid/acp=
id-1.0.10/netlink.diff
>> index 635c550..ebdec58 100644
>> --- a/recipes/acpid/acpid-1.0.10/netlink.diff
>> +++ b/recipes/acpid/acpid-1.0.10/netlink.diff
>> @@ -2019,7 +2019,7 @@ diff -ruN acpid-1.0.10/libnetlink.c acpid-1.0.10-n=
etlink2/libnetlink.c
>> =A0+
>> =A0+int addraw_l(struct nlmsghdr *n, int maxlen, const void *data, int l=
en)
>> =A0+{
>> -+ =A0 =A0if ((int)NLMSG_ALIGN(n->nlmsg_len) + NLMSG_ALIGN(len) > maxlen=
) {
>> ++ =A0 =A0if ((int)NLMSG_ALIGN(n->nlmsg_len) + (int)NLMSG_ALIGN(len) > m=
axlen) {
>> =A0+ =A0 =A0 =A0 =A0 =A0 =A0fprintf(stderr, "addraw_l ERROR: message exc=
eeded bound of %d\n",maxlen);
>> =A0+ =A0 =A0 =A0 =A0 =A0 =A0return -1;
>> =A0+ =A0 =A0}
>
>
> Thanks,
>
> Paul
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>



--=20
For there are moments when one can neither think nor feel. =A0And if one
can neither think nor feel, she thought, where is one?
=A0-- Virginia Woolf, "To the Lighthouse"

[Quoted in "VMS Internals and Data Structures", V4.4, when referring
to powerfail recovery.]


