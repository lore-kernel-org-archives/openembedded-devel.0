Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Sa5zy-0004FX-2x
	for openembedded-devel@lists.openembedded.org;
	Thu, 31 May 2012 16:05:10 +0200
Received: by eekd49 with SMTP id d49so372381eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 May 2012 06:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=1CDTbHEdSR8nJVzlFGCuNknHHZx7+i/57gSG21I0tfU=;
	b=aA26usP7NNvG2H2jBuG+NmFvvAJRw7IvYkVGjalF3bei/70fx5YLTBi0/9Jps86v4O
	jo3pyBlFlImaLjOgnxquUfniMQ632FOAIEq7cJT2ebvYFzkXA2jOhAybB6kjiaXieasi
	1nZECEawte6/8y+h4OTuipr4ghPJjHVbNlpI0oGPoQOgEBfi8sa99YbUyJ9F5WBH83wt
	rg/4wx5GlRMTyZ2XmVUd6Z3Dlhj9ESF7/hWvjGRTmFWPYFoxX/2UaV0wL7fcRLHZb2Gl
	VYTLZRwFE1dDwqFx6UhuXVC81/xM87a8mPBsRJ0mZvbDotGpP//oEKGQsKQhT6ELt/Ls
	wldg==
Received: by 10.14.39.70 with SMTP id c46mr9135208eeb.118.1338472490418; Thu,
	31 May 2012 06:54:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.188.11 with HTTP; Thu, 31 May 2012 06:54:20 -0700 (PDT)
In-Reply-To: <CA+M6bXncod0LwDyADvmv_cffDOLna5jCkUkUoe_+9JZkwFkEgQ@mail.gmail.com>
References: <1338010968-11334-1-git-send-email-raj.khem@gmail.com>
	<CA+M6bXncod0LwDyADvmv_cffDOLna5jCkUkUoe_+9JZkwFkEgQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 31 May 2012 06:54:20 -0700
Message-ID: <CAMKF1sqU_-3uKLWZZPRxbajYoZNgvbViueYUxUAU4D9zC6USig@mail.gmail.com>
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
X-List-Received-Date: Thu, 31 May 2012 14:05:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, May 31, 2012 at 6:50 AM, Tom Rini <tom.rini@gmail.com> wrote:
> On Fri, May 25, 2012 at 10:42 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>> =C2=A0classes/mirrors.bbclass | =C2=A0 =C2=A02 +-
>> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/classes/mirrors.bbclass b/classes/mirrors.bbclass
>> index 71ee5f6..bb4f1ec 100644
>> --- a/classes/mirrors.bbclass
>> +++ b/classes/mirrors.bbclass
>> @@ -1,6 +1,6 @@
>> =C2=A0MIRRORS[func] =3D "0"
>> =C2=A0MIRRORS () {
>> -${DEBIAN_MIRROR}/main =C2=A0http://snapshot.debian.net/archive/pool
>> +${DEBIAN_MIRROR}/main =C2=A0 http://snapshot.debian.org/archive/debian-=
archive/20120328T092752Z/debian/pool
>> =C2=A0${DEBIAN_MIRROR} =C2=A0 =C2=A0 =C2=A0 ftp://ftp.de.debian.org/debi=
an/pool
>> =C2=A0${DEBIAN_MIRROR} =C2=A0 =C2=A0 =C2=A0 ftp://ftp.au.debian.org/debi=
an/pool
>> =C2=A0${DEBIAN_MIRROR} =C2=A0 =C2=A0 =C2=A0 ftp://ftp.cl.debian.org/debi=
an/pool
>
> Sorry I missed this for a while. =C2=A0This I believe is backwards. =C2=
=A0We
> don't want to tie the default mirror to today we want to tie it back
> to the 20110331 or so snapshot we use in a few other cases.

actually we should use all the three archive mirrors
    2009: 08
    2011: 01
    2012: 03


