Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f172.google.com (mail-qk0-f172.google.com
	[209.85.220.172])
	by mail.openembedded.org (Postfix) with ESMTP id 479B278741
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jul 2018 04:05:50 +0000 (UTC)
Received: by mail-qk0-f172.google.com with SMTP id t79-v6so4082209qke.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Jul 2018 21:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=YqHTmuDi6mYMQd5aSi8qi6Ee8QGwIS8ph1DJRj8yRWY=;
	b=gaGZcBttbqXYw955/SXgTHc+Ftix7E2gHFYdHcfNIIOdLgx9DJAxK0nG4Pl4iTzBxZ
	pfNsVXJ/tWALrubZkMgj8BQI/SbohP+hGtqPX+/z4fKQTxrrz3JObDPET9U8iE/z5uts
	T8iYJeHA7VEV0qT9GsGwvknana0pH8sUZbG7CcmFEMujIyj18qqid8VPdMj3n2MbIYV5
	YPKmPEFURknX/UpAlO8LkGBLdQjgFeXiuWDjBpEAUi9BkIYUFEtLMcyhqyw53EElrmy0
	KY/PKKH9WKtSOAKwKjCsNUZU6Xr5sJxSdErEpWG17Rmwn7SgM62fEd3Eg6QVMx2UlQMq
	JU3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=YqHTmuDi6mYMQd5aSi8qi6Ee8QGwIS8ph1DJRj8yRWY=;
	b=ecOIGoY2/zAOmmdGqThuWhn+h27cqRrF7eatgzgLB98iq+sCO6bBRuYQoDb+5U8vGz
	IX4atGdYXh9T7J7JlHIhcBehbTPOsQSt2cprr0tlvRwPU+l6+A76iyaaRHLYoe/VcWG9
	p8UEPVOAZuSxgGY9+1QKHJkZmBYnCIGPeMNspNpjuTjmSY/2EgBmzmRY8eY8V0UhZuHw
	+20VNjTkDb15jMPH0BYgP2AyUQ4d4hZylclfNXgBgat1lHtlyY0aDy9mO8/6UAGT+eaV
	GAjBQwK2E/zaYDXIwFBkJdh9nUqmsHzTFrYtOyG94eUnWEnqHqgWyMDoIuFSbHNRY0AY
	ihVA==
X-Gm-Message-State: AOUpUlHdTLdTP7KGmUDN8Vidm4xj9a4IB92nTJ6lMgpa8I7Twobc88p8
	kYX8UramJPxTTYv4AQ/Cfwzdp23QPos+PFlu8nI=
X-Google-Smtp-Source: AAOMgpcYgP5f1WFXvB8zPMXer1QK7QjKjefXxtu7l5IEDEwxn52wXbCcx2GC/UutQGcsH/f73VnaJm67kHfh7Dgfd/E=
X-Received: by 2002:a37:4a94:: with SMTP id
	x142-v6mr17825497qka.110.1532491550972; 
	Tue, 24 Jul 2018 21:05:50 -0700 (PDT)
MIME-Version: 1.0
References: <MAXPR01MB03485F715FB80DCF083B704191550@MAXPR01MB0348.INDPRD01.PROD.OUTLOOK.COM>
	<MAXPR01MB0348E0FB92BCD5785A4E22E391550@MAXPR01MB0348.INDPRD01.PROD.OUTLOOK.COM>
	<MAXPR01MB034871D225312CE9BAE6A46D91540@MAXPR01MB0348.INDPRD01.PROD.OUTLOOK.COM>
In-Reply-To: <MAXPR01MB034871D225312CE9BAE6A46D91540@MAXPR01MB0348.INDPRD01.PROD.OUTLOOK.COM>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 24 Jul 2018 21:05:24 -0700
Message-ID: <CAMKF1soBLh_MHbLS11MqcxFg4LjnV8y0QRMYad3m7oqYQuVGTg@mail.gmail.com>
To: Aditya Tayade <Aditya.Tayade@kpit.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] libbytesize: fix gettext not found issue
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
X-List-Received-Date: Wed, 25 Jul 2018 04:05:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Can you try setting

USE_NLS =3D "yes" in the affected recipe ?
On Tue, Jul 24, 2018 at 6:29 PM Aditya Tayade <Aditya.Tayade@kpit.com> wrot=
e:
>
> Hi,
>
> In Sumo branch, libbytesize_0.10.bb<http://10.bb> do_configure fails with=
 error "configure: error: gettext not found", hence added a dependency to g=
ettext -native for the same.
>
>
> Kindly review the attached patch and integrate it with upstream if change=
s looks fine.
>
>
> Regards,
> Aditya Tayade
> This message contains information that may be privileged or confidential =
and is the property of the KPIT Technologies Ltd. It is intended only for t=
he person to whom it is addressed. If you are not the intended recipient, y=
ou are not authorized to read, print, retain copy, disseminate, distribute,=
 or use this message or any part thereof. If you receive this message in er=
ror, please notify the sender immediately and delete all copies of this mes=
sage. KPIT Technologies Ltd. does not accept any liability for virus infect=
ed mails.
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

