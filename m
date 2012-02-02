Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RsrTh-0002s7-Sp
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Feb 2012 08:53:10 +0100
Received: by yenr5 with SMTP id r5so906460yen.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Feb 2012 23:45:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=97sy5u2bOcb6uQa5NgipMHsdTxldRjNdPcqrMfJdyQA=;
	b=R6A00L7vzK/nYMPA0ljAb50FsSrBbMbquN6+QjeBVOqSpIQ0kMUEdGvb5eub5AEmqU
	8Q/z6/gIkL7aWZmEzjhdn2jV2qn6sASnzR64baZJTO1Uy7TU8nAJcOdQPaaAnKtDlTTH
	O0cgl3JuwYE/xh5vpTNcGxbr6hdLf4g7Rz2Xw=
MIME-Version: 1.0
Received: by 10.236.138.131 with SMTP id a3mr1959802yhj.101.1328168713153;
	Wed, 01 Feb 2012 23:45:13 -0800 (PST)
Received: by 10.236.25.33 with HTTP; Wed, 1 Feb 2012 23:45:13 -0800 (PST)
In-Reply-To: <20120104090523.066ae2d7@eb-e6520>
References: <1324624336-18713-1-git-send-email-eric@eukrea.com>
	<20120104051849.GG31275@sakrah.homelinux.org>
	<20120104090523.066ae2d7@eb-e6520>
Date: Thu, 2 Feb 2012 08:45:13 +0100
Message-ID: <CA+chaQe-XFR6XVAoept8+d8kqoZ1y2qBoVXgetEPpD2n50nYBA@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe] gdb-cross-canadian: build gdb with python support
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
X-List-Received-Date: Thu, 02 Feb 2012 07:53:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 4, 2012 at 9:05 AM, Eric B=C3=A9nard <eric@eukrea.com> wrote:
> Hi Khem,
>
> Le Tue, 3 Jan 2012 21:18:49 -0800,
> Khem Raj <raj.khem@gmail.com> a =C3=A9crit :
>> On (23/12/11 08:12), Eric B=C3=A9nard wrote:
>> > * python support is needed for providing finer scripting control
>> > in gdb, and for remote controling gdb for example from qtcreator
>> > * gdb/configure tries to autodetect python using python executable
>> > with --includes --ldflags --exec-prefix to get the right flags
>> > As it's difficult to achieve in OE's context, we generate a
>> > script which will return the right values and make gdb's build
>> > system happy. This idea was taken from the following article :
>> > http://www.mentby.com/doug-evans-2/python-enabled-gdb-on-windows-and-r=
elocation.html
>> > * tested using angstrom & armv7/armv5 targets & qtcreator 201005 & 2.4=
.0
>>
>> I think this change should go into oe-core. Can you please redo it
>> w.r.t. oe-core
>>
> I agree with you, I initally submited it for oe-core and was asked
> to put it into meta-oe by Jessica :
> http://lists.linuxtogo.org/pipermail/openembedded-core/2011-December/0148=
28.html
> http://lists.linuxtogo.org/pipermail/openembedded-core/2011-December/0148=
33.html
>
> Eric

Hi Eric,

with this patch I see gdb-cross-canadian_7.3.1.bb failing with:
| checking whether to use python...
/OE/shr-core/tmp/work/x86_64-nativesdk-oesdk-linux/gdb-cross-canadian-arm/g=
db-cross-canadian-arm-7.3.1-r5.1/python
| checking for python2.7... no
| configure: error: no usable python found at
/OE/shr-core/tmp/work/x86_64-nativesdk-oesdk-linux/gdb-cross-canadian-arm/g=
db-cross-canadian-arm-7.3.1-r5.1/python

and
/OE/shr-core/tmp/work/x86_64-nativesdk-oesdk-linux/gdb-cross-canadian-arm/g=
db-cross-canadian-arm-7.3.1-r5.1/python
is really script from this patch

Any hint how to fix this?

Cheers,


