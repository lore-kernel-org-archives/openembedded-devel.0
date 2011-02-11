Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PnslC-0007qP-5G
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Feb 2011 14:10:09 +0100
Received: by iyj8 with SMTP id 8so2368720iyj.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Feb 2011 05:08:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=nMOBt8poz2Pm3RD8TQYCb3LnKPFV8sWqAfxmtZOj18o=;
	b=lwP5pEIIKezmlrmINm3ASLvcczQcn+ZUP1XUdxA/urrwsssoSRabhp/lz3174Hvt92
	tjTaO+0WvgwBDuqgdAMd7ZiBV0xtVqR9Gr0CVp9x/GQ3wvwArgerT5lm4dBVeO1ZWipe
	aAi8+ubA/kZYyU4Mh6ZBupgI4Qf+6wK4kW97c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=E8DKi06+4m4fWM7DjMHlTRHXF/+b2RytuehpCCYMnizkoUHHe3jfFe/QujZt1wEjyh
	sKOMU9DheWNyJePlOrWmfQbrpNelCesKilauJ6QqfVlStAIMt2QA1UDtdLy7z1pzqjw9
	iycrK5jaH2HJD28QHZ4s+qjNDk4uJSghu6N2A=
MIME-Version: 1.0
Received: by 10.231.10.197 with SMTP id q5mr330345ibq.197.1297429735737; Fri,
	11 Feb 2011 05:08:55 -0800 (PST)
Received: by 10.231.30.73 with HTTP; Fri, 11 Feb 2011 05:08:55 -0800 (PST)
In-Reply-To: <1297428287.3785.24.camel@mattotaupa>
References: <1297424493-25116-1-git-send-email-sledz@dresearch.de>
	<1297428287.3785.24.camel@mattotaupa>
Date: Fri, 11 Feb 2011 14:08:55 +0100
Message-ID: <AANLkTin__Y7xEFGMyb2G2ODW06b-n_ODP2H27RvqvRKM@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] testscript.sh: be able to use branches other that testing-next
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
X-List-Received-Date: Fri, 11 Feb 2011 13:10:12 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2011/2/11 Paul Menzel <paulepanter@users.sourceforge.net>:
> Am Freitag, den 11.02.2011, 12:41 +0100 schrieb Steffen Sledz:
>
> There is a typo in the commit summary: `s/that/than/`.
>
>> Signed-off-by: Steffen Sledz <sledz@dresearch.de>

Steffen, thanks for updating the script. Saved me some time having to
make those changed.

Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
>> ---
>> =A0contrib/testing/testscript.sh | =A0 22 ++++++++++++++--------
>> =A01 files changed, 14 insertions(+), 8 deletions(-)
>>
>> diff --git a/contrib/testing/testscript.sh b/contrib/testing/testscript.=
sh
>> index 7ae2bd5..23c244b 100755
>> --- a/contrib/testing/testscript.sh
>> +++ b/contrib/testing/testscript.sh
>> @@ -1,21 +1,27 @@
>> =A0# this script can be used for testing purposes.
>> =A0# see also http://wiki.openembedded.net/index.php/TestingScript
>>
>> -# you can define your machine/distro/recipe below (remove the #)
>> -# or you can pick them up from the environment
>> -#MACHINE=3D"beagleboard"
>> -#DISTRO=3D"minimal"
>> -#TARGET_RECIPE=3D"console-image"
>> +# you can set your machine/distro/recipe/branch in the environment
>> +# or use these defaults
>> +[ -n "${MACHINE}" ] || MACHINE=3D"beagleboard"
>> +[ -n "${DISTRO}" ] || DISTRO=3D"minimal"
>> +[ -n "${TARGET_RECIPE}" ] || TARGET_RECIPE=3D"console-image"
>> +[ -n "${TESTING_BRANCH}" ] || TESTING_BRANCH=3D"testing-next"
>>
>> =A0# test if we have an openembedded dir, clone it if it does not exist
>> =A0if [ ! -d openembedded ]
>> =A0then
>> =A0 =A0 =A0(git clone git://git.openembedded.org/openembedded)
>> - =A0 =A0(cd openembedded; git checkout -b testing-next origin/testing-n=
ext)
>> +else
>> + =A0 =A0# fetch latest objects and refs
>> + =A0 =A0(cd openembedded; git fetch)
>
> I always use `git remote update` but it looks like there is no
> difference [1][2]. Although I could not find in `git help fetch` what
> remote is used by default by `git fetch` if none is provided.
>
>> =A0fi
>>
>> +# create local testing branch if it does not exist yet
>> +(cd openembedded; git branch --set-upstream ${TESTING_BRANCH} origin/${=
TESTING_BRANCH})
>> +
>> =A0# switch to the testing branch
>> -(cd openembedded; git checkout testing-next)
>> +(cd openembedded; git checkout ${TESTING_BRANCH})
>>
>> =A0# test if bitbake exist; if not; fetch it and untar it
>> =A0if [ ! -d bitbake-1.10.2 ]
>> @@ -80,7 +86,7 @@ export BBPATH=3D${TOPDIR}/openembedded
>> =A0rm -rf ${TOPDIR}/tmp
>>
>> =A0# add an echo about the vars so we can see what has been done in a lo=
g file
>> -echo $MACHINE $DISTRO $TARGET_RECIPE
>> +echo ${MACHINE} ${DISTRO} ${TARGET_RECIPE} ${TESTING_BRANCH} `(cd opene=
mbedded;git --no-pager log --max-count=3D1 --pretty=3Dformat:%H)`
>>
>> =A0# and do the actual work.
>> =A0bitbake ${TARGET_RECIPE}
>
> Acked-by: Paul Menzel <paulepanter@users.sourceforge.net>
>
>
> Thanks,
>
> Paul
>
>
> [1] http://www.kernel.org/pub/software/scm/git-core/docs/gitworkflows.htm=
l
> [2] http://stackoverflow.com/questions/2688251/what-is-the-difference-bet=
ween-git-fetch-origin-and-git-remote-update-origin
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>


