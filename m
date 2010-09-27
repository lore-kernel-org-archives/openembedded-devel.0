Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1P0EW4-0002Hi-9c
	for openembedded-devel@lists.openembedded.org;
	Mon, 27 Sep 2010 16:17:17 +0200
Received: by pxi11 with SMTP id 11so1412561pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Sep 2010 07:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=9FD4qkVcFhRFRMk5kqRWJ2RXOuMCgv2vC2mCifENGQg=;
	b=WMRQ8zc1YZX/hSfRZfbX/GMmhXvydQEn2LJS/hbb8gmOBSWdCxuEKxviyds5euOxpd
	fHoNdyLx3zwJVHSPHhQlEOTAVuS/5NnrdEpnCG4OUKXKmsYYtYTNL58mdku5ewWOQGcF
	/aaynqnGsRFhvqjUksm0MyAjPf/w0OW8RArrQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=vunQq7hgTJdSBpSqdbCnXObkXtkZ7JNXDYsAt7bRiJ1H4JAZdKvzJAzyuJA2kTXNvM
	bnF2695p0j/clLvXaPdNP3hNWEiqRDGpPmZt7Z7d/sdqsKpaVqInXM1Pg/IozEYSqLin
	saOEil1goPBhqdMr72uve+Z1Rnh01rmOftD7w=
Received: by 10.143.6.15 with SMTP id j15mr5809098wfi.243.1285597024201; Mon,
	27 Sep 2010 07:17:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.199.1 with HTTP; Mon, 27 Sep 2010 07:16:39 -0700 (PDT)
In-Reply-To: <1285578597.11101.12.camel@mattotaupa>
References: <1285456353-27457-1-git-send-email-raj.khem@gmail.com>
	<1285456353-27457-13-git-send-email-raj.khem@gmail.com>
	<1285578597.11101.12.camel@mattotaupa>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 27 Sep 2010 07:16:39 -0700
Message-ID: <AANLkTik0xGJH-ebYzEXyP-Xka37DGHS4fjWywGmAdpfm@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 12/12] netbase: Add interface information for qemumips64 and qemumips64el
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
X-List-Received-Date: Mon, 27 Sep 2010 14:17:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 27, 2010 at 2:09 AM, Paul Menzel
<paulepanter@users.sourceforge.net> wrote:
> Dear Khem,
>
>
> Am Samstag, den 25.09.2010, 16:12 -0700 schrieb Khem Raj:
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>> =C2=A0recipes/netbase/netbase/qemumips64/interfaces =C2=A0 | =C2=A0 13 +=
++++++++++++
>> =C2=A0recipes/netbase/netbase/qemumips64el/interfaces | =C2=A0 13 ++++++=
+++++++
>> =C2=A02 files changed, 26 insertions(+), 0 deletions(-)
>> =C2=A0create mode 100644 recipes/netbase/netbase/qemumips64/interfaces
>> =C2=A0create mode 100644 recipes/netbase/netbase/qemumips64el/interfaces
>>
>> diff --git a/recipes/netbase/netbase/qemumips64/interfaces b/recipes/net=
base/netbase/qemumips64/interfaces
>> new file mode 100644
>> index 0000000..1c6955e
>> --- /dev/null
>> +++ b/recipes/netbase/netbase/qemumips64/interfaces
>> @@ -0,0 +1,13 @@
>> +# /etc/network/interfaces -- configuration file for ifup(8), ifdown(8)
>> +
>> +# The loopback interface
>> +auto lo
>> +iface lo inet loopback
>> +
>> +# Wired or wireless interfaces
>> +auto eth0
>> +iface eth0 inet static
>> + =C2=A0 =C2=A0 address 192.168.1.107
>> + =C2=A0 =C2=A0 netmask 255.255.255.0
>> + =C2=A0 =C2=A0 network 192.168.1.264
>> + =C2=A0 =C2=A0 gateway 192.168.1.254
>> diff --git a/recipes/netbase/netbase/qemumips64el/interfaces b/recipes/n=
etbase/netbase/qemumips64el/interfaces
>> new file mode 100644
>> index 0000000..63a360b
>> --- /dev/null
>> +++ b/recipes/netbase/netbase/qemumips64el/interfaces
>> @@ -0,0 +1,13 @@
>> +# /etc/network/interfaces -- configuration file for ifup(8), ifdown(8)
>> +
>> +# The loopback interface
>> +auto lo
>> +iface lo inet loopback
>> +
>> +# Wired or wireless interfaces
>> +auto eth0
>> +iface eth0 inet static
>> + =C2=A0 =C2=A0 address 192.168.1.108
>> + =C2=A0 =C2=A0 netmask 255.255.255.0
>> + =C2=A0 =C2=A0 network 192.168.1.264
>> + =C2=A0 =C2=A0 gateway 192.168.1.254
>
> is there a way to share one interfaces file for all qemu configurations?
>

it could be made so but then I you wont be able to start more than one
instance of networking enabled qemu with different machines easily

> If not, then this patch is
>
> Acked-by: Paul Menzel <paulepanter@users.sourceforge.net>
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


