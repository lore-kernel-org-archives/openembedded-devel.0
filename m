Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vwyodapink@gmail.com>) id 1Oy7hA-0001Ge-2k
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Sep 2010 20:36:00 +0200
Received: by pvg6 with SMTP id 6so1686088pvg.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Sep 2010 11:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=4q23vleifSl6yM/Uk3uB3RKZ1fQS6c3+RUAfFHjo7k0=;
	b=x5MhRdi+hxZYSWjZ3eOkiylDN6K8CKq/Tvs+olTjYH+GJ737MTYgLPtoSLItbVZyLv
	t0jqdcrNayu62f45Rdlqdq7eoAIv52NPoKAEFVloicFVcr4PZx99IjtrwPcvPsCpCA34
	FT/KqT0wxYYNrmtq0SaNlZa3j5J0PNepurpxY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=htE+plhFCHA1Y9Xj5pT+meP6FqYR2H04QiMGvIS5TNdt3ieAJOHSFVcLiex73xkl+Q
	wuKhywiltGcljbSywrrQNcp+nvs9TInJ2i51CFDA5hFKnBY7CSlEusStfjOBDky0vbMx
	UE9Xe/GmiN3oTTBjO35161RFKwk7E0RwLvfqk=
MIME-Version: 1.0
Received: by 10.114.124.10 with SMTP id w10mr12427472wac.6.1285094152980; Tue,
	21 Sep 2010 11:35:52 -0700 (PDT)
Received: by 10.115.33.18 with HTTP; Tue, 21 Sep 2010 11:35:52 -0700 (PDT)
In-Reply-To: <20100921175036.GB5750@lundinova.se>
References: <4C9494EC.4070309@freyther.de> <20100921175036.GB5750@lundinova.se>
Date: Tue, 21 Sep 2010 11:35:52 -0700
Message-ID: <AANLkTi=Kmc_FA7sP1TaH+-cxaNNM+0cf=4qV3KvG98-1@mail.gmail.com>
From: "J. L. " <vwyodapink@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: vwyodapink@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Question regarding the staging layout
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
X-List-Received-Date: Tue, 21 Sep 2010 18:36:01 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Sep 21, 2010 at 10:50 AM, Johan Hovold
<johan.hovold@lundinova.se> wrote:
> On Sat, Sep 18, 2010 at 06:31:08PM +0800, Holger Freyther wrote:
>> I am seeing a lot of messages like:
>>
>> /home/ich/build/arm/xscale/tmp/sysroots/i686-linux/usr/armv5te/lib/gcc/arm-angstrom-linux-gnueabi/4.3.3/../../../../arm-angstrom-linux-gnueabi/bin/ld:
>> warning: libc.so, needed by
>> /home/ich/build/arm/xscale/tmp/sysroots/i686-linux/usr/armv5te/lib/gcc/arm-angstrom-linux-gnueabi/4.3.3/../../../../arm-angstrom-linux-gnueabi/lib/libgcc_s.so,
>> not found (try using -rpath or -rpath-link)
>>
>>
>> is that to be expected?
>
> Same issue here.
>
> See the thread "[oe] several recipes give a link error: libc.so, needed
> by libgcc_s.so, not found" from Mon, 23 Aug 2010 for some discussion on
> this matter.
>
> /Johan
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

I am still seeing this issue as well.


