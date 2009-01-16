Received: from [209.85.218.15] (helo=mail-bw0-f15.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1LNmI4-0004AC-Lc
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Jan 2009 11:51:04 +0100
Received: by bwz8 with SMTP id 8so3945805bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jan 2009 02:44:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=ZG8dsYm4uHrVcpvD/6LrRc8y6UcmBvQajn67UQz+XE0=;
	b=PaSnGVWCUDCEJqGgR5rp0t3rWFpvIf3+3vqSD4uv5HaSKpGPalAhTFVZxJGaMi3GcK
	GpqYrFmOptVAKKCje80JFWVnPntMIhMXlgXOiGcEoOtGtlOQVrYL8ro8UBPVc+4Pobss
	rE9ywyvjb5ILZAJN/Vn2pbrlBUInATmweaGnc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=Kbb3W1UNFBgF4PexK1f72AKaapq665ITTngHeEpqU9FzSfUhVO2RdUTrBWSkXKuuqL
	chKHeWW+lD3dHUPjyHEXMBsy+iizF/d2af+5kwYbXZ1YSw49+VGgFyQBmtrQtmRYeV8l
	2zPt2gQDtjOUa52xp59RlwhZ3ef6lna5W45Bs=
MIME-Version: 1.0
Received: by 10.181.224.3 with SMTP id b3mr793814bkr.183.1232102659219; Fri, 
	16 Jan 2009 02:44:19 -0800 (PST)
In-Reply-To: <d1b08f940901150928h56ede408u2d070606fbe6b7bc@mail.gmail.com>
References: <d1b08f940901150928h56ede408u2d070606fbe6b7bc@mail.gmail.com>
Date: Fri, 16 Jan 2009 11:44:19 +0100
Message-ID: <d1b08f940901160244md17fed1n2d26175561a51ec9@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: ARM bootloaders (Zaurus) and CMDLINE
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
X-List-Received-Date: Fri, 16 Jan 2009 10:51:04 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

An old bootlog illustrating our purposes is there:
http://de.pastebin.ca/1309948

As you see, u-boot passes the customized mtdparts via cmdline (not
sure about ATAGs) and the 2.6.26-kexecboot-kernel finds these and does
NOT default to the standard partitioning hardcoded in the sources.

The code in the initramfs parses then /proc/cmdline and passes the
right arguments to the kexecbooted kernel.

We want to achieve this without u-boot...

TIA

Andrea


