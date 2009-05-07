Received: from [209.85.132.243] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1M29KX-0001jD-0I
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 May 2009 21:32:29 +0200
Received: by an-out-0708.google.com with SMTP id b6so551737ana.42
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 May 2009 12:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=u8chsNkER7kPTkmaeOVNo6fgfKSIxoLvqoRGeYIWKAc=;
	b=EyUbHHnEQp54qYijmd+5dGdS1306t4k38GqmZsHr01bHHqwoMvIcFlpucCC0+7rT47
	uLiUb2sNE9ixJl0vNYLJ8Ex8TkGJUmtnCvPV4N1s8mSd/568z3fZRbm3nUW/u4Z9eE1r
	+iHb9LWQxEOFr5agLCYqaOehVUdlhQQO4XzBc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=EE6p1M/WDIgNpc51KU5yLfTwvAdUsgPW5fOT2ga3d9E89PmOndUD7pGd97Yr9qKrEX
	IVFPZWMpMZJqqxAz7WUFfVmyWTcH5DFn30n83Gt/kkpSenodu4K04+dCUsl9RXzAfEFP
	GFtj2Hb7M9Nipgg8AlxYfQoW1kVtVb/++sYEs=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.100.43.10 with SMTP id q10mr6059620anq.144.1241724381157; Thu, 
	07 May 2009 12:26:21 -0700 (PDT)
In-Reply-To: <c384c5ea0905071218v3978ea4cpe791a5283f05c2df@mail.gmail.com>
References: <4A03277B.1090402@cbnco.com>
	<1241720835-17998-1-git-send-email-msmith@cbnco.com>
	<1241720835-17998-2-git-send-email-msmith@cbnco.com>
	<c384c5ea0905071218v3978ea4cpe791a5283f05c2df@mail.gmail.com>
Date: Thu, 7 May 2009 16:26:20 -0300
X-Google-Sender-Auth: 6705abf34a9d1e27
Message-ID: <be7a9f3d0905071226m78b94d44u50a4e63c927200f5@mail.gmail.com>
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
X-List-Received-Date: Thu, 07 May 2009 19:32:29 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On Thu, May 7, 2009 at 4:18 PM, Leon Woestenberg
<leon.woestenberg@gmail.com> wrote:
> Why do we install menu.cfg in ${libdir} anyway?
>
> All desktop distro's I have seen have the menu.lst in /boot/grub/ on the rootfs.

I second this change; it makes easier for people to find it.

-- 
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


