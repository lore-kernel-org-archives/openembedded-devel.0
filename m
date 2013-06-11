Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f173.google.com (mail-ie0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id A180061FEC
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jun 2013 15:10:09 +0000 (UTC)
Received: by mail-ie0-f173.google.com with SMTP id k13so657611iea.18
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jun 2013 08:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=GUDuVH0kclGiIo4Bb6ZkUqThblp91LDSKx52/u7lsNE=;
	b=D0yweMvs2nX0bo+BMQngSOMp1OUHBMarEpR/h2wpJz4mOPOxeZKRGCumwiIvzwXapz
	v4LAaP78YoJgHwav8OVLVXwnNOKRWuwAH9Ea7XrzduJ+35M6CnZdl4vSJpIemw5A5y6F
	XM7Qfb24Ed5likVhWBAxVoxm0SrhEpWKrD356FCJsXxt81iX2e2QTPhSBklIIpkQhWVX
	vBTemAzTpxwox0HXaR7T+3E4CjeUG1qtD8bRl76AsIYBW2a4/Pb/jDc3NHJzXQs5DqXf
	ll/p3RdntEEDNef8nl1a9mPERVlOWNKp3SoiNp8d4oezDcdCHPPNSaAIT/SGlCTWUrsM
	CJDg==
X-Received: by 10.50.26.67 with SMTP id j3mr1220015igg.15.1370963410703; Tue,
	11 Jun 2013 08:10:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.79.137 with HTTP; Tue, 11 Jun 2013 08:09:40 -0700 (PDT)
In-Reply-To: <7063136.DAg8vKBVKy@koontz>
References: <2472586.UfWZc5OvGZ@koontz> <7063136.DAg8vKBVKy@koontz>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 11 Jun 2013 08:09:40 -0700
Message-ID: <CAMKF1sohYz4g8zf8fJie6k=Q5ngSuVwhFEOGPoViOfJm+UhT4g@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: xf86-video-intel compilation failure
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Jun 2013 15:10:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 11, 2013 at 6:49 AM, S=C3=B8ren Holm <sgh@sgh.dk> wrote:
>
> Copying my local dri2.h into the sysroot like this makes the driver compi=
le.
>
>  cp /usr/include/xorg/dri2.h  tmp-eglibc/sysroots/vmc16/usr/include/xorg/
>
> Any hint on where that files is.
>
> S=C3=B8ren HolmTirsdag den 11. juni 2013 00:10:34 skrev :
>> Hi
>>
>> When compiling xf86-video-intel I get the following compilation error. D=
o
>> you have any ideas - I have looked everywhere for xorg/dri2.h
>>
>> | /home/sgh/git/openembedded/build/tmp-
>>
>> eglibc/sysroots/vmc16/usr/include/xorg/xf86.h:202:33: note: previous
>> declaration of 'xf86CVTMode' was here
>>
>> | In file included from i830_3d.c:33:0:
>> | intel.h:66:18: fatal error: dri2.h: No such file or directory
>> | compilation terminated.


do you have xserver-xorg staged in sysroot


>> | make[3]: *** [i830_3d.lo] Error 1
>> | make[3]: Leaving directory `/home/sgh/git/openembedded/build/tmp-
>>
>> eglibc/work/prescott-oe-linux/xf86-video-intel/2_2.21.6-r0/xf86-video-
>> intel-2.21.6/src'
>>
>> | make[2]: *** [all-recursive] Error 1
>> | make[2]: Leaving directory `/home/sgh/git/openembedded/build/tmp-
>>
>> eglibc/work/prescott-oe-linux/xf86-video-intel/2_2.21.6-r0/xf86-video-
>> intel-2.21.6/src'
>>
>> | make[1]: *** [all-recursive] Error 1
>> | make[1]: Leaving directory `/home/sgh/git/openembedded/build/tmp-
>>
>> eglibc/work/prescott-oe-linux/xf86-video-intel/2_2.21.6-r0/xf86-video-
>> intel-2.21.6'
>>
>> | make: *** [all] Error 2
>> | ERROR: oe_runmake failed
> --
> S=C3=B8ren Holm
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

