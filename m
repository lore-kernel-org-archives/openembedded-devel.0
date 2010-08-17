Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1OlNlL-0002ti-Cn
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Aug 2010 17:08:10 +0200
Received: by eyx24 with SMTP id 24so3149635eyx.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Aug 2010 08:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=aWQv6hHO6kUsMh4khZII23NlMczaM/uotCRd7i4P0mg=;
	b=nDuQ5VRb+XNT9JzMLzl2ZpQf7cAwuKwpM1IQPmkdWL1Oi0Y9/+COcAeF3DniMws2ei
	/UiAK2EGWpDHTY2/BOqdp7N9/1MpkiQptq+NhGY65zqLSjma6WCHPsL1KNKpgRme+f0f
	hyKoQUfLBptM1OZ1fb/KfS9/ru8CbO0SQL6Z8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=l6tQ0XZvx3D/zraEsEMTc3Frg50+zFFRtJNu9s2rlrL3K+7kaZM+ymC6k/D7ACRys8
	OKkLtJ8PyskFhlfCKjCX/sEmsgv0IHzrzkKjsncNFd/PdHdxckTpirR0AfAagpN8JOaN
	S+SELQRVAfwGm0FS8RfortNROviFWWm/cLLr4=
MIME-Version: 1.0
Received: by 10.216.35.138 with SMTP id u10mr862675wea.80.1282057638583; Tue,
	17 Aug 2010 08:07:18 -0700 (PDT)
Received: by 10.216.21.209 with HTTP; Tue, 17 Aug 2010 08:07:16 -0700 (PDT)
In-Reply-To: <1281732402.28856.6.camel@paso-laptop>
References: <1281732402.28856.6.camel@paso-laptop>
Date: Tue, 17 Aug 2010 11:07:16 -0400
Message-ID: <AANLkTi=jOmbFx=+JT49yvD4r3wkzH1pYkHcRBc4Wby4y@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.215.175
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: OE on my new tablet. How write a new machine conf file?
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
X-List-Received-Date: Tue, 17 Aug 2010 15:08:55 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Aug 13, 2010 at 4:46 PM, Davide Pasini <ilpaso@inwind.it> wrote:
> Hi all
> I'm new in OpenEmbedded and it is a very good idea!
> Maybe this is not the right place for a newbie help req but the user
> mail list is a desert.
>
> I bought a china tablet few days ago. It has Android or WinCe OS.
> I'd like to install a linux distro on it.
>
> I'm trying to build my distro (minimal distro with only a shell
> interface) but I'm lost in the .conf files.
> Obviously my machine is not in the "machines list" and I'd like to
> create an ad-hoc conf file maybe starting from an existing machine file.
>
> my device mount an ARM 11 (ARM v6) CPU and this is the link to some
> additional infos http://forum.xda-developers.com/showthread.php?t=740631
>
> How write a new machine conf file?
> Any help is appreciated.

Just look at the existing ones and copy/modify one that is reasonably
close.  The other thing that is typically required is to add/modify a
kernel recipe for your machine.  See:
http://wiki.openembedded.net/index.php/Adding_a_new_Machine for more
information.

Thanks,
Cliff

-- 
=================
http://bec-systems.com


