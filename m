Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PpbzI-0000Ro-7x
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Feb 2011 08:39:48 +0100
Received: by iwn8 with SMTP id 8so1012972iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Feb 2011 23:38:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=SgAY6+iN8Slq7+jBuJW/DnjYQedMlkW5f/svsekask8=;
	b=XvGBbDRmgW9Gn71PHYRiOmkZWC7+gqpzG0iC5NE//vCVaEGCGXdK2OBcmv1kmrhZVS
	zwwswT8hntkcYEaWRKrijXaTDolzXmqvnS1qQYa1hoxio+4IbdfcmFYomtO90ez/LWCW
	9Cz4W8G5cCyv0AX8DEC4J4A/Gz2LsjbniwyFI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=AoVsoTBwgtBp8//Zzm8w4Ih8X//N5NqY2Wq0FLu0VGCjJEuicJTtI4wuwzMNe2x1fh
	PKX5DSAlndCn81q+bKFhBc7X3gKY7IjnjQEcRrw0ivoZ+XnT57rEYAHHa0D1eNaI56Aw
	9jfJ8+SY2w4BAP7gH6mGJI6Z4bJWumV/uzHsE=
MIME-Version: 1.0
Received: by 10.231.205.194 with SMTP id fr2mr185825ibb.197.1297841916132;
	Tue, 15 Feb 2011 23:38:36 -0800 (PST)
Received: by 10.231.30.73 with HTTP; Tue, 15 Feb 2011 23:38:35 -0800 (PST)
In-Reply-To: <4D5A8FF2.2010200@mentor.com>
References: <AANLkTi=bPrL+J+sA6wR+BEK9GuLxbMJRohVAPie-_u_i@mail.gmail.com>
	<4D5A8FF2.2010200@mentor.com>
Date: Wed, 16 Feb 2011 08:38:35 +0100
Message-ID: <AANLkTikybh5rueE=YwrG-RoOYgWo9XXGA9BnDJp8Kf2h@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: git head: build of rpm-native fails
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
X-List-Received-Date: Wed, 16 Feb 2011 07:39:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

2011/2/15 Tom Rini <tom_rini@mentor.com>:
> On 02/14/2011 11:48 PM, Frans Meulenbroeks wrote:
>>
>> Hi,
>>
>> Yesterday I tried whether I could cross compile a helloworld.rpm to
>> try on a fedora-arm box, but I failed in building rpm-native.
>> This issue was verified by Jay. His log:
>> http://tinderbox.openembedded.net/public/logs/task/25555153.txt
>>
>> apparently this is the failing part is:
>>
>> file -C -m ./magic.mime
>> ./magic.mime, 187: Warning: string extension `B' invalid
>> ./magic.mime, 401: Warning: string extension `B' invalid
>> ./magic.mime, 618: Warning: string extension `B' invalid
>> ./magic.mime, 623: Warning: string extension `B' invalid
>> ./magic.mime, 627: Warning: string extension `B' invalid
>> ./magic.mime, 628: Warning: string extension `B' invalid
>> ./magic.mime, 672: Warning: no need to escape `#'
>> ./magic.mime, 674: Warning: no need to escape `#'
>> file: could not find any magic files!
>> make[4]: *** [magic.mime.mgc] =C3=90=C5=BE=C3=91=CB=86=C3=90=C2=B8=C3=90=
=C2=B1=C3=90=C2=BA=C3=90=C2=B0 1
>> make[4]: *** =C3=90=C5=BE=C3=90=C2=B6=C3=90=C2=B8=C3=90=C2=B4=C3=90=C2=
=B0=C3=90=C2=BD=C3=90=C2=B8=C3=90=C2=B5 =C3=90=C2=B7=C3=90=C2=B0=C3=90=C2=
=B2=C3=90=C2=B5=C3=91=E2=82=AC=C3=91=CB=86=C3=90=C2=B5=C3=90=C2=BD=C3=90=C2=
=B8=C3=91 =C2=A0=C3=90=C2=B7=C3=90=C2=B0=C3=90=C2=B4=C3=90=C2=B0=C3=90=C2=
=BD=C3=90=C2=B8=C3=90=C2=B9..
>>
>> I tried the command in a devshell and there it also fails, but I have
>> not really an idea what is wrong (and I don't know too much about RPM
>> anyway)
>> Suggestions? Fixes ?
>
> rpm depends on having a specific version of file around and there's proba=
bly
> a mis-match.

Guess so.
Note that this is not host related as the file used is build by OE (file-na=
tive)

Actually maybe we should move to a newer version of rpm. Ours is at
4.4.2.3, latest stable is 4.8.1
and file on oe is 5.04, mainstream is 5.05, but I guess that will have
less impact.

Frans


