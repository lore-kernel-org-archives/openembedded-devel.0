Received: from [74.125.46.154] (helo=yw-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1M2aoD-0000PT-Ol
	for openembedded-devel@lists.openembedded.org;
	Sat, 09 May 2009 02:52:57 +0200
Received: by yw-out-1718.google.com with SMTP id 9so1074558ywk.42
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 May 2009 17:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=hOg6J9f+yEJZ5lGFRjetMcmzagkQiVgIZGm1TyBvhSs=;
	b=tbfm57Y1svEM2mtbF7URs4g6Q9MavOBvtpD4D2+TZ9OXUlYrtXeKsR95p/b8Dc+TuS
	k3yyoYhc8shLf+x2OCSUVZYpNvcjJUKQJoBC4tIFbyc8h84yiysOyk0dYPFKBno4Vupw
	tYR+gRQtGehQiVLBe/eKqT+Q1sT3BSb25k1QI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=HOHzmok46RKGQugXVJBgiQtO5Wq+XePsp3+nC0wxm+46eMRZZjHzrNF1WqPlOIEzUB
	RDj8T4+wr4q0pv/RYQaeeptAovOv7UnvmPPcAQ3QK0aP6fWwDlR6jTZP9OmBn47q+NAR
	hlwrYpRE9LgfZ5urLfBSg/J1nWKN99jNO5Jm0=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.100.10.15 with SMTP id 15mr10190254anj.8.1241830002155; Fri, 
	08 May 2009 17:46:42 -0700 (PDT)
In-Reply-To: <c384c5ea0905081215j21443cdes8ab78f31d0bda632@mail.gmail.com>
References: <4A03277B.1090402@cbnco.com>
	<1241720835-17998-1-git-send-email-msmith@cbnco.com>
	<1241720835-17998-2-git-send-email-msmith@cbnco.com>
	<c384c5ea0905071218v3978ea4cpe791a5283f05c2df@mail.gmail.com>
	<be7a9f3d0905071226m78b94d44u50a4e63c927200f5@mail.gmail.com>
	<4A033D54.2000709@cbnco.com>
	<c384c5ea0905071305s1b180deal8c5fd09b5d646308@mail.gmail.com>
	<4A035FAB.4040405@cbnco.com>
	<be7a9f3d0905071835x5d551897l84bf64f9133c13e4@mail.gmail.com>
	<c384c5ea0905081215j21443cdes8ab78f31d0bda632@mail.gmail.com>
Date: Fri, 8 May 2009 21:46:42 -0300
X-Google-Sender-Auth: 3392b30c886b5b00
Message-ID: <be7a9f3d0905081746g6856c083s5ac317ddb8735b7e@mail.gmail.com>
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
X-List-Received-Date: Sat, 09 May 2009 00:52:58 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello Leon,

On Fri, May 8, 2009 at 4:15 PM, Leon Woestenberg
<leon.woestenberg@gmail.com> wrote:
[...]
>> I'd say that technically speaking grub2 is the right choose for OE
>> since it will demand less work to maintain and keep it up to date.
>>
> GRUB1 just works - no need to maintain (unless new filesystems appear
> - I think btrfs etc.).
[...]

Oh really? So please, take a look in the following list of GRUB know bugs:

http://bugs.debian.org/cgi-bin/pkgreport.cgi?src=grub

This is quite easy to notice that it does not "Just works". And I'm
one of GRUB maintainers in Debian so I know what I'm talking about.

-- 
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


