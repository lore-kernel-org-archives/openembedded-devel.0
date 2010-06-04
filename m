Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OKTTe-0005Lu-SV
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Jun 2010 11:46:12 +0200
Received: by fxm9 with SMTP id 9so668559fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Jun 2010 02:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=qNb2xLflOrRhi11rQOIpBdry/T+M+SOuDD+4RdtA4R8=;
	b=mfhbTump2KzhUytgLfDHhejsWOFCC224rNX1kYrAw+SAqpdCCRjeoN0CxxdUTtSfu0
	T1J/fKpVoovsHL8lOGVrfLs1J6ct5RZrEHhROBk9nhR9luu8rMxWrR5AcJfyDxP4xWQn
	xW1eNC+9+uwWVJ/q8x4H3odN+rYl/m4rnmiX0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=USX02bzzlZTjGjb4IImFrcNac8HtTYMfHnP7MSv7NK5qN7Ta1mZ1NBdsYQ1HecBX8Y
	+SVTi36AFxRSOvDBoifsmsYbgw7RJ9wrvYtS2C8ZL0bdTB/Ka+BfiZtuuD7A3vRTl3Pv
	kSyHTK/Y+uRvvGVa00LIE1T6t4JT2Od9MFl+E=
MIME-Version: 1.0
Received: by 10.223.19.87 with SMTP id z23mr11547190faa.7.1275644514359; Fri, 
	04 Jun 2010 02:41:54 -0700 (PDT)
Received: by 10.223.106.138 with HTTP; Fri, 4 Jun 2010 02:41:54 -0700 (PDT)
In-Reply-To: <AANLkTimuc2dtfmbduEhLKLAxcjg_tR2Yah1jZxYBZp7y@mail.gmail.com>
References: <1275510896-30845-1-git-send-email-raj.khem@gmail.com>
	<1275510896-30845-4-git-send-email-raj.khem@gmail.com>
	<AANLkTimuc2dtfmbduEhLKLAxcjg_tR2Yah1jZxYBZp7y@mail.gmail.com>
Date: Fri, 4 Jun 2010 11:41:54 +0200
Message-ID: <AANLkTinv1zLuDcj3cFbLOGZC_hKorUmM3Tg04nk7Y6OW@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 03/16] gettext-0.18: Add recipe for 0.18
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
X-List-Received-Date: Fri, 04 Jun 2010 09:46:12 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 4, 2010 at 9:37 AM, Martin Jansa <martin.jansa@gmail.com> wrote=
:
> On Wed, Jun 2, 2010 at 10:34 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> * gl_cv_func_unsetenv_works is not computed correctly in cross
>> =A0environment so cache it.
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>
> Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

I've forgotten to add that it needs automake-1.11 and
angstrom-2008-preferred-versions.inc is locking older version
PREFERRED_VERSION_automake-native =3D "1.10.3" - maybe not need anymore?

Regards,


