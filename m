Return-Path: <trevor.woerner@linaro.org>
Received: from mail-ie0-f174.google.com (mail-ie0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id 674A160E23
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Jun 2014 20:49:59 +0000 (UTC)
Received: by mail-ie0-f174.google.com with SMTP id lx4so781406iec.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Jun 2014 13:50:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=g9YH93snPC6YDMzxZdgK338AXI0h4HoXyDzu5t5N0HU=;
	b=fw/2lqMN7bt0m7ibAjXNmd0IwsfE2dJRUmAaAu4ti3ltOTCjJfns8NMTNrfcbxg/YC
	GNIWa9gRiwutIGDrkzng5vu0i5uHA8FAn2OJlw9urYvgM415NFbh24xVo+wOrszXPreG
	Z6iHoqcsaonWNitQfzLnOPX6uJYkzi4eAZW4BbUPXQr/8XmuiBoLahN2I9sOz3Tr5+is
	VvXW/GyGcRC1W6YK3ZINlQ13w8I0Vvrr9fz45CTIwTnFr4nAJcTUKI+lB+KB9jqZLwbj
	JbclD8GOgefPmde+lX4zzD4CEO6WKlw/vtliXX3TTxGG9hwM9g0/EqZ+fPm+C7XawnKh
	n9yA==
X-Gm-Message-State: ALoCoQk6DvIhIeWIpXlXxVBILGo9Gn+agrXm1289KTfCQ0Qj5OyNcEOdtmZE3yEWgvdO9+ElOrup
X-Received: by 10.50.57.80 with SMTP id g16mr17948173igq.30.1403643001093;
	Tue, 24 Jun 2014 13:50:01 -0700 (PDT)
Received: from [192.168.141.83] (69-165-220-158.dsl.teksavvy.com.
	[69.165.220.158])
	by mx.google.com with ESMTPSA id i19sm162284igf.1.2014.06.24.13.50.00
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 24 Jun 2014 13:50:00 -0700 (PDT)
Message-ID: <53A9E471.8080500@linaro.org>
Date: Tue, 24 Jun 2014 16:49:53 -0400
From: Trevor Woerner <trevor.woerner@linaro.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Stephen Arnold <stephen.arnold42@gmail.com>
References: <1403634363-18032-1-git-send-email-trevor.woerner@linaro.org>
	<CAOLEWZXqQ_tnZEiVi5JxLbWGktAXNnTWexw_+C0WY+GbyW6V0w@mail.gmail.com>
In-Reply-To: <CAOLEWZXqQ_tnZEiVi5JxLbWGktAXNnTWexw_+C0WY+GbyW6V0w@mail.gmail.com>
Cc: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Tue, 24 Jun 2014 20:50:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/24/14 16:02, Stephen Arnold wrote:
> but not as "hard" deps (since pam is an
> optional feature).

I wasn't 100% before sending that patch, but somehow I assumed it'd be
best as a:

DEPENDS += "${@base_contains("DISTRO_FEATURES", "pam"...

or some such. But I put it as a hard DEPENDS because lxdm has a
"--without-pam" configuration option which is not being used, so I
therefore concluded lxdm always wants pam support.

