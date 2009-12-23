Received: from mail-px0-f182.google.com ([209.85.216.182])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NNFsA-0003e5-FJ
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Dec 2009 02:18:45 +0100
Received: by pxi12 with SMTP id 12so3265981pxi.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Dec 2009 17:16:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:content-type:to:subject
	:references:date:mime-version:content-transfer-encoding:from
	:organization:message-id:in-reply-to:user-agent;
	bh=FwmkraZmK1Hw+2Gym15ULbNFlVlys2M7Y0Ug6HaILQA=;
	b=iPxmZPfsxDDgotbLODR5aDiq5vfheIkr1dWDQJyn9gHdoxkInIoukPvGCMpvZff9FX
	JsIIYaSiaiegyPj0Pb2ujsTotXbnhEHSF1QuKinjPRWnweythnNnyTInzxU+wJOi/4xv
	lq/ji/dvN8knr9cuJQhSOpfy6Q2cL3arKg4ao=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=content-type:to:subject:references:date:mime-version
	:content-transfer-encoding:from:organization:message-id:in-reply-to
	:user-agent;
	b=c6EIiC8OnmlcP281tXkdLxX/mVUZAkB16eRxxQgOHcAiNT6hxTuB06GfXwsxurgaED
	MrRPU4QbtgBs28MQZGnWcuwdTC23v0JYcyr+eNrijF94s0ANqELI+psgPWJF06o3Cvhc
	POhgzdl7JZJsEFXNuu7m+E/56mGDv+sMaLbf4=
Received: by 10.140.255.13 with SMTP id c13mr6644457rvi.211.1261531006122;
	Tue, 22 Dec 2009 17:16:46 -0800 (PST)
Received: from guohr-laptop-ubuntu ([123.162.69.196])
	by mx.google.com with ESMTPS id 23sm6471682pzk.0.2009.12.22.17.16.43
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 22 Dec 2009 17:16:45 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <op.u5b0cczimn1qzu@guohr-laptop-ubuntu>
	<4B30E03B.1040500@mwester.net> <20091222195157.GB2271@denix.org>
	<ac9c93b10912221425g4fee3ca0kdc0257be7eb677bc@mail.gmail.com>
	<4B314C5B.8000703@balister.org>
	<19c1b8a90912221707u113e5e4eie71ca721702e4551@mail.gmail.com>
Date: Wed, 23 Dec 2009 09:16:31 +0800
MIME-Version: 1.0
From: "Guo Hongruan" <camelguo@gmail.com>
Organization: Gulessoft, Inc
Message-ID: <op.u5c9tnq2mn1qzu@guohr-laptop-ubuntu>
In-Reply-To: <19c1b8a90912221707u113e5e4eie71ca721702e4551@mail.gmail.com>
User-Agent: Opera Mail/10.10 (Linux)
X-SA-Exim-Connect-IP: 209.85.216.182
X-SA-Exim-Mail-From: camelguo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: why rootfs directory in temp is empty
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
X-List-Received-Date: Wed, 23 Dec 2009 01:18:45 -0000
Content-Type: text/plain; charset=utf-8; format=flowed; delsp=yes
Content-Transfer-Encoding: Quoted-Printable

Yea, I understand. Thanks a lot.

I used to check the rootfs directory quickly, to verify whether or not  =

some packages have been installed correctly and to check the rootfs size=
.  =

So when I can not find it as usual, I am amazing.

Thank all of you.

=E5=9C=A8 Wed, 23 Dec 2009 09:07:42 +0800=EF=BC=8CKhem Raj <raj.khem@gma=
il.com> =E5=86=99=E9=81=93:

> On Tue, Dec 22, 2009 at 2:46 PM, Philip Balister <philip@balister.org>=
  =

> wrote:
>> On 12/22/2009 05:25 PM, Frans Meulenbroeks wrote:
>>>
>>> 2009/12/22 Denys Dmytriyenko<denis@denix.org>:
>>>>
>>>> On Tue, Dec 22, 2009 at 09:05:31AM -0600, Mike Westerhof wrote:
>>>>>
>>>>> Guo Hongruan wrote:
>>>>>>
>>>>>> Hi guys,
>>>>>>   Today, I build an base-image using OE. And I want to check the
>>>>>> content
>>>>>> of rootfs, but I found the directory rootfs in building directory=
 is
>>>>>> empty. I remember there was the ontent of the target root  =

>>>>>> filesystem.
>>>>>> Why have to remove them? Does it means the rootfs directory is
>>>>>> unuseful?
>>>>>>
>>>>>> Thanks a lot!
>>>>>>
>>>>>
>>>>> Add IMAGE_KEEPROOTFS =3D "1" to your local.conf file.
>>>>> I'm not sure why the change was made to clean it out every build,
>>>>> though.
>>>>
>>>> To prevent people from using it as an NFS share and having problems=
.
>>>
>>> Ehm, can you please clarify why this would cause a problem?
>>> (btw if I recall correctly the rootfs is still there in the work dir=
,
>>> and anyway you can build a rootfs in a tar.gz file and untar that).
>>
>> Someone correct me if I get this wrong ...
>>
>> Since OE does not run as root, the file ownership are not suitable fo=
r  =

>> use
>> as a true rootfs. During the assembly of the tarball, the file owner
>> information is "fixed" so that if you unpack the tarball as root, the=
  =

>> files
>> have the proper owners.
>>
>> So the temporary root file system will not do what people expect.
>
> This is the real cause. Always use the tar file to populate the
> root file system even if it is to be nfs mounted
>
> -Khem
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel=



-- =

Guo Hongruan, Embedded Linux Consultant
Mobile: +86-0-13484056007
Skype: camelguo
Twitter: camelguo
http://www.gulessoft.com


