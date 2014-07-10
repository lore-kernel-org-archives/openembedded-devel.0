Return-Path: <trevor.woerner@linaro.org>
Received: from mail-qa0-f53.google.com (mail-qa0-f53.google.com
	[209.85.216.53])
	by mail.openembedded.org (Postfix) with ESMTP id D35CB607FE
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Jul 2014 15:09:54 +0000 (UTC)
Received: by mail-qa0-f53.google.com with SMTP id v10so1976155qac.40
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Jul 2014 08:09:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=T9g5jf6ta63XPGTFOWjPNTzrX6K3yyuFPVNnTppLX8c=;
	b=MnrAbpj0loWZClyFif6OymLU16NDU4kmDe3XIWPheD/g7zxqGXZflIHRSHMvy1C/8g
	jAMQa/XK/+DLm3FX8hdLN+LS/qVstkswnfEhZp+LkiejW91ubqgVP2GhMtV3IoLsrPJX
	Wm6L1RZNR3AMug6O3G7KgZkObdaHrL/3O5EwXN3DljZ9q7EDtHDH8itNVEzaLNj+dQOW
	BLL9QtU4BbSbcZoZI1lvF9vy/aFMXNTLvrfhCu1RpWV1lyS48balWmFBsH0dC5MiyWB9
	U4k8JTpir0sJxbdKh5+69EJHrOnyb8eXcuz0Oe1o++O8MdPUPnwJ41wS8VJSVCNECU8y
	T3qA==
X-Gm-Message-State: ALoCoQn3kIQJcDD473UyvCYSO4O7vsTuEnXsXv3k1/N8P2N+AUFQf33X2EKyexfNTG6lpfEnP3Z9
MIME-Version: 1.0
X-Received: by 10.224.115.3 with SMTP id g3mr82451836qaq.9.1405004995385; Thu,
	10 Jul 2014 08:09:55 -0700 (PDT)
Received: by 10.96.221.48 with HTTP; Thu, 10 Jul 2014 08:09:55 -0700 (PDT)
In-Reply-To: <CAOLEWZUbT17s1pxuxK7Tkvvf6Jk2AO2w5dk2iWuAVCfzTkpPsA@mail.gmail.com>
References: <1403634363-18032-1-git-send-email-trevor.woerner@linaro.org>
	<CAOLEWZXqQ_tnZEiVi5JxLbWGktAXNnTWexw_+C0WY+GbyW6V0w@mail.gmail.com>
	<53A9E471.8080500@linaro.org>
	<CAOLEWZUbT17s1pxuxK7Tkvvf6Jk2AO2w5dk2iWuAVCfzTkpPsA@mail.gmail.com>
Date: Thu, 10 Jul 2014 11:09:55 -0400
Message-ID: <CALmOhgngis1Qc8GeLhpjYpb1-m1GNXtseuji+e4pnNiAXr7ByQ@mail.gmail.com>
From: Trevor Woerner <trevor.woerner@linaro.org>
To: Stephen Arnold <stephen.arnold42@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][MASTER][PATCH] lxdm: add libpam DEPENDS
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
X-List-Received-Date: Thu, 10 Jul 2014 15:09:58 -0000
Content-Type: text/plain; charset=UTF-8

Hi Steve,

On 25 June 2014 00:16, Stephen Arnold <stephen.arnold42@gmail.com> wrote:
> Yeah, it would certainly make more sense with a packageconfig option for
> that; currently it doesn't work either with or without the "pam" feature due
> to the missing plugins.  So if you want hard deps, then the plugins need to
> be included as rdeps.  Otherwise, adding an appropriate packageconfig option
> to the flexible depends sounds good.
>
> I still need an init script anyway, so...

Just curious to know if you're still working on this? It doesn't look
to me as though pam is optional with lxdm (?)

Best regards,
    Trevor

