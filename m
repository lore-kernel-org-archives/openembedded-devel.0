Received: from mail-qy0-f182.google.com ([209.85.216.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heroor@gmail.com>) id 1QGYdv-0004jr-M2
	for openembedded-devel@lists.openembedded.org;
	Sun, 01 May 2011 17:33:07 +0200
Received: by qyk27 with SMTP id 27so3292070qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 01 May 2011 08:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=CC4ftxsfYi10xhxmU/lK2GnYOD0xrVo3k3ja3NoJcp0=;
	b=UULoRvREoDmfGkWPAKgGnmLnXPP5xu3zXYgcs+EEtk/BLUhpiy9VwjDUBCOCbDx2I5
	k9DzwUMKEW+B5era2OYIOBmnoZIpAryoMmEdV6L5XZ2zh8IEl4e4uxGWGkr+v75WWm9h
	3rqrxARcNEIRi28WvUFrgSDRJmq5iYy9LQtvw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=KNbkMuzjNYsAltuCKIwhtyQEHcuYO9mdHnS50E+Jzf2Ou2HRQwax83gMDCnNO/T1ho
	I8oJG9FpLUnkjhUWbez1zZ8IrZa1S/iRhXuXjzczwI+fwMc1s6NZbaEL3KGUJ2n5+UfQ
	NObY9rKknjVmidIKMBHPijKCJCU3L5TpxYU7Q=
MIME-Version: 1.0
Received: by 10.224.176.13 with SMTP id bc13mr5473874qab.192.1304263801495;
	Sun, 01 May 2011 08:30:01 -0700 (PDT)
Received: by 10.224.2.209 with HTTP; Sun, 1 May 2011 08:30:01 -0700 (PDT)
In-Reply-To: <1304244645.23614.9.camel@mattotaupa>
References: <1304243449-12028-1-git-send-email-heroor@ti.com>
	<1304243449-12028-2-git-send-email-heroor@ti.com>
	<1304244645.23614.9.camel@mattotaupa>
Date: Sun, 1 May 2011 21:00:01 +0530
Message-ID: <BANLkTinfT-o9QJZuA8GRFU8z=hkjG84Hhg@mail.gmail.com>
From: Siddharth Heroor <heroor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 2/2] zeromq: Add version 2.1.6
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
X-List-Received-Date: Sun, 01 May 2011 15:33:07 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sun, May 1, 2011 at 3:40 PM, Paul Menzel
<paulepanter@users.sourceforge.net> wrote:
> Am Sonntag, den 01.05.2011, 15:20 +0530 schrieb Siddharth Heroor:
>
> What distribution and machine did you use for testing?
I built for Angstrom using Koen's angstrom setup scripts. I built for
angstrom-2008.1 and MACHINE c6a816x-evm (a TI device). I some basic
tests
on the same board.

>
>> Signed-off-by: Siddharth Heroor <heroor@ti.com>
>> ---
>> =A0recipes/zeromq/zeromq_2.1.6.bb | =A0 =A04 ++++
>> =A01 files changed, 4 insertions(+), 0 deletions(-)
>> =A0create mode 100644 recipes/zeromq/zeromq_2.1.6.bb
>>
>> diff --git a/recipes/zeromq/zeromq_2.1.6.bb b/recipes/zeromq/zeromq_2.1.=
6.bb
>> new file mode 100644
>> index 0000000..f88f512
>> --- /dev/null
>> +++ b/recipes/zeromq/zeromq_2.1.6.bb
>> @@ -0,0 +1,4 @@
>> +require zeromq.inc
>
> Please add `PR =3D ${INC_PR}.0`.
>
>> +
>> +SRC_URI[md5sum] =3D "77b9ca20e8f2426874022080f41d7b0b"
>> +SRC_URI[sha256sum] =3D "a1bbb352a9dbf34b18a3999b22a8db2d51e4a52508d0985=
28d771811533f9fd0"
>
> You can also squash your two patches (`git rebase -i HEAD~2`) since the
> include file by itself cannot not be used.
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
Sid


