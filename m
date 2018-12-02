Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com
	[209.85.167.176])
	by mail.openembedded.org (Postfix) with ESMTP id AAEFA6BA72
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  2 Dec 2018 16:04:51 +0000 (UTC)
Received: by mail-oi1-f176.google.com with SMTP id x23so8823488oix.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 02 Dec 2018 08:04:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=RD7ULpuHEINLCv8kQQQ97dydB0JqLMPubwzTfAghHK8=;
	b=n1UXQeNqSCrdreH1g6wdyLs8un46Ci4IeagMEcohCVixZqziKkyngxpbn7w7Q6HsBC
	rpbKU6YiWoILjjH8u2QlKPgSbATMtYHnnetVh3ky72USFkzxgyU08Y2f19YxGf5UjpRd
	Jt0tOA52h19WsXmNLBs58rXKv0NW8mWKYp4bv6t5+iH7/R2lmADfziEg8h45MejhijWX
	bxtiIGbxpjyKh7Whsv/qMCHR/RQRX909/aUkKDTlo55othzsLE88EA9k+YD/I8Ve0yej
	ZQYezJMcIaaFcA3WiyAeVScK1B/A8AJYR64/R6CF7GG7p0EWGkYXMP+OMvZN+9SFmFZb
	9E9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=RD7ULpuHEINLCv8kQQQ97dydB0JqLMPubwzTfAghHK8=;
	b=U7VfVNC3zpEfSblWupB0yZvt9WiV9afBcv5/aNNWaFpfP3pCiWmHZG61Jk1H47EAH0
	gqWLiXLlsqvu5XEeDxM4ZQWExqHiP3FowfrNl86IRTPZBMVAnPfE5M2JAq3zeeyfLayJ
	fZpKICVU60UOUQ43bVkYJwm4n1gY6Q7p3n3DHq+bKZQuBqMBL82tq6o3PDv+i4qsAcU4
	vZK7AM5UG8PGH8aeLbePrBdn3WQLDLnrG25IHJxTmaefbcj3q4KYJY+lk9zCDDGHWk0F
	wGD6h7n3heozQYlyH2arg5x2I7eWMmoeg2ziTjEOkrV5iLsC7YMKi0V28262iYeIHdpb
	Valw==
X-Gm-Message-State: AA+aEWbe6QJQ6LtSMTk2rRLXghd8d/yj2bC6iDoCOpmZPgeLzr3ZeJT3
	6Dp16XEol8lTW/GZ7Jep0hhX5UG+u+iTn/xBmEg=
X-Google-Smtp-Source: AFSGD/W48LJql5CGUUTI0vXuMYpzJxTRWWAipUWWDN/coyn7yJAzdNjW98L+uxBRGGmokyucm9QR2iHyNTgDsQTSSiw=
X-Received: by 2002:aca:4b4f:: with SMTP id y76mr8238195oia.88.1543766692593; 
	Sun, 02 Dec 2018 08:04:52 -0800 (PST)
MIME-Version: 1.0
References: <20181202102736.47401-1-alex.kanavin@gmail.com>
	<6d78c61b-d097-8677-8f7e-f6aa3d26f1f6@gmail.com>
In-Reply-To: <6d78c61b-d097-8677-8f7e-f6aa3d26f1f6@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 2 Dec 2018 17:04:40 +0100
Message-ID: <CANNYZj8V34J0ZKWAjWtRyYV_vJVJ4YCBK2PF4dmJenF2NkgtSQ@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] packagegroup-meta-oe: drop ptest groups
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
X-List-Received-Date: Sun, 02 Dec 2018 16:04:51 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, 2 Dec 2018 at 15:57, akuster808 <akuster808@gmail.com> wrote:
> My understanding all ptests are included in the auto mode. I wanted to
> isolate the ones for meta-oe to get a quicker test run.
>
> Am I misunderstanding ptest?

The problem appears when ptest is in DISTRO_FEATURES (e.g. poky
default). Bitbake then throws an error due to duplicate entries in
packagegroups (-ptest stuff included twice - once via explicit
definition in the recipe and then again from packagegroups.bbclass):

ERROR: packagegroup-meta-oe-1.0-r0 do_package: QA Issue:
packagegroup-meta-oe-ptest is listed in PACKAGES multiple times, this
leads to packaging errors. [packages-list]
ERROR: packagegroup-meta-oe-1.0-r0 do_package: Fatal QA errors found,
failing task.
ERROR: packagegroup-meta-oe-1.0-r0 do_package: Function failed: do_package
ERROR: Logfile of failure stored in:
/home/alexander/development/poky/build/tmp/work/all-poky-linux/packagegroup-meta-oe/1.0-r0/temp/log.do_package.89890
ERROR: Task (/home/alexander/development/meta-openembedded/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb:do_package)
failed with exit code '1'

I don't think you can cherry-pick ptests at the moment.

Alex

