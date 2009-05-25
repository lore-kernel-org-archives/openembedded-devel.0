Received: from [209.85.218.171] (helo=mail-bw0-f171.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ihar.hrachyshka@gmail.com>) id 1M8XyC-0007tH-NE
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 May 2009 13:03:52 +0200
Received: by bwz19 with SMTP id 19so3018390bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 May 2009 03:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=qNC0+vlBBTCHQjm+eSholtRhmVb51IJBUBPwNgkNyqI=;
	b=D9G+sFFQ8RRNLD4eqNMcTz2mlRkYVUtMOFvjynU6ELJ0apXDoVKORcYrasUwxZX4AG
	6X5PS712RzOmcLxNXRJSL9I0HdBw+qBhNUOc3ZTLIVAlEh9yJPNNX+OWDezslV2klwAB
	6CmUUzLbYRtpI3aYYjaHh0/B5Yb43iSbm10Gg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=tFJ/eNv2ojVTY8b2R5iEjyMgV0wsLxWTcxznavRcZdDsdTqaj+pnHkckYS2JPJvaXW
	bCjruYWspSLuhUabOpeU4/zdacBl7/u4n2bpbONh0Un1DUeuwYCQwcjgpbTHshJAc49B
	ZPp+gyq5dtpCkwQaO7+VDOzwaGXN8ie3Jat8U=
MIME-Version: 1.0
Received: by 10.103.213.10 with SMTP id p10mr3613541muq.17.1243248951142; Mon, 
	25 May 2009 03:55:51 -0700 (PDT)
In-Reply-To: <1243247426.4869.23.camel@lenovo.internal.reciva.com>
References: <1243189985-19060-1-git-send-email-ihar.hrachyshka@gmail.com>
	<1243189985-19060-2-git-send-email-ihar.hrachyshka@gmail.com>
	<200905251125.45665.marcin@juszkiewicz.com.pl>
	<fce2a370905250254p4c51b706q399b14d9b0bb20e5@mail.gmail.com>
	<1243247426.4869.23.camel@lenovo.internal.reciva.com>
Date: Mon, 25 May 2009 13:55:51 +0300
Message-ID: <fce2a370905250355h5edd949cq40bcb52882e1e623@mail.gmail.com>
From: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 2/2] udev: moved udevadm to the main udev package
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
X-List-Received-Date: Mon, 25 May 2009 11:03:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, May 25, 2009 at 1:30 PM, Phil Blundell <philb@gnu.org> wrote:
> On Mon, 2009-05-25 at 12:54 +0300, Ihar Hrachyshka wrote:
>> On Mon, May 25, 2009 at 12:25 PM, Marcin Juszkiewicz
>> <marcin@juszkiewicz.com.pl> wrote:
>> > Dnia niedziela, 24 maja 2009 o 20:33:05 Ihar Hrachyshka napisa=C5=82(a=
):
>> >> The reason for the move is that udevadm binary is executed from udev
>> >> init.d script.
>> >
>> > NACK, NACK, NACK - udevadm is also udevinfo and is used by HAL. Your
>> > patch will make my mdev images not working properly because I would ne=
ed
>> > to install mdev and udev to get HAL working and then find a way to not
>> > run udev at boot time (even after package upgrades).
>>
>> I tried to understand your complain (really) but don't get it. What do
>> you mean when saying "udevadm is also udevinfo and is used by HAL"?
>> And also please provide your solution for the problem of broken images
>> with unfuctional udev subsystem.
>
> I think he's saying that udevadm is needed by HAL for correct operation,
> even if you're using mdev instead of udev itself.
>
> It looks like udev used to Depend on udev-utils due to the existence
> of /sbin/udevsettle in version 124. =C2=A0But, in version 141, that symli=
nk
> has gone away and hence the dependency is no longer created. =C2=A0The ri=
ght
> fix is probably to add an explicit RDEPENDS_${PN} +=3D "udev-utils" or
> some such.

Just sent the fix to ML.

>
> p.
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


