Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <giuseppe.condorelli@gmail.com>) id 1SHxgr-0002lB-9e
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Apr 2012 15:34:29 +0200
Received: by ghbz2 with SMTP id z2so408038ghb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Apr 2012 06:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=references:from:in-reply-to:mime-version:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=Pz9jTyBSBbnoAGwv/lWenrwcTa1DwCkc7KEBB0ESryQ=;
	b=v6pez7zKxu16M6rPYrC10NYyAmDckwkYzactmYZgRpGN9/Z+mW4VzpmaK6cCgThKy2
	n6VK1NF8S2s6jXk2G1e8/XLbkGr/SwbT13U8NN8iD6dKAc6jm0DV5NRB7NufPw1K3o7D
	gUbxTZfy9c/bSVPvhf1A4JYVwy/yfco+VFmyR7SoEJau+ekhCevTrV1LHGG06vCG7gPk
	X5eQLytsOWRItrbFp0eg0lmA2///qWoVD6RUzZn9UVy9yCHL8hT9MAblHuFHZkQ5bCOD
	E0EZ3lO7AhTKxwao4vkx4MpKwM6nROiSwBKsoYq0quwRhUN8+ezWA4abRpKqWQmk1eZ9
	Sh9A==
Received: by 10.50.212.97 with SMTP id nj1mr1978592igc.65.1334150709945; Wed,
	11 Apr 2012 06:25:09 -0700 (PDT)
References: <CAOHjBZuGf-wG2jpSR1R9sM_KawN+5H9ZS_ivikYgfMvLJVVtXQ@mail.gmail.com>
	<4F855F1A.6090700@mlbassoc.com>
	<CAOHjBZssQBxkwe-qpTQz8mubiB1tAZ5ohKbhFapw3BqiYxqA7g@mail.gmail.com>
	<CA+chaQfoxtqA5QgaCy6cgaf27MsMLCLXc=5MO-Dj9263scEeeQ@mail.gmail.com>
From: Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
In-Reply-To: <CA+chaQfoxtqA5QgaCy6cgaf27MsMLCLXc=5MO-Dj9263scEeeQ@mail.gmail.com>
Mime-Version: 1.0 (1.0)
Date: Wed, 11 Apr 2012 15:25:07 +0200
Message-ID: <940168466624837829@unknownmsgid>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Wed, 11 Apr 2012 13:34:29 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

No FILESPATH in the log after bitbake -e <recipe> command.
But... it's ok running scripts/bitbake instead of the binary one as I'm doi=
ng?

Il giorno 11/apr/2012, alle ore 15:07, Martin Jansa
<martin.jansa@gmail.com> ha scritto:

> Use bitbake -e your_recipe and check FILESPATH variable.
>
>
> On Wed, Apr 11, 2012 at 12:52 PM, Giuseppe Condorelli
> <giuseppe.condorelli@gmail.com> wrote:
>> Many thanks for the reply, I tried the suggestion but I obtained this:
>>
>> "Unable to fetch URL file://myfile.tar.gz from any source"
>>
>> What's happening?
>> Thanks,
>> Giuseppe
>>
>> Il giorno mercoled=EC 11 aprile 2012, Gary Thomas ha scritto:
>>
>>> On 2012-04-11 04:23, Giuseppe Condorelli wrote:
>>>
>>>> Hi, I moved to OE-Core (working on stable version dowloaded as tar fil=
e
>>>> from cgit.openembedded.org).
>>>> I'm in trouble trying to include a source through .bbappend file, loca=
ted
>>>> under my meta-<personal>  subtree.
>>>>
>>>> FILESPATHBASE_prepend :=3D "${THISDIR}/files:"
>>>> SRC_URI +=3D "file://myfile.tar.gz"
>>>>
>>>> results in a no such file or directory. Please can you tell me if I'm
>>>> missing anything?
>>>>
>>>
>>> Assuming your tree looks something like this [partial]:
>>>
>>>  meta-giuseppe:
>>>    recipes:
>>>      some-recipe:
>>>        some-recipe_1.2.3.bbappend
>>>        files:
>>>          myfile.tar.gz
>>>
>>> Try using this instead
>>>  FILESEXTRAPATHS_prepend :=3D "${THISDIR}/files:"
>>>
>>> --
>>> ------------------------------**------------------------------
>>> Gary Thomas                 |  Consulting for the
>>> MLB Associates              |    Embedded world
>>> ------------------------------**------------------------------
>>>
>>> ______________________________**_________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.linuxtogo.org/**cgi-bin/mailman/listinfo/**openembedded-de=
vel<http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>
>>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


