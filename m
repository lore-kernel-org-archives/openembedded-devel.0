Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1P3CP4-0000Mu-0e
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Oct 2010 20:38:20 +0200
Received: by iwn2 with SMTP id 2so8609548iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Oct 2010 11:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=8GM5S3Y0A8gGrq7nXIAY9t+obWrn2Cp3GIQs1cE8IOw=;
	b=n4Ul7FoRqKtntdVTTpigdIxGSWo8BgecaqS7ftxCBMhM5WZFqM9rRACJnG3TWneDJy
	goMaKQ7VZo5ZjhekJyg+R3LSyGae0bc9luVXM6OEeA08doRbr45BY/ZnMdLB1OUfOFyE
	GxUCGIREw41OSoqaZAMT/J7cnHaB1ZIOk/wMw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=esNeryZndTiednX8g8TFWPvM1CgTWONxlfGayE+gu4CGHA/QpehXeTkpCi1/Q/m+By
	pUU3seF1hXcW3VfqjQYN00qlnufCPvYSvKyMnh0YTaS9Rdgntl1QtSyB2wO80vDOFnAN
	LXkv++zzznNDkKiXZsm3ILA64euAGTt5rwwOo=
Received: by 10.231.155.7 with SMTP id q7mr12553781ibw.105.1286303877306; Tue,
	05 Oct 2010 11:37:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.199.1 with HTTP; Tue, 5 Oct 2010 11:37:37 -0700 (PDT)
In-Reply-To: <4CAAE0AC.4040701@freyther.de>
References: <1286264643-6352-1-git-send-email-raj.khem@gmail.com>
	<1286264643-6352-7-git-send-email-raj.khem@gmail.com>
	<4CAAE0AC.4040701@freyther.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 5 Oct 2010 11:37:37 -0700
Message-ID: <AANLkTinqhsCn1c0ZFz8s4pDjqcZLGAYA4VxCMgywOJFG@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 6/6] gnutls_2.10.1.bb: Update to libtools 2.4 macros.
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
X-List-Received-Date: Tue, 05 Oct 2010 18:38:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 5, 2010 at 1:24 AM, Holger Freyther <holger+oe@freyther.de> wro=
te:
> On 10/05/2010 03:44 PM, Khem Raj wrote:
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>> =C2=A0recipes/gnutls/gnutls-2.10.1/libtool-update.patch |10965 +++++++++=
++++++++++++
>> =C2=A0recipes/gnutls/gnutls_2.10.1.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A03 +-
>> =C2=A02 files changed, 10967 insertions(+), 1 deletions(-)
>> =C2=A0create mode 100644 recipes/gnutls/gnutls-2.10.1/libtool-update.pat=
ch
>
>
> normally we tend to just remove the copy of libtool... autoreconf --insta=
ll
> will just install the new version back. Why is that not possible here?

certainly possible, I will give it a try. upgrading the m4 files is
more upstream like
thats why I do it that way.

>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


