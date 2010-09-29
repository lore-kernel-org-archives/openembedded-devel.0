Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1P0yQB-0007tF-Oa
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Sep 2010 17:18:17 +0200
Received: by gyg8 with SMTP id 8so328878gyg.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Sep 2010 08:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=836PQ4mdli3N86BBYjizqQyilV+8lmEkZE8BrHURHes=;
	b=soocsRBlqfCLRkSnPdZstSAKidLI8nlunuW+9aeOuo42Jy7IawyHqBEH9Mj6hNWRDf
	Y9HEF7AcYMsSaI8NX33T3A+8hx+2AnQK2mkpuR00J1u9Wx/scJqK9hEh8IOcNEkitwJq
	RaycVEyWTcqmBc02FyBz4kvFo+ii/43TyE90Y=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=w0O1nOXWxifFWlkDR+E3qtYY13FIEtgZO4yfGxsI7Rm6zq3jIHcSQHCVeHkU3CFqmT
	kuCm0oxHj8pcO1/bXSUQTCo25BD0oFAKaDc5MUV0YCfGtDH+3OhdmTgsrFOQdl9SGFdL
	/oMUJMGsuPhAVuiI+x29P11fAi0tmOWpIylBc=
MIME-Version: 1.0
Received: by 10.229.10.217 with SMTP id q25mr1228926qcq.274.1285773482171;
	Wed, 29 Sep 2010 08:18:02 -0700 (PDT)
Received: by 10.229.36.65 with HTTP; Wed, 29 Sep 2010 08:18:02 -0700 (PDT)
In-Reply-To: <AANLkTi=v6tbd+iS3cf5xM+Cm0fjtsENLaXpmd8iUC0xz@mail.gmail.com>
References: <AANLkTikjs7DrdBxNpo0GpGy-FkbG3MEQe=+aT8if_a_C@mail.gmail.com>
	<AANLkTimxud8X-EdsRC1FrJg8Xpya7S_BM5vKSs3K7Vi5@mail.gmail.com>
	<AANLkTikDLYVEa=X5eHj7kB+9O3Hu=a_Our7iAimyW0-c@mail.gmail.com>
	<AANLkTimeg=+6VEvgd8k1sJk0KQ6Y+po6qcCZSW8C3A3f@mail.gmail.com>
	<AANLkTi=v6tbd+iS3cf5xM+Cm0fjtsENLaXpmd8iUC0xz@mail.gmail.com>
Date: Wed, 29 Sep 2010 17:18:02 +0200
Message-ID: <AANLkTi=KwKi6DnAcAd45Ma-_T7Kft_QyZNyaKSYHsX_e@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: generate a named kernel in ${DEPLOY_DIR_IMAGE}
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
X-List-Received-Date: Wed, 29 Sep 2010 15:18:17 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 29, 2010 at 3:10 PM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> 2010/9/29 Andrea Adami <andrea.adami@gmail.com>:
>> On Wed, Sep 29, 2010 at 8:54 AM, Frans Meulenbroeks
>> <fransmeulenbroeks@gmail.com> wrote:
>>> 2010/9/29 Andrea Adami <andrea.adami@gmail.com>:
>
>>> I would have expected you had to add something like:
>>> FILESPATHPKG_append =3D ":linux-${PV}"
>>> I had to add this to get access to the linux patches.
>>
>> No need to extend FILESPATHPKG being we keep the patches in the
>> kernel-specific dirs: e.g. /linux-2.6.34 and /linux-kexecboot-2.6.34
>
> Ah ok, I understand. As I am building different versions of the
> standard kernel, I am using those patches
> I assumed kexecboot also used the same patches as the kernel does.
> I expected these would apply to the kexecboot kernel with the same name.
>
Sure, the patches are the same and FILESPATHPKG could avoid patch
duplication: only defconfig differ.
At first I moved the kernels here, as second step I'll lead the
obsoleted to rest, finally I'll take care of this duplicated patches.

> The question was whether it would be better to explicitly say
> =A0S =3D "${WORKDIR}/linux-${PV}"
> in linux_${PN}.bb
> then S is always automatically ok for everyone who includes it.
>
> not a big change and not very important either.
>
> Frans

Well, or having it once in linux.inc. Recipes can override after
'require linux.inc' if needed.
Feel free to propose a patch, thx.

Regards

Andrea

>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


