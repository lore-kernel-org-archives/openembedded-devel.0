Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mickael.chazaux@gmail.com>) id 1Q6hsb-0007nc-Qf
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Apr 2011 13:23:34 +0200
Received: by vxd7 with SMTP id 7so4595996vxd.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Apr 2011 04:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=DfnMNSn3Pq+8L9dHNZEdv4BX+KKCTafQY8lYJGITEfA=;
	b=qtPvq70fINaWQlhilBhltV4XmopQHBwvPfO/Na5/VjoCrQPr+c8KhdqcjQCg3rQaS0
	Xj1At3Y1JlpNLerMUQdInKODgO6mPlkyYGSF9NJ3obHd4EdR9bWYA0bFfArsjCtTl69k
	D06s4v6Zm9QtlEY+hDyceRuACD8sqJrYGULzo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=pWXgKvX6eqNzej/mLeXJGLa/fdA5Q0yhdVUVW1IemvMTTidChcbllGvnMK++Qpv/px
	0d5sh7hSxBawnpWLgcmgWQNojjcZ1H6QM56B/mGZs2Y7iiE9UUZS7UZl4ZrypLTG8WsN
	hxPWbJ01FuKRaE6JtBZO3dlko6QKp2bkHrP3I=
MIME-Version: 1.0
Received: by 10.52.99.38 with SMTP id en6mr5153546vdb.182.1301916088420; Mon,
	04 Apr 2011 04:21:28 -0700 (PDT)
Received: by 10.220.46.65 with HTTP; Mon, 4 Apr 2011 04:21:28 -0700 (PDT)
In-Reply-To: <4D657F34.5050200@mentor.com>
References: <AANLkTinD5vHUrhcuB1McLOkG4M+K7T5zAvCX276Xti8a@mail.gmail.com>
	<4D657F34.5050200@mentor.com>
Date: Mon, 4 Apr 2011 13:21:28 +0200
Message-ID: <BANLkTik=S6Ui--WVgGMZO0XiUoGsaQxU0g@mail.gmail.com>
From: Mickael Chazaux <mickael.chazaux@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: VMware disk image type
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
X-List-Received-Date: Mon, 04 Apr 2011 11:23:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

2011/2/23 Tom Rini <tom_rini@mentor.com>:
> On 02/23/2011 05:48 AM, Mickael Chazaux wrote:
>>
>> Hi,
>>
>> I see there is a vmware.conf in conf/machine, but it does not generate
>> vmdk (vmware virtual disk files) files. Here are the steps I take to
>> do that:
>>
>> - create an empty file the size wanted (with dd),
>> - format it to ext3 (mkfs.ext3 myfile)
>> - mount it loopback (mount -o loop myfile /mnt)
>> - untar the OE-generated rootfs in /mnt
>> - create a /boot/extlinux.conf [1],
>> - install extlinux in /boot (extlinux -i /mnt/boot)
>> - umount,
>> - convert to vmdk (using qemu-img -O vmdk myfile myfile.vmdk)
>> - boot it in vmware.
>>
>> Is it possible to add a "vmdk" image to openembedded to do this
>> automatically?
>
> Yes, patches would be welcome. =C2=A0This would reside in conf/bitbake.co=
nf. =C2=A0See
> the ubi/ubifs image examples for how to generate slightly complex images
> like this. =C2=A0And I would recommend adding vmdk.ext[234] as the image =
names
> (and supply at least one of them, someone else might step up and do the
> regex for the others if you don't). =C2=A0Thanks!
>

The problem is the loopback mount, which requires root privileges, and
is required by extlinux for its installation. Is there another method?

Regards,

Mickael Chazaux


