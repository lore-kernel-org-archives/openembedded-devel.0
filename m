Received: from [209.85.146.180] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1KPTeh-0001bR-2V
	for openembedded-devel@openembedded.org; Sun, 03 Aug 2008 04:49:11 +0200
Received: by wa-out-1112.google.com with SMTP id j5so2288138wah.4
	for <openembedded-devel@openembedded.org>;
	Sat, 02 Aug 2008 19:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:cc:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=S9zarv+GTPu1Ie8xVOPYnabkN3rt5n6Rq8+y2nZr1fU=;
	b=MqQJYILAWvUdNSi03SQF5yRYd1YwlIRzaPjknEVslPU3r9t0/i0I1lKv0d0Tdn+n72
	sbXLEq/xhI/adFhmTMt0qN76Xl0C73vZlwhRam/fhLLqdk1U5xwX5oHWf9SLv7Drwqxi
	ZOXJNUepJIa94tCI9+idJkXW3FGQ500ud768I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:cc:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=DonR97X3TmUmnLsUjFavbyARnx40tCeR+rRlFwp8dQGqXk7L/tmrj7B42Dq4EDL8uQ
	fZVakB738WKcZzT+Kb36G/BzPqivFpH44pIEpzm1liQnVu7NCJUG6qetwsezDuJyOMsM
	Y5D7PGs7uJjyqPk/i+5UVh3tizJ86eJUTp04w=
Received: by 10.114.192.17 with SMTP id p17mr13265047waf.133.1217731632647;
	Sat, 02 Aug 2008 19:47:12 -0700 (PDT)
Received: by 10.114.149.20 with HTTP; Sat, 2 Aug 2008 19:47:12 -0700 (PDT)
Message-ID: <19c1b8a90808021947u51704879gd696fe112e31e55d@mail.gmail.com>
Date: Sat, 2 Aug 2008 19:47:12 -0700
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <g71ver$tg8$1@ger.gmane.org>
MIME-Version: 1.0
References: <1216087105.10214.7.camel@isis> <g71idt$s09$1@ger.gmane.org>
	<1217690093.25732.106.camel@lenovo.internal.reciva.com>
	<g71ver$tg8$1@ger.gmane.org>
Cc: openembedded-devel@openembedded.org
Subject: Re: [RFC]: Toolchain build sequence alteration.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Sun, 03 Aug 2008 02:49:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Sat, Aug 2, 2008 at 8:45 AM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> Phil Blundell wrote:
>>
>> On Sat, 2008-08-02 at 14:03 +0200, Koen Kooi wrote:
>>>
>>> -do_stage_prepend () {
>>> +do_stage_append () {
>>>        # get rid of dummy libc.so
>>>
>>> This fixes builds from scratch for me (tried with armv5te and armv7a),
>>> but I haven't tested if it breaks iconv again since I value working
>>> builds over working iconv atm. I'm fairly sure it doesn't break iconv,
>>> because the bogus libc.so is gone before glibc gets built, but as I
>>> said, I haven't tested it.
>>
>> Iconv does still seem to be OK after this change.
>
> Great! Thanks for testing this.
>
>> However, the fact
>> that this was needed indicates that something in gcc-c-i's do_stage()
>> method is trying to link with the dummy libc.so, which might be causing
>> some other subtle breakage along the lines of the original iconv
>> problem.  Some scrutiny will be needed to figure out what exactly
>> gcc-c-i is doing with libc.so at this point and whether or not it is
>> safe to let it do so.
>
> I suspect it's a side effect of using 'make install' for do_stage, but then
> again, I'm not a toolchain or gcc expert :)

I think using make install for staging should not be done. We should
generate complete package and then incrementally populate staging as
we populate rootfs. It will need cross ipk installation support.

My two cents.

Khem


