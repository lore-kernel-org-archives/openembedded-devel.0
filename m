Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sakoman@gmail.com>) id 1PATGQ-00026D-1T
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Oct 2010 22:03:27 +0200
Received: by wwb39 with SMTP id 39so3043928wwb.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Oct 2010 13:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=HrEgbz05g0/zHbgdVY3VjS+xGlUHaCTzpBgW/OeGv2I=;
	b=a8XO6ajcXv/jNLH0ueu9bnOxyLqLlzhad0I/AZGcuLwEK45Qu9wZZ6HQDPzyfFyT6G
	NLR9dyXehUH2w1IMAYhhRam/obgyscG1PTzBh7HKVcaQjQgZIJlcIw7yi/b/fI4ZTi/n
	tHLxtavzmMTSByZRH0QfOmH4zOeLHMkyMKMlQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=uyYERsxUs0DSn7G6BPjLRF/1GMmycJ3OuqmV3vEfqIqbVsEr3AUSz3d+JvmDbrYI3c
	pzTys0o7vs/s0z7jtu+eeKxXAo4jh6R2CbP7/Fw1lOSQ692zWjU5GdVAuKAOF/rBO/W8
	LLI8zvGNZtZO2ANSZjkmq9tsFA9PfMdT1MlB8=
MIME-Version: 1.0
Received: by 10.216.17.211 with SMTP id j61mr6721160wej.14.1288036963405; Mon,
	25 Oct 2010 13:02:43 -0700 (PDT)
Received: by 10.216.23.13 with HTTP; Mon, 25 Oct 2010 13:02:42 -0700 (PDT)
In-Reply-To: <AANLkTimnpM-4_d7LV8bv5AnYPN02ZkUNS7h+BaEJyd1H@mail.gmail.com>
References: <AANLkTinhVFqdS1XQ1OmhSHVwr0MS9pZgMMR9cqBoFxYM@mail.gmail.com>
	<AANLkTimnpM-4_d7LV8bv5AnYPN02ZkUNS7h+BaEJyd1H@mail.gmail.com>
Date: Mon, 25 Oct 2010 13:02:42 -0700
Message-ID: <AANLkTi=u8D0f9rWHz+YT3B+UaoaOO_iFjfizJUW6-3sC@mail.gmail.com>
From: Steve Sakoman <sakoman@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: sakoman@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Python.h LONG_BIT definition error on 64 bit build machine
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
X-List-Received-Date: Mon, 25 Oct 2010 20:03:27 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 25, 2010 at 12:48 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Mon, Oct 25, 2010 at 8:57 AM, Steve Sakoman <sakoman@gmail.com> wrote:
>> I'm working on a recipe for a new version of hplip (it depends on
>> python). =A0It builds just fine on my 32 bit Ubuntu development machine,
>> but when I attempt the build on my 64 bit Ubuntu machines the build
>> fails with the following error:
>>
>> In file included from
>> /home/steve/source/sakoman-oe/tmp/sysroots/x86_64-linux/usr/include/pyth=
on2.6/Python.h:58,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from io/mudext/hpmudext.c:27:
>> /home/steve/source/sakoman-oe/tmp/sysroots/x86_64-linux/usr/include/pyth=
on2.6/pyport.h:685:2:
>> error: #error "LONG_BIT definition appears wrong for platform (bad
>> gcc/glibc config?)."
>>
>> I seem to recall seeing this error in the distant past.
>>
>> Is this a known issue with python on 64 bit machines?
>>
>> Any advice?
>>
>
> see this https://bugzilla.redhat.com/show_bug.cgi?id=3D139911

Is this something that we should try to fix in the OE python build?

Steve


