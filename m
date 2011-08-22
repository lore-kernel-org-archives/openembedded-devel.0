Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1QvYCA-00047K-QO
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Aug 2011 19:21:54 +0200
Received: by gyg4 with SMTP id 4so3456755gyg.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Aug 2011 10:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=80isyhCXYbK3rciI5HvQj+WwXjj7X+AyOZpVZlHtUAs=;
	b=GqQj6P3SR7yIRCb4/drcSjtWwd14G43M0GnNT1SeVgQM1VwBd/tZHufuGuil3Alxcf
	AuyJLCqtL6Olbr8L0XKECQW0W7K4Vu0iiw6vWUfgBixeAJru19awTc3b+JCunqLBJzaU
	jaaos61bUV9M2DzFNrWhkrwlujjng/q7zIFaY=
MIME-Version: 1.0
Received: by 10.42.29.193 with SMTP id s1mr2628247icc.439.1314033430005; Mon,
	22 Aug 2011 10:17:10 -0700 (PDT)
Received: by 10.42.220.70 with HTTP; Mon, 22 Aug 2011 10:17:09 -0700 (PDT)
In-Reply-To: <1314033226.12202.25.camel@mattotaupa>
References: <1314023559-15827-1-git-send-email-noor_ahsan@mentor.com>
	<1314033226.12202.25.camel@mattotaupa>
Date: Mon, 22 Aug 2011 12:17:09 -0500
Message-ID: <CA+M6bXkBsGBX-AXAgWdjue=ZhPVrobExJDXJ9yijwb=QQw71FA@mail.gmail.com>
From: Tom Rini <tom.rini@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH][meta-oe] lmbench: Added 3.0-a9 version recipe files
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
X-List-Received-Date: Mon, 22 Aug 2011 17:21:55 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 22, 2011 at 12:13 PM, Paul Menzel
<paulepanter@users.sourceforge.net> wrote:
> Dear Noor,
>
>
> please try to incorporate the following comments when sending the next
> version.
>
> Am Montag, den 22.08.2011, 19:32 +0500 schrieb Noor, Ahsan:
>> From: Noor Ahsan <noor_ahsan@mentor.com>
>>
>> * Added recipe file to build 3.0-a9 version.
>
> Please do not duplicate the commit summary in the commit message body
> and please use present tense.
>
> =A0 =A0 =A0 =A0lmbench: Add version 3.0-a9 (initial recipe)
>
> =A0 =A0 =A0 =A0=95 imported from oe.dev (rev goes here)
>
> What build configuration do you use?
>
>> Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
>> ---
>> =A0.../lmbench-3.0-a9/update-results-script.patch =A0 =A0 | =A0155 +++++=
+++++++++++++++
>> =A0meta-oe/recipes-support/lmbench/lmbench_3.0-a9.bb =A0| =A0 75 +++++++=
+++
>> =A02 files changed, 230 insertions(+), 0 deletions(-)
>>
>> diff --git a/meta-oe/recipes-support/lmbench/lmbench-3.0-a9/update-resul=
ts-script.patch b/meta-oe/recipes-support/lmbench/lmbench-3.0-a9/update-res=
ults-script.patch
>> new file mode 100644
>> index 0000000..3feb657
>> --- /dev/null
>> +++ b/meta-oe/recipes-support/lmbench/lmbench-3.0-a9/update-results-scri=
pt.patch
>> @@ -0,0 +1,155 @@
>> +Now that we have our binaries in /usr/bin rather than the normal
>> +lmbench hierarchy we need to update the scripts as well to bave well he=
re.
>
> s/bave/behave/
>
> Did you send that patch upstream?

This is related to the OE-specific behavior of installing into
/usr/bin, etc, rather than dumping everything into /usr/share/lmbench
or similar.  For the Upstream-Status line :)

--=20
Tom


