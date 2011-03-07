Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PwXdD-0001BW-OD
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Mar 2011 11:25:39 +0100
Received: by iyb26 with SMTP id 26so4050200iyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Mar 2011 02:24:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=PtTm4fASYDOUs8mWRLQdlF4fwibePp4TL4BU/1YWeAw=;
	b=CYIrF9fzo5KheZ9Hu8YPavAfV2/ORKpPgWwOxiWYvjkc67ECc5DTBGflqhIn0TLYIi
	z9Ko+ZcddIj6cigqA/enubV2Z0JpyHyKk7K+uxSFU+ucUljB7FBvX+aB5wXXbq1hY6/I
	m//lNgmGP/8zV8oEUq+3tMciLYVXW/UQRtwLs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=r035+WXIkOqmqpaBgmZ4JLbbmzmFTqRSKCQ8IVzJI27L7DIn48A4uAddPDosYdR14Q
	/tExTC2Y4zIIdWa+5QGanUUw2PQ1Uy+ye5KhCGbxZOUMIdnHzFWUUOtY+d5TphYOCuO3
	Q4gAbpVSP7NaoGVYQAMZh3CxGNP3iDNc5jvFA=
MIME-Version: 1.0
Received: by 10.231.194.195 with SMTP id dz3mr2937186ibb.148.1299493446223;
	Mon, 07 Mar 2011 02:24:06 -0800 (PST)
Received: by 10.231.19.5 with HTTP; Mon, 7 Mar 2011 02:24:06 -0800 (PST)
In-Reply-To: <1299188687.17920.150.camel@lenovo.internal.reciva.com>
References: <AANLkTinrZHXCyA2USHeuOijx0KrZrNVY7K3uhqwpLaao@mail.gmail.com>
	<1299188687.17920.150.camel@lenovo.internal.reciva.com>
Date: Mon, 7 Mar 2011 11:24:06 +0100
Message-ID: <AANLkTinT-GUhvmLxh80M-41SOAW7c8suBTg9ZR+Pmntq@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: gcc ICE (gcc 4.1.2, nios2), test program included
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
X-List-Received-Date: Mon, 07 Mar 2011 10:25:39 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2011/3/3 Phil Blundell <philb@gnu.org>:
> On Thu, 2011-03-03 at 19:48 +0100, Frans Meulenbroeks wrote:
>> Dear all,
>>
>> I've bumped onto an issue that I seem unable to resolv.
>> With gcc 4.1.2, target nios2, I get an ICE when compiling dbus:
>>
>> [...]
>>
>> Anyone an idea on how to tackle this.
>
> I'm not sure there's much to say about this really. =A0An ICE is, more or
> less by definition, a compiler bug in gcc, and the version you're
> testing with is quite old now (by normal standards if not in the Altera
> world). =A0So your options would seem to be:
>
> a) find a newer gcc and hope that it fixes the bug;

Unfortunately there isn't one.
>
> b) debug the failure for yourself (see the gcc manual and/or mailing
> list for advice); or

Guess that is the road to travel. Maybe someone has some pointers on
how to get started with this.
>
> c) persuade someone else, presumably one of the nios2 gcc maintainers,
> to debug it.

Unfortunately such maintainer does not seem to exist.
The nios2 port was done by windriver. I'm speculating that this was
contract work for Altera. There does not seem to be an active
maintainer. That is probably also why there is no newer version.

I've encountered the error in dbus; there I managed to develop a patch
to dbus that avoids triggering the bug.
However with bitbake -k console-image I see the problem also occurs in
jasper and tiff:

jpc_t1cod.c: In function 'jpc_getmagctxno':
jpc_t1cod.c:447: error: Attempt to delete prologue/epilogue insn:
(insn 76 75 77 0 jpc_t1cod.c:436 (set (reg:SI 22 r22)
        (plus:SI (reg:SI 22 r22)
            (reg:SI 8 r8))) -1 (nil)
    (nil))
jpc_t1cod.c:447: internal compiler error: in propagate_one_insn, at flow.c:=
1699


tif_ojpeg.c:2078: error: Attempt to delete prologue/epilogue insn:
(insn 171 170 172 8 tif_ojpeg.c:2078 (set:SI (reg:SI 22 r22)
        (mem/c:SI (plus:SI (reg/f:SI 27 sp)
                (const_int 8 [0x8])) [110 S4 A32])) -1 (nil)
    (nil))
tif_ojpeg.c:2078: internal compiler error: in propagate_one_insn, at flow.c=
:1699

Frans.


