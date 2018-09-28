Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id 56D4B799D0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Sep 2018 16:02:30 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id 80-v6so4197136qkj.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Sep 2018 09:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=xhthJFrWbJfhEO3g6rULtR9Zqc3IyLWHy1dm0r4/Bts=;
	b=VFRcec+SlrWpvfs+KjGuDS1tSxHjPwN4clirf9YX95ubmMGZcoH7lx1EA/qGyiQi7Y
	boBwV0KO0LE6qCcJlIeTTIqvTzlzydOc7HcCRnVvJFXv9zUEal2CghAggCFVcCHFCCoW
	QySPSTnXhgex13Sq0thNCWeOReSV09ndhsWTshJheGvOO5SfGehqWCs4jhA5e9AmLCYR
	gyEMhNstyTlariXcCp8oUQD+9ZeK65cD+LF86WTocy6dsAuHVzsHTumTScgBYTJUf5dL
	oSA2zCHrSZEeOgY73XNi4fRY7Lx8Qf5AdBhOY2ub5PSVjjM5TPe1Dc9Di4PtXNB+K4iF
	cgCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=xhthJFrWbJfhEO3g6rULtR9Zqc3IyLWHy1dm0r4/Bts=;
	b=FrXQDLUOJUMc76YH3tGR0p2Fjm48HKRGX+E44mAx3LCjp+LoknvOCUkPi4leCJSE98
	0CaM0CVh4gkwwL1tzI+IH4aUKCIngkAmGCA0JcyUNrVJIYwD6+LLdxm5IxoB8S4G3kTf
	kwV/MWxsH/LmxKrnaYVayAp3+8bFmWxE/zHSQTZ9ID65hLhRdbEPzpDjCfHQRgY/6OOx
	E0DZyQWG9gkcv/Vb7Jyg1vnOj8fS4cPDsqZpNdjcZ3/5IdjevHGi26kHr7CdHh0jFzHJ
	9sILjf9DPq75aQF+1mNjlvp+KyE3fVJPXJfK9744aj5jpITTw4FJ02UC4boMWmGqtTx4
	6Fyw==
X-Gm-Message-State: ABuFfoh4BwER7pKAK1HLw7tjn/K037L4WWnQISOOojY/dLlNPFOtidfX
	atR9KP50YWML3ZV6Fxtb3inzcX0wYGTzKuoFUcA=
X-Google-Smtp-Source: ACcGV61wDC0/n8pfJhTVbQ2r9sbIyw4qVnCGzC+p7+utR5+YQvYco88jKiLhotwSQFkJqVYVW2KwIAeKytzuW6ftHq4=
X-Received: by 2002:a37:2915:: with SMTP id
	p21-v6mr12465701qkh.206.1538150550932; 
	Fri, 28 Sep 2018 09:02:30 -0700 (PDT)
MIME-Version: 1.0
References: <20180927125519.2567-1-max+openembedded@blarg.de>
	<20180927125519.2567-2-max+openembedded@blarg.de>
	<ed33c2b2-69df-7ebf-d181-38e25ffbef1c@victronenergy.com>
	<20180927203459.dwvddevjmabhs2wu@swift.blarg.de>
In-Reply-To: <20180927203459.dwvddevjmabhs2wu@swift.blarg.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 28 Sep 2018 09:02:04 -0700
Message-ID: <CAMKF1soJQv93-=BjXD+GQnGkynFuQ+QMJts+HwSC8fPn9r5+oQ@mail.gmail.com>
To: jhofstee@victronenergy.com, 
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 2/2] php: fix linker errors by setting `ac_cv_func_dlopen=no`
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
X-List-Received-Date: Fri, 28 Sep 2018 16:02:30 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 27, 2018 at 1:35 PM Max Kellermann
<max+openembedded@blarg.de> wrote:
>
> On 2018/09/27 21:27, Jeroen Hofstee <jhofstee@victronenergy.com> wrote:
> > Removing CACHED_CONFIGUREVARS completely also seems to work
> > for 7.2.9, but perhaps 5.6 needs this?
>
> I thought about this as well.  The reason for hard-coding those
> variables is a mystery to me, because I thought doing such detections,
> even when cross-compiling, is a first-class feature of autotools which
> always works reliably.

see http://git.openembedded.org/meta-openembedded/commit/?id=0d052a48c9fd6d2207f150729a20804e416c91b1
>
> Max
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

