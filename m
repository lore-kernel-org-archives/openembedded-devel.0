Received: from [209.85.220.222] (helo=mail-fx0-f222.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1Mo0vu-0002dB-RJ
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Sep 2009 22:16:57 +0200
Received: by fxm22 with SMTP id 22so3747152fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Sep 2009 13:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=GJBeeka85zV/e5H0NO3QytGVU0fF8QO45enbO14nEWc=;
	b=FSkvDcl254hHVNOHD4oc2gTEHRrYxBLL0PYk1OXCOA9p9y2nDQo/S+KiSWt+6Q/5Ze
	45uzco4r+JfL0XiGxfrMOsSpq4064RSE7ihnKOuGsX5tXzZj2mOYYcytGE2aghIIFYZa
	s61FXYIC/t6rhHxUqCroDINPTzHXh6r8g0NKc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=l2oQrksswrhL8LuSXBDhamurlVRdHW/GojQcPD/FuFsVIikapcUGUAubQMr0Ijcmo0
	ZA9xB3NaJ1zHCtaKnIGG9Qfk3COo72tLHCeN8vbcAWQFBtlCjbYZfd6JLiEI3EUQMf2W
	eYMpD1ePQrFq9WOPHNoGAWkS7ZJhGHu/8AOXA=
MIME-Version: 1.0
Received: by 10.239.163.202 with SMTP id q10mr858393hbd.129.1253132181993; 
	Wed, 16 Sep 2009 13:16:21 -0700 (PDT)
In-Reply-To: <70c9a9110909150058k34419c27n8bcc80abb2cda147@mail.gmail.com>
References: <1252941903-6186-1-git-send-email-enric.balletbo@telefonica.net>
	<1252941903-6186-2-git-send-email-enric.balletbo@telefonica.net>
	<1252941903-6186-3-git-send-email-enric.balletbo@telefonica.net>
	<h8lu4h$jte$1@ger.gmane.org>
	<70c9a9110909150058k34419c27n8bcc80abb2cda147@mail.gmail.com>
Date: Wed, 16 Sep 2009 22:16:21 +0200
Message-ID: <c384c5ea0909161316l74594a96seed94b7a144472ee@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.220.222
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] linux-igep2: Add 2.6.28.10 for IGEP v2 machine
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
X-List-Received-Date: Wed, 16 Sep 2009 20:16:58 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello Enric, all,

On Tue, Sep 15, 2009 at 9:58 AM, Enric Balletb=F2 i Serra
<enric.balletbo@telefonica.net> wrote:
>
> =A0 At this time our board it's not included in mach-types file (beacause=
 is
> too old), we're waiting for an update of mach-types file to publish the
> patches to the linux-omap tree and then switch to the linux-omap recipe i=
n
> OE like others OMAP3 based boards. For this reason, we prefer to use the
> linux-igep2 recipe for now.
>

I had the same problem for an other ARM board.

This solves it, if you submitted the machine number upstream to
http://www.arm.linux.org.uk:

#do_patch_append() {
#        curl -o mach-types
"http://www.arm.linux.org.uk/developer/machines/download.php"
#}

do_configure_prepend() {
        # update machine types list for ARM architecture
        curl -o mach-types
"http://www.arm.linux.org.uk/developer/machines/download.php" && \
        cp mach-types arch/arm/tools/mach-types


However, can someone see why the do_patch_append() approach does not work?

It clearly belongs in the patch area, not the configure area.

Regards,
--=20
Leon


