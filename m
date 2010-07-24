Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OcV13-00025g-E4
	for openembedded-devel@lists.openembedded.org;
	Sat, 24 Jul 2010 05:03:13 +0200
Received: by iwn34 with SMTP id 34so860964iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Jul 2010 20:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=MDjTAnr5pwbGLq8qJsKRW67V9szUpUu8ytFJTwABKHM=;
	b=m/G1sCQr3UNSuifutb0kzA9oo44HEthhTPKXSr2dO/qOnKblZy5HI+lRlQ4rQuaIne
	hpuLRzhtlP8gSwwqHNdi674iwh64rOXswgRA9+vR1b6ZDiLPBZE9A8G26LnlMrLy6UCS
	kgVmI8brnSE8Kg3AXStNJxfMS7I6nBeteJwPI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=ATyNdfCfwDhYe+b4sCCnqdRoEksXwzmGenbuMGvhVk5PuoUq+5KZFXJ5Y9WQmpuMwb
	TB1ILS1sEJgDbRH00O4iV2GGsiMMLkZ0zLE3VBu0weAOYdcpYcTCR04kmTqrdcCfDJsC
	GlbMbWJTb5GBYUuGzJF/X+pQmI3/HY7IAJ37E=
Received: by 10.231.10.137 with SMTP id p9mr4662367ibp.91.1279940576137; Fri, 
	23 Jul 2010 20:02:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.186.88 with HTTP; Fri, 23 Jul 2010 20:02:36 -0700 (PDT)
In-Reply-To: <20100723114746.GA19734@mx.loc>
References: <1279316946-8901-1-git-send-email-rep.dot.nop@gmail.com> 
	<1279317776.7632.15.camel@mattotaupa> <20100723114746.GA19734@mx.loc>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 23 Jul 2010 20:02:36 -0700
Message-ID: <AANLkTinSO44VVBAU7WhhmXe3SyVS52fR6_-U-qrcHCXC@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH][CFT 1/3] libmpc: bump version and cleanup staging
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
X-List-Received-Date: Sat, 24 Jul 2010 03:03:13 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 23, 2010 at 4:47 AM, Bernhard Reutner-Fischer
<rep.dot.nop@gmail.com> wrote:
> On Sat, Jul 17, 2010 at 12:02:56AM +0200, Paul Menzel wrote:
>>Dear Bernhard,
>
>>> --- a/recipes/libmpc/libmpc_0.8.1.bb
>>> +++ b/recipes/libmpc/libmpc_0.8.1.bb
>>> @@ -1,13 +1,12 @@
>>> =A0require libmpc.inc
>>>
>>> =A0DEPENDS =3D "gmp mpfr"
>>> -
>>> -SRC_URI =3D "http://www.multiprecision.org/mpc/download/mpc-${PV}.tar.=
gz"
>>> =A0S =3D "${WORKDIR}/mpc-${PV}"
>>> +NATIVE_INSTALL_WORKS =3D "1"
>>> +BBCLASSEXTEND =3D "native"
>>> +PR =3D "1"
>>>
>>> -do_stage() {
>>> - =A0 =A0autotools_stage_all
>>> -}
>>> +SRC_URI =3D "http://www.multiprecision.org/mpc/download/mpc-${PV}.tar.=
gz"
>>
>>Maybe you can put `SRC_URI` also in `libmpc.inc`?
>
> mpc seems to be only available as .tar.gz (you even get a .tar.gz if you
> ask their server for a .tar.xz ATM, apache anti-typo module,
> apparently), so yes, i'll do that as a follow-up once these 3 are in,
> ok?
>
>>Otherwise it looks fine.
>>
>>Acked-by: Paul Menzel <paulepanter@users.sourceforge.net>
>
> ping these three (mpc, mpfr, gmp)
>
> Please, somebody with write privs for oe, install.
> TIA,
>

I have them staged dont worry once the heavy changes are settled it will be=
 in.


> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


