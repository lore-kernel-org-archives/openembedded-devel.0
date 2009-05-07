Received: from [74.125.44.152] (helo=yx-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1M29ti-00036R-PQ
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 May 2009 22:08:50 +0200
Received: by yx-out-1718.google.com with SMTP id 36so600122yxh.42
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 May 2009 13:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=2DBqfOGDIj23V18lpBU0cP5G4VIKuy5x3RZdLoc62rg=;
	b=I4wY5cQEJJt0DT61P85nfqxv9woh2dGB6sK67poN5IzUTQeq6fGqH39tvDTToiTdLs
	Vmqe91GKVB9NxOyBr3aZsfiN1BOVNWUJFVNvkS+bEH6nzgi6bjNPuegDAo3jcrpru/bm
	RudnSbmtKEsO71JShtqGqkdpow39rWo6Brswc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=gAAc24wUZiFvayZQ1/WADvsIqdUdX4zaQSZz5E2+C/kmru10a5pbpMqbhzKVf8sV0A
	EyyK9Wxk9vchZRyBuiz47fCP12lQmGLVUVAeBiVGf2+oouvUsxZ2xvkjuc/OCcSFA4gY
	R8WVnpu0odaXo/Xv7RNT36XItTgtx7ZeohGZA=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.100.58.19 with SMTP id g19mr6010778ana.150.1241726556257; Thu, 
	07 May 2009 13:02:36 -0700 (PDT)
In-Reply-To: <4A033D54.2000709@cbnco.com>
References: <4A03277B.1090402@cbnco.com>
	<1241720835-17998-1-git-send-email-msmith@cbnco.com>
	<1241720835-17998-2-git-send-email-msmith@cbnco.com>
	<c384c5ea0905071218v3978ea4cpe791a5283f05c2df@mail.gmail.com>
	<be7a9f3d0905071226m78b94d44u50a4e63c927200f5@mail.gmail.com>
	<4A033D54.2000709@cbnco.com>
Date: Thu, 7 May 2009 17:02:36 -0300
X-Google-Sender-Auth: 58431ce89d4b6ddb
Message-ID: <be7a9f3d0905071302w6c4f54bbye6f7f9e71bde8853@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 2/3] grub: use ${libdir}, not /usr/lib
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
X-List-Received-Date: Thu, 07 May 2009 20:08:51 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello Michael,

On Thu, May 7, 2009 at 4:58 PM, Michael Smith <msmith@cbnco.com> wrote:
> I would prefer to install all the files to /boot/grub rather than /usr/lib,
> since that's where they're used. I'll have to check if the grub install
> script is OK with that.

To be able to do that you'd need to add a link for /usr/lib otherwise
you'd need to mangle grub-install script.

Another thing, since we're revamping GRUB packaging, why not move to
grub2? It also has the benefit of providing multi-arch support and
being active.

-- 
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


