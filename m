Received: from [74.125.92.150] (helo=qw-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1MgQg3-0008Ia-Rh
	for openembedded-devel@lists.openembedded.org;
	Thu, 27 Aug 2009 00:09:16 +0200
Received: by qw-out-1920.google.com with SMTP id 4so74162qwk.36
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Aug 2009 14:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=kapMgU/pe3eeCczu55615BV4FaHwCYl9ikp0glqJ2Js=;
	b=DqeaGlCnQb24MFzWirVMyPnC2mEse+I8zk4SKAhaBine/9lbbaB+pvMNDHLEFC3otV
	ePB85EGcNKU8H5KKMTOB3dhAMTjL9PiZWNFQlN74oHDAgbRY8P9gcRS5c8T3DbWTSrg+
	uiFWDvjN3WN5TzJ/npjpWe6qZNs2mQzibapdI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=LhGUTjq0ULK1vT2pYUF7ImZtQQ1DvXhi3EOobjAIrNUW8H5pYUivK/SZ5zBZGzUc8p
	E5jitWc/X6sLaIQvL0Z0zapm7t9otVFr9w3ijfvV0QImjZl8o608Y7B549FIkQU/XI3W
	RRB5DbKrqvW8kDSwWc+/BDfYXfDr/JqBgCo8c=
MIME-Version: 1.0
Received: by 10.229.28.8 with SMTP id k8mr2533360qcc.78.1251323472229; Wed, 26 
	Aug 2009 14:51:12 -0700 (PDT)
In-Reply-To: <20090826165220.GB31371@gmail.com>
References: <4A94E1CC.2090404@gmail.com> <20090826165220.GB31371@gmail.com>
Date: Thu, 27 Aug 2009 07:21:12 +0930
Message-ID: <6ec4247d0908261451r658d237bkcb0b374a0eed62e9@mail.gmail.com>
From: Graham Gower <graham.gower@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] enca_1.9.bb: remove unused configure test which is bound to fail.
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
X-List-Received-Date: Wed, 26 Aug 2009 22:09:29 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2009/8/27 Khem Raj <raj.khem@gmail.com>:
>> +do_configure_prepend() {
>> + =A0 =A0 # remove failing test which checks for something that isn't ev=
en used
>> + =A0 =A0 sed -i -e '/ye_FUNC_SCANF_MODIF_SIZE_T/d' configure.ac
>> +}
>
> you may not require this hunk. see below
>

>> -# enca
>> -yeti_cv_func_scanf_modif_size_t=3Dyes
>> -
>
> set this to 'no'
>

>> -# enca
>> -yeti_cv_func_scanf_modif_size_t=3Dyes
>> -
>
> same here.


The two site files that specify yeti_cv_func_scanf_modif_size_t=3Dyes
probably make things work on those two systems. But every other system
will fail to configure. Hence, a fix which is independent of the
architecture. And with that fix, I figured the arch dependent fixes
should be removed.

-Graham


