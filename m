Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-oi0-f45.google.com (mail-oi0-f45.google.com
	[209.85.218.45])
	by mail.openembedded.org (Postfix) with ESMTP id D59556AC37
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Aug 2016 10:04:37 +0000 (UTC)
Received: by mail-oi0-f45.google.com with SMTP id j185so229057079oih.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Aug 2016 03:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=UI+DWvUE2r6cf25tAxq/RMk7S3vrOKsxd/bJA8jS7+M=;
	b=JMJob8dAju7rqrVTTsaIFdGWHXg5GYZoVuY+v3QI5cts3agb3O4Xm4LdCi/oRY+3M2
	LLDDyIN5zkxiuGtY6KaKTYtYnKvBNPx9b55fasp28Mu7H417luGvn6eZoADTlQ1qsc8H
	AX0N83yGtccXb6ptawfv7MQIDvYcSbLxE99jJyjXhlMMoa3Qz4YdJw/9vXw9Hey0SIZ5
	Rr1qTMel3tw+L0B5pkWUp0gz2X7ykiICdmvljPegPaRGAeXk9ZTK6iCU0KvTJx8Iz3Ij
	fVmqSysqo+MkP0I+iO0WQwB8gR8CEIKoQ6xnuPW9q239upFzi8zVoNLvzRMio5A5On5E
	R9eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=UI+DWvUE2r6cf25tAxq/RMk7S3vrOKsxd/bJA8jS7+M=;
	b=GjtvJVr6OdgqTMmuPmmfO4WP4SKv9ZUGn44+nOEhcR8f2gU7/IjaqqNKnZxk1mwFnC
	UNeHcVgR1I57H8ERxiDZFZv8ezYbuaFRX5CwX5tVeW/Tj7dG5mGPsIRvrmr2w9SNLNXH
	wqhhcBvroimv6/BzSvLq2U1ljO53OHqT+HBjzDmBOGngs4VIcRR0OYjbMiUCuv5wUS5v
	jK3S+8I68Jh3ZfUi8VR8mpTnvisIVctwjVYfJHLwedPSjv33sBbtwNpyEMGDLsNsYigB
	WO97EVpm6aFi8zS2Qa1aanKoHhXTh9+nSpa9a2aE+7FDK9Jyx0PJISxiUGIXtu2oTdZG
	91dA==
X-Gm-Message-State: AEkooutYmT4o+2OcwDoFVOooL+pL6RhgIJhFLkO7fv3Fu4BEaUv2l76/kOf2cOMbJNDAkaXTGRT4UsaGBouQmoyI
X-Received: by 10.157.35.136 with SMTP id t8mr27011524otb.127.1470132277816;
	Tue, 02 Aug 2016 03:04:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.241.11 with HTTP; Tue, 2 Aug 2016 03:04:07 -0700 (PDT)
In-Reply-To: <CAJTo0LbZbk_w+=G=EeG1O8U-9-hLH5B2N=MwEczyHcpzuaThxw@mail.gmail.com>
References: <CAHiDW_Hu7dZYxLD0cCEbV_M=-VtQF0s7O_8aZxZrXof2LXa5gw@mail.gmail.com>
	<CAJTo0LbZbk_w+=G=EeG1O8U-9-hLH5B2N=MwEczyHcpzuaThxw@mail.gmail.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Tue, 2 Aug 2016 13:04:07 +0300
Message-ID: <CAHiDW_Ev_wP_R=Kp=ADJ_zsk2LsYdQT4rsySxGL4rFWUdHu=yA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] augeas: oe-core removal warning
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 02 Aug 2016 10:04:40 -0000
Content-Type: text/plain; charset=UTF-8

On 2 August 2016 at 11:23, Burton, Ross <ross.burton@intel.com> wrote:

>
> On 13 May 2016 at 08:15, Jussi Kukkonen <jussi.kukkonen@intel.com> wrote:
>
>> I'm considering removing the augeas recipe from oe-core: it has not
>> really been depended on by anything since Danny (rpm has a non-default
>> PACKAGECONFIG but even that is accompanied by comments about no
>> testing) and we have nothing testing its functionality. Please speak
>> up now if you think augeas should stay in oe-core.
>>
>
> I think that it really should go and will likely be doing this shortly.
>
> Ross
>

Feel free, my commit to move it to meta-oe just showed up in
meta-openembedded master.

Jussi

