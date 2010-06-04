Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OKRfF-00011X-6K
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Jun 2010 09:50:11 +0200
Received: by fxm9 with SMTP id 9so595212fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Jun 2010 00:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=4dsM9om1Ja6257Zv1fO8hNs61j4Tqlq3HKmpglDklkI=;
	b=XkH6Nfs9q1QRFKSquPsizPP2jLf532UewGZoZGLsE+0uodx4407r2FMzM69fJxqHQ6
	vCyJtCnfOzqPw4NoluCjvshcKw62F0FuFAYnwSAAQDpL+jxEAd7PKDxDGRAScr0j4CnK
	xd+5vmiVCfldhfsyLhcTPZKs2yhPOfCaZ2PPg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=VQxadnUzACSRwSc3Fl3dXlx9dI4/a140XpFUj59PZEgV4gXCT4m+iRYwd48PxzmfK0
	/NGRQTjvnIA9ZdqtgrcHQQoVYrbwmPgSXtb3bJkR86qSbBAg38m2BryrxUnBDLZIxSlw
	mGQXxV+tF8I+hYuBShiLF1QXx0VbMg4DJOmx4=
MIME-Version: 1.0
Received: by 10.223.98.19 with SMTP id o19mr11392298fan.80.1275637544674; Fri, 
	04 Jun 2010 00:45:44 -0700 (PDT)
Received: by 10.223.106.138 with HTTP; Fri, 4 Jun 2010 00:45:44 -0700 (PDT)
In-Reply-To: <1275510896-30845-1-git-send-email-raj.khem@gmail.com>
References: <1275510896-30845-1-git-send-email-raj.khem@gmail.com>
Date: Fri, 4 Jun 2010 09:45:44 +0200
Message-ID: <AANLkTinBOnVLXNQ6KN9teMM0DnLfY-qpRBSsWcUrQyeS@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 00/16] Upgrade gettext, GNU utilities, fix general 	build issues with uclibc distros.
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
X-List-Received-Date: Fri, 04 Jun 2010 07:50:47 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Jun 2, 2010 at 10:34 PM, Khem Raj <raj.khem@gmail.com> wrote:
> Hi
>
> These patches are for three things mainly.
>
> 1. Upgrade to gettext 0.18
> 3. General gnu utilities updates
> 4. uclibc based distro builds
>
> I have tested several images for qemu based machines
> mainly qemuarm and qemux86
>
> Please provide feedback

I've tested all in last build from scratch for armv4t (om-gta02) and
armv5te (spitz), both with eglibc. Works OK, ACKed (except 16/16
because I don't use uclibc - but looks ok too).

Regards,


