Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RSewR-0004KH-45
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Nov 2011 02:14:33 +0100
Received: by faat2 with SMTP id t2so6724423faa.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Nov 2011 17:08:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=qReATOy/5OTdFGgymPMPkiG+Ucj15tthcXXzNaS8DuI=;
	b=Y8GugCkqIBubyHd4cHNS+6TSk9ucbUfHtW+144RBGA2zNZwc5GeVU0lbhGcXpTAaV2
	J0yRcQVLbLW6FaaUoBsrKgiS75e23WMdspNn/grS+kfgk/f9+0EXjyuXxAp2yuoaGk37
	o/sbex8nHJUJv6HVM2D867el+w0AQeiQf2n7U=
Received: by 10.152.106.38 with SMTP id gr6mr10706235lab.35.1321924080168;
	Mon, 21 Nov 2011 17:08:00 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.24.36 with HTTP; Mon, 21 Nov 2011 17:07:29 -0800 (PST)
In-Reply-To: <20111121203039.GM3565@jama.jama.net>
References: <20111104141806.GU9949@jama.jama.net>
	<20111104142028.GV9949@jama.jama.net>
	<20111121203039.GM3565@jama.jama.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 21 Nov 2011 17:07:29 -0800
Message-ID: <CAMKF1srZhWXp+e32Ut1xhM0wgqDsiVNxrcHYtrNw-S7UNsA6PQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: libvpx causing gcc ICE when building for qemux86-64
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
X-List-Received-Date: Tue, 22 Nov 2011 01:14:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 21, 2011 at 12:30 PM, Martin Jansa <martin.jansa@gmail.com> wro=
te:
> On Fri, Nov 04, 2011 at 03:20:28PM +0100, Martin Jansa wrote:
>> On Fri, Nov 04, 2011 at 03:18:06PM +0100, Martin Jansa wrote:
>> > Hi, with latest gcc-4.6 from meta-oe I get this ICE:
>> >
>> > OE @ ~/shr-core/tmp/work/x86_64-oe-linux/libvpx-0.9.5-r0.0/libvpx-v0.9=
.5 $ x86_64-oe-linux-gcc =C2=A0 =C2=A0-m64 --sysroot=3D/OE/shr-core/tmp/sys=
roots/qemux86-64 -O2 -pipe -g -feliminate-unused-debug-types -fPIC -O3 -Wal=
l -Wdeclaration-after-statement -Wdisabled-optimization -Wpointer-arith -Wt=
ype-limits -Wcast-qual -Wno-unused -I. -I"/OE/shr-core/tmp/work/x86_64-oe-l=
inux/libvpx-0.9.5-r0.0/libvpx-v0.9.5" -I/OE/shr-core/tmp/work/x86_64-oe-lin=
ux/libvpx-0.9.5-r0.0/libvpx-v0.9.5/vp8 -I/OE/shr-core/tmp/work/x86_64-oe-li=
nux/libvpx-0.9.5-r0.0/libvpx-v0.9.5/vp8 -c -o md5_utils.c.o md5_utils.c
>> > md5_utils.c: In function 'byteSwap':
>> > md5_utils.c:30:1: internal compiler error: Segmentation fault
>> > Please submit a full bug report,
>> > with preprocessed source if appropriate.
>> > See <http://gcc.gnu.org/bugs.html> for instructions.
>>
>> And dropping -O3 is enough to make it compile again.
>
> FWIW: Just tested with newer gcc from oe-core and the problem is still th=
ere.

Its a regression caused by one of linaro patches I suppose. I will see
what I can find.

-Khem


