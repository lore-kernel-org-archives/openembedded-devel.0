Received: from mail-iw0-f194.google.com ([209.85.223.194])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NNFjK-0000jf-W7
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Dec 2009 02:09:38 +0100
Received: by iwn32 with SMTP id 32so4309355iwn.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Dec 2009 17:07:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=LM9QVESFiZYKQVV6Gxr7YvoC4ie5w8I6f37lXkT3dpk=;
	b=mErpPMPl9hbt/hy1Z09QWeUVR63mtgTW8BpeIV7MtYCf3ghsSCo8MzfQ3PNoVNPpTi
	sv0nWbB8FHbF0yFynml8JzI7zcdO6bZH2NaBZJ/IuxP8lkgY0iaUdmZlqOR3JJZFPEiF
	AHj4SSXmuwjq5wWQbB2AwFDda3WWaYLEQjqo4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=m45fInKtkZNGlyYCWvc0P5Sw2nNRw/fGe//WUfZ+V4/wa6n0nKqKrMzVQKEp3Cx0ji
	SASJpafRG1Z5W2dyQ3HwK2bQ3+riYvRo5+L+itbFJhh7ppyb4gguJLNL+RS7IGtdy4cE
	zq3OBi2ysVAYVHYYvidJ/436Bn0sOmdw+wJks=
MIME-Version: 1.0
Received: by 10.231.6.79 with SMTP id 15mr81186iby.36.1261530462029; Tue, 22 
	Dec 2009 17:07:42 -0800 (PST)
In-Reply-To: <4B314C5B.8000703@balister.org>
References: <op.u5b0cczimn1qzu@guohr-laptop-ubuntu>
	<4B30E03B.1040500@mwester.net> <20091222195157.GB2271@denix.org>
	<ac9c93b10912221425g4fee3ca0kdc0257be7eb677bc@mail.gmail.com>
	<4B314C5B.8000703@balister.org>
Date: Tue, 22 Dec 2009 17:07:42 -0800
Message-ID: <19c1b8a90912221707u113e5e4eie71ca721702e4551@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.194
X-SA-Exim-Mail-From: raj.khem@gmail.com
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
X-List-Received-Date: Wed, 23 Dec 2009 01:09:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 22, 2009 at 2:46 PM, Philip Balister <philip@balister.org> wrot=
e:
> On 12/22/2009 05:25 PM, Frans Meulenbroeks wrote:
>>
>> 2009/12/22 Denys Dmytriyenko<denis@denix.org>:
>>>
>>> On Tue, Dec 22, 2009 at 09:05:31AM -0600, Mike Westerhof wrote:
>>>>
>>>> Guo Hongruan wrote:
>>>>>
>>>>> Hi guys,
>>>>> =C2=A0 Today, I build an base-image using OE. And I want to check the
>>>>> content
>>>>> of rootfs, but I found the directory rootfs in building directory is
>>>>> empty. I remember there was the ontent of the target root filesystem.
>>>>> Why have to remove them? Does it means the rootfs directory is
>>>>> unuseful?
>>>>>
>>>>> Thanks a lot!
>>>>>
>>>>
>>>> Add IMAGE_KEEPROOTFS =3D "1" to your local.conf file.
>>>> I'm not sure why the change was made to clean it out every build,
>>>> though.
>>>
>>> To prevent people from using it as an NFS share and having problems.
>>
>> Ehm, can you please clarify why this would cause a problem?
>> (btw if I recall correctly the rootfs is still there in the work dir,
>> and anyway you can build a rootfs in a tar.gz file and untar that).
>
> Someone correct me if I get this wrong ...
>
> Since OE does not run as root, the file ownership are not suitable for us=
e
> as a true rootfs. During the assembly of the tarball, the file owner
> information is "fixed" so that if you unpack the tarball as root, the fil=
es
> have the proper owners.
>
> So the temporary root file system will not do what people expect.

This is the real cause. Always use the tar file to populate the
root file system even if it is to be nfs mounted

-Khem


