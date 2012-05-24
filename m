Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gizero@gmail.com>) id 1SXZNW-00064c-HY
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 May 2012 16:51:02 +0200
Received: by obhx4 with SMTP id x4so14155273obh.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 May 2012 07:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=LbZvmQNmWF0ybU0nZmC0lDsKEeYVY9FlX/KY87XGFr8=;
	b=kTqlMbY0FG/QpaYgfeKE3D/U5b7sX8RHHxecvNc8GkFHyoOWrZn4XRCMKBnaIqyM9X
	AFQases9BN2CeAfuLaG0r59wlSz/+BpwF3QKUbCpx5s871D+YZ3OXYEUjcZvqTFnMZkJ
	TvrdjNJFQRoVo5i/dZZL+0XeSWxDGMIb097ilfqKiH85H7avhsrSd0j8m6mQFgeVKIHE
	0GbrvzlcQ3GpGO4pixIwvHTlDL2M3+wBZka3jgors+T1zTL8FGT8E5KfvkbBV3xMQQyo
	mmU2z65F2NLwv4roLi5kT6V8BFXMkgT+x5DbMSUoaz9C3dLtzxrkvvQcPN7pMLSfHssN
	SgUw==
MIME-Version: 1.0
Received: by 10.182.8.99 with SMTP id q3mr30490056oba.63.1337870450867; Thu,
	24 May 2012 07:40:50 -0700 (PDT)
Received: by 10.182.75.166 with HTTP; Thu, 24 May 2012 07:40:49 -0700 (PDT)
In-Reply-To: <jpl2nd$o5t$1@dough.gmane.org>
References: <1337108462-14996-1-git-send-email-gizero@gmail.com>
	<CAC+thW2CJEGYJxPK63F_w7u+iZE+yv0Gda_XYwc6iB4TAOsy9w@mail.gmail.com>
	<jpl2nd$o5t$1@dough.gmane.org>
Date: Thu, 24 May 2012 16:40:49 +0200
Message-ID: <CAC+thW356pE-eAR-vWboy8=yRoPNKVijH-KyWZECZvkxDUaaGw@mail.gmail.com>
From: Andrea Galbusera <gizero@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH v3] libmodbus: ported recipe from classic and updated
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
X-List-Received-Date: Thu, 24 May 2012 14:51:02 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Koen,

On Thu, May 24, 2012 at 12:32 PM, Koen Kooi <koen@dominion.thruhere.net> wr=
ote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Op 24-05-12 07:52, Andrea Galbusera schreef:
>> Hello,
>>
>> On Tue, May 15, 2012 at 9:01 PM, Andrea Galbusera <gizero@gmail.com>
>> wrote:
>>> * based on recipe by Radoslav Kolev which was in classic * updated to
>>> latest released version 3.0.2
>>>
>>> v2: * drop git version of recipe * drop no longer used PRIORITY
>>>
>>> v3: * drop PR =3D "r0"
>>>
>>> Signed-off-by: Andrea Galbusera <gizero@gmail.com> ---
>>> .../recipes-extended/libmodbus/libmodbus_3.0.2.bb =A0| =A0 16
>>> ++++++++++++++++ 1 files changed, 16 insertions(+), 0 deletions(-)
>>> create mode 100644
>>> meta-oe/recipes-extended/libmodbus/libmodbus_3.0.2.bb
>>>
>>> diff --git a/meta-oe/recipes-extended/libmodbus/libmodbus_3.0.2.bb
>>> b/meta-oe/recipes-extended/libmodbus/libmodbus_3.0.2.bb new file mode
>>> 100644 index 0000000..03b7fcc --- /dev/null +++
>>> b/meta-oe/recipes-extended/libmodbus/libmodbus_3.0.2.bb @@ -0,0 +1,16
>>> @@ +SUMMARY =3D "A Modbus library" +DESCRIPTION =3D "libmodbus is a C
>>> library designed to provide a fast and robust \ +implementation of the
>>> Modbus protocol. It runs on Linux, Mac OS X, FreeBSD, \ +QNX and
>>> Windows." +HOMEPAGE =3D "http://www.libmodbus.org/" +SECTION =3D "libs"=
 +
>>> +LICENSE =3D "LGPLv2.1+" +LIC_FILES_CHKSUM =3D
>>> "file://COPYING.LESSER;md5=3D4fbd65380cdd255951079008b364516c" + +SRC_U=
RI
>>> =3D
>>> "http://github.com/downloads/stephane/libmodbus/libmodbus-${PV}.tar.gz"
>>>
>>>
> +
>>> +inherit autotools pkgconfig + +SRC_URI[md5sum] =3D
>>> "1aaacce9d9779d3a84f7d1a75774c943" +SRC_URI[sha256sum] =3D
>>> "927ec90e0e299a7d4ec7086b1e2590566bdfc3bbc22e12204229361c029f2615" --
>>> 1.7.5.4
>>>
>>
>> Does v3 of the patch look acceptable
>
> Yes, it went in 8 days ago:
> http://cgit.openembedded.org/meta-openembedded/commit/?id=3D984fa94e2b75d=
1665077953fa3c9c6e74e8fc328
> :)

Thank you. I didn't notice the commit! ;-)


