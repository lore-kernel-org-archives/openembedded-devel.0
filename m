Received: from mail-pw0-f53.google.com ([209.85.160.53])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gregoiregentil@gmail.com>) id 1NEkr1-0007qU-8m
	for openembedded-devel@lists.openembedded.org;
	Sun, 29 Nov 2009 15:34:26 +0100
Received: by pwj11 with SMTP id 11so1701872pwj.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Nov 2009 06:32:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:subject:from:reply-to
	:to:in-reply-to:references:content-type:organization:date:message-id
	:mime-version:x-mailer:content-transfer-encoding;
	bh=TAKBaeZJJh6HTjqm77wvsGbxTO3/Ds0eT7FDeQsGxv4=;
	b=I0bMzvWeQKs1BHRzpQNm7lhU/T4cLT1GiRYm4cV7pqzoCg7+MjEozOq9QW8ykWnoU8
	kGWhlr3SSX8a32l/jurzkET/BiYp2M9butV2TYrvDkNQZV5mAW8364HNPwk6PWYZhsj7
	9sGhX/p5W1JTkHFcrU5C1HMAo89LobfJkF0as=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:subject:from:reply-to:to:in-reply-to:references:content-type
	:organization:date:message-id:mime-version:x-mailer
	:content-transfer-encoding;
	b=xfs0QTac5i8WBbCyiNf5nkQ+nB73pIRFvbbs+kUOAm+XuFIvNGFWJTVo9qAga6AagM
	McSS3ERRPeY2fibEYelQpBGWj3DXvLnf34Fj7XEesPyAU7/z3+VpDgmsQdikzlVmoJo2
	P15GnfZgeEIxzHtQi7/CfjgD60Es8iSD2G2Kw=
Received: by 10.115.66.24 with SMTP id t24mr4844377wak.188.1259505169234;
	Sun, 29 Nov 2009 06:32:49 -0800 (PST)
Received: from ?116.6.23.151? ([116.6.23.151])
	by mx.google.com with ESMTPS id 23sm2296963pzk.4.2009.11.29.06.32.47
	(version=SSLv3 cipher=RC4-MD5); Sun, 29 Nov 2009 06:32:48 -0800 (PST)
Sender: Gregoire Gentil <gregoiregentil@gmail.com>
From: Gregoire Gentil <gregoire@gentil.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1259505030.24812.8.camel@gregoire-laptop>
References: <mailman.3.1259492402.612.openembedded-devel@lists.openembedded.org>
	<1259505030.24812.8.camel@gregoire-laptop>
Organization: Gregoire Gentil
Date: Sun, 29 Nov 2009 22:32:45 +0800
Message-ID: <1259505165.24812.11.camel@gregoire-laptop>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1
X-SA-Exim-Connect-IP: 209.85.160.53
X-SA-Exim-Mail-From: gregoiregentil@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Initramfs and kernel
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
X-List-Received-Date: Sun, 29 Nov 2009 14:34:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

I hit the send button too fast. I also wanted to add a PS to my email.

I tried to fatload an external initramfs at u-boot but I didn't manage
to have the kernel to use it. Not sure if I need to have it inside
uImage (hence the circular problem mentioned below) or to have the right
command line,

Grégoire


On Sun, 2009-11-29 at 22:30 +0800, Gregoire Gentil wrote:
> Hello,
> 
> I'm building an initramfs image for a beagleboard-like platform. I
> managed to make it work but I have a kind of circular dependency,
> meaning:
> 
> I build initramfs (which depends kernel), I add to the .config of kernel
> the path of the initramfs.cpio.gz, then I need to rebuild the kernel to
> have the initramfs inside the uImage...
> 
> I obviously don't do it right. How is initramfs supposed to work in OE?
> 
> Grégoire
> 
> 




