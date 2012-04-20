Received: from mail-qc0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SLEpB-00084D-Ay
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Apr 2012 16:28:37 +0200
Received: by qcso7 with SMTP id o7so5912118qcs.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Apr 2012 07:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=XVrwacnyIvTrPnzRquAju0158Fl6ipaFzxavVot19mM=;
	b=bAhbk3rtX0EHzZ0aCp6N6O9j/fuGjveSG4ZO3i596kcL5LMGR3uZy44KKO5U4dxmBg
	CUWbCfmGxJK2qqnAD/N/bbMbGMUuNRLCBI5ZtFhkM4mpbQqvFGd24ZkDEzhNU6evb6cl
	Vi6bBEAjAn/WVdtx5jD7EYnYdn2QbFd964B2qMm+4LuAov12pIM6CqfOziLyI/+2W0F2
	dTy8HpuNNRwB77Ou4FBCLrw3mnvRYMlXq9ZK4O8c71qdgqTLgNJMX+/eZbrMGslfBjk7
	89shA1MFyiV3Q0yrC5QNaNo0RyI1FnCPkgEQ4mC62pA6b3iSqKYkfhWjoVQzU0BZ5QQ9
	21oQ==
Received: by 10.224.108.193 with SMTP id g1mr7281725qap.7.1334931547255; Fri,
	20 Apr 2012 07:19:07 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.79.79 with HTTP; Fri, 20 Apr 2012 07:18:47 -0700 (PDT)
In-Reply-To: <4F916F96.8050901@mlbassoc.com>
References: <4F916294.6090706@mlbassoc.com>
	<CABcZAN=ATv+2NUzf1nNq6w1O4Kg+trD1S3kuKM0Eq4=yq4PL2Q@mail.gmail.com>
	<4F916F96.8050901@mlbassoc.com>
From: Chris Larson <clarson@kergoth.com>
Date: Fri, 20 Apr 2012 07:18:47 -0700
X-Google-Sender-Auth: momLsfLQa0IrIZDq3vNz3DzRwj0
Message-ID: <CABcZANmiQX8yWht6Sxm5Rer3e4OCG1NkJ7M=TdxoDGA=OGio5g@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: COMPATIBLE_MACHINE
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
X-List-Received-Date: Fri, 20 Apr 2012 14:28:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 20, 2012 at 7:15 AM, Gary Thomas <gary@mlbassoc.com> wrote:
> On 2012-04-20 08:04, Chris Larson wrote:
>>
>> On Fri, Apr 20, 2012 at 6:20 AM, Gary Thomas<gary@mlbassoc.com> =C2=A0wr=
ote:
>>>
>>> I'm writing a .bbappend for a recipe which contains a COMPATIBLE_MACHIN=
E
>>> pattern like this:
>>> =C2=A0COMPATIBLE_MACHINE =3D "(machine1|machine2|machine3)"
>>>
>>> Is there a way my .bbappend file can add to this pattern? =C2=A0I don't=
 want
>>> to disturb what's there, just add my machine as well.
>>
>>
>> It's just a standard regular expression.
>>
>> COMPATIBLE_MACHINE =3D "(machine1|machine2|machine3)"
>> COMPATIBLE_MACHINE .=3D "|machine4"
>>
>> Will result in a value of "(machine1|machine2|machine3)|machine4",
>> which is still a perfectly valid pattern, as far as I can tell.
>
>
> Yes, this does seem to work. =C2=A0Any clues why most uses of COMPATIBLE_=
MACHINE
> use the regex "(x|y|z)" instead of just "x|y|z"? =C2=A0Aren't they the sa=
me?

They are. No idea why people use the grouping.
--=20
Christopher Larson


