Received: from [209.85.220.220] (helo=mail-fx0-f220.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ihar.hrachyshka@gmail.com>) id 1MENaG-0007YV-J5
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Jun 2009 15:11:16 +0200
Received: by fxm20 with SMTP id 20so743873fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Jun 2009 06:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=hzzGyPFz8mv55JBUdGIUiYiJ+0ZYJEAAPsLZJ4RsW8k=;
	b=ZBSdHcKaVg0rFnLjsZ0i4MGSIH7r49/kt3MNFgKym6LaMZ0p8E9bKuKr8j4/JxENhI
	Uhz3CilzIOtOV6skeAne7veBtH70GxREAfQUCSoSWndoCthVLSppVv/+5FDCrutQUBcX
	Ss0bO3NaBbRCYc6Nn5B8wjYkqb7XKeX43guMs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=XAedD/YCre1AHLH4tOiUal+IevhgfWbl8lRB2AaU+vkGJzC43KfvXn4r7qAnQy+ukj
	fmxAXNNUgzb9dl0Dl5PJvbqc+jQOr2KTp8U6JB2F1TEUZ47P1ZVu2va9vhtyGw7DDTgX
	ZTl8kVnqCe7UjckNOo37MKeJ63ZI+oR9aI7/Q=
MIME-Version: 1.0
Received: by 10.103.52.13 with SMTP id e13mr688249muk.46.1244638892336; Wed, 
	10 Jun 2009 06:01:32 -0700 (PDT)
In-Reply-To: <20090610032957.GA6080@denix.org>
References: <20090603151754.GI26065@smtp.west.cox.net>
	<1244043442-3868-1-git-send-email-ihar.hrachyshka@gmail.com>
	<20090603161035.GL26065@smtp.west.cox.net>
	<fce2a370906031027y1e28cc6cre5aad0a1465c806b@mail.gmail.com>
	<fce2a370906070940i3f5d7faud81d010af727b66a@mail.gmail.com>
	<20090610024002.GR26065@smtp.west.cox.net>
	<20090610032957.GA6080@denix.org>
Date: Wed, 10 Jun 2009 16:01:32 +0300
Message-ID: <fce2a370906100601p2fac7611ufae4763413f87ea1@mail.gmail.com>
From: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 00/12] different qt4 related patches
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
X-List-Received-Date: Wed, 10 Jun 2009 13:11:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 10, 2009 at 6:29 AM, Denys Dmytriyenko<denis@denix.org> wrote:
> On Tue, Jun 09, 2009 at 07:40:03PM -0700, Tom Rini wrote:
>> On Sun, Jun 07, 2009 at 07:40:52PM +0300, Ihar Hrachyshka wrote:
>> > On Wed, Jun 3, 2009 at 8:27 PM, Ihar
>> > Hrachyshka<ihar.hrachyshka@gmail.com> wrote:
>> > > On Wed, Jun 3, 2009 at 7:10 PM, Tom Rini <trini@embeddedalley.com> w=
rote:
>> > >> On Wed, Jun 03, 2009 at 06:37:10PM +0300, Ihar Hrachyshka wrote:
>> > >>
>> > >>> This patchset:
>> > >>> - adds meta-toolchain-qte.bb to install toolchain with Qt/Embedded=
 and
>> > >>> =C2=A0 all the needed tools ready to use for qt4-embedded developm=
ent;
>> > >>> - adds directfb support for qt4-embedded;
>> > >>> - includes missing files to qt4 packages;
>> > >>> - fixes code style, generalize qt4 recipes and classes, reworked d=
irectory
>> > >>> =C2=A0 layout;
>> > >>> - occasionally ports pkg-config to INC_PR.
>> > >>
>> > >> What machine / distro combinations have you tested all of this with=
, and
>> > >> what recipes (other than meta-toolchain-qte) have you explicitly bu=
ilt
>> > >> after? =C2=A0ie have you built / run some QtE images or similar too=
? =C2=A0Thanks.
>> > >
>> > > I built and tested qt4-embedded (with directfb and linuxfb), meta-to=
olchain-qte.
>> > > I also built (but not tested) qt4-x11-free.
>> > > My machine is beagleboard.
>> >
>> > What's the status of the patchset? Is there any problems pending befor=
e commit?
>>
>> I have no problem and Acked-by the whole series. =C2=A0I do not however,=
 have
>> time to commit this right now, sorry. =C2=A0But anyone else, please feel=
 free
>> to add:
>> Acked-by: Tom Rini <trini@embeddedalley.com>
>>
>> And push.
>
> Acked and pushed. Patchwork updated. Thanks.

Thanks!

>
> --
> Denys
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


