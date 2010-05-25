Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OGlla-0007Jn-Dg
	for openembedded-devel@lists.openembedded.org;
	Tue, 25 May 2010 06:29:23 +0200
Received: by iwn2 with SMTP id 2so3865199iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 May 2010 21:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=zSrQVFUfpS8o4wIsiwLrLJMSy7A/nmz5TQmk47FOheQ=;
	b=EiqmkZp1o3D9sYq5qYynUGjIHfiIBHkNMvWPssFbRP+9H0DGPD8bdnh/qNVmEFGqwf
	cmB7gSeON+q71G8VfIh7ONLgFtFPkvcCcVNXcfGLxAoi2VOpiDlSAs4TMTrq+Kj7CmMa
	wNm4iQcJrmakIyEYnRBNGm21U6CkoQ/je2qOg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=Ma8g4YwPRtRvOGTzeFC+r9zaTi+75H1biaNMkj5+0eOyznHoobA2AXdoW4K4cEpDDj
	FiEehuH47DVCZj2GgaM76+1xwwjUmkBp4nSCaE9+NsmoAOb7Iw3Fddbc5HLkzZiqwa06
	RZWd0Khp7HPFjqdzWMnrPRBeQbZ9X6J/a3aIk=
MIME-Version: 1.0
Received: by 10.231.170.1 with SMTP id b1mr5736069ibz.13.1274761517061; Mon, 
	24 May 2010 21:25:17 -0700 (PDT)
Received: by 10.231.30.67 with HTTP; Mon, 24 May 2010 21:25:16 -0700 (PDT)
In-Reply-To: <20100524234235.GN25484@denix.org>
References: <1274618279-24726-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
	<20100524234235.GN25484@denix.org>
Date: Mon, 24 May 2010 21:25:16 -0700
Message-ID: <AANLkTimAy0OrwqpBYg7zXdj8PjwU_AgVas5kSJqmQah0@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: Re: [PATCH] packaged-staging.bbclass: added missing space in find call
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
X-List-Received-Date: Tue, 25 May 2010 04:29:23 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, May 24, 2010 at 4:42 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> On Sun, May 23, 2010 at 02:37:59PM +0200, Enrico Scholz wrote:
>> Old find statement failed with something like
>>
>> =A0 $ find . \( -name XXX\)
>> =A0 find: invalid expression; I was expecting to find a ')' somewhere bu=
t did not see one.
>
> Ah, that's where I was getting it from! :) It then triggered the same/sim=
ilar
> issue with tar complaining about the modified archive...
>
>> Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
>
> Acked-by: Denys Dmytriyenko <denis@denix.org>

Acked-by: Khem Raj <raj.khem@gmail.com>

>
>
>> ---
>> =A0classes/packaged-staging.bbclass | =A0 =A02 +-
>> =A01 files changed, 1 insertions(+), 1 deletions(-)
>>
>> diff --git a/classes/packaged-staging.bbclass b/classes/packaged-staging=
.bbclass
>> index 62a78e4..83f3578 100644
>> --- a/classes/packaged-staging.bbclass
>> +++ b/classes/packaged-staging.bbclass
>> @@ -19,7 +19,7 @@ PSTAGE_PKGPN =A0 =A0 =A0=3D "${@bb.data.expand('stagin=
g-${PN}-${MULTIMACH_ARCH}${TARGET_
>> =A0PSTAGE_PKGNAME =A0 =A0=3D "${PSTAGE_PKGPN}_${PSTAGE_PKGVERSION}_${PST=
AGE_PKGARCH}.ipk"
>> =A0PSTAGE_PKG =A0 =A0 =A0 =A0=3D "${PSTAGE_DIR}/${PSTAGE_PKGPATH}/${PSTA=
GE_PKGNAME}"
>> =A0PSTAGE_WORKDIR =A0 =3D "${TMPDIR}/pstage"
>> -PSTAGE_SCAN_CMD ?=3D "find ${PSTAGE_TMPDIR_STAGE} \( -name "*.la" -o -n=
ame "*-config"\) -type f"
>> +PSTAGE_SCAN_CMD ?=3D "find ${PSTAGE_TMPDIR_STAGE} \( -name "*.la" -o -n=
ame "*-config" \) -type f"
>>
>> =A0PSTAGE_NATIVEDEPENDS =3D "\
>> =A0 =A0 =A0shasum-native \
>> --
>> 1.7.0.1
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


