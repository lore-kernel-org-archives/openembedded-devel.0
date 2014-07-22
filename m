Return-Path: <trevor.woerner@linaro.org>
Received: from mail-ig0-f171.google.com (mail-ig0-f171.google.com
	[209.85.213.171])
	by mail.openembedded.org (Postfix) with ESMTP id 52AF06AC77
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Jul 2014 13:42:18 +0000 (UTC)
Received: by mail-ig0-f171.google.com with SMTP id l13so4017871iga.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Jul 2014 06:42:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=0qSUfKQeidbpMMtTH+81vJAgt3npHTvT1ccviqUZjAo=;
	b=jVZEEVs737nXLjkny6GCZ2qMzkduFWM18Jdwk6RfWSDBD/YfsOCklVnPPbt50SdgFB
	m9yP0xR1SSzbHFAiicUd/wbMohbaxvv4IBpKu3Dy4Mwthgzuz6L4fKZf70Azkbxvdx6h
	IaraHbii0VqgFzyaRpsB1vP/PF2dvQWCJdcU4OMqhv7TlGcOMu7vORLXnukAX/w+Ej5E
	p57k0soZgC3dZsSG6gsAc0/pkBv4MqVhFG/Av//jvgnSDlwa4S5Fl0cp6RfSlX4P+ru0
	7AqBGgnmVjOhQ8KGZ8t6xVeYAAd0MgpAz3mKrykN4k4eekVJg0klP1XCeUAGUebebI0O
	ygoQ==
X-Gm-Message-State: ALoCoQmK00OrELd61qS3yQl3/soYfQOMveZNDwlnkaM9aB7cAPn3bh/lSvhNuHwDxSEqXVTKwEGO
X-Received: by 10.42.67.203 with SMTP id u11mr37323077ici.20.1406036539951;
	Tue, 22 Jul 2014 06:42:19 -0700 (PDT)
Received: from [192.168.141.83] (69-165-220-158.dsl.teksavvy.com.
	[69.165.220.158])
	by mx.google.com with ESMTPSA id qa4sm2417512igb.10.2014.07.22.06.42.19
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 22 Jul 2014 06:42:19 -0700 (PDT)
Message-ID: <53CE6A3A.7000106@linaro.org>
Date: Tue, 22 Jul 2014 09:42:18 -0400
From: Trevor Woerner <trevor.woerner@linaro.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <alpine.LFD.2.11.1407130915280.31826@localhost>	<3072899.OS8yJTfGtp@peggleto-mobl5.ger.corp.intel.com>	<alpine.LFD.2.11.1407140804360.29952@localhost>	<28111309.Fiim3rPSbe@peggleto-mobl5.ger.corp.intel.com>	<53CE64C9.2010402@linaro.org>
	<alpine.LFD.2.11.1407220921230.4203@localhost>
In-Reply-To: <alpine.LFD.2.11.1407220921230.4203@localhost>
Subject: Re: overriding tasks with EXPORT_FUNCTIONS
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 22 Jul 2014 13:42:28 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 07/22/14 09:22, Robert P. J. Day wrote:
> On Tue, 22 Jul 2014, Trevor Woerner wrote:
>
>> On 07/14/14 08:26, Paul Eggleton wrote:
>>> Unfortunately as far as the BitBake manual is concerned, it pretty
>>> much has to be abstract. Remember that there are no base
>>> implementations of any task functions in BitBake itself; the ones
>>> you refer to are in OE's base.bbclass.
>> In reality there are only about 2 people on the whole planet for
>> whom that distinction is important :-)
>   i should point out that fetching is defined in bitbake, while
> everything else is in oe-core. just being difficult. :-)

And (if I'm not mistaken) kergoth (?) is working on separating the
fetching process from bitbake too :-)

