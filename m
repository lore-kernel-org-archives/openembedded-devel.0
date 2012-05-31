Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1Sa7Ee-0001cQ-Ic
	for openembedded-devel@lists.openembedded.org;
	Thu, 31 May 2012 17:24:24 +0200
Received: by lbol5 with SMTP id l5so947879lbo.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 May 2012 08:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=tVY+0wdtZoSB1yp7kYEL3LHNliOKhIjk47OaM3YEQPc=;
	b=eNjnHI0xuTkGoS1j38t6z1ecmaTXG8oESAGzGTEacx9MebNHbv52BIQwXgR5R6J7XO
	+AboSvUo7rQM0d/PoDPC/dETgouxxJ93LfCYUqPRdWq4LSDQy2H2eiekZUgk9sz1HBCS
	pXFYyDbNNfUys2t6eoZGcHBdQiv/fV1ewpfZ2sWDfY4m6f6S2fIfztjHNU3T8LLvbzv4
	wyA/hCL4I5puPcuXHjZYhnKov18VLHJmznRTg5qQ2+JhFy0TewtHh6KWY/Y+TjHTGbSe
	SOxFpVRwmh1XACHoKtZyh5IAwDvECXB6sVKS5bc5wgpMpskNVvBDANYT5WHrMfZWCt4K
	Gz7A==
MIME-Version: 1.0
Received: by 10.152.146.163 with SMTP id td3mr20769408lab.26.1338477244657;
	Thu, 31 May 2012 08:14:04 -0700 (PDT)
Received: by 10.112.38.202 with HTTP; Thu, 31 May 2012 08:14:04 -0700 (PDT)
In-Reply-To: <CAMKF1sqU_-3uKLWZZPRxbajYoZNgvbViueYUxUAU4D9zC6USig@mail.gmail.com>
References: <1338010968-11334-1-git-send-email-raj.khem@gmail.com>
	<CA+M6bXncod0LwDyADvmv_cffDOLna5jCkUkUoe_+9JZkwFkEgQ@mail.gmail.com>
	<CAMKF1sqU_-3uKLWZZPRxbajYoZNgvbViueYUxUAU4D9zC6USig@mail.gmail.com>
Date: Thu, 31 May 2012 08:14:04 -0700
Message-ID: <CA+M6bXm9besnHCs7HN-HnHUd9-fvVZ+FWG+-xcYQBtdOQyrPjw@mail.gmail.com>
From: Tom Rini <tom.rini@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [2011.03-maintenance][PATCH] classes/mirrors.bbclass: update debian snapshot mirror url
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
X-List-Received-Date: Thu, 31 May 2012 15:24:24 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, May 31, 2012 at 6:54 AM, Khem Raj <raj.khem@gmail.com> wrote:
> On Thu, May 31, 2012 at 6:50 AM, Tom Rini <tom.rini@gmail.com> wrote:
>> On Fri, May 25, 2012 at 10:42 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>> ---
>>> =A0classes/mirrors.bbclass | =A0 =A02 +-
>>> =A01 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/classes/mirrors.bbclass b/classes/mirrors.bbclass
>>> index 71ee5f6..bb4f1ec 100644
>>> --- a/classes/mirrors.bbclass
>>> +++ b/classes/mirrors.bbclass
>>> @@ -1,6 +1,6 @@
>>> =A0MIRRORS[func] =3D "0"
>>> =A0MIRRORS () {
>>> -${DEBIAN_MIRROR}/main =A0http://snapshot.debian.net/archive/pool
>>> +${DEBIAN_MIRROR}/main =A0 http://snapshot.debian.org/archive/debian-ar=
chive/20120328T092752Z/debian/pool
>>> =A0${DEBIAN_MIRROR} =A0 =A0 =A0 ftp://ftp.de.debian.org/debian/pool
>>> =A0${DEBIAN_MIRROR} =A0 =A0 =A0 ftp://ftp.au.debian.org/debian/pool
>>> =A0${DEBIAN_MIRROR} =A0 =A0 =A0 ftp://ftp.cl.debian.org/debian/pool
>>
>> Sorry I missed this for a while. =A0This I believe is backwards. =A0We
>> don't want to tie the default mirror to today we want to tie it back
>> to the 20110331 or so snapshot we use in a few other cases.
>
> actually we should use all the three archive mirrors
> =A0 =A02009: 08
> =A0 =A02011: 01
> =A0 =A02012: 03

Yes, that sounds like a good idea.  Waiting for v2 :)

--=20
Tom


