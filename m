Received: from [209.85.198.241] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1LeXjI-0005E5-JL
	for openembedded-devel@lists.openembedded.org;
	Tue, 03 Mar 2009 17:44:28 +0100
Received: by rv-out-0708.google.com with SMTP id b17so3179007rvf.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Mar 2009 08:40:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=o4rTeHJ59/kc4tXrrxCYwN5VyujgPaI4FFtVHno2Hxg=;
	b=SYn0g1BhzmCJ79VsA/63U9EKFVa+8ecdQZ6tHJ9JCWrW1lzAPP/qP4tuvW6o8aQhbD
	OMK6PS3rdOSoxS/axKWuY3hkNiKOv+nXSlaba1UXXBljytakJPDKfKjRq2riwSxVgYhm
	aLaTtGzzBxCa8OQ+7RCpPtpH3muUTEkYXUjNo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=dH2CzfyD8EMfGm+gu+iXCXYclI1Lsgz0YFVwoKsX/okqxzTv3G8/Q68INium2SlSRg
	i2Iiq3aRerQABfciFCJFSPc6r3Jjoe6NKKXyRm/BjFylJACwVo5bzlsPHZWVPeRDtIRM
	plbTW/h6aXNNcuTTVcAz2HBt8FXzuJJm4G13Y=
MIME-Version: 1.0
Received: by 10.140.174.20 with SMTP id w20mr3621822rve.87.1236098424488; Tue, 
	03 Mar 2009 08:40:24 -0800 (PST)
In-Reply-To: <69E6C70090A0A14498CC98FAE5E06B6E3CF6D4@hiob.intern.dresearch.de>
References: <f46da1cf0902201818r3fcf3432oc14929b5f455bbe7@mail.gmail.com>
	<f96d234e0902240651r7ad36677h8e828964308e2b50@mail.gmail.com>
	<49A55A59.5080409@balister.org>
	<f96d234e0902250828x6e72a8b6kc0a4285125f27b0e@mail.gmail.com>
	<49A8626B.8020209@balister.org>
	<69E6C70090A0A14498CC98FAE5E06B6E3CF6D4@hiob.intern.dresearch.de>
Date: Tue, 3 Mar 2009 11:40:24 -0500
Message-ID: <f96d234e0903030840k69edc48cy7f946274616a3c24@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Documentation/User Manual questions
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
X-List-Received-Date: Tue, 03 Mar 2009 16:44:29 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On Mon, Mar 2, 2009 at 1:48 AM, Sledz, Steffen <sledz@dresearch.de> wrote:
>> docs.openembedded.org is working now. Koen put a copy of the
>> manual up
>> there, but I suspect that long term other documents may also belong
>> there. I'm not sure who has access to that part of amethyst/
>> Cliff, Koen
>> and others, can you work out the details of keeping this up to date?
>
> There's a little configuration problem according to the encoding. The document seems to be in Latin1 and contains
>
> <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
>
> but the HTTP header say UTF-8.
>
> HTTP/1.1 200 OK
> Date: Mon, 02 Mar 2009 06:45:20 GMT
> Server: Apache/2.2.3 (Debian) mod_python/3.2.10 Python/2.4.4 PHP/5.2.0-8+etch13 mod_perl/2.0.2 Perl/v5.8.8
> Last-Modified: Tue, 06 May 2008 12:30:38 GMT
> ETag: "184311-84-44c8f04003780"
> Accept-Ranges: bytes
> Content-Length: 132
> Connection: close
> Content-Type: text/html; charset=UTF-8
>
> This results in wrong presentation e.g. of the copyright symbol. :(

I'm unable to reproduce the problem -- can you supply:

- browser and version that displays this problem
- screen shot of problem

Patches are also welcome if you know what needs changed in the docs source.

Thanks,
Cliff

-- 
=======================
Cliff Brake
http://bec-systems.com


