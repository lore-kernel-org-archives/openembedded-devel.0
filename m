Received: from [209.85.211.177] (helo=mail-yw0-f177.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1N8bqC-0003gy-Ss
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Nov 2009 16:44:12 +0100
Received: by ywh7 with SMTP id 7so2125178ywh.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2009 07:42:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=4oatadlNijsyVD3MApSFmYHxBc79ZoWFP87qGQ2Ks5E=;
	b=DVoC2vniJWrzfQK9aIB4VNHguGE1fw9bVFl2rYOejQd2gLFMWg9/+vmDeNpjcrQSjL
	TyeT0W0pbtJcdOvdvPQmIvJ4eGOBMtzqr8sL3KBrA3PFhl0u61jEw25CKCBOpbecTisp
	gJdRuMDY/LtCtl1LYGpE7hnZAKJLRfu/W1mt8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=P9BUQ7Qxv7IWBBcKzACAVEol+6b638iEv1QjwplT3jy8QKbafuFLVlBYHsVNl50yLv
	WjD93VeuJvNpr47TyT0iTmnzCsrltsxMk7sN4TolCa1+PchUO/w8YxjkhVfqsr2S20Vw
	DyYvpKtC0voiyy2I59Vc8Gypx7tNek0EW7PIA=
MIME-Version: 1.0
Received: by 10.239.181.167 with SMTP id m39mr278733hbg.169.1258038917643; 
	Thu, 12 Nov 2009 07:15:17 -0800 (PST)
In-Reply-To: <be7a9f3d0911100905i791157e1lfd73c3cdb7f58f51@mail.gmail.com>
References: <4AF353C8.80904@cs.put.poznan.pl>
	<c384c5ea0911100806r7b163600l9adb62a23f1877a4@mail.gmail.com>
	<be7a9f3d0911100905i791157e1lfd73c3cdb7f58f51@mail.gmail.com>
Date: Thu, 12 Nov 2009 16:15:17 +0100
Message-ID: <c384c5ea0911120715j12181ff2oe93d0b68c4b3fa92@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.211.177
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
X-List-Received-Date: Thu, 12 Nov 2009 15:44:12 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello Otavio,

On Tue, Nov 10, 2009 at 6:05 PM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> Hello,
>
> On Tue, Nov 10, 2009 at 2:06 PM, Leon Woestenberg
> <leon.woestenberg@gmail.com> wrote:
>> Look in classes/kernel.bbclass, line ~221:
>>
>> addtask menuconfig after do_patch
>> change it to:
>> addtask menuconfig after do_configure
>>
>> I wonder if this can go upstream.
>
Any response to this idea?


> After menuconfig the .config might be copied back to the recipe?
>
That's a(n additional totally different) feature request.

I'ld rather fix things first, then add new features.


Regards,
-- 
Leon


