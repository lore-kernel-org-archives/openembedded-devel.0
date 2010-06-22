Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OR4aP-0002ra-UQ
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Jun 2010 16:36:27 +0200
Received: by gyg10 with SMTP id 10so3153553gyg.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Jun 2010 07:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=Eueyw5I1XyNjNBWFx1zWTgiqg52YwKtQlk6+9ff7Ieo=;
	b=Dmzmj0Zw4ofV9zmiZ5ZAsZ+TpN07lEKXvNsaYgaw9T4CAso8AiAGLhA0Ua9gIVss2A
	PpP/dG2KbOHtvWjT3n+O/X2Qh7oh84xvnl8wj5MbD7hyuovbXdLTJn8m1mfqE5PyMUs5
	Vbrwg0kqGxEMrdpqwTiX7QU3jgiaiJTE7CYNs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=qqCHsc0QZ/ct1ZJg/fbtKB7mJg/4B/scOApPmy+6jPZIxnPHfeWWj8zfp56peC5+Es
	U5u1kgGffUmjmEe6Qw2JJ0KURldcMWXe6rambtxXFilh3EHglkJYoFKn19Cej1mJfznA
	VysPXZzgKVUmPgF2EuvDMY04dh28Hy2ScsbyI=
Received: by 10.229.99.85 with SMTP id t21mr3386439qcn.260.1277217109817; Tue, 
	22 Jun 2010 07:31:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.17.133 with HTTP; Tue, 22 Jun 2010 07:31:29 -0700 (PDT)
In-Reply-To: <AANLkTik6QLxTLQgYZaLpucQaU8etYax-invJna3D5kp_@mail.gmail.com>
References: <1276814379-13161-1-git-send-email-raj.khem@gmail.com> 
	<1276814379-13161-2-git-send-email-raj.khem@gmail.com>
	<AANLkTik6QLxTLQgYZaLpucQaU8etYax-invJna3D5kp_@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 22 Jun 2010 07:31:29 -0700
Message-ID: <AANLkTimOU6R6QDgQ2F2WtFRcYZy30T68TmhglN3OxIKZ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 2/3] busybox_1.15.3.bb: Work around the gcc 4.5 ICE on thumb
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
X-List-Received-Date: Tue, 22 Jun 2010 14:36:27 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Jun 21, 2010 at 10:59 PM, Leon Woestenberg
<leon.woestenberg@gmail.com> wrote:
> Hello Khem,
>
> On Fri, Jun 18, 2010 at 12:39 AM, Khem Raj <raj.khem@gmail.com> wrote:
>> +# gcc 4.5 has this bug on thumb
>> +# http://gcc.gnu.org/bugzilla/show_bug.cgi?id=44557
>> +# so add -fomit-frame-pointer
>> +# this will be removed once the above bug is fixed.
>> +
>> +
>> +CFLAGS_append = " -fomit-frame-pointer"
>> +
> Can we make this append conditional for ARM-only or even thumb-only?

Yes it should be better to restrict it to arm only I will do that.
I dont think we have instruction set (e.g. thumb) in standard overrides
may be it will help if we added such an override.

>
> In all cases:
>
> Acked-by: Leon Woestenberg <leon@sidebranch.com>
>
> Regards,
> --
> Leon
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


