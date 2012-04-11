Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <giuseppe.condorelli@gmail.com>) id 1SHvJ5-00078N-OU
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Apr 2012 13:01:47 +0200
Received: by iaag37 with SMTP id g37so1157430iaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Apr 2012 03:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=f1r2r9bMSYtW+b3jnoziEheiBowKLJsLH+kT7xhVFnA=;
	b=hiTJY9pYELdVRfRf+bXq30pyqR1EcT8k1vrv/HVliK1lJKgmbhoEM0rI7+q/gMHTmQ
	i/6Hof9S6wfiLqpo69VY9tWeuJX+5mxtTqvECOxt/0D/3cQiWdXdrD9gvqTpCT0SeqBU
	XjfmbSoAGM33oCmzrCiAXGed0+1trbMjIeWpeQ+e60O0jrr8pEN9qbxTHCtOV2imQyH2
	5ZOa1GqCNBFJIAxHvMPhxTDAPbA18saiEiABFVUcNpBs3JYbnLzzb8jUp3OOg4KXCQK4
	LaKg55GtNIyhEqDBwSZ7+RCIItv1SenYrtVDx7ayxSNCcSnhtADu6aDMlPdxc16YhXYb
	71+w==
MIME-Version: 1.0
Received: by 10.50.153.198 with SMTP id vi6mr5135337igb.0.1334141548499; Wed,
	11 Apr 2012 03:52:28 -0700 (PDT)
Received: by 10.231.170.15 with HTTP; Wed, 11 Apr 2012 03:52:28 -0700 (PDT)
In-Reply-To: <4F855F1A.6090700@mlbassoc.com>
References: <CAOHjBZuGf-wG2jpSR1R9sM_KawN+5H9ZS_ivikYgfMvLJVVtXQ@mail.gmail.com>
	<4F855F1A.6090700@mlbassoc.com>
Date: Wed, 11 Apr 2012 12:52:28 +0200
Message-ID: <CAOHjBZssQBxkwe-qpTQz8mubiB1tAZ5ohKbhFapw3BqiYxqA7g@mail.gmail.com>
From: Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
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
X-List-Received-Date: Wed, 11 Apr 2012 11:01:48 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Many thanks for the reply, I tried the suggestion but I obtained this:

"Unable to fetch URL file://myfile.tar.gz from any source"

What's happening?
Thanks,
Giuseppe

Il giorno mercoled=EC 11 aprile 2012, Gary Thomas ha scritto:

> On 2012-04-11 04:23, Giuseppe Condorelli wrote:
>
>> Hi, I moved to OE-Core (working on stable version dowloaded as tar file
>> from cgit.openembedded.org).
>> I'm in trouble trying to include a source through .bbappend file, locate=
d
>> under my meta-<personal>  subtree.
>>
>> FILESPATHBASE_prepend :=3D "${THISDIR}/files:"
>> SRC_URI +=3D "file://myfile.tar.gz"
>>
>> results in a no such file or directory. Please can you tell me if I'm
>> missing anything?
>>
>
> Assuming your tree looks something like this [partial]:
>
>  meta-giuseppe:
>    recipes:
>      some-recipe:
>        some-recipe_1.2.3.bbappend
>        files:
>          myfile.tar.gz
>
> Try using this instead
>  FILESEXTRAPATHS_prepend :=3D "${THISDIR}/files:"
>
> --
> ------------------------------**------------------------------
> Gary Thomas                 |  Consulting for the
> MLB Associates              |    Embedded world
> ------------------------------**------------------------------
>
> ______________________________**_________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/**cgi-bin/mailman/listinfo/**openembedded-deve=
l<http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>
>

