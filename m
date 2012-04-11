Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SHxOM-0002ES-OA
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Apr 2012 15:15:22 +0200
Received: by ghbz2 with SMTP id z2so393770ghb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Apr 2012 06:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=IotzwWxrtLwd08lZWYvOAS4xDmArm6VH0PkUCOdi/vM=;
	b=vrgHqtuQB0Uhe1nIfLlzA4QTnY5W7N8WBHjUxELzX/wz29uesvQ6DE1og7CXYAQWZ9
	RP9R0vtWzjPaBnw2by4gC6SV4y3MDCmhZjhSAjacHgLjHzuNGK8wErQ8jQzgh/LFY+YE
	2AGNO4o4ENO9XgwG4lnYTOoPejtrJ7D0iQRdU5P+EZau92EEZxLV4v0PRy7lsSSw+ADF
	BimilF1BjFZSuV7yGtXFhSrI4x0gnZhA+Hb5QnuRfgG4+dUUEJT3p+S1vE5x13he9HVj
	vfwcxvcgQBKVB9RBBmhXDARj4uRxFNbx/aJn+hw8JBcZRgPMdiSvgllPLkjJySjrATH1
	UW8A==
MIME-Version: 1.0
Received: by 10.236.128.116 with SMTP id e80mr11093127yhi.116.1334149563534;
	Wed, 11 Apr 2012 06:06:03 -0700 (PDT)
Received: by 10.236.37.131 with HTTP; Wed, 11 Apr 2012 06:06:03 -0700 (PDT)
In-Reply-To: <CAOHjBZssQBxkwe-qpTQz8mubiB1tAZ5ohKbhFapw3BqiYxqA7g@mail.gmail.com>
References: <CAOHjBZuGf-wG2jpSR1R9sM_KawN+5H9ZS_ivikYgfMvLJVVtXQ@mail.gmail.com>
	<4F855F1A.6090700@mlbassoc.com>
	<CAOHjBZssQBxkwe-qpTQz8mubiB1tAZ5ohKbhFapw3BqiYxqA7g@mail.gmail.com>
Date: Wed, 11 Apr 2012 15:06:03 +0200
Message-ID: <CA+chaQfoxtqA5QgaCy6cgaf27MsMLCLXc=5MO-Dj9263scEeeQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [oe-core] THISDIR usage
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
X-List-Received-Date: Wed, 11 Apr 2012 13:15:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Use bitbake -e your_recipe and check FILESPATH variable.


On Wed, Apr 11, 2012 at 12:52 PM, Giuseppe Condorelli
<giuseppe.condorelli@gmail.com> wrote:
> Many thanks for the reply, I tried the suggestion but I obtained this:
>
> "Unable to fetch URL file://myfile.tar.gz from any source"
>
> What's happening?
> Thanks,
> Giuseppe
>
> Il giorno mercoled=C3=AC 11 aprile 2012, Gary Thomas ha scritto:
>
>> On 2012-04-11 04:23, Giuseppe Condorelli wrote:
>>
>>> Hi, I moved to OE-Core (working on stable version dowloaded as tar file
>>> from cgit.openembedded.org).
>>> I'm in trouble trying to include a source through .bbappend file, locat=
ed
>>> under my meta-<personal> =C2=A0subtree.
>>>
>>> FILESPATHBASE_prepend :=3D "${THISDIR}/files:"
>>> SRC_URI +=3D "file://myfile.tar.gz"
>>>
>>> results in a no such file or directory. Please can you tell me if I'm
>>> missing anything?
>>>
>>
>> Assuming your tree looks something like this [partial]:
>>
>> =C2=A0meta-giuseppe:
>> =C2=A0 =C2=A0recipes:
>> =C2=A0 =C2=A0 =C2=A0some-recipe:
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0some-recipe_1.2.3.bbappend
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0files:
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0myfile.tar.gz
>>
>> Try using this instead
>> =C2=A0FILESEXTRAPATHS_prepend :=3D "${THISDIR}/files:"
>>
>> --
>> ------------------------------**------------------------------
>> Gary Thomas =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =
=C2=A0Consulting for the
>> MLB Associates =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =
=C2=A0Embedded world
>> ------------------------------**------------------------------
>>
>> ______________________________**_________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/**cgi-bin/mailman/listinfo/**openembedded-dev=
el<http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>
>>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


