Received: from mail-qy0-f182.google.com ([209.85.216.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sylvain.pare@gmail.com>) id 1Qf5uw-0004jj-Q0
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Jul 2011 09:56:07 +0200
Received: by qyk38 with SMTP id 38so1204217qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Jul 2011 00:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=8vssDbjxMxmCT9qBGXaosFQE1telEHPXwXy/wrkfo4U=;
	b=DYxNmLlKOKpTikVmFkLVfBAot5CdhjFnzyVEtp+Rq1xd+SQ3sHY3vT7i50+uo+OoZc
	ygtUJONx1FlEJZOjkvDmavWTAviz7ukJ4LtuHCV2KV4rUtCmeS4kJlLlD8pw6TMPwDF7
	Ye6BWtHDKeQQsCyCRDflJyMCPXy9iPgt+SskE=
Received: by 10.229.41.70 with SMTP id n6mr1293367qce.237.1310111534126; Fri,
	08 Jul 2011 00:52:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.229.215.206 with HTTP; Fri, 8 Jul 2011 00:51:54 -0700 (PDT)
In-Reply-To: <4E16909C.7080600@gmail.com>
References: <CACrTVgKyLQ1UDqzUAcJACrsraPYfcOZf7c8HdfQOJsgTAx-r7A@mail.gmail.com>
	<201107061734.31202.GNUtoo@no-log.org>
	<CACrTVgJ6hYwz8bbJPowEN_jb5A+hd4vVr_T4qQONdtKd8gGv_g@mail.gmail.com>
	<CACrTVgLG+DcK=p0G4D0sfVy44Dm0WnVrH+yf3u2241_DkNguhw@mail.gmail.com>
	<4E16909C.7080600@gmail.com>
From: =?ISO-8859-1?Q?Sylvain_Par=E9?= <sylvain.pare@gmail.com>
Date: Fri, 8 Jul 2011 09:51:54 +0200
Message-ID: <CACrTVgL6ZnbufMCTme+stKjkGM_1cdWsO9KKMgM5C9_axNJrGA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH-proposal] fix vlc building (-fPIC error) by patching live555 recipe
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
X-List-Received-Date: Fri, 08 Jul 2011 07:56:07 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Direclty in the recipe yeah and it did not work. But I have adoubt about
testing it directly in the config.linux-cross file..
Why ? (because as C_FLAGS =3D               $(COMPILE_OPTS) ...) in this sa=
me
file


2011/7/8 Khem Raj <raj.khem@gmail.com>

> On 07/06/2011 02:44 PM, Sylvain Par=E9 wrote:
>
>> Patch attached. removed unneeded line
>>
>>
>>  From 9e01ea60bf7790f1250ef24a317507**e255f3f947 Mon Sep 17 00:00:00 200=
1
>> From: =3D?UTF-8?q?Sylvain=3D20'GarthPS'=3D**20Par=3DC3=3DA9?=3D<sylvain.=
pare@**
>> gmail.com <sylvain.pare@gmail.com>>
>> Date: Wed, 6 Jul 2011 23:36:14 +0200
>> Subject: [PATCH] live555 recipe: added -fPIC flag need by VLC to build
>> with
>> live555 support
>> MIME-Version: 1.0
>> Content-Type: text/plain; charset=3DUTF-8
>> Content-Transfer-Encoding: 8bit
>>
>> Signed-off-by: Sylvain 'GarthPS' Par=E9<sylvain.pare@gmail.com>
>> ---
>>  recipes/live555/live555.inc |    1 +
>>  1 files changed, 1 insertions(+), 0 deletions(-)
>>
>> diff --git a/recipes/live555/live555.inc b/recipes/live555/live555.inc
>> index 14e97bb..6de57cb 100644
>> --- a/recipes/live555/live555.inc
>> +++ b/recipes/live555/live555.inc
>> @@ -18,6 +18,7 @@ TARGET_CC_ARCH +=3D "${LDFLAGS}"
>>
>>  do_configure() {
>>      cp ${WORKDIR}/config.linux-cross .
>> +    echo "COMPILE_OPTS+=3D" -fPIC "">>  config.linux-cross
>>
>
> Did you try adding -fPIC to CFLAGS
>
>       ./genMakefiles linux-cross
>>  }
>>
>>
>>
>>
>> ______________________________**_________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.**openembedded.org<Openembedded-devel@lists.ope=
nembedded.org>
>> http://lists.linuxtogo.org/**cgi-bin/mailman/listinfo/**
>> openembedded-devel<http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/o=
penembedded-devel>
>>
>
>
> ______________________________**_________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.**openembedded.org<Openembedded-devel@lists.open=
embedded.org>
> http://lists.linuxtogo.org/**cgi-bin/mailman/listinfo/**openembedded-deve=
l<http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>
>

