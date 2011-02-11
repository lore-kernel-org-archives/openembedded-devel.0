Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <filip.zyzniewski@gmail.com>) id 1PntJw-0000IB-LM
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Feb 2011 14:46:00 +0100
Received: by qwi2 with SMTP id 2so1479067qwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Feb 2011 05:44:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=+sUva+Fib/vr7kn3GteujJwInF2WHIxFTQJzljUDiIU=;
	b=kqvOF3OUw3c6+vcaiSnhhnEgAGpeEXvceII4rGWskRmzDVyJYm+4Mr5PTe8wtS+4Zh
	rLtUOtPjXzhQBBigMiQvBeQbLxsQcaiPxzB9WEybQD2wtTdJfZ/Oe1X43bI9oo6xnJKL
	pI9NI+lMJRqEYlm+CwfmC0ni0W+cRBxk0XA28=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=QOhkJxv5HTzAzTUME1cvXXHnkUXdDv3kwV7C1bQahn0TAfm+vdF3xx+LhEvXmw8edY
	Ii9snjAmeoTtxhDpFT1lCArJGkWHKaWa/eSo1DT64NYn06ZzOrZXQVF8EBwUxCK6Aq45
	ZDrxgM3X2kp5ij6NJSoCefDlr0lqUr+xDd6dI=
MIME-Version: 1.0
Received: by 10.229.230.17 with SMTP id jk17mr549883qcb.184.1297431893966;
	Fri, 11 Feb 2011 05:44:53 -0800 (PST)
Received: by 10.229.193.10 with HTTP; Fri, 11 Feb 2011 05:44:53 -0800 (PST)
In-Reply-To: <1297282989-7580-1-git-send-email-filip.zyzniewski@gmail.com>
References: <1297282989-7580-1-git-send-email-filip.zyzniewski@gmail.com>
Date: Fri, 11 Feb 2011 14:44:53 +0100
Message-ID: <AANLkTinrY3g2RLOnHWZ-sborNsFjET8-uE_OoU-LQ2Hf@mail.gmail.com>
From: Filip Zyzniewski <filip.zyzniewski@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] base-files: update fstab for jornada7xx
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
X-List-Received-Date: Fri, 11 Feb 2011 13:46:00 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 2/9/11, Filip Zyzniewski <filip.zyzniewski@gmail.com> wrote:
> We use the scsi subsystem for PCMCIA ATA access, so device files are
> /dev/sda*, not /dev/hda*.
> See recipes/linux/linux-jlime-jornada7xx-2.6.34+git/defconf_jlime:702.
>
> Signed-off-by: Filip Zyzniewski <filip.zyzniewski@gmail.com>

Is there a reason for this patch to be absent from
http://patches.openembedded.org ?

Should I add it there by hand?

bye,
Filip Zyzniewski


