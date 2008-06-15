Received: from [74.125.46.152] (helo=yw-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <xjqian@gmail.com>) id 1K7oWV-0000Cj-IO
	for openembedded-devel@lists.openembedded.org;
	Sun, 15 Jun 2008 11:27:53 +0200
Received: by yw-out-1718.google.com with SMTP id 5so2925216ywr.42
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Jun 2008 02:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:reply-to
	:user-agent:mime-version:to:subject:references:in-reply-to
	:content-type; bh=v9qDartVGbXbnNCViDToXtbP5ReSZtQT4+HPj4KNM/M=;
	b=LbB7Q+GGeoSFBAimMiESpZNIhs82U/7OHzNI5bQFjkBmdlnklPeTh6xX/4VdvTDBin
	zxrXczqOYplvp86AXP2zxZFp/IXE+RswJq3TtkxSJpmyJH8/k0OsOOULfv3xY77XsYZ2
	+KtRsvtMLIBrXiw3Uy1B/12HEWmTgChxZHhkE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:reply-to:user-agent:mime-version:to:subject
	:references:in-reply-to:content-type;
	b=qKEeIfhr8fKdI/Odx4D+heAEOpnFwMHIQgyHROdy2retsEMqWJLh/aRKtmwHnPPyyQ
	NUV4t5iO9HnOOT/qGSz+v/JN1ekKYwEkaaqQjMTLBnfhJzNMf02fmq58+ZqRDrXNvDWg
	oC8WzTOKihjuCFqI1f4TuDMm8cNJpfh2Qj0z4=
Received: by 10.151.158.2 with SMTP id k2mr8369251ybo.70.1213522034466;
	Sun, 15 Jun 2008 02:27:14 -0700 (PDT)
Received: from ?192.168.1.204? ( [68.188.71.196])
	by mx.google.com with ESMTPS id y45sm8614437pyg.9.2008.06.15.02.27.12
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 15 Jun 2008 02:27:13 -0700 (PDT)
Message-ID: <4854E06F.1020205@gmail.com>
Date: Sun, 15 Jun 2008 04:27:11 -0500
From: Gordon <xjqian@gmail.com>
User-Agent: Mozilla-Thunderbird 2.0.0.14 (X11/20080509)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20080613225643.86B4D1881B6@amethyst.openembedded.net>	<20080613231709.GB3606@cimmeria.hyboria>	<g2vvg5$3hh$1@ger.gmane.org>	<d1b08f940806140210o54897e92wbcf5e7962c0c49a3@mail.gmail.com>	<g305u5$jbi$1@ger.gmane.org>	<d1b08f940806140634k47bfb782hef80608e39e23c5b@mail.gmail.com>
	<20080614170647.GA3428@cimmeria.hyboria>
In-Reply-To: <20080614170647.GA3428@cimmeria.hyboria>
Subject: Re: [oe-commits] org.oe.dev udev-118: go back in time	to	udev-115 which seems to work slightly better on some	Zaurus models
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Sun, 15 Jun 2008 09:28:03 -0000
Content-Type: multipart/mixed; boundary="------------080101010602080303010307"

--------------080101010602080303010307
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/14/2008 12:06 PM, Graeme Gregory wrote:
> Well I tried to build for tosa, but Im falling over on the fact the
> kernel doesnt build and libtool seems to be busted :-(

There are some kernel patch conflicts in the dev branch. You need the 
attached patch for linux-rp_2.6.24 on tosa.

Regards
Gordon

--------------080101010602080303010307
Content-Type: text/x-diff;
 name="linux-rp_2.6.24-tosa.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="linux-rp_2.6.24-tosa.patch"

#
# old_revision [ed4564d099fea7663820669914d24a6886bfc907]
#
# patch "packages/linux/linux-rp_2.6.24.bb"
#  from [4782fd14fc4ea11a863598f899afcf59024885eb]
#    to [f17b8575b063ee52c7d87d257a422569645b3a88]
#
============================================================
--- packages/linux/linux-rp_2.6.24.bb	4782fd14fc4ea11a863598f899afcf59024885eb
+++ packages/linux/linux-rp_2.6.24.bb	f17b8575b063ee52c7d87d257a422569645b3a88
@@ -48,9 +48,9 @@ SRC_URI = "${KERNELORG_MIRROR}pub/linux/
            file://mtd-module.patch;patch=1;status=external \
            file://wm8750-treble.patch;patch=1;status=external \
            file://spitz_h_rewrite.patch;patch=1;status=external \
-           file://pxa2xx_udc-clock.patch;patch=1 \
-           file://sharpsl-rc-r1.patch;patch=1 \
-           file://sharpsl-rc-r2.patch;patch=1 \
+#           file://pxa2xx_udc-clock.patch;patch=1 \
+#           file://sharpsl-rc-r1.patch;patch=1 \
+#           file://sharpsl-rc-r2.patch;patch=1 \
            file://squashfs3.3.patch;patch=1;status=external \
            ${RPSRC}/logo_oh-r1.patch.bz2;patch=1;status=unmergable \
            ${RPSRC}/pxa-linking-bug.patch;patch=1;status=unmergable \
@@ -65,7 +65,7 @@ SRC_URI = "${KERNELORG_MIRROR}pub/linux/
            file://connectplus-prevent-oops-HACK.patch;patch=1;status=hack \
            file://binutils-buildid-arm.patch;patch=1 \
            file://versatile-armv6.patch;patch=1 \
-	   file://htcuni.patch;patch=1 \
+#	   file://htcuni.patch;patch=1 \
            file://defconfig-c7x0 \
            file://defconfig-hx2000 \
            file://defconfig-collie \

--------------080101010602080303010307--
