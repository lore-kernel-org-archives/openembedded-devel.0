Received: from [209.85.218.171] (helo=mail-bw0-f171.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ihar.hrachyshka@gmail.com>) id 1M8fE0-000429-8u
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 May 2009 20:48:40 +0200
Received: by bwz19 with SMTP id 19so3287003bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 May 2009 11:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=G6ft13uGoY41nRNgfvWuGlau186lG5ZO/Awuiu1zjcY=;
	b=PjDX6Dd4NN3d+NTMkn9zO9Iub91OoKnMS8pHockkZhIb7hlVC4RhTmN54Fj3+CBSXF
	ccSkYq2EJdud5QIox42Gw6MshbDq/kUMSppJYYyo5DtHWn7Dt7SsCFbw7vwZe6/gvNB1
	vPCVb0OfK28kdzm7SYV4pfPYe4Z/PUOtEtKAc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=abO/R3/jMQKv69WEdvPr03DucK4ygi2JDKCP2w5kQog5e3jRWrhuDHObjnrt2F036V
	3Zb2+PZIBFMzIkGMKT17wPJ/mPtXD7GeEb4awqqHaxUg1s3VSiLd6GFwV7QMWXuK0yAs
	ewnV+LVECbNMVGtNXzbvreJNw7F6kvHdLoueM=
MIME-Version: 1.0
Received: by 10.103.213.10 with SMTP id p10mr3875169muq.17.1243276836527; Mon, 
	25 May 2009 11:40:36 -0700 (PDT)
In-Reply-To: <be7a9f3d0905250938t4abdb286gee1501f1de1b536d@mail.gmail.com>
References: <1243189985-19060-1-git-send-email-ihar.hrachyshka@gmail.com>
	<1243192690.4869.8.camel@lenovo.internal.reciva.com>
	<20090525020608.GR23842@smtp.west.cox.net>
	<be7a9f3d0905250938t4abdb286gee1501f1de1b536d@mail.gmail.com>
Date: Mon, 25 May 2009 21:40:36 +0300
Message-ID: <fce2a370905251140q6116db65h14b021d6e6cf040c@mail.gmail.com>
From: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 1/2] udev: fixed obsolete udevadm syntax for udev init.d script.
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
X-List-Received-Date: Mon, 25 May 2009 18:48:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, May 25, 2009 at 7:38 PM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> Hello Tom,
>
> On Sun, May 24, 2009 at 11:06 PM, Tom Rini <trini@embeddedalley.com> wrot=
e:
>> I disagree. =C2=A0There are, I assume, things that could be done on top =
of
>> the -141 script as further enchancements/cleanups that would not apply
>> to -124. =C2=A0But keeping older files in sync, so long as (a) it works =
and
>> (b) the older version is cared about makes future buging easier, I've
>> found.
>
> I also disagree but due different reasons. I believe we ought to drop
> the old version except if there're a real reason to keep it around.
> For udev 124 I think there's no reason for it to be kept (maybe I'm
> missing something here).

Some distros still prefer this version. I think that's the reason you misse=
d.

>
> Obviously this ought to be done in dev, not stable, but it can make
> our life easier and avoid us to need to care about so many recipes.
> The final result is that old versions usually has ugly and unknown
> bugs that noone cares about.

If someone prefer the version then we should consider it as needed. Or
drop the obsolete distro (btw I think it's a good thing to drop
obsolete infrastructure things for which maintainers are too "busy" to
sync their third-party gits with upstream).

>
> --
> Otavio Salvador =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0O.S. Systems
> E-mail: otavio@ossystems.com.br =C2=A0http://www.ossystems.com.br
> Mobile: +55 53 9981-7854 =C2=A0 =C2=A0 =C2=A0 =C2=A0 http://projetos.ossy=
stems.com.br
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


