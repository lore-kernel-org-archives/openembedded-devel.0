Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PIvBq-0001e1-3x
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Nov 2010 04:29:38 +0100
Received: by gxk2 with SMTP id 2so1669863gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Nov 2010 19:28:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=d7Qn+GoBRqtcp4BrzfycQXpfDEu8cHF+EM9kc3oraJY=;
	b=vJJy3nSm9PbUbhv1FGVxHaYKA4naU9TwkMHha+/huCYVp7O4Fwmyt+q4/4O8i2360m
	G4W7pweDkZc6MI5t3+lfKCFQ4/Rmc0fj+WDPonlIHlqRrz1PJB6L+Jsozr38Tlo2xLVg
	452uU+ALFnaMdfObFDy/rJT6S67knRLGdiPXM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=NVoP7rBydX3hYCbvGYi+53Z3AzkC4v/knuJLbuGA1GiXZHXYHqmg1Q+7wC2nHBAlFD
	YbiT3YovjhIUlbp7hqAdlFJ5Z5/+74GYZ4aQnEPNbRKiRcmZBIIfNwdyhPNzCDMtOgCn
	s01DdZ5eu0gjf5MOvNq6Uf7fCvW8g6Z6BuqaM=
Received: by 10.91.9.1 with SMTP id m1mr234908agi.21.1290050909950; Wed, 17
	Nov 2010 19:28:29 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.120.8 with HTTP; Wed, 17 Nov 2010 19:28:09 -0800 (PST)
In-Reply-To: <4CE49577.4030100@balister.org>
References: <1290046421-22553-1-git-send-email-sgarman@zenlinux.com>
	<4CE48CFF.7070406@balister.org> <4CE493E2.3010509@zenlinux.com>
	<4CE49577.4030100@balister.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 17 Nov 2010 19:28:09 -0800
Message-ID: <AANLkTimRDgCPqg3g45cQkM6M1dnBa+SRD55Kyu=pFBcN@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] tar: upgrade to version 1.25
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
X-List-Received-Date: Thu, 18 Nov 2010 03:29:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 17, 2010 at 6:54 PM, Philip Balister <philip@balister.org> wrot=
e:
> On 11/17/2010 06:48 PM, Scott Garman wrote:
>>
>> On 11/17/2010 06:18 PM, Philip Balister wrote:
>>>
>>> On 11/17/2010 06:13 PM, Scott Garman wrote:
>>>>
>>>> Signed-off-by: Scott Garman<sgarman@zenlinux.com>
>>>> ---
>>>> recipes/tar/tar_1.23.bb | 6 ------
>>>> recipes/tar/tar_1.25.bb | 6 ++++++
>>>> 2 files changed, 6 insertions(+), 6 deletions(-)
>>>> delete mode 100644 recipes/tar/tar_1.23.bb
>>>> create mode 100644 recipes/tar/tar_1.25.bb
>>>>
>>>> diff --git a/recipes/tar/tar_1.23.bb b/recipes/tar/tar_1.23.bb
>>>> deleted file mode 100644
>>>> index dc37247..0000000
>>>> --- a/recipes/tar/tar_1.23.bb
>>>> +++ /dev/null
>>>> @@ -1,6 +0,0 @@
>>>> -require tar.inc
>>>> -
>>>> -PR =3D "${INC_PR}"
>>>> -
>>>> -SRC_URI[md5sum] =3D "41e2ca4b924ec7860e51b43ad06cdb7e"
>>>> -SRC_URI[sha256sum] =3D
>>>> "c9328372db62fbb1d94c9e4e3cefc961111af46de47085b635359c00a0eebe36"
>>>> diff --git a/recipes/tar/tar_1.25.bb b/recipes/tar/tar_1.25.bb
>>>> new file mode 100644
>>>> index 0000000..c611f77
>>>> --- /dev/null
>>>> +++ b/recipes/tar/tar_1.25.bb
>>>> @@ -0,0 +1,6 @@
>>>> +require tar.inc
>>>> +
>>>> +PR =3D "${INC_PR}"
>>>> +
>>>> +SRC_URI[md5sum] =3D "6e497f861c77bbba2f7da4e10270995b"
>>>> +SRC_URI[sha256sum] =3D
>>>> "f3f6ce41b8e0f327abd05c95990f113ddafbae131e10f79a99728ed46458494b"
>>>
>>>
>>> Acked-by: Philip Balister <philip@balister.org>
>>>
>>> Can you add tar-1.23 to the removal.txt file? Ask it be removed in a
>>> couple of months. This way we have a schedule to delete the older recip=
e.
>>
>> Thanks for the quick ack, Philip. Question though on the removal.txt
>> addition - this patch deletes the v1.23 version already. Does it need to
>> be kept around instead? I would think not given that this is a pretty
>> trivial update.
>>
>> Perhaps you meant tar v1.18 and/or v1.20, which are still there?
>
> Oops, I wasn't paying that close attention. I'd still leave 1.23 around f=
or
> a couple of months, just in case there is some weird issue with 1.25. We
> should check on the older ones and add them to removal.txt also. I'd like=
 to
> see us get into a sane clean up old stuff cycle, instead of the delete
> everything at once approach. Of course checking to see if any in tree
> distros use them is =C2=A0good thing.
>

Yeah probably a sane thing. Make 1.25 default and let 1.23 linger
around for a while
just in case.

> Philip
>
>>
>> Scott
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


