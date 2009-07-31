Received: from [209.85.221.197] (helo=mail-qy0-f197.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1MWrZ6-0008LC-A3
	for openembedded-devel@lists.openembedded.org;
	Fri, 31 Jul 2009 14:50:28 +0200
Received: by qyk35 with SMTP id 35so2659199qyk.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jul 2009 05:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=HgqbhzYl7zEJKySLyVYb6Ah7DX3SWuSuAFmiaN1qLpU=;
	b=WGNN99QqQTeNPKS5P29uMJHDlnWNinLz5PcAS33gzktK9RtQCLgopCkspw8Ggy/hvZ
	UcOlYOXHGqz+vcNRB+O44bore2zDWegc0U1WyNiLjv41f6yV3n8PTkW7hUKUU+yQxVEr
	j0Kf3Hxb2rnUrO9As9o44yISKDm314tOgfK0c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=W9BBVoLdIQ1C08yS3LBA/yoAQtijvRyLO2TbApk8OXKwTytLaJG3Wie//kYHw7QUaI
	jpxeggmA5bEBjZlLmexTKDjXHEi9gMHJEeVVu+q+d0RSF9a2NxDIJ08yZIR1vSWCsw2b
	5w4X9cJ4PF66Bp2cXaDW4+elynNYqjXQm7FNo=
MIME-Version: 1.0
Received: by 10.229.96.15 with SMTP id f15mr459924qcn.91.1249043719620; Fri, 
	31 Jul 2009 05:35:19 -0700 (PDT)
In-Reply-To: <4A72D676.6060304@xora.org.uk>
References: <4A6FD077.1060001@gmail.com>
	<200907291131.04967.marcin@juszkiewicz.com.pl>
	<6ec4247d0907292211w6afc1f60s9fcf21bc7b2d56d3@mail.gmail.com>
	<20090730053353.GF25691@smtp.west.cox.net>
	<6ec4247d0907292249k42c582ddid3d53e847c5f835d@mail.gmail.com>
	<4A7160F2.8030000@xora.org.uk> <4A7255D3.9020703@gmail.com>
	<4A729943.4060200@xora.org.uk> <4A729FF4.3040600@gmail.com>
	<4A72D676.6060304@xora.org.uk>
Date: Fri, 31 Jul 2009 22:05:19 +0930
Message-ID: <6ec4247d0907310535h345a22a9sfe98c6cae8336aaf@mail.gmail.com>
From: Graham Gower <graham.gower@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] remove duplicated code from linux.inc
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
X-List-Received-Date: Fri, 31 Jul 2009 12:50:28 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

And for those playing at home, the value to assign to UBOOT_ENTRYSYM
for a given arch can be found by grepping
linux/arch/${ARCH}/kernel/vmlinux.lds.S for 'ENTRY'.

-Graham


