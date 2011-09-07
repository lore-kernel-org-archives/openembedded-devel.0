Received: from mail-qy0-f182.google.com ([209.85.216.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sylvain.pare@gmail.com>) id 1R1CRg-0003mu-Qo
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 Sep 2011 09:21:17 +0200
Received: by qyk9 with SMTP id 9so4496051qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Sep 2011 00:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=4Av5USrjsH3kkpS7ijyb1BIfSyLvPlPuxwcvKdSDOkw=;
	b=XuKt7kyMAsaSys0VvqmI3R0Jg/YwXdjWMhCRyFen1smSx0b5K4QDw5P8yGPg0763dS
	PvSqh3H53bPVvv3aLAeln8IR6ZDJORh5iw+3iMANdBLon1xGTtRIeb/723MZBJ5U5NH0
	+zt+QOGvH1B7Oz3hcPqcyYhiiBVOkxcFSus9k=
Received: by 10.229.67.95 with SMTP id q31mr2544903qci.228.1315379772223; Wed,
	07 Sep 2011 00:16:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.229.88.144 with HTTP; Wed, 7 Sep 2011 00:15:52 -0700 (PDT)
In-Reply-To: <CACrTVg+Zig-sAR=gUR2yt+8pRtzx_+gSBYLUnL4qro=A8t9L-Q@mail.gmail.com>
References: <CACrTVgL3To0AH5H35aBYSuhVif8EK69eAaf2DeB+-7z-y8hDVA@mail.gmail.com>
	<1315304074.4717.6.camel@mattotaupa>
	<CACrTVgJnDNks+eJhBP4Pj8o6PLqaZi2sVR62Nw67jKz=Sqj4iA@mail.gmail.com>
	<1315305904.4717.9.camel@mattotaupa>
	<CACrTVg+Zig-sAR=gUR2yt+8pRtzx_+gSBYLUnL4qro=A8t9L-Q@mail.gmail.com>
From: =?ISO-8859-1?Q?Sylvain_Par=E9?= <sylvain.pare@gmail.com>
Date: Wed, 7 Sep 2011 09:15:52 +0200
Message-ID: <CACrTVgJv6yroaXzacnXL2Uo1yNvb1wc6YndSufS9iVF78MdkBA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org, 
	Paul Menzel <paulepanter@users.sourceforge.net>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] binutils_2.21: recipes updates to new version 2.21.1
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
X-List-Received-Date: Wed, 07 Sep 2011 07:21:17 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

Hi Paul,

There is a mistake in my last patch.
As I changed the version of binutils ( + '.1') then patches are not good
fetched, they are looked for in files/ and not in binutils-2.21/
What is the best way to fix this ?
copy binutils-2.21/ into binutils-2.21.1/ with all its patches or update th=
e
binutils-2.21.1.bb recipe to point to binutils-2.21/ ?

I will then push propose a new version of my patch.
Thanks.
regards,

Sylvain


2011/9/6 Sylvain Par=E9 <sylvain.pare@gmail.com>

> Paul,
> I had already resent my patch with proper -M -C option.
> Sorry for the noise. It is missing the v2 thing. is it ok?
> Thanks again. and next I hope it will be good from the start.
> Greetings,
> Sylvain
>
>
>
> 2011/9/6 Paul Menzel <paulepanter@users.sourceforge.net>
>
>> Am Dienstag, den 06.09.2011, 12:22 +0200 schrieb Sylvain Par=E9:
>>
>> > thank you. I was just seing these *@# line breaks..
>> > So yes I will use git-send.
>> >
>> > So about my patch I re-send a new one right?
>>
>> Yeah, fix the commit message with `git commit -s --amend` or `git rebase
>> -i =85`, create a new file with
>>
>>        git format-patch -s -1 -M -M -C -C -C --subject-prefix=3D"PATCH
>>        v2"
>>
>> and use `git send-email =85`.
>>
>>
>> Thanks,
>>
>> Paul
>>
>>
>> [1]
>> http://openembedded.org/index.php/How_to_submit_a_patch_to_OpenEmbedded
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>>
>

