Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RsGCz-0007M9-Gd
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 Jan 2012 17:05:25 +0100
Received: by lahc1 with SMTP id c1so87725lah.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Jan 2012 07:57:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=rv2u/MYrO8BB90GPvGPnktJFh8qZMHfBE1ygQpv4CIg=;
	b=Gd0fZMlF/nl8xaIjfy+fDIbm379MNHc2OVuqCI5Xx+9JrohuPBA30lexoZbqq8iwmS
	8gsFYSCOsTa95QCkiVm/iVaiDLJyuUimJIY92l/dCA5D2U8ouQSb92LwfB68GMbiXRZU
	kxHD27l2vzq/hjlcBr9EEBBU/thkKa1auINug=
MIME-Version: 1.0
Received: by 10.152.114.169 with SMTP id jh9mr11309852lab.20.1328025451645;
	Tue, 31 Jan 2012 07:57:31 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.112.46.199 with HTTP; Tue, 31 Jan 2012 07:57:31 -0800 (PST)
In-Reply-To: <1328022931.3975.15.camel@mattotaupa>
References: <1328022931.3975.15.camel@mattotaupa>
Date: Tue, 31 Jan 2012 13:57:31 -0200
X-Google-Sender-Auth: -ZY-_ZO2GQu176av8IRA6EOGDzI
Message-ID: <CAP9ODKo-60CK_fRaVGZ6obUtMT3Um40ZAwRFPPENS0LdO9g7pA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Board support package (BSP) layers/distributions for Geode LX800
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
X-List-Received-Date: Tue, 31 Jan 2012 16:05:25 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Jan 31, 2012 at 13:15, Paul Menzel <
paulepanter@users.sourceforge.net> wrote:

> searching for a suited build configuration for a Geode LX800 based
> system I could only find the discussion about creating a BSP layer for
> it [1]. Was this layer created? I could not find it anywhere.
>

Not that I am aware of but I do have interest in help with it.


> Additionally could you give recommendations which build configuration is
> suited for a Geode system? Especially with OE-Core as the base. Did
> someone test the latest OE stuff with a Geode LX800 system recently?


We use it in one of our products; I have geode Xorg driver packaged and
working here and can contribute it for sure. For kernel, we have a generic
x86 machine definition so we don't have a defconfig for it currently but it
should be easy to do. IMO it would be nice to use linux-yocto for it as it
is well supported mainline nowadays.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

