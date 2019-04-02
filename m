Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
	[209.85.215.179])
	by mail.openembedded.org (Postfix) with ESMTP id D90267D297;
	Tue,  2 Apr 2019 21:24:53 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id q1so7161970pgv.13;
	Tue, 02 Apr 2019 14:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=H41fFPxZsi5cF+YP3DOD15omBJNInATJbv7sUCiveAI=;
	b=o2yH8GTFCFRIxxT6T4mAAaXeCo7Fh66CVVgus2n75CDSymrMW2TIdeMdK5N9ademFJ
	eYwQQyGzkQ+yXs6wLZQG2Sz6taxiD61Rg0kdHA75YmG7ROXlVR0Ed07jJFTCx6kkExz8
	Y9S8fGYn7qtRD3HeLOA5a0cRpg6YJ0dvI81DRzGMx/mRNmkdeigjmPayZpo3HAA+zMXH
	pMSBM4xd+/cybcwMcBsM21SzNFFVuXCXU7dWpSu7/mCAVsNNKvEhLEEay/n3aRK8HRni
	7ulZz1hzLjkPBK6lyuY4ENYwCRPiAJqW8raYtJmidSyNG1BPjloNaAV0XXz8GhG1JkF0
	XFVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=H41fFPxZsi5cF+YP3DOD15omBJNInATJbv7sUCiveAI=;
	b=Xb8iMOL9xdosE+LKTnvj3Yd/6OdYGl5et8QOc0wmOf2XJg3gw8eJRmLbnhrIfuwt0E
	Z6sYTjfRs5S+KzlfPzFsLFK1rb/ltnOc0eK7aExzN8+d4sNWvCHV8tTSmWGxOTbScy1K
	9Bvb1Lwoy7Im8zNozeisVusZ1pGpqlAbFpzprDIYApLY/FRZyAJLNen0nq2NYI/MkVb1
	x5uAdh8hIyQ2Qi216j05CQbs4MfTLy7c/ansyjcInmpiSGWOXJESssQxSEdMMWmCrXv6
	BdVU8Rau7UHgj53MiwXgptA+FSkwEvrbq1c4SRcNmksHyLfc6sLyPjm3WRwZPkcLd4U3
	N1fA==
X-Gm-Message-State: APjAAAWsYRTRs0yfe2PgXMZy/LfT3CCnqrgeXfLRN1X7gprhdOgi2uZr
	UBMjH+zv+1vjNhR02i3cLK01eHEn
X-Google-Smtp-Source: APXvYqykp0nPjxbLdmI1+XpdsVn4OgnZU33TnUmlbey4croxqeGYUX0KVN/qmsxzm5+AOc7PZrrmFg==
X-Received: by 2002:a62:e412:: with SMTP id r18mr19485759pfh.207.1554240294663;
	Tue, 02 Apr 2019 14:24:54 -0700 (PDT)
Received: from [10.188.84.210] ([206.121.102.138])
	by smtp.gmail.com with ESMTPSA id
	t12sm28470732pfl.59.2019.04.02.14.24.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 02 Apr 2019 14:24:53 -0700 (PDT)
To: Tom Rini <trini@konsulko.com>, Jon Mason <jdmason@kudzu.us>
References: <854544cb-aab1-1a9d-9e98-0f39663ca621@gmail.com>
	<b08083fc2f63f6324a652706f8343a0b8defe209.camel@linuxfoundation.org>
	<a1416fe3-04fb-1d37-eaef-05b9a838254e@gmail.com>
	<6068e963-94c1-7225-2c60-9ae027c74639@windriver.com>
	<CAPoiz9yat-4XRgSFikh5PxrsgVpRAWNi2dx1O0+_iHyVR529Ag@mail.gmail.com>
	<20190402194738.GZ4664@bill-the-cat>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <56e2b936-177c-7066-99c0-bb46854daa4b@gmail.com>
Date: Tue, 2 Apr 2019 14:24:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190402194738.GZ4664@bill-the-cat>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] Git commit process question.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 02 Apr 2019 21:24:54 -0000
X-Groupsio-MsgNum: 76954
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="kmFSbKfNATamUmkQwWrEFz66pW5JofYRN"

--kmFSbKfNATamUmkQwWrEFz66pW5JofYRN
Content-Type: multipart/mixed; boundary="EjcxwKrJpXF4KfP316oM0k8RUmygTODU0";
 protected-headers="v1"
From: akuster808 <akuster808@gmail.com>
To: Tom Rini <trini@konsulko.com>, Jon Mason <jdmason@kudzu.us>
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
 Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Message-ID: <56e2b936-177c-7066-99c0-bb46854daa4b@gmail.com>
Subject: Re: [oe] [OE-core] Git commit process question.
References: <854544cb-aab1-1a9d-9e98-0f39663ca621@gmail.com>
 <b08083fc2f63f6324a652706f8343a0b8defe209.camel@linuxfoundation.org>
 <a1416fe3-04fb-1d37-eaef-05b9a838254e@gmail.com>
 <6068e963-94c1-7225-2c60-9ae027c74639@windriver.com>
 <CAPoiz9yat-4XRgSFikh5PxrsgVpRAWNi2dx1O0+_iHyVR529Ag@mail.gmail.com>
 <20190402194738.GZ4664@bill-the-cat>
In-Reply-To: <20190402194738.GZ4664@bill-the-cat>

--EjcxwKrJpXF4KfP316oM0k8RUmygTODU0
Content-Type: multipart/alternative;
 boundary="------------ACF619984FBE2BEC09B40A67"
Content-Language: en-US

--------------ACF619984FBE2BEC09B40A67
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable



On 4/2/19 12:47 PM, Tom Rini wrote:
> On Tue, Apr 02, 2019 at 04:45:16AM +0000, Jon Mason wrote:
>> On Tue, Apr 2, 2019 at 6:41 AM Mark Hatle <mark.hatle@windriver.com> wr=
ote:
>>> On 4/1/19 6:20 PM, akuster808 wrote:
>>>>
>>>> On 4/1/19 4:02 PM, Richard Purdie wrote:
>>>>> On Mon, 2019-04-01 at 15:33 -0700, akuster808 wrote:
>>>>>> Hello,
>>>>>>
>>>>>> I have noticed a large number of git commits with no header
>>>>>> information being accepted.
>>>>> Can you be more specific about what "no header information" means? Y=
ou
>>>>> mean a shortlog and no full log message?
>>>> Commits with just a "subject" and signoff. No additional information
>>> If you can convey the reason for the change in just the subject, that =
is
>>> acceptable.. but there is -always- supposed to be a signed-off-by line=
 according
>>> to our guidelines.
>>>
>>> So if you see this, I think we need to step back and figure out where =
and why
>>> it's happening and get it resolved in the future.
>>>
>>> (Places I've seen in the past were one-off mistakes and clearly that -=
- so it
>>> wasn't anything that we needed to work on a correction.)
>>>
>>> --Mark
>>>
>>>> We tend to reference back to how the kernel does things.
>>>>
>>>> https://www.kernel.org/doc/html/latest/process/submitting-patches.htm=
l
>>>> These two sections in particular.
>>>>
>>>>
>>>>     2) Describe your changes
>>>>
>>>> Describe your problem. Whether your patch is a one-line bug fix or 50=
00 lines of
>>>> a new feature, there must be an underlying problem that motivated you=
 to do this
>>>> work. Convince the reviewer that there is a problem worth fixing and =
that it
>>>> makes sense for them to read past the first paragraph.
>>>>
>>>>
>>>> along with this section.
>>>>
>>>>
>>>>     14) The canonical patch format
>>>>
>>>> This section describes how the patch itself should be formatted. Note=
 that, if
>>>> you have your patches stored in a |git| repository, proper patch form=
atting can
>>>> be had with |git format-patch|. The tools cannot create the necessary=
 text,
>>>> though, so read the instructions below anyway.
>>>>
>>>> The canonical patch subject line is:
>>>>
>>>> Subject: [PATCH 001/123] subsystem: summary phrase
>>>>
>>>> The canonical patch message body contains the following:
>>>>
>>>>       * A |from| line specifying the patch author, followed by an emp=
ty line
>>>>         (only needed if the person sending the patch is not the autho=
r).
>>>>       * The body of the explanation, line wrapped at 75 columns, whic=
h will be
>>>>         copied to the permanent changelog to describe this patch.
>>>>       * An empty line.
>>>>       * The |Signed-off-by:| lines, described above, which will also =
go in the
>>>>         changelog.
>>>>       * A marker line containing simply |---|.
>>>>       * Any additional comments not suitable for the changelog.
>>>>       * The actual patch (|diff| output).
>>>>
>>>>
>>>>     - Armin
>> There are existing git hooks that can be used to detect and fail to
>> merge patches like this.  For Linux, I have the following in
>> .git/hooks/pre-commit
>> #!/bin/sh
>> exec git diff --cached | scripts/checkpatch.pl -
> FWIW, over in U-Boot land I do:
> ./scripts/checkpatch.pl -q --git origin/master..
> as part of checking things prior to pushing to master.
Having hooks is fine but after the fact. It puts the burden back on the
Layer maintainer to resolve. If we think more info is better, it needs
to happen at time of change submittal.

- armin
>
>


--------------ACF619984FBE2BEC09B40A67--

--EjcxwKrJpXF4KfP316oM0k8RUmygTODU0--

--kmFSbKfNATamUmkQwWrEFz66pW5JofYRN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJco9MjAAoJEO6LtJn0Vuf56nUP/2IZrhcjzVp+mr29oGCC2SCl
ZFzVOcsnyebCzTHwZkS0Ge5yfhZ3rjPQXCq0jhcZHZW/1bfSwMpl0g8fjwo6tADi
/w9ZMLbc/m08SaG9KvgPSrV0JZAjGAqk62f7yLZ0YMQyJrhrRnO8rA9pSPsk3z//
1M8rYEMQBTP6S30yqo+qumO1/b5QDEBefD5r+t4Pv+HbhAfKYV+fP94F/y93j6Fl
j9vVq9FdiRy/k9LrfFcUHRgWtfvg8/15G17LzSivQd4O/QQ6CkEEeNk2nuyavTo7
wXuyowpUn5RkjII+PcdKCoQ5ce6Y0s9M8MqBV9qI8xsFtpwLxkyEPVfE81qCcLTK
SVLLDsIPYaZqrtNc5FmNDxopEInrkkipkdmnbMmZm4P0bYT+TfxgFkJoYvY+LU/8
BZ0Al8DIdXy3RSduubNt2Cm7u6Skj/mQKdWuMFKesU5yzDPSxT80KFQvAKL2xeNF
VXHXvfLYb9Nw/qp0i61FejBe8EK/XZagQt94ZIIWlF8imCaCHlD9nix3RbDf+KBN
RMud1cwpJi+vgf5F8xCR7UxluXajeTCS4c0xppmAemG4n/+ziQE9qSQROqzBUns/
44z7SD9nGMTbmiiV0menabGzdRMuszyj3wyW7ALlIhf+W3kbik8/cwF5WMOPDJr0
hr8mNYpXcHBDJMJ0LXKT
=pXtA
-----END PGP SIGNATURE-----

--kmFSbKfNATamUmkQwWrEFz66pW5JofYRN--
