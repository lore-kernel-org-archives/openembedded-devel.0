Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Ph4gS-0002G4-4Y
	for openembedded-devel@lists.openembedded.org;
	Sun, 23 Jan 2011 19:29:04 +0100
Received: by gyh20 with SMTP id 20so1175403gyh.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Jan 2011 10:28:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=wirOeIIaqYDM5jT2eNLSgIu6eTgrRpjHyu476jKAA1s=;
	b=uv04jDWz4CVn5IG6rfIxrUiG1c7W1NGRsxjfI0Pp8VAlK0FOyH/no2/CAMXqFDd5r4
	iUebtUJprzvczfiaAl/VjcekKktRiM6idKMGHZI4XORMXfqg0erVMz4VmvalpENnKamS
	cpJYW/J3JsjHVcTbT+Q9dhm5W5JrjRRD6lrVU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=w2uT7Bag7xqqK1Q4l3dQSr5fMPnbXdO19JDp1d085zVh3qe/h1crimjFGJW8f3Z8kt
	GZT5zMqA8aFv26Hi8fUD3bLg+QnmLFjXvTinpn+nJKoI+t2vTXt7xfmyeakuuuUjKlky
	pKq4vTIkMeoATVWhDUAywy1FlVxl6RmMqsNYc=
Received: by 10.90.100.4 with SMTP id x4mr3818028agb.4.1295807298778; Sun, 23
	Jan 2011 10:28:18 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.55.10 with HTTP; Sun, 23 Jan 2011 10:27:57 -0800 (PST)
In-Reply-To: <4D3A31FF.2010907@mwester.net>
References: <1295598581-12927-1-git-send-email-raj.khem@gmail.com>
	<4D394AC0.90300@eukrea.com>
	<AANLkTi=Jdmsr8sYYpOMTOqdpoi9iHiyFBcAAqnfoaMAN@mail.gmail.com>
	<4D3A31FF.2010907@mwester.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 23 Jan 2011 10:27:57 -0800
Message-ID: <AANLkTin=77JheFmKVs2Z7wKH6kWD+uKgHSDVRQ__cwF7@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 3/3] busybox_1.18.2.bb: slugos needs a modified version of usb.sh script
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
X-List-Received-Date: Sun, 23 Jan 2011 18:29:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 21, 2011 at 5:25 PM, Mike Westerhof <mike@mwester.net> wrote:
> Isn't this kernel-specific, though? =C2=A0I don't have any other OE-based
> devices handy just now to check, but what's difference, specifically,
> and should we change something to bring SlugOS into line with the rest
> of the world?
>
> -Mike (mwester)
>

yes seems like slugos kernel enables.
CONFIG_SYSFS_DEPRECATED=3Dy
CONFIG_SYSFS_DEPRECATED_V2=3Dy

which enabled these. I havent tested the kernel by disabling them
as I havent figured out how to boot a kernel from network on slug
but if you can try that and see what /sys/class looks like that
would help or if I find some time to make slug suck the kernel
from a tftp then I can do it too.


