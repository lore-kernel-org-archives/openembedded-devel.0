Received: from [209.85.218.217] (helo=mail-bw0-f217.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1N7tLV-0006Dg-5E
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Nov 2009 17:13:32 +0100
Received: by bwz9 with SMTP id 9so168573bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Nov 2009 08:12:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=jMABVsAsr1MjK8+cTztsuRfs1BmhG/EAAlNhR5cfu2k=;
	b=KcNaDWh8b4mRAHrLaYZhi4oMCVQPC5L8d6OTdN1vRLwqsFbCIuM3jGOF1jv4jIHrNO
	YsGQHWxC+X60ITWt/4qa3Oss87mpT8WEnZ6Ix4/b6YzeymSnA1s1AVVJJqJmnnrmDWx3
	qHBtogdK9DAtRdvujPLhwsI3J1OAxMFsLDG6E=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=Eg/TOteSFkwWVZuf88Eb4SuPbaDNnSOxzkxIELHwYbDNFzIz3eza2Bb45JlwhxsBIf
	zlIyy79NoqcHEpwoFc573cedWaPOFi7lJkUnSWcpIssbiEqQBp4tNA6Z9V7ZPntqfAq7
	8HbtKA0t1A7Relt2j+oHd7myfo2upqALANOuc=
MIME-Version: 1.0
Received: by 10.239.145.33 with SMTP id q33mr26850hba.126.1257869161729; Tue, 
	10 Nov 2009 08:06:01 -0800 (PST)
In-Reply-To: <4AF353C8.80904@cs.put.poznan.pl>
References: <4AF353C8.80904@cs.put.poznan.pl>
Date: Tue, 10 Nov 2009 17:06:01 +0100
Message-ID: <c384c5ea0911100806r7b163600l9adb62a23f1877a4@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.218.217
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: menuconfig task for kernels
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
X-List-Received-Date: Tue, 10 Nov 2009 16:13:32 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

On Thu, Nov 5, 2009 at 11:38 PM, Przemyslaw Wesolek
<przemyslaw.wesolek@cs.put.poznan.pl> wrote:
>
> The order of tasks to do menuconfig is, more or less: fetch, patch,
> menuconfig. It means that when menuconfig is run, there is no .config*
> files in linux build dir, and generated .config is far different than
> defconfig resulting from applying OE patches.
> [...]
> Is this the "right" way to do? If so, maybe menuconfig should be added
> as 'after do_configure', instead of 'after do_patch'?
>

Look in classes/kernel.bbclass, line ~221:

addtask menuconfig after do_patch

change it to:

addtask menuconfig after do_configure


and see if that helps.

I wonder if this can go upstream.


Regards,
-- 
Leon


