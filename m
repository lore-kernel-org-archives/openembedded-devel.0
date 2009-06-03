Received: from [209.85.218.219] (helo=mail-bw0-f219.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ihar.hrachyshka@gmail.com>) id 1MBuOH-0003uv-Cu
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Jun 2009 19:36:41 +0200
Received: by bwz19 with SMTP id 19so151984bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Jun 2009 10:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=qZTuVB1M+bbAOFfL36Jb+/+hvjY8rPstC2cUtQfU31M=;
	b=RGQAXW1cTof8909Vyky/U+jGW8fh56ePU5uCa1pwhqQkpKm86fof0gNtkSL5kEcVLD
	E/b7v8Ez4Qu97+zkNZpgGSMTMMuT9RI26fF0dIon4nMhkAx2eenJ3rzvDH5DubLwyRrJ
	Umo0l9KPRN6vCosmUQg5yDk0cUq6NwSsQI6Uw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=cyQleGLovBpKVN4JEi3kgq/NMxvWCpGJx3FImVwOP/WfMRlFZpfsJgpUbBFi/7YDHZ
	Lcn0kp4CVkXa2leeDFNqQ43cxm3doyJmj4K/RmAGPnbaW2Pft1MfPZ6Ecbl7iX1vWl2l
	9IWUEbFH02dxXed3Cce9FUQYSo8u7MoX4u6IA=
MIME-Version: 1.0
Received: by 10.103.226.20 with SMTP id d20mr809494mur.8.1244050061111; Wed, 
	03 Jun 2009 10:27:41 -0700 (PDT)
In-Reply-To: <20090603161035.GL26065@smtp.west.cox.net>
References: <20090603151754.GI26065@smtp.west.cox.net>
	<1244043442-3868-1-git-send-email-ihar.hrachyshka@gmail.com>
	<20090603161035.GL26065@smtp.west.cox.net>
Date: Wed, 3 Jun 2009 20:27:41 +0300
Message-ID: <fce2a370906031027y1e28cc6cre5aad0a1465c806b@mail.gmail.com>
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
X-List-Received-Date: Wed, 03 Jun 2009 17:36:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 3, 2009 at 7:10 PM, Tom Rini <trini@embeddedalley.com> wrote:
> On Wed, Jun 03, 2009 at 06:37:10PM +0300, Ihar Hrachyshka wrote:
>
>> This patchset:
>> - adds meta-toolchain-qte.bb to install toolchain with Qt/Embedded and
>> =C2=A0 all the needed tools ready to use for qt4-embedded development;
>> - adds directfb support for qt4-embedded;
>> - includes missing files to qt4 packages;
>> - fixes code style, generalize qt4 recipes and classes, reworked directo=
ry
>> =C2=A0 layout;
>> - occasionally ports pkg-config to INC_PR.
>
> What machine / distro combinations have you tested all of this with, and
> what recipes (other than meta-toolchain-qte) have you explicitly built
> after? =C2=A0ie have you built / run some QtE images or similar too? =C2=
=A0Thanks.

I built and tested qt4-embedded (with directfb and linuxfb), meta-toolchain=
-qte.
I also built (but not tested) qt4-x11-free.
My machine is beagleboard.

>
> --
> Tom Rini
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


