Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1QjBx0-0003C2-4m
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Jul 2011 17:11:10 +0200
Received: by vxh2 with SMTP id 2so2718443vxh.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jul 2011 08:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=qcK7pY3dAkVVF5H2VwhJkY2ccOy1eszh3uB4571yIHY=;
	b=Swz3hLSwsUIz8RMf47ctze6ClTBJpfNfEnrxzN4z60u0l6v18en61pMlUtZ02RZqs6
	iuAHCI0dJXTN3Hj72MHghpBc6BiMzhGBDCQZd2ABRquDrgGumrwQsnXTWFkq8m2TjfZs
	3kj2vVtXxgX2wSZM6MTvMTiWvDQe5ATu4Q9zk=
Received: by 10.52.73.234 with SMTP id o10mr3149650vdv.174.1311088024091; Tue,
	19 Jul 2011 08:07:04 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.52.181.104 with HTTP; Tue, 19 Jul 2011 08:06:43 -0700 (PDT)
In-Reply-To: <4E253020.4050001@vollmann.ch>
References: <4E248688.1030902@vollmann.ch> <4E249F56.8030907@vollmann.ch>
	<CABcZANnmZwTK147Vwgv8j9omd7xNQQK5EKT99_UEctC2itw3Jw@mail.gmail.com>
	<4E253020.4050001@vollmann.ch>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 19 Jul 2011 08:06:44 -0700
X-Google-Sender-Auth: lUlDUBJ3UFERc30B3mWG2qU1e-4
Message-ID: <CABcZANmEtiVPuYE_RQ4A9kupeEagt2LT7EGF1nkTK2YAKQvVaA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: preferred version not available
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
X-List-Received-Date: Tue, 19 Jul 2011 15:11:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 19, 2011 at 12:20 AM, Detlef Vollmann <dv@vollmann.ch> wrote:
> On 07/18/11 23:05, Chris Larson wrote:
>>
>> On Mon, Jul 18, 2011 at 2:02 PM, Detlef Vollmann<dv@vollmann.ch> =C2=A0w=
rote:
>>>
>>> Ok, I found the problem: PREFERRED_VERSION refers to PV inside
>>> the recipe, not to the part of the filename after '_'.
>>> As I tinker with PV inside the recipe, bitbake is actually correct
>>> that a PV 'githead' is not available for linux-taurus.
>>
>> All variables which are typically set by the filename can be
>> overridden. Those are simply defaults. See the definitions of PN, PV,
>> and PR in bitbake.conf.
>
> Yes, I knew that (I actually wrote the line changing the PV myself).
> What surprised me (though it makes sense) that PREFERRED_VERSION
> refers to PV, and not directly to a part of the filename.

I'm not sure why that would be surprising. PN, PV, and PR are what are
used. The fact that they default to being based on the filename is
just an artifact of how oe does things. You could quite easily change
that, and make it required to set them all in the recipe. Bitbake does
*not* care about the filename, other than in determining what bbappend
to apply to the recipe when an append exists.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


