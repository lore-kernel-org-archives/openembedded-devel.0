Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ashcharles@gmail.com>) id 1O9jWr-0000kT-F9
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 May 2010 20:41:06 +0200
Received: by pvg4 with SMTP id 4so365934pvg.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 May 2010 11:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=ZHSWuqQ3SlzwSfboRNT0/VKGYFkfDyHTVPw9AbY9c0Y=;
	b=OnQvq+fsO2p4s7sXF9sgJIKpm58NXEGvXXRRJF8aF1bCdP5RznDasAycImsXhX73eL
	v+SB7WO8o/QABBnKJKFbPLBL+DMvHQiv3m3IR+tIHXUxTmPqtq3X+vT3a2FVc80MPOke
	B6YOhAh7Vax1FK8fuIryCNEMp4gxWF74UC61M=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=OiES6fa4v2fLExUkMBfWGSUNKDyTJXTI1Gm+GVWebgQQvxVLD2OWFCjrSYNisUs21H
	S/Y/iP0Tw66YgC0/ER4znK9AGpc2tcIermgexhM+ryKE688pMdU2OKiSB1sfPSgnziMs
	whZsu7Zxp4QunB316gf9iM3H7tFed8QgX8fPg=
Received: by 10.141.214.15 with SMTP id r15mr5921521rvq.189.1273084636744; 
	Wed, 05 May 2010 11:37:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.208.6 with HTTP; Wed, 5 May 2010 11:36:56 -0700 (PDT)
In-Reply-To: <2D3EFC75-3DFC-492D-A230-ED263BB96281@mac.com>
References: <2D3EFC75-3DFC-492D-A230-ED263BB96281@mac.com>
From: Ash Charles <ashcharles@gmail.com>
Date: Wed, 5 May 2010 11:36:56 -0700
Message-ID: <g2ubd4a003f1005051136wc9ca8d59v2a35fa08669f761d@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: ashcharles@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: How to modify omap3-console-image recipe to modify /etc/inittab
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
X-List-Received-Date: Wed, 05 May 2010 18:41:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, May 5, 2010 at 9:28 AM, Elvis Dowson <elvis.dowson@mac.com> wrote:
> =C2=A0How can I modify the omap3-console-image recipe to modify the /etc/=
inittab file from
>
> c1:12345:respawn:/sbin/agetty 38400 tty1 linux
> to
>
> c1:12345:respawn:/sbin/agetty -n -l /usr/sbin/autologin 38400 tty1 linux
>
> after the rootfs is fully created?

I made an addition to my autologin recipe that does this:

pkg_postinst_${PN} () {
  sed 's_S:2345:respawn:/sbin/getty_S:2345:respawn:/sbin/getty -n -l
/usr/bin/autologin_' /etc/inittab > inittab.tmp
  mv inittab.tmp /etc/inittab
  passwd -d root
  echo 'NOTE: remove the password from the root account'
}

pkg_prerm_${PN} () {
  sed 's_ -n -l /usr/bin/autologin__' /etc/inittab > inittab.tmp
  mv inittab.tmp /etc/inittab
  echo 'NOTE: there is still no password on the root account'
}

Does this make sense?  I don't know if this is the ideal way to do it
but it seems to work for me.

-Ash


