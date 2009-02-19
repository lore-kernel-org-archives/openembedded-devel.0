Received: from [209.85.218.165] (helo=mail-bw0-f165.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1LaBwK-0007fD-Tl
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Feb 2009 17:39:57 +0100
Received: by bwz9 with SMTP id 9so1272038bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Feb 2009 08:37:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:received:from:to:cc
	:subject:organization:references:user-agent:x-url:x-attribution:date
	:in-reply-to:message-id:mime-version:content-type;
	bh=mNRTkD/V7dzWGifohweHhEl+5tYJ7MuJPnq+aWlQYps=;
	b=ReRyfwi4zivaJMNsXo+5h9PboF1cVFAXfMa0waOHWCvhRlm4V8AxfD8lyh6ZFfmZbg
	a51TFq9MCAtuOqIMlooztfLYEjzh29ZFgilkj6/JSVMXocvGiSqfzllv4XygYHsqM7QJ
	notM1TSodm1BlP2gW74E5JI/5i8UbsTHeW1L8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:organization:references:user-agent:x-url
	:x-attribution:date:in-reply-to:message-id:mime-version:content-type;
	b=X+osj8pDPVGD05YuoBdEmQAE+Fr5qU4dKHy5ptG5/BEF+ILjBD3xk0gXIJK7ZOKxH7
	IfuR5Px0gMdzzLvHclpVCzl2Ux0Kz/hoAvP+i6IZ4Vm61TWjnfOOwhStrL2u6kahU7PJ
	+Po8kR85qYgE4d8nzPz6Xjs1oQs6UQWVxfDSE=
Received: by 10.103.225.11 with SMTP id c11mr714753mur.24.1235061455872;
	Thu, 19 Feb 2009 08:37:35 -0800 (PST)
Received: from ossystems.com.br (201-40-162-47.cable.viacabocom.com.br
	[201.40.162.47])
	by mx.google.com with ESMTPS id i7sm1043321mue.14.2009.02.19.08.37.33
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 19 Feb 2009 08:37:35 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by ossystems.com.br (Postfix, from userid 1000)
	id CF548610047; Thu, 19 Feb 2009 13:37:27 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Organization: O.S. Systems Ltda.
References: <1235045523-6405-1-git-send-email-k.kooi@student.utwente.nl>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.0.90 (gnu/linux)
	(x86_64-pc-linux-gnu)
X-URL: http://www.ossystems.com.br/
X-Attribution: O.S.
Date: Thu, 19 Feb 2009 13:37:27 -0300
In-Reply-To: <1235045523-6405-1-git-send-email-k.kooi@student.utwente.nl>
	(Koen Kooi's message of "Thu, 19 Feb 2009 13:12:03 +0100")
Message-ID: <87tz6qjsc8.fsf@neumann.lab.ossystems.com.br>
MIME-Version: 1.0
Cc: Koen Kooi <koen@openembedded.org>
Subject: Re: [PATCH] task-boot: rename DISTRO_ vars to IMAGE_ vars and move to image.bbclass
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
X-List-Received-Date: Thu, 19 Feb 2009 16:40:13 -0000
Content-Type: text/plain; charset=us-ascii

Koen Kooi <k.kooi@student.utwente.nl> writes:

> From: Koen Kooi <koen@openembedded.org>
>
> ---
>  classes/image.bbclass         |   22 ++++++++++++++++++++++
>  conf/distro/kaeilos.conf      |    2 +-
>  conf/distro/openmoko.conf     |    2 +-
>  conf/distro/openprotium.conf  |    6 +++---
>  conf/machine/mx31moboard.conf |    2 +-
>  packages/tasks/task-boot.bb   |   22 +---------------------
>  6 files changed, 29 insertions(+), 27 deletions(-)

[...]

+1

-- 
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


