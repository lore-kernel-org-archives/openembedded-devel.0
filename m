Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1RXaVp-0004zW-AL
	for openembedded-devel@lists.openembedded.org;
	Mon, 05 Dec 2011 16:31:25 +0100
Received: by ywb20 with SMTP id 20so4357439ywb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Dec 2011 07:24:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=/ZH4lPGOPQrVkqM/QSDz4S4LzKLGLInFmpUIDsMCvGk=;
	b=cTCJcFjnyaowy+EGIOBE3dVN/4sc1/s3Df1BY6tvoyrLIQ2OKReNJpo4dv5IXp/vQb
	p/Cm1BMl2U9Dlb6grXE/dgTkyuCmfimnqEMWR2RuekpozgpKi2/LZSwpxEIaEOftQltN
	CCy6x7ZctRY9AUqffSeEjaBWV3xYWyW/4weOU=
MIME-Version: 1.0
Received: by 10.236.191.5 with SMTP id f5mr12375628yhn.122.1323098676006; Mon,
	05 Dec 2011 07:24:36 -0800 (PST)
Received: by 10.150.202.10 with HTTP; Mon, 5 Dec 2011 07:24:35 -0800 (PST)
In-Reply-To: <20111017071406.GF12684@jama.jama.net>
References: <CAAQYJAt+o+Wcp1aSa5pxSd_FAHYVJv-ZYLfKLYUt6n+tdkjjQw@mail.gmail.com>
	<20111017071406.GF12684@jama.jama.net>
Date: Mon, 5 Dec 2011 16:24:35 +0100
Message-ID: <CAAQYJAuLcwC8p6HoOkXhH3neC0pofi5z_1GNCpwWB=pA73bPsQ@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: xserver-common and x11-common conflicting
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
X-List-Received-Date: Mon, 05 Dec 2011 15:31:25 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 17, 2011 at 9:14 AM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> On Mon, Oct 17, 2011 at 12:42:08AM +0200, Andrea Adami wrote:
>> Hello,
>>
>> using oe-core and meta-oe my xserver settings are "touched" by two packa=
ges:
>>
>> xserver-common: seems more complete, provides some xmodmaps (should be i=
n
>> BSP layers). Though it invocates fbset which is not in path.
>> x11-common: needs maybe care but is using the formfactor settings from B=
SP
>> so obviously is more modular
>>
>> I suppose once the merge is finished we'll have sane default settings.
>> (atm the xserver-common is providing some extra cruft)
>
> It was part of my original xorg patchset, but it needed more work
> (rework ROOTLESS_X) and you wanted xorg in oe-core faster :).
>
> --
> Martin 'JaMa' Jansa =A0 =A0 jabber: Martin.Jansa@gmail.com
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

Well, I verified the issue is still open and that xserver-nodm-init
have diverged even more.
In practice if I don't mask the one in meta-oe the xserver does start
and immediately shut down.

Now, it would be nice if those remaining bits could be
merged...unfortunately I lack the knowledge about intrinsic relations
with initscripts/systemd. I'm ready to test and perhaps debug once
committed, though.

Regards

Andrea


