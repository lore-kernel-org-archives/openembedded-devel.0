Received: from [209.85.132.240] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1MPjZE-00076L-LD
	for openembedded-devel@lists.openembedded.org;
	Sat, 11 Jul 2009 22:53:08 +0200
Received: by an-out-0708.google.com with SMTP id c5so799809anc.42
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Jul 2009 13:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=cYzHJqFbn+W1SOL8rLUhzL5EVeZjN3iHhmqh5OEyyXk=;
	b=cpyT6/zXfGzsViaLkqeVRQd9f90IP3rafA2PVss69hHwZEcNUs7O+ALigq80o7Hjj3
	9kyhihvRLGV8nX3Ci6V1fob9pohzpn2vwT5p/FRnMroic1Aj6hYuWAZqoHJBgn5Muy+1
	Igq2qXh/tVdYQ0VdANfHrr2cVsEsVj6HcAUrU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=VlpPV3EPGmG1k6omzzWnJTy3zOOcfvQnJ2IldzIORWkMI3aX8CNimuN2L9eqbYPGmg
	xAroosKO0HwsGjMc+Yzeqswy439FVvlSa+GXLHO7dqWl6B3IMoxR2LiaO6SscsKPdiSd
	Xd1ZisA5UyBiGfHdHr+l8QwoHeqUHj7m/+4/M=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.100.4.8 with SMTP id 8mr4558207and.180.1247344808097; Sat, 11 
	Jul 2009 13:40:08 -0700 (PDT)
In-Reply-To: <4A5788F3.2080805@cbnco.com>
References: <4A5788F3.2080805@cbnco.com>
Date: Sat, 11 Jul 2009 17:40:08 -0300
X-Google-Sender-Auth: 50d486a5a6c5bdc6
Message-ID: <be7a9f3d0907111340p20b792ecod3874d59a8a0f183@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Building xserver-xorg 1.6.1 for i686: libtool error
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
X-List-Received-Date: Sat, 11 Jul 2009 20:53:09 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello Michael,

On Fri, Jul 10, 2009 at 3:31 PM, Michael Smith<msmith@cbnco.com> wrote:
[...]
> I worked around it with a symlink.
>
> Wondering if anyone has a pointer where I can look to solve it permanently.
> It looks like libtool.m4 is setting ofile=${host_alias}-libtool, but
> xserver-xorg's acinclude.m4 is "dolt, a replacement for libtool" and it
> doesn't have the same ideas about what libtool should be called.

http://lists.freedesktop.org/archives/xorg/2009-May/045835.html

Above goes the patch we have sent for inclusion on dolt GIT. I'll
pester upstream about it again ;-)

-- 
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


